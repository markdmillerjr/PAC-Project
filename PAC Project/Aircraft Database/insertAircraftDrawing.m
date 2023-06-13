function insertAircraftDrawing
global fig background ax xLimPic yLimPic boeing boxCoordinates rootChordLine...
    mmObject rootChordLineDone wingRootChordLine wingSpanLine line1 line2...
    line3 line4 dotX dotY xclick yclick masterFile

% Code allows input of an aircraft drawing that user can then manipulate to
% isolate wing portion. Then draw a lines indicating length of root chord
% and wing span
fig = figure('Position',[200 200 800 700],'Toolbar','none','Menubar','none',...
    'NumberTitle','off','Name','Boeing 737-300','Dockcontrols','off');
ax = axes('Position',[.08 .01 .88 .98]);

% Revert file access to master file
cd(masterFile);

% Access Aircraft Database folder
cd('Aircraft Database');

% Load aircraft drawing
fileAircraftDrawing = dir('boeing-737-300.png');

% Input aircraft drawing file into MATLAB
boeing = imread(fileAircraftDrawing.name);

% Revert file access to master file
% cd(masterFile);

% Load aircraft drawing image
image(boeing);

% Determine size of drawing
sizeVector = size(boeing);
xLimPic = sizeVector(2);
yLimPic = sizeVector(1);

% Use dimensions of drawing to constrain a patch onto the drawing to place
% a handle to manipulate the drawing
background = patch([0 xLimPic xLimPic 0],[yLimPic yLimPic 0 0],[0 0 0 0],[.95 .95 .95]);
alpha(background,.1);

axis tight equal
grid on
grid minor

xlabel('X');
ylabel('Y');

% Give the figure a handle to allow later manipulation
set(fig, 'WindowKeyPressFcn', @KeyPress);
boxCoordinates = [];
rootChordLine  = [];
rootChordLineDone = 0;

if isempty(wingRootChordLine) ~= 1 && isempty(wingSpanLine) ~= 1
    line1 = line([dotX xclick],[dotY dotY],'linestyle','-','color','black','linewidth',1);
    line2 = line([dotX dotX],[dotY yclick],'linestyle','-','color','black','linewidth',1);
    line3 = line([dotX xclick],[yclick yclick],'linestyle','-','color','black','linewidth',1);
    line4 = line([xclick xclick],[dotY yclick],'linestyle','-','color','black','linewidth',1);
