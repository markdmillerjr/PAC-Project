function wingPlanformMod
% Written by Mark D. Miller Jr.
% 1/26/20
global wingPlanformModTab wingPlanformModPanel pointCoordFig editPanel...
    storageArray1X storageArray1Y xLocationInc yLocationInc storageArrayP1...
    XWRTMainC YWRTMainC okButtonSelected deletePointGo savePointSelected...
    storageArray2X storageArray2Y storageArrayP2 wingFrontViewPanel LEP1...
    wingPreviewModPanel enablePointCoords lineSelected xCoordsLE yCoordsLE...
    zCoordsLE xCoordsTE yCoordsTE zCoordsTE wingDimensionsModPanel wingOutlineTVTab...
    wingOutlineFVTab wpmActivated xCoords yCoords zCoords rootChordLineDone...
    XWRTMainTopView YWRTMainTopView ZWRTMainTopView xScaleFactor yScaleFactor...
    tempStorageArrayXSort1 tempStorageArrayYSort1 tempStorageArrayXSort2...
    tempStorageArrayYSort2 selectedCancel storageArray3X storageArray3Y...
    storageArrayP3

% Tabs
% if wpmActivated == 1
%     wingPlanformModTabgp = uitabgroup('Parent',wingPlanformModTab,'Position',[.01 .01 .98 .51],'Visible','on');
%     
%     wingOutlineTVTab       = uitab('Parent',wingPlanformModTabgp,'Title','Left Wing Outline - Top View');
%     wingOutlineFVTab       = uitab('Parent',wingPlanformModTabgp,'Title','Left Wing Outline - Front View');
%     
%     pointCoordinatesMod;
%     wingDimensions;
%     editBox;
%     topView;
%     frontView;
%     pushbutton_top_Callback;
%     overlay1;
%     overlay2;
%     overlay3;
% else
    wingPlanformModTabgp = uitabgroup('Parent',wingPlanformModTab,'Position',[.01 .01 .98 .51],'Visible','on');
    
wingOutlineTVTab       = uitab('Parent',wingPlanformModTabgp,'Title','Left Wing Outline - Top View');
wingOutlineFVTab       = uitab('Parent',wingPlanformModTabgp,'Title','Left Wing Outline - Front View');

% Panels
% Half Wing Planform
pointCoordFig        = uipanel('Parent',wingPlanformModTab,'Title','Point Coordinates','FontSize',12,'Position',[.01 .79 .41 .21]);
% editPanel            = uipanel('Parent',wingPlanformModTab,'Title','Edit Box','FontSize',12,'Position',[.32 .79 .1 .12]);
% wingFrontViewPanel   = uipanel('Parent',wingPlanformModTab,'Title','Half Wing Front View','FontSize',12,'Position',[.01 .52 .41 .27]);
% wingPlanformModPanel = uipanel('Parent',wingPlanformModTab,'Title','Half Wing Outline','FontSize',12,'Position',[.01 .01 .98 .51]);
wingPreviewModPanel  = uipanel('Parent',wingPlanformModTab,'Title','Wing Preview','FontSize',12,'Position',[.01 .52 .98 .27]);
wingDimensionsModPanel  = uipanel('Parent',wingPlanformModTab,'Title','Wing Dimensions','FontSize',12,'Position',[.43 .79 .56 .21]);
% uicontrol('Parent',editPanel,'Style','radiobutton','String','Edit','Fontsize',10,'Position',[10 40 50 25],'Callback',@radiobutton_edit_Callback,'Enable','off');
% uicontrol('Parent',editPanel,'Style','radiobutton','String','Delete','Fontsize',10,'Position',[10 15 60 25],'Callback',@radiobutton_delete_Callback,'Enable','off');