end
% Create MouseManager and intialize(external program incorporated to
% control mouse movement
mmObject = MouseManager(fig);
mmObject.add_item(ax, {'click', 'drag'}, 'alt', @dolly_camera, ...
                       'click', 'open', @reset_camera, ...
                       'scroll', @zoom_camera);
mmObject.enable(true);

%% Key Data
function KeyPress(~, EventData)
global fig background background2 mmObject boxCoordinates fig2 mmObject2...
    rootChordLineDone wingRootChordLine

% Set the background(constrained patch) to a button down function, tied to
% holding down the shift key
switch(EventData.Key)
    case 'shift' 
    if isempty(boxCoordinates) == 1
        set(background, 'ButtonDownFcn', {@selectedBackground, background});
        mmObject.enable(false);
        set(fig, 'WindowKeyReleasefcn', @KeyRelease);
        
    elseif isempty(boxCoordinates) ~= 1 && rootChordLineDone == 0
        set(background2, 'ButtonDownFcn', {@selectedRootChordMeasure, background2});
        mmObject2.enable(false);
        set(fig2, 'WindowKeyReleasefcn', @KeyRelease);
        
    elseif isempty(boxCoordinates) ~= 1 && rootChordLineDone == 1
        set(background2, 'ButtonDownFcn', {@selectedWingSpanMeasure, background2});
        set(wingRootChordLine, 'ButtonDownFcn', {@selectedWingSpanMeasure, wingRootChordLine});
        mmObject2.enable(false);
        set(fig2, 'WindowKeyReleasefcn', @KeyRelease);
    end
end

function KeyRelease(~, EventData)
global topLine leftLine rightLine bottomLine dot2 dot background mmObject...
    background2 boxCoordinates mmObject2 rootChordLine spanLine dot3...
    endPointLine endPointLine2

% When release the shift key erase any drawings 
switch(EventData.Key)
    case 'shift'
        delete(topLine);
        delete(leftLine);
        delete(rightLine);
        delete(bottomLine);
        delete(rootChordLine);
        delete(endPointLine);
        delete(spanLine);
        delete(endPointLine2);
        delete(dot);
        delete(dot2);
        delete(dot3);
end

% Set background handle to a dummy function to erase handle control of
% figure
if isempty(boxCoordinates) == 1
    set(background, 'ButtonDownFcn', {@selectedBackgroundOff, background});
    mmObject.enable(true);
elseif isempty(boxCoordinates) ~= 1
    set(background2, 'ButtonDownFcn', {@selectedBackgroundOff, background2});
    mmObject2.enable(true);
end

%% Background Data
function selectedBackground(~,~,background)
global fig dot dotX dotY boxSelected

% Determine if the mouse is over the background. If it is then draw a
% dot(while holding down the shift key)
obj=hittest(fig);
if obj==background %if over the plot...
    %get cursor coordinates in its axes:
    a=get(background,'parent');
    point=get(a,'currentpoint');
    xclick=point(1,1,1);
    yclick=point(1,2,1);
    
    delete(dot);
    dot  = line(xclick,yclick,'marker','o','markersize',5,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','none');
    dotX = xclick;
    dotY = yclick;
    
    boxSelected = 0;
    set(fig,'windowbuttonmotionfcn',{@selectedWingBox,fig},'BusyAction','cancel');
end

% Dummy function to remove handle to background
function selectedBackgroundOff(~,~,~)
        
% Handle to drawing outline around wing 
function selectedWingBox(~,~,~)
global dotX dotY background topLine leftLine rightLine bottomLine...
    xclick yclick dot2 

% Draw a box to isolate wing portion
delete(topLine);
delete(leftLine);
delete(rightLine);
delete(bottomLine);
delete(dot2);

a=get(background,'parent');
point=get(a,'currentpoint');
xclick=point(1,1,1);
yclick=point(1,2,1);

topLine    = line([dotX xclick],[dotY dotY],'linestyle','-','color','black','linewidth',1.5);
leftLine   = line([dotX dotX],[dotY yclick],'linestyle','-','color','black','linewidth',1.5);
rightLine  = line([dotX xclick],[yclick yclick],'linestyle','-','color','black','linewidth',1.5);
bottomLine = line([xclick xclick],[dotY yclick],'linestyle','-','color','black','linewidth',1.5);
dot2       = line(xclick,yclick,'marker','o','markersize',3,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0]);

% Give the second dot a handle to plot a permanent box around the wing
% portion
set(dot2, 'ButtonDownFcn', {@plotWingOutline, dot2});

% Handle to drawing a line across wing root chord
function selectedRootChordMeasure(~,~,background2)
global fig2 dot dotX2 dotY2 boxSelected

% Determine if over the second background, if are then draw a dot(while
% holding down the shift key)
obj = hittest(fig2);
if obj == background2
    a = get(background2,'Parent');
    point = get(a,'currentpoint');
    xclick = point(1,1,1);
    yclick = point(1,2,1);

    delete(dot);
    dot  = line(xclick,yclick,'marker','o','markersize',5,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','none');
    dotX2 = xclick;
    dotY2 = yclick;

    boxSelected = 0;
    set(fig2,'windowbuttonmotionfcn',{@rootChordMeasure,fig2});
end
        
% Handle to drawing a line across wing span
function selectedWingSpanMeasure(~,~,background2,chordLine)
global dot dotX3 dotY3 boxSelected fig2

% Determine if over the second background or the root chord line. If are
% then draw a dot(while holding down the shift key)
obj = hittest(fig2);
if obj == background2 || obj == chordLine
    if obj == background2
        a = get(background2,'Parent');
    elseif obj == chordLine
        a = get(background2,'Parent');
    end
    point = get(a,'currentpoint');
    xclick = point(1,1,1);
    yclick = point(1,2,1);
    
    delete(dot);
    dot  = line(xclick,yclick,'marker','o','markersize',5,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','none');
    dotX3 = xclick;
    dotY3 = yclick;
    
    boxSelected = 0;
    set(fig2,'windowbuttonmotionfcn',{@wingSpanMeasure,fig2},'BusyAction','cancel');
end    

%% Wing Outline
function plotWingOutline(~,~,~)
global dot2 dot xclick yclick dotX dotY line1 line2 line3...
    line4

% Draw a permanent box around the wing
line1 = line([dotX xclick],[dotY dotY],'linestyle','-','color','black','linewidth',1);
line2 = line([dotX dotX],[dotY yclick],'linestyle','-','color','black','linewidth',1);
line3 = line([dotX xclick],[yclick yclick],'linestyle','-','color','black','linewidth',1);
line4 = line([xclick xclick],[dotY yclick],'linestyle','-','color','black','linewidth',1);
set(line1, 'ButtonDownFcn', {@selectedRootChordMeasure, line1});
set(line2, 'ButtonDownFcn', {@selectedRootChordMeasure, line2});
set(line3, 'ButtonDownFcn', {@selectedRootChordMeasure, line3});
set(line4, 'ButtonDownFcn', {@selectedRootChordMeasure, line4});

delete(dot);
delete(dot2);

wingDrawing;

function wingDrawing
global fig fig2 dotX dotY xclick yclick mmObject croppedBoeing boxCoordinates...
    background2 ax2 mmObject2 boeing yLimPic xLimPic
  
% Once have a permanent box around the wing, delete the aircraft drawing
% and create a new drawing to isolate the wing portion specified by the
% drawn box
mmObject.enable(false);
delete(fig);

fig2 =  figure('Position',[200 200 800 700],'Toolbar','none','Menubar','none',...
    'NumberTitle','off','Name','Boeing 737-300','Dockcontrols','off');
ax2 = axes('Position',[.1 .1 .8 .85]);

% Determine coordinates of wing box
boxCoordinatesY = [dotY yclick];
boxCoordinatesX = [dotX xclick];
boxCoordinatesY = sort(boxCoordinatesY);
boxCoordinatesX = sort(boxCoordinatesX);

boxCoordinates = [boxCoordinatesY boxCoordinatesX];

% Converts coordinates to integer values
boxCoordinates = fix(boxCoordinates);

% Crop the aircraft drawing to only show the wing outline
croppedBoeing = boeing(boxCoordinates(1):boxCoordinates(2), boxCoordinates(3): boxCoordinates(4),:);

image(ax2,croppedBoeing);

% Set the new figure to a key press function
set(fig2, 'WindowKeyPressFcn', @KeyPress);
axis tight equal

sizeVector = size(croppedBoeing);

xLimPic = sizeVector(2);
yLimPic = sizeVector(1);

xlabel('X');
ylabel('Y');

% Create a new patch to allow manipulation of wing drawing
background2 = patch([0 xLimPic xLimPic 0],[yLimPic yLimPic 0 0],[0 0 0 0],[.95 .95 .95]);
alpha(background2,.1);

% Create MouseManager and intialize
mmObject2 = MouseManager(fig2);
mmObject2.add_item(ax2, {'click', 'drag'}, 'alt', @dolly_camera, ...
                       'click', 'open', @reset_camera, ...
                       'scroll', @zoom_camera);
mmObject2.enable(true);

%% Wing Root Chord Line
function rootChordMeasure(~,~,~)
global dotX2 dotY2 background2 rootChordLine xclick2 yclick2 dot2 endPointLine...
    yLimPic

% Draw a line across the wing root chord
delete(rootChordLine);
delete(endPointLine);
delete(dot2);

a=get(background2,'parent');
point=get(a,'currentpoint');
xclick2=point(1,1,1);
yclick2=point(1,2,1);

rootChordLine = line([dotX2 xclick2],[dotY2 dotY2],'linestyle','-','color','#1f9e00','linewidth',1.5);
endPointLine  = line([xclick2 xclick2],[0 yLimPic],'linestyle','--','color','#a9a9ac','linewidth',1.5);
dot2          = line(xclick2,dotY2,'marker','o','markersize',5,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0]);

% Give the second dot a handle to plot a permanent line indicating the root
% chord dimensions
set(dot2, 'ButtonDownFcn', {@plotRootChordLine, dot2});

function plotRootChordLine(~,~,~)
global dotX2 dotY2 xclick2 wingRootChordLine rootChordLineDone

% Draw a permanent line across the root chord
wingRootChordLine = line([dotX2 xclick2],[dotY2 dotY2],'linestyle','-','color','#1f9e00','linewidth',1.5);
rootChordLineDone = 1;

%% Wing Span Line
function wingSpanMeasure(~,~,~)
global dotX3 dotY3 background2 spanLine dot3 yclick3 xLimPic endPointLine2

% Draw a line across the wing span
delete(spanLine);
delete(endPointLine2);
delete(dot3);

a=get(background2,'parent');
point=get(a,'currentpoint');
yclick3=point(1,2,1);

spanLine      = line([dotX3 dotX3],[dotY3 yclick3],'linestyle','-','color','#1f9e00','linewidth',1.5);
endPointLine2 = line([0 xLimPic],[yclick3 yclick3],'linestyle','--','color','#a9a9ac','linewidth',1.5);
dot3          = line(dotX3,yclick3,'marker','o','markersize',5,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0]);

% Give the second dot(called dot3) a handle to plot a permanent line
% indicating the wing span dimensions
set(dot3, 'ButtonDownFcn', {@plotWingSpanLine, dot3})

function plotWingSpanLine(~,~,~)
global yclick3 dotX3 dotY3 wingSpanLine fig2

% Draw a permanent line across the wing span
wingSpanLine = line([dotX3 dotX3],[dotY3 yclick3],'linestyle','-','color','#1f9e00','linewidth',1.5);
delete(fig2);
insertAircraftDrawing;

%% Mouse Manager Data
function dolly_camera(hObject, eventData)
    persistent dollyOrigin
    switch eventData.operation
      case 'click'
        dollyOrigin = eventData.figurePoint;
      case 'drag'
        offset = (dollyOrigin-eventData.figurePoint)./200;
        dollyOrigin = eventData.figurePoint;
        camdolly(hObject, offset(1), offset(2), 0);
    end

function zoom_camera(hObject, eventData)
    camzoom(hObject, 1-0.1*eventData.scrollEventData.VerticalScrollCount);

function reset_camera(~, ~)