%% Pushbuttons-------------------------------------------------------------
% Top
uicontrol('Parent',wingPlanformModTab','Style','pushbutton','String','Top','Position',[575 361 60 20],'Callback',@pushbutton_top_Callback);    
% Front
uicontrol('Parent',wingPlanformModTab','Style','pushbutton','String','Front','Position',[635 361 60 20],'Callback',@pushbutton_front_Callback); 
% Side
uicontrol('Parent',wingPlanformModTab','Style','pushbutton','String','Side','Position',[695 361 60 20],'Callback',@pushbutton_side_Callback);   
% Isometric
uicontrol('Parent',wingPlanformModTab','Style','pushbutton','String','Isometric','Position',[755 361 60 20],'Callback',@pushbutton_iso_Callback);
% Aircraft Drawing Import
% uicontrol('Parent',wingPlanformModTab','Style','pushbutton','String','Import Aircraft Drawing','Position',[425 361 150 20],'Callback',@pushbutton_importAircraftDrawing_Callback);

% Empty storage array if it has old values
% if isempty(storageArray1X) ~= 1 || isempty(storageArray1Y) || isempty(xLocationInc) ~= 1 ||...
%         isempty(storageArrayP1) ~= 1 || isempty(storageArray2X) ~= 1 || isempty(storageArray2Y) ~= 1 ||...
%         isempty(storageArrayP2) ~= 1

    if isempty(storageArrayP1) == 1 && isempty(storageArrayP2)    
        storageArray1X    = [];
        storageArray1Y    = [];
        storageArrayP1    = [];
        storageArray2X    = [];
        storageArray2Y    = [];
        storageArrayP2    = [];
        storageArray3X    = [];
        storageArray3Y    = [];
        storageArrayP3    = [];
        tempStorageArrayXSort1 = [];
        tempStorageArrayYSort1 = [];
        tempStorageArrayXSort2 = [];
        tempStorageArrayYSort2 = [];
        xLocationInc      = [];
        yLocationInc      = [];
        XWRTMainC         = [];
        YWRTMainC         = [];
        okButtonSelected  = 0;
        savePointSelected = 0;
        deletePointGo     = 0;
        selectedCancel    = 0;
        LEP1              = [];
        xCoordsLE         = [];
        yCoordsLE         = [];
        zCoordsLE         = [];
        xCoordsTE         = [];
        yCoordsTE         = [];
        zCoordsTE         = [];
        xCoords           = [];
        yCoords           = [];
        zCoords           = [];
        XWRTMainTopView   = [];
        YWRTMainTopView   = [];
        ZWRTMainTopView   = [];
        rootChordLineDone = [];
        xScaleFactor      = [];
        yScaleFactor      = [];
    end

    enablePointCoords = 1;
    lineSelected = 0;
    pointCoordinatesMod;
    wingDimensions;
    editBox;
    topView;
    frontView;
    pushbutton_top_Callback;
    overlay1;
    overlay2;
    overlay3;
% end

% Wing planform mod is opened
wpmActivated = 1;

% Modifies the wing planform to create a more complex shape
% Drawing the basic aircraft wing
function aircraftWingTopView
global b c cr LamLE XW1 YW2 XWRTMainTopView YWRTMainTopView ZWRTMainTopView...
    XWRT3 YWRT3 ZWRT3 WRT WRT3 tp wingPointsArray1 wingPointsArray2...
    wingPointsArray3 combinedWindowsFig XWRTMain YWRTMain wingOutline...
    topViewAxes rootChord tipChord rootChordLineDone YW2Scaled xScaleFactor...
    yScaleFactor boxCoordinates wingRootChordLine wingSpanLine storageArray1X...
    storageArray1Y storageArray2X storageArray2Y
    
if rootChordLineDone == 1
%     xAxisDifference = boxCoordinates(4) - boxCoordinates(3);
    xAxisDifference = wingRootChordLine.XData(2) - wingRootChordLine.XData(1);
%     yAxisDifference = boxCoordinates(2) - boxCoordinates(1);
    yAxisDifference = wingSpanLine.YData(2) - wingSpanLine.YData(1);

    xScaleFactor = xAxisDifference/(rootChord);
    yScaleFactor = yAxisDifference/(b/2);

    % X-Coordinates
    XW1 = 0;
    XW2Scaled = XW1 + (b/2)*tand(LamLE)*xScaleFactor;
    XW3Scaled = XW2Scaled + tipChord*xScaleFactor;
    XW4Scaled = XW1 + rootChord*xScaleFactor;

    % Y-Coordinates
    YW2Scaled=(b/2)*yScaleFactor;

    XWRTMainTopView = [(((XW1))),(((XW2Scaled))),(((XW3Scaled))),(((XW4Scaled)))];
    YWRTMainTopView = [0,(YW2Scaled),(YW2Scaled),0];
    ZWRTMainTopView = [0,0,0,0];
elseif isempty(rootChordLineDone) == 1 || rootChordLineDone == 0
    % X-Coordinates
    XW1 = 0;
    XW2 = XW1 + (b/2)*tand(LamLE);
    XW3 = XW2 + tipChord;
    XW4 = XW1 + rootChord;

    % Y-Coordinates
    YW1 = 0;
    YW2 = b/2;
    YW3 = YW2;
    YW4 = YW1;

    XWRTMainTopView = [(((XW1))),(((XW2))),(((XW3))),(((XW4)))];
    YWRTMainTopView = [0,(YW2),(YW2),0];
    ZWRTMainTopView = [0,0,0,0];
end

if isempty(storageArray1X) ~= 1 || isempty(storageArray2X) ~= 1
    XWRTMainTopView = [XW1, storageArray1X, XW2, XW3, storageArray2X, XW4];
    YWRTMainTopView = [YW1, storageArray1Y, YW2, YW3, storageArray2Y, YW4];
end

% Need to update XWRTMain and YWRTMain for wing preview plotting
XWRTMain = [XW1, XW2, XW3, XW4];
YWRTMain = [YW1, YW2, YW3, YW4];

%     XWRTMain = [(((XW1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((1+XW1)*c)-c)];
    
    
%     XWR  = ((XW1).*rootChord);
%     XWR2 = ((tipChord)+XW2);
%     
%     XWRTMain = [XWR, XWR2, X
    
    
%     WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);

    wingOutline = line(topViewAxes,XWRTMainTopView,YWRTMainTopView,'color','black','linewidth',3);
    
function aircraftWingFrontView
global b c cr LamLE XW1 XW2 YW2 XWRT YWRT ZWRT XWRT3 YWRT3 ZWRT3 WRT WRT3...
    tp wingPointsArray1 wingPointsArray2 wingPointsArray3 combinedWindowsFig...
    XWRTMain YWRTMain wingCS frontViewAxes ct ZWRTMain Gam t_c tipChord...
    rootChord ZWRTMainFV wingFrontView
    
    i_w = 0;
 
    % X-Coordinates
    XW1 = 0;
    XW2=XW1 + (b/2)*tand(LamLE);
%     XW3=XW2+tipChord;
    XW4=XW1+rootChord;

    % Y-Coordinates
    YW2=b/2;

    % Z-Coordinates
%     ZW1=1/2+cr*sind(i_w);
%     ZW2=1/2+(XW4-XW2)*sind(i_w)+(b/c)*tand(Gam);
%     ZW3=1/2+(XW4-XW3)*sind(i_w)+(b/c)*tand(Gam);
%     ZW4=1/2;
    %     ZW3=(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);



    ZW1=rootChord*sind(i_w);
    ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
    
    % Bottom
    YWRTMainFV = [0,-YW2,-YW2,0];
    ZWRTMainFV = [-(ZW1+t_c*rootChord),-(ZW2+t_c*tipChord),-(ZW2+t_c*tipChord*tp),0];
    
    wingFrontView = line(frontViewAxes,ZWRTMainFV,YWRTMainFV,'color','black','linewidth',3);

function aircraftWingPreview
global b c cr LamLE XW1 XW2 YW2 XWRT YWRT ZWRT XWRT3 YWRT3 ZWRT3 WRT WRT3...
     tp wingPointsArray1 wingPointsArray2 wingPointsArray3 combinedWindowsFig...
     XWRTMainTopView YWRTMainTopView wingPreviewLeftInitial wingPreviewRightInitial...
     previewAxes airfoil_size airfoil_coords_x airfoil_coords_y XWRTMainC...
     YWRTMainC wingPreviewModPanel XWR2 YWR2 ZWR2 airfoil_array ARWing...
     xCoords yCoords zCoords ZW2 tipChord rootChord comboAirfoil_coords_xRoot...
     comboAirfoil_coords_yRoot comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
     comboAirfoilSize ZW1

%  if isempty(xCoords) == 1 && isempty(yCoords) == 1 && isempty(zCoords) == 1
     
    % X-Coordinates
    XW1 = 0;
    XW2 = XW1 + (b/2)*tand(LamLE);
    XW3 = XW2 + tipChord;
    XW4 = XW1 + rootChord;

    % Y-Coordinates
    YW2 = b/2;

    XWRTMainTopView = [(((XW1))),(((XW2))),(((XW3))),(((XW4)))];
    YWRTMainTopView = [0,(YW2),(YW2),0];
%     ZWRTMainTopView = [0,0,0,0];
     
    % Create a new array
    XWRTMainWP = XWRTMainTopView;
    YWRTMainWP = YWRTMainTopView;
    XWRTMain   = XWRTMainTopView;
    YWRTMain   = YWRTMainTopView;
    
    % Erase the last points in the array
    XWRTMainWP(end-1:end) = [];
    YWRTMainWP(end-1:end) = [];
    
    % Slope of trailing edge
    slopeTE = (XWRTMain(end) - XWRTMain(end-1))/(YWRTMain(end) - YWRTMain(end-1));
    
    yLocationFirstWS    = zeros(1,1);
    xLocationFirstWSLES = zeros(1,1);
    firstWSChord        = zeros(1,1);
    tpWS                = zeros(1,1);
    airfoil_coords_xWP  = zeros(comboAirfoilSize,1);
    
%     if isempty(airfoil_coords_x) == 1
%         airfoil_coords_x = comboAirfoil_coords_x;
%     end
    
    for i = 1:1
        % Y-Location of end of first wing segment
        yLocationFirstWS(i) = slopeTE*YWRTMainWP(i+1);
        
        % X-Location accounting for LE sweep
        xLocationFirstWSLES(i) = yLocationFirstWS(i)+c;

        % Subtract LE point 
        firstWSChord(i) = xLocationFirstWSLES(i) - XWRTMainWP(i+1);

        % Taper of wing segment
        tpWS(i) = firstWSChord(i)/c;
        
        % Set up airfoil coordinates for each wing segment
%         airfoil_coords_xWP(:,i) = comboAirfoil_coords_xTip*c*tpWS(i) + XWRTMainWP(i+1);
        airfoil_coords_xWP(:,i) = comboAirfoil_coords_xTip*tipChord + XWRTMainWP(i+1);
    end
    
    % Set up airfoil coordinates for first point
    airfoil_coords_x1 = comboAirfoil_coords_xRoot*rootChord + XWRTMainWP(1);
    
    % Build final arrays along each axis to input into surface plot
    xCoords  = [airfoil_coords_x1, airfoil_coords_xWP];
    yCoords  = (ones(comboAirfoilSize,1).*YWRTMainWP);
    ZWRLRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
    ZWRLTip  = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;
    zCoords  = [ZWRLRoot ZWRLTip];
    
%     zCoords = comboAirfoil_coords_yTip.*(ones(1,2).*c*tpWS)+ZW2;
    
    
    
%  end

    % Plot left wing
    wingPreviewRightInitial = surface(previewAxes,xCoords,-yCoords,zCoords);
%     wingPreviewRightInitial = surface(previewAxes,-yCoords,xCoords,zCoords);
    set(wingPreviewModPanel, 'ButtonDownFcn', {@selectedWingPlanformMod, wingPreviewModPanel});

%     axis tight equal
% xlabel('X (ft)')
% ylabel('Y (ft)')
% zlabel('Z (ft)')
% grid on
% az = 90;
% el = 90;
% view(az,el);
% 
% shading(previewAxes,'interp');
% lighting gouraud;
% camlight;
    
    % Plot right wing
    wingPreviewLeftInitial = surface(previewAxes,xCoords,yCoords,zCoords);
%     wingPreviewLeftInitial = surface(previewAxes,yCoords,xCoords,zCoords);
    set(wingPreviewModPanel, 'ButtonDownFcn', {@selectedWingPlanformMod, wingPreviewModPanel});

% Displaying the top view of the aircraft wing    
function topView
global topViewAxes pointCoordinatesSelected wingOutlineTVTab croppedBoeing...
    resizedBoeing XWRTMainTopView YWRTMainTopView wingArea wingSpan rootChord...
    rootChordLineDone

delete(topViewAxes);
topViewAxes = axes('Parent',wingOutlineTVTab,'Position',[.06 .13 .92 .83]);

if rootChordLineDone == 1
%     aircraftWingTopView;
    image(topViewAxes,croppedBoeing);
    az = 90;
    el = 90;
    view(az,el);
elseif isempty(rootChordLineDone) == 1 || rootChordLineDone == 0
    
    az = 270;
    el = -90;
    view(az,el);
end
% image(topViewAxes,resizedBoeing);

aircraftWingTopView;

axis tight equal  
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
grid minor

pointCoordinatesSelected = 0;

% xlim([min(XWRTMainTopView)-((rootChord/wingSpan)),max(XWRTMainTopView)+max(XWRTMainTopView)*.01]);
% xlim([min(XWRTMainTopView)-(rootChord*.1),max(XWRTMainTopView)+(rootChord*.1)]);

% Displaying the front view of the aircraft wing    
function frontView
global frontViewAxes pointCoordinatesSelected wingOutlineFVTab
delete(frontViewAxes);
frontViewAxes = axes('Parent',wingOutlineFVTab,'Position',[.06 .13 .92 .83]);
aircraftWingFrontView;
axis tight equal
xlabel('Z (ft)')
ylabel('Y (ft)')
pointCoordinatesSelected = 0;

% xlim([-10 10]);

grid on
grid minor
az = 270;
el = -90;
view(az,el);

function preview
global previewAxes pointCoordinatesSelected wingPreviewModPanel combinedWindowsFig...
    mmObjectWingPlanformMod mmObjectWingPlanform XW1 b c LamLE Gam cr tp ARWing...
    airfoil_array airfoil_coords_x airfoil_coords_y
delete(previewAxes);
previewAxes = axes('Parent',wingPreviewModPanel,'Position',[.05 .2 .93 .75]);
aircraftWingPreview;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
pointCoordinatesSelected = 0;

grid on
az = 90;
el = 90;
view(az,el);
colormap(bone);
shading interp
material metal
lighting gouraud
% camlight;

hold on
    
% X-Coordinates
XW2=XW1+(b/c)*tand(LamLE);
    
XWR2 = ((airfoil_coords_x.*tp+XW2).*c)-c;
YWR2 = (airfoil_array + b/2);
ZWR2 = ((airfoil_coords_y.*tp).*(c));
fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

function selectedWingPlanformMod(~, ~, ~)
global combinedWindowsFig previewAxes mmObjectWingPlanformMod mmObjectWingPlanform

% Create MouseManager and intialize:
mmObjectWingPlanformMod = MouseManager(combinedWindowsFig);
mmObjectWingPlanformMod.add_item(previewAxes, {'click', 'drag'}, 'normal', @orbit_camera, ...
                       {'click', 'drag'}, 'alt', @dolly_camera, ...
                       'click', 'open', @reset_camera, ...
                       'scroll', @zoom_camera);
if isempty(mmObjectWingPlanform) ~= 1                   
    mmObjectWingPlanform.enable(false);
end
mmObjectWingPlanformMod.enable(true);

% Line overlays
 function overlay1
global wingPointsArray1 YW2 XWRT c b LamLE L1 XWRTMain topViewAxes xScaleFactor...
    yScaleFactor YW2Scaled storageArrayP1 storageArrayP2 LEP1 deleteSecondPoint

if deleteSecondPoint == 1
    delete(LEP1);
end

%% 1st Line
if isempty(yScaleFactor) ~= 1
    % X-Coordinates
    XW1        = 0;
    XW2Scaled  = XW1 + (b/2)*tand(LamLE)*xScaleFactor;
    XWRTScaled = [(((XW1))),(((XW2Scaled)))];

    % Y-Coordinates
    YW2Scaled = (b/2)*yScaleFactor;

    wingPlanformPointsX1 = linspace(XWRTScaled(1),XWRTScaled(2),1000);
    wingPlanformPointsY1 = linspace(0,YW2Scaled,1000);
    
elseif isempty(storageArrayP1) == 1 && isempty(storageArrayP2) == 1
    % X-Coordinates
    XW1  = 0;
    XW2  = XW1 + (b/2)*tand(LamLE);
    XWRT = [(((XW1))),(((XW2)))];

    % Y-Coordinates
    YW2 = b/2;
    wingPlanformPointsX1 = linspace(XWRT(1),XWRT(2),1000);
    wingPlanformPointsY1 = linspace(0,YW2,1000);


% Wing Planform Points
% wingPlanformPointsX1 = -linspace(XWRT(1),XWRT(2),1000);
% wingPlanformPointsY1 = linspace(0,YW2,1000);


% Conversion from number array to cell array
wingPlanformPointsXCell1 = num2cell(wingPlanformPointsX1);
wingPlanformPointsYCell1 = num2cell(wingPlanformPointsY1);

% Arrange it in a column
wingPlanformPointsXCell1 = wingPlanformPointsXCell1(:);
wingPlanformPointsYCell1 = wingPlanformPointsYCell1(:);

% Conversion from cell array to logical array
% sizePlanformPointsX = size(wingPlanformPointsX1);
% sizePlanformPointsY = size(wingPlanformPointsY1);

% wingPlanformPointsXLogic = false(sizePlanformPointsX(2),1);
% wingPlanformPointsYLogic = false(sizePlanformPointsY(2),1);

% animals1 = [wingPlanformPointsXCell,wingPlanformPointsYCell];
wingPointsArray1 = [wingPlanformPointsXCell1,wingPlanformPointsYCell1];

% wingPointsArray1 = [wingPlanformPointsXCell1,wingPlanformPointsYCell1,wingPlanformPointsXCell2,wingPlanformPointsYCell2,wingPlanformPointsXCell3,wingPlanformPointsYCell3];


% wingPointsArray2 = [wingPlanformPointsXCell2,wingPlanformPointsYCell2];
% wingPointsArray3 = [wingPlanformPointsXCell3,wingPlanformPointsYCell3];

% XXX = [cell2mat(wingPointsArray1(:,1))];
% YYY = [cell2mat(wingPointsArray1(:,2))];

% 1st Line
L1 = line(topViewAxes,cell2mat(wingPointsArray1(:,1)),cell2mat(wingPointsArray1(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

% L1 = line(XXX,YYY,'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

%------------------


% L1 = line(cell2mat(wingPointsArray1(:,(1:3))),cell2mat(wingPointsArray1(:,(4:6))),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

% L1 = line(cell2mat(wingPointsArray1(:,(1:2))),cell2mat(wingPointsArray1(:,(2:3))),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

%---------------------

% obj = uicontrol(...,'style','popupmenu',...
% 'Callback', @(h,e)(cellfun(@(x)feval(x,h,e),{@(h,e)this.myfunc(h),@(h,e)this.myfunc2(h), @(h,e)this.myfunc2(h)}))

% L2 = line(cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);
% L3 = line(cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

% set(L1, 'ButtonDownFcn', {@selectedLine1, L1});
% set(L2, 'ButtonDownFcn', {@selectedLine2, L2});
% set(L3, 'ButtonDownFcn', {@selectedLine3, L3});

% H1 = patchline(cell2mat(wingPointsArray1(:,1)),cell2mat(wingPointsArray1(:,2)),...
%             'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
        
% H1 = patchline(cell2mat(wingPointsArray1(:,(1:2))),cell2mat(wingPointsArray1(:,(2:3))),...
%     'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
        
% H2 = patchline(cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),...
%             'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
% H3 = patchline(cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),...
%             'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);

% set(combinedWindowsFig,'windowbuttonmotionfcn', {@hover1,H1},'windowbuttonmotionfcn',{@hover2,H2},'windowbuttonmotionfcn',{@hover3,H3});

% what we are trying to figure out is how to set up multiple callbacks
% simultaneously so that we can select whichever point we want
% set(combinedWindowsFig,'windowbuttonmotionfcn', @(h,e)(cellfun(@(x)feval(x,h,e),@(h,e)hover1,H1,@(h,e)hover2,H2,@(h,e)hover3,H3)));



% obj = set(combinedWindowsFig,'windowbuttonmotionfcn', @(h,e)(cellfun(@(x)feval(x,h,e), {@(h,e)hover1, @(h,e)hover2, @(h,e)hover3})));


set(L1, 'ButtonDownFcn', {@selectedLine1, L1})
else
    overlay;
end

function overlay2
global wingPointsArray2 YW2 XWRT c tp b LamLE L2 XWRTMain topViewAxes...
    rootChord tipChord xScaleFactor yScaleFactor YW2Scaled storageArrayP1...
    storageArrayP2

%% 2nd Line

if isempty(yScaleFactor) ~= 1
    % X-Coordinates
    XW1 = 0;
    XW2Scaled = XW1 + (b/2)*tand(LamLE)*xScaleFactor;
    XW3Scaled = XW2Scaled + tipChord*xScaleFactor;
    XW4Scaled = XW1 + rootChord*xScaleFactor;

    % Y-Coordinates
    YW2Scaled=(b/2)*yScaleFactor;

    XWRTScaled = [(((XW4Scaled))),(((XW3Scaled)))];
    wingPlanformPointsX2 = linspace(XWRTScaled(1),XWRTScaled(2),1000);
    wingPlanformPointsY2 = linspace(0,YW2Scaled,1000);
    
elseif isempty(storageArrayP1) == 1 && isempty(storageArrayP2) == 1
    % X-Coordinates
    XW1 = 0;
    XW2=XW1 + (b/2)*tand(LamLE);
    XW3=XW2 + tipChord;
    XW4=XW1 + rootChord;

    % Y-Coordinates
    YW2=b/2;

    XWRT = [(((XW4))),(((XW3)))];
    wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
    wingPlanformPointsY2 = linspace(0,YW2,1000);

%% 2nd Line
% XWRT = [(((XW4))),(((XW3)))];

% Wing Planform Points
% wingPlanformPointsX2 = linspace(-XWRT(2),-XWRT(3),1000);
% wingPlanformPointsY2 = linspace(YW2,YW2,1000);

% wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
% 
% wingPlanformPointsY2 = linspace(0,YW2,1000);

% Conversion from number array to cell array
wingPlanformPointsXCell2 = num2cell(wingPlanformPointsX2);
wingPlanformPointsYCell2 = num2cell(wingPlanformPointsY2);

% Arrange it in a column
wingPlanformPointsXCell2 = wingPlanformPointsXCell2(:);
wingPlanformPointsYCell2 = wingPlanformPointsYCell2(:);

wingPointsArray2 = [wingPlanformPointsXCell2,wingPlanformPointsYCell2];
L2 = line(topViewAxes,cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

% set(combinedWindowsFig,'windowbuttondownfcn',{@selectedLine2,L2});
set(L2, 'ButtonDownFcn', {@selectedLine2, L2})
else
    overlay;
end

function overlay3
global wingPointsArray3 YW2 XWRT c tp b LamLE L3 XWRTMain frontViewAxes...
    t_c rootChord tipChord Gam yScaleFactor

%% 3rd Line
if isempty(yScaleFactor) ~= 1

i_w = 0;   
    
XWRT = XWRTMain;

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW3=XW2+tipChord;
XW4=XW1+rootChord;

% Y-Coordinates
YW2=b/2;



% X-Coordinates
XW2=XW1+(b/c)*tand(LamLE);


% Y-Coordinates
YW2=b/2;



ZW1=rootChord*sind(i_w);
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);


ZWRT = [-(ZW1+t_c*rootChord),-(ZW2+t_c*tipChord),0,0];

% Wing Planform Points
% wingPlanformPointsX2 = linspace(-XWRT(2),-XWRT(3),1000);
% wingPlanformPointsY2 = linspace(YW2,YW2,1000);

wingPlanformPointsX3 = linspace(ZWRT(1),ZWRT(2),1000);

wingPlanformPointsY3 = linspace(0,-YW2,1000);

% Conversion from number array to cell array
wingPlanformPointsXCell2 = num2cell(wingPlanformPointsX3);
wingPlanformPointsYCell2 = num2cell(wingPlanformPointsY3);

% Arrange it in a column
wingPlanformPointsXCell2 = wingPlanformPointsXCell2(:);
wingPlanformPointsYCell2 = wingPlanformPointsYCell2(:);

wingPointsArray3 = [wingPlanformPointsXCell2,wingPlanformPointsYCell2];
L3 = line(frontViewAxes,cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);

% set(combinedWindowsFig,'windowbuttondownfcn',{@selectedLine2,L2});
set(L3, 'ButtonDownFcn', {@selectedLine3, L3});
else
    overlay;
end

% Selected line callbacks
function selectedLine1(~,~,~)
global wingPointsArray1 H1 H2 combinedWindowsFig lineSelected lineSelectedOff...
      pointSelected saveButton pointCoordFig
delete(H1);
delete(H2);
H1 = patchline(cell2mat(wingPointsArray1(:,1)),cell2mat(wingPointsArray1(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover1,H1});
lineSelected = 1;
lineSelectedOff = 0;
pointSelected = 0;
% if isempty(storageArrayX) ~= 1 || isempty(storageArrayY) ~= 1
%     for i = 1:length(storageArrayX)
%         if xclick == storageArrayX(i) && yclick == storageArrayY(i)
%         end
%     end
% end
saveButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Save Point','Position',[60 20 60 25],'Callback',@pushbutton_savePoint_Callback,'Enable','off');

function selectedLine2(~,~,~)
global wingPointsArray2 H1 H2 combinedWindowsFig lineSelectedOff lineSelected...
     pointSelected saveButton pointCoordFig
delete(H1);
delete(H2);
H2 = patchline(cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover2,H2});
lineSelected = 2;
lineSelectedOff = 0;
pointSelected = 0;
saveButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Save Point','Position',[60 20 60 25],'Callback',@pushbutton_savePoint_Callback,'Enable','off');

function selectedLine3(~,~,~)
global wingPointsArray3 H3 combinedWindowsFig lineSelectedOff lineSelected...
     pointSelected saveButton pointCoordFig

delete(H3);
H3 = patchline(cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover3,H3});
lineSelected = 3;
lineSelectedOff = 0;
pointSelected = 0;
saveButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Save Point','Position',[60 20 60 25],'Callback',@pushbutton_savePoint_Callback,'Enable','off');

% Moving the mouse over the selected line moves a dot under the mouse
function hover1(src1,~,L1)
global LL1 LL2 wingPointsArray1 idx1 line1Selected lineSelectedOff topViewAxes

delete(LL2);
% delete(firstPointFigure);
% delete(secondPointFigure);
% firstPointFigureDeleted = 1;
% delete(firstLineFigure);
% line1Selected = 0;
%since this is a figure callback, the first input is the figure handle:


f=src1;

%like all callbacks, the second input, ev, isn't used. 
%  delete(pointsFigure);
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo
 
% if pointCoordinatesSelected == 0
if obj==L1 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L1,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx1=findclosestpoint2D(xclick,yclick,L1);
%         idx4=findclosestpoint2D(xclick,yclick,L1);
        if length(idx1) > length(wingPointsArray1)
            idx1(end) = [];
        end
        
%         disp(xclick);

%     if secondRun == 0
%     selected = false(size(idx1));
%         for ii = 1:length(idx1)
%             selected(ii) = idx1(ii);
%             if selected(ii) == 1
%                 idxPosition1 = ii;
%                 break
%             end
%         end
%     end
% 
%     if secondRun == 1
%     selected = false(size(idx1));
%         for jj = 1:length(idx1)
%             selected(jj) = idx1(jj);
%             if selected(jj) == 1
%                 idxPosition2 = jj;
%                 break
%             end
%         end
%     end

%         if idxPosition1 == idxPosition2
%         elseif idxPosition1 ~= idxPosition2
        if lineSelectedOff == 0
            delete(findobj(LL1));
%             delete(findobj(LL2));
%             delete(findobj(LL3));
            LL1=line(topViewAxes,wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            set(LL1, 'ButtonDownFcn', {@selectedPoint1, LL1});
        end
        
        
        
%             idxC = idx1;
%             
%             idxA = idx1(1:1000);
%             idxB = idx1(1001:2000);
%             idxC = idx1(2001:3000);
%             
%             idxCombo = [idxA,idxB,idxC];
            
%             LL1=line(wingPointsArray1(idxCombo(1:3),(1:3)),wingPointsArray1(idxCombo(1:3),(4:6)),'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            
%             LL1=line(wingPointsArray1{idxCombo(:,1),(1)},wingPointsArray1{idxCombo(:,1),(2)},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
%             LL2=line(wingPointsArray1{idxCombo(:,2),(2)},wingPointsArray1{idxCombo(:,2),(2)},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
%             LL3=line(wingPointsArray1{idxCombo(:,3),(3)},wingPointsArray1{idxCombo(:,3),(3)},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            
%             LL2=line(wingPointsArray2{idx1,1},wingPointsArray2{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
%             LL3=line(wingPointsArray3{idx1,1},wingPointsArray3{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
%             set(LL1, 'ButtonDownFcn', {@selectedPoint1, LL1});
%             set(LL2, 'ButtonDownFcn', {@selectedPoint2, LL2});
%             set(LL3, 'ButtonDownFcn', {@selectedPoint2, LL3});
            
%             delete(redline);
%             delete(blueline);
%             redline  = line([xclick,xclick],[0,70],'linestyle','-','color','red');
%             blueline = line([-20,0],[yclick,yclick],'linestyle','-','color','blue');
end
line1Selected = 1;
            
function hover2(src2,~,L2)
global secondRun idxPosition1 idxPosition2 LL1 LL2 wingPlanformPointsXLogic...
    wingPlanformPointsYLogic wingPlanformPointsX wingPlanformPointsY LL3 LL4...
    wingPointsArray2 idx2 pointCoordinatesSelected idx3 L3 firstPointFigure...
    firstLineFigure firstPointFigureDeleted secondPointFigure secondPointSelected...
    secondPointFigureDeleted topViewAxes

delete(LL1);

% if firstPointFigureDeleted == 0
% t = timer('StartDelay', 0, 'Period', .3, 'TasksToExecute', 2, ...
%         'ExecutionMode', 'fixedRate');
% 
%         t.TimerFcn = @(x,y)disp('');
% 
%         start(t)
%         wait(t)
% elseif firstPointFigureDeleted == 1
% elseif secondPointFigureDeleted == 0
%     t = timer('StartDelay', 0, 'Period', .3, 'TasksToExecute', 2, ...
%         'ExecutionMode', 'fixedRate');
% 
%         t.TimerFcn = @(x,y)disp('');
% 
%         start(t)
%         wait(t)
% end
% delete(firstPointFigure);
% delete(secondPointFigure);
% firstPointFigureDeleted = 1;
% delete(firstLineFigure);

%since this is a figure callback, the first input is the figure handle:
f=src2;
 
%like all callbacks, the second input, ev, isn't used. 
 
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo

% if pointCoordinatesSelected == 0
    if obj==L2 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L2,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx2=findclosestpoint2D(xclick,yclick,L2);
%         idx3=findclosestpoint2D(xclick,yclick,L2);

        if length(idx2) > length(wingPointsArray2)
            idx2(end) = [];
        end

%     if secondRun == 0
%     selected = false(size(idx2));
%         for ii = 1:length(idx2)
%             selected(ii) = idx2(ii);
%             if selected(ii) == 1
%                 idxPosition1 = ii;
%                 break
%             end
%         end
%     end
% 
%     if secondRun == 1
%     selected = false(size(idx2));
%         for jj = 1:length(idx2)
%             selected(jj) = idx2(jj);
%             if selected(jj) == 1
%                 idxPosition2 = jj;
%                 break
%             end
%         end
%     end

%         if idxPosition1 == idxPosition2
%         elseif idxPosition1 ~= idxPosition2
            delete(findobj(LL2));
            % For line 2
    %         LL2=line(animals2{idx,2},animals2{idx,1},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            LL2=line(topViewAxes,wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            set(LL2, 'ButtonDownFcn', {@selectedPoint2, LL2})
%             if secondRun == 1
%                 secondRun = 0;
%             else
%                 secondRun = 1;
%             end
%         end
    else
    end
    
function hover3(src3,~,L3)
global secondRun idxPosition1 idxPosition2 LL1 LL2 wingPlanformPointsXLogic...
    wingPlanformPointsYLogic wingPlanformPointsX wingPlanformPointsY LL3 LL4...
    wingPointsArray3 idx2 pointCoordinatesSelected idx3 firstPointFigure...
    firstLineFigure firstPointFigureDeleted secondPointFigure secondPointSelected...
    secondPointFigureDeleted frontViewAxes


% if firstPointFigureDeleted == 0
% t = timer('StartDelay', 0, 'Period', .3, 'TasksToExecute', 2, ...
%         'ExecutionMode', 'fixedRate');
% 
%         t.TimerFcn = @(x,y)disp('');
% 
%         start(t)
%         wait(t)
% elseif firstPointFigureDeleted == 1
% elseif secondPointFigureDeleted == 0
%     t = timer('StartDelay', 0, 'Period', .3, 'TasksToExecute', 2, ...
%         'ExecutionMode', 'fixedRate');
% 
%         t.TimerFcn = @(x,y)disp('');
% 
%         start(t)
%         wait(t)
% end
% delete(firstPointFigure);
% delete(secondPointFigure);
% firstPointFigureDeleted = 1;
% delete(firstLineFigure);

%since this is a figure callback, the first input is the figure handle:
f=src3;
 
%like all callbacks, the second input, ev, isn't used. 
 
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo

% if pointCoordinatesSelected == 0
    if obj==L3 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L3,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx3=findclosestpoint2D(xclick,yclick,L3);
%         idx3=findclosestpoint2D(xclick,yclick,L2);

        if length(idx3) > length(wingPointsArray3)
            idx3(end) = [];
        end

%     if secondRun == 0
%     selected = false(size(idx2));
%         for ii = 1:length(idx2)
%             selected(ii) = idx2(ii);
%             if selected(ii) == 1
%                 idxPosition1 = ii;
%                 break
%             end
%         end
%     end
% 
%     if secondRun == 1
%     selected = false(size(idx2));
%         for jj = 1:length(idx2)
%             selected(jj) = idx2(jj);
%             if selected(jj) == 1
%                 idxPosition2 = jj;
%                 break
%             end
%         end
%     end

%         if idxPosition1 == idxPosition2
%         elseif idxPosition1 ~= idxPosition2
            delete(findobj(LL3));
            % For line 2
    %         LL2=line(animals2{idx,2},animals2{idx,1},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            LL3=line(frontViewAxes,wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            set(LL3, 'ButtonDownFcn', {@selectedPoint3, LL3})
%             if secondRun == 1
%                 secondRun = 0;
%             else
%                 secondRun = 1;
%             end
%         end
    end

%% Callback to each point--------------------------------------------------
function selectedPoint1(~, ~, ~)
global LL1 LEP1 wingPointsArray1 idx1 pointCoordinatesSelected enablePointCoords...
    lineSelectedOff storageArrayP1 H1 H2 LL2 TEP1 storageArray2X storageArrayP2...
    saveButton

delete(H1);
delete(H2);
delete(LL1);
delete(LL2);
delete(TEP1);
lineSelectedOff = 1;
delete(LEP1);

if isempty(storageArray2X) == 1 && isempty(storageArrayP2) ~= 1
    storageArrayP2(end) = [];
end

if isempty(storageArrayP1) ~= 1
    storageArrayP1(end) = [];
end

if isempty(storageArrayP1) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP1(end+1) = length(storageArrayP1)+1;
else 
    % If no previous values xLocation and yLocation
    storageArrayP1(1) = 1;
end

% if storageArrayP1(end) == 1
    LEP1 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
    LEP1.Visible = 'on';
    LEP1.MarkerEdgeColor = 'green';
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
% elseif storageArrayP1(end) == 2
%     LP2 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
%     LP2.Visible = 'on';
%     set(LP2, 'ButtonDownFcn', {@currentPoint2, LP2});
% elseif storageArrayP1(end) == 3
%     LP3 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
%     LP3.Visible = 'on';
%     set(LP3, 'ButtonDownFcn', {@currentPoint3, LP3});
% end
    
% if storageArrayP1(end) > 1 && okButtonSelected == 0
%     if storageArrayP1(end) == 2
%        check = LP2.Visible == 'on';
%         if check(1) == 1
%             LP1.Visible = 'off';
%             LP2.Visible = 'off';
%         else
%             LP1.Visible = 'off';
%         end
%     elseif storageArrayP1(end) == 3
%         LP2.Visible = 'off';
%     elseif storageArrayP1(end) == 4
%         LP3.Visible = 'off';
%     end
%     storageArrayP1(end) = [];
% end

enablePointCoords = 1;
pointCoordinatesSelected = 1;
pointCoordinatesMod;
saveButton.Enable = 'on';

function selectedPoint2(~, ~, ~)
global LL2 wingPointsArray2 idx2 TEP1 H2 lineSelectedOff storageArrayP2...
    H1 LL1 LEP1 storageArray1X storageArrayP1 enablePointCoords saveButton

delete(H1);
delete(H2);
delete(LL1);
delete(LL2);
delete(LEP1);
lineSelectedOff = 1;
delete(TEP1);

if isempty(storageArray1X) == 1 && isempty(storageArrayP1) ~= 1
    storageArrayP1(end) = [];
end

if isempty(storageArrayP2) ~= 1
    storageArrayP2(end) = [];
end

if isempty(storageArrayP2) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP2(end+1) = length(storageArrayP2)+1;
else 
    % If no previous values xLocation and yLocation
    storageArrayP2(1) = 1;
end

TEP1 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
TEP1.Visible = 'on';
TEP1.MarkerEdgeColor = 'green';
set(TEP1, 'ButtonDownFcn', {@currentPoint2, TEP1});

enablePointCoords = 1;
% pointCoordinatesSelected = 1;
pointCoordinatesMod;
saveButton.Enable = 'on';

function selectedPoint3(~,~,~)
global LL3 wingPointsArray3 idx3 USP1 H3 lineSelectedOff storageArrayP2...
       storageArray1X storageArrayP1 enablePointCoords saveButton storageArrayP3

delete(H3);
delete(LL3);
delete(USP1);
lineSelectedOff = 1;

if isempty(storageArray1X) == 1 && isempty(storageArrayP1) ~= 1
    storageArrayP1(end) = [];
end

if isempty(storageArrayP2) ~= 1
    storageArrayP2(end) = [];
end

if isempty(storageArrayP3) ~= 1
    storageArrayP3(end) = [];
end

if isempty(storageArrayP3) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP3(end+1) = length(storageArrayP3)+1;
else 
    % If no previous values xLocation and yLocation
    storageArrayP3(1) = 1;
end

USP1 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
USP1.Visible = 'on';
USP1.MarkerEdgeColor = 'green';
set(USP1, 'ButtonDownFcn', {@currentPoint3, USP1});

enablePointCoords = 1;
% pointCoordinatesSelected = 1;
pointCoordinatesMod;
saveButton.Enable = 'on';

%% Callback specifying which point is most current-------------------------
function currentPoint1(~, ~, ~)
global pointSelected editButton deleteButton
pointSelected = 1;
pointCoordinatesMod;
editBox;
editButton.Enable   = 'on';
deleteButton.Enable = 'on';

function currentPoint2(~, ~, ~)
global pointSelected editButton deleteButton
pointSelected = 2;
pointCoordinatesMod;
editBox;
editButton.Enable   = 'on';
deleteButton.Enable = 'on';

function currentPoint3(~, ~, ~)
global pointSelected editButton deleteButton
pointSelected = 3;
pointCoordinatesMod;
editBox;
editButton.Enable   = 'on';
deleteButton.Enable = 'on';

% Edit box specifying what type of modification is to be performed
function editBox
global editBoxSelected editPanel pointCoordFig editButton deleteButton
% Figure
% editPanel = figure('Visible','on','Position',[500 600 130 70],...
%     'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
%     'Name','','Resize','off','Dockcontrols','off');

editBoxSelected = 1;

%Radiobuttons
% uicontrol('Parent',editPanel,'Style','radiobutton','String','Edit','Fontsize',10,'Position',[10 40 50 25],'Callback',@radiobutton_edit_Callback,'Enable','on');
% uicontrol('Parent',editPanel,'Style','radiobutton','String','Delete','Fontsize',10,'Position',[10 15 60 25],'Callback',@radiobutton_delete_Callback,'Enable','on');
% uicontrol('Parent',pointCoordFig,'Style','text','String','Edit','Fontsize',10,'Position',[260 40 50 25],'Callback',@radiobutton_edit_Callback,'Enable','off');
editButton   = uicontrol('Parent',pointCoordFig,'Style','radiobutton','String','Edit Point','Fontsize',10,'Position',[240 40 100 25],'Callback',@radiobutton_edit_Callback,'Enable','off');
deleteButton = uicontrol('Parent',pointCoordFig,'Style','radiobutton','String','Delete Point','Fontsize',10,'Position',[240 15 100 25],'Callback',@radiobutton_delete_Callback,'Enable','off');

% Wing Dimensions
function wingDimensions
global tp c b Gam LamLE ARWing wingDimensionsModPanel wingArea rootChord...
    tipChord wingSpan rootButton strakeButton strakeChord

% Wing Area
wingArea = (b/2)*c*(1+tp);

% Wing Span
wingSpan = b;
% Construct the components
%% Static Texts------------------------------------------------------------
% Wing Area
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Reference Area','Position',[5 100 100 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','ft^2','Position',[65 75 35 25]);
    
% Wing Aspect Ratio
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Aspect Ratio','Position',[120 100 80 25],'Fontsize',9);    

% Wing Span
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Span','Position',[243 100 35 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','ft','Position',[275 75 35 25]);    
    
% Wing Taper
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Taper Ratio','Position',[316 100 100 25],'Fontsize',9);    
    
% Wing Sweep
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Sweep','Position',[25 40 40 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','deg','Position',[65 15 35 25]);

% Wing Dihedral
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Dihedral','Position',[132 40 50 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','deg','Position',[175 15 35 25]);    

% Root Chord
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Root Chord','Position',[230 40 70 25],'Fontsize',9);
%     Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','ft','Position',[275 15 35 25]);
    
% Tip Chord
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Tip Chord','Position',[330 40 100 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','ft','Position',[395 15 35 25]);

%% Textboxes---------------------------------------------------------------
% Wing Area
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',wingArea,'Position',[25 80 45 25]);

% Aspect Ratio
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',ARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

% Wing Span
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',wingSpan,'Position',[240 80 45 25],'Callback',@txtbox_span_Callback);

% Wing Taper
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',tp,'Position',[345 80 45 25],'Callback',@txtbox_taper_Callback);

% Wing Sweep
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',LamLE,'Position',[25 20 45 25],'Callback',@txtbox_sweep_Callback);

% Wing Dihedral
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',Gam,'Position',[135 20 45 25],'Callback',@txtbox_dihedral_Callback);

% Root Chord
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',rootChord,'Position',[240 20 45 25],'Callback',@txtbox_rootChord_Callback);

% Tip Chord
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',tipChord,'Position',[360 20 45 25],'Callback',@txtbox_tipChord_Callback);

% Strake Or Root Chord
% rootButton   = uicontrol('Parent',wingDimensionsModPanel','Style','radio','String','Root','Position',[305 35 50 20],'Callback',@radiobutton_root_Callback);
strakeButton = uicontrol('Parent',wingDimensionsModPanel','Style','checkbox','String','Strake','Position',[302 23 50 20],'Callback',@checkbox_strake_Callback);

% Callbacks to the Wing Dimensions
function txtbox_strakeChord_Callback(hObject,~)
global strakeChord

strakeChord = str2double(get(hObject,'String'));

% Callbacks to the edit box------------------------------------------------
function radiobutton_edit_Callback(~,~)
global editFigure pointSelected lineSelected
switch(pointSelected)
    case 1
        lineSelected = 1;
    case 2
        lineSelected = 2;
end

function radiobutton_delete_Callback(~,~)
global LP1 LP2 LP3 LP4 LP5 LP6 pointSelected editFigure
switch(pointSelected)
    case 1
        delete(LP1);
    case 2
        delete(LP2);
end
delete(editFigure);

function index = findclosestpoint2D(xclick,yclick,datasource)
%this function checks which point in the plotted line "datasource"
%is closest to the point specified by xclick/yclick. It's kind of 
%complicated, but this isn't really what this demo is about...

xdata=get(datasource,'xdata');
ydata=get(datasource,'ydata');
 
activegraph=get(datasource,'parent');
 
pos=getpixelposition(activegraph);
xlim=get(activegraph,'xlim');
ylim=get(activegraph,'ylim');
 
%make conversion factors, units to pixels:
xconvert=(xlim(2)-xlim(1))/pos(3);
yconvert=(ylim(2)-ylim(1))/pos(4);
 
Xclick=(xclick-xlim(1))/xconvert;
Yclick=(yclick-ylim(1))/yconvert;
 
Xdata=(xdata-xlim(1))/xconvert;
Ydata=(ydata-ylim(1))/yconvert;

Xdiff=(Xdata-Xclick);
Ydiff=(Ydata-Yclick);
 
distance=sqrt(Xdiff.^2+Ydiff.^2);
 
index=distance==min(distance);

index=index(:); %make sure it's a column.
 
if sum(index)>1
    thispoint=find(distance==min(distance),1);
    index=false(size(distance));
    index(thispoint)=true;
end

% Callback to add a strake
function checkbox_strake_Callback(~,~)
global wingDimensionsModPanel strakeButton strakeChord rootChord
if strakeButton.Value == 0
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Root Chord','Position',[227 45 76 20],'Fontsize',9);
    uicontrol('Parent',wingDimensionsModPanel','Style','edit','String',rootChord,'Position',[240 20 45 25],'Callback',@txtbox_rootChord_Callback);
elseif strakeButton.Value == 1
    uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Strake Chord','Position',[230 45 75 20],'Fontsize',9);
    % Strake Chord
    uicontrol('Parent',wingDimensionsModPanel','Style','edit','String',strakeChord,'Position',[240 20 45 25],'Callback',@txtbox_strakeChord_Callback);
    if isempty(strakeChord) == 1
        strakeChord = 0;
    end
    uicontrol('Parent',wingDimensionsModPanel','Style','edit','String',strakeChord,'Position',[240 20 45 25],'Callback',@txtbox_rootChord_Callback);
end

% Callbacks to the pushbuttons
function pushbutton_top_Callback(~, ~)
global selected b Gam LamLE XWR2 YWR2 ZWR2 XW1 airfoil_array...
    airfoil_coords_x airfoil_coords_y previewAxes wingPreviewModPanel...
    rightAirfoil leftAirfoil wingPreviewLeft wingPreviewRight rootChord...
    tipChord i_w comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize

delete(previewAxes);
delete(wingPreviewLeft);
delete(wingPreviewRight);
delete(rightAirfoil);
delete(leftAirfoil);
previewAxes = axes('Parent',wingPreviewModPanel,'Position',[.05 .2 .93 .75]);
aircraftWingPreview;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 90;
view(az,el);

shading(previewAxes,'interp');
lighting gouraud;
camlight;

hold on

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW4=XW1+rootChord;
XWR2 = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

% Y-Coordinates
YWR2 = (zeros(comboAirfoilSize) + b/2);

% Z-Coordinates
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZWR2 = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

rightAirfoil = fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
leftAirfoil  = fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

selected = 1;
            
function pushbutton_front_Callback(~,~)
global selected b Gam LamLE XWR2 YWR2 ZWR2 XW1 airfoil_array...
    airfoil_coords_x airfoil_coords_y previewAxes wingPreviewModPanel...
    rightAirfoil leftAirfoil wingPreviewRight wingPreviewLeft rootChord...
    tipChord i_w comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize

delete(previewAxes);
delete(wingPreviewLeft);
delete(wingPreviewRight);
delete(rightAirfoil);
delete(leftAirfoil);
previewAxes = axes('Parent',wingPreviewModPanel,'Position',[.05 .2 .93 .75]);
aircraftWingPreview

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 0;
view(az,el);

shading interp
lighting gouraud;
camlight;

hold on

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW4=XW1+rootChord;
XWR2 = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

% Y-Coordinates
% YWR2 = (airfoil_array + b/2);
YWR2 = (zeros(comboAirfoilSize) + b/2);

% Z-Coordinates
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZWR2 = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

rightAirfoil = fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
leftAirfoil  = fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

selected = 2;
            
function pushbutton_side_Callback(~,~)
global selected b Gam LamLE XWR2 YWR2 ZWR2 XW1 airfoil_array...
    airfoil_coords_x airfoil_coords_y previewAxes wingPreviewModPanel...
    rightAirfoil leftAirfoil wingPreviewRight wingPreviewLeft rootChord...
    tipChord i_w comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize

delete(previewAxes);
delete(wingPreviewLeft);
delete(wingPreviewRight);
delete(rightAirfoil);
delete(leftAirfoil);
previewAxes = axes('Parent',wingPreviewModPanel,'Position',[.05 .2 .93 .75]);
aircraftWingPreview

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 0;
el = 360;
view(az,el);

shading interp
lighting gouraud;
camlight;

hold on

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW4=XW1+rootChord;
XWR2 = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

% Y-Coordinates
% YWR2 = (airfoil_array + b/2);
YWR2 = (zeros(comboAirfoilSize) + b/2);


% Z-Coordinates
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZWR2 = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

rightAirfoil = fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
leftAirfoil  = fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

selected = 3;
             
function pushbutton_iso_Callback(~,~)
global selected b Gam LamLE XWR2 YWR2 ZWR2 XW1 airfoil_array...
    airfoil_coords_x airfoil_coords_y previewAxes wingPreviewModPanel...
    rightAirfoil leftAirfoil wingPreviewRight wingPreviewLeft rootChord...
    tipChord i_w comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize

delete(previewAxes);
delete(wingPreviewLeft);
delete(wingPreviewRight);
delete(rightAirfoil);
delete(leftAirfoil);
previewAxes = axes('Parent',wingPreviewModPanel,'Position',[.05 .2 .93 .75]);
aircraftWingPreview

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view(3);

shading interp
lighting gouraud;
camlight;

hold on

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW4=XW1+rootChord;
XWR2 = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

% Y-Coordinates
% YWR2 = (airfoil_array + b/2);
YWR2 = (zeros(comboAirfoilSize) + b/2);

% Z-Coordinates
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZWR2 = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

rightAirfoil = fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
leftAirfoil  = fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

selected = 4;

% function pushbutton_importAircraftDrawing_Callback(~,~)
% insertAircraftDrawing;

function orbit_camera(hObject, eventData)
persistent orbitOrigin orbitScale
switch eventData.operation
  case 'click'
    orbitOrigin = eventData.figurePoint;
    orbitScale = [360 180]./eventData.figureRegion(3:4);
  case 'drag'
    offset = orbitScale.*(orbitOrigin-eventData.figurePoint);
    orbitOrigin = eventData.figurePoint;
    camorbit(hObject, offset(1), offset(2));
end

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

function reset_camera(hObject, ~)
set(hObject, 'CameraPosition', [-10 -10 10], ...
             'CameraTarget', [0 0 0], ...
             'CameraUpVector', [0 0 1], ...
             'CameraViewAngle', 90,...
             'CameraviewAngleMode','Auto');
         
         