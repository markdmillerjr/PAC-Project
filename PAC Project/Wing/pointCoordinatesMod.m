function pointCoordinatesMod
% Written by Mark D. Miller Jr.
% 1/27/20

global pointCoordFig leftButton rightButton upButton downButton...
    enablePointCoords okButton saveButton cancelButton xCoordinateLabel...
    yCoordinateLabel resetButton zCoordinateLabel

% Didn't like the standard matlab input box so I decided to make my own.
% delete(boxFigure)
% % Figure
% boxFigure = figure('Visible','on','Position',[500 600 270 110],...
%     'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
%     'Name','Point Coordinates','Resize','off','Dockcontrols','off','CloseRequestFcn',@pointCoordinates_closereq);

% Z Coordinate
zCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','Z-Coordinate','Position',[10 80 100 25],'Enable','off');
% X Coordinate
xCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','X-Coordinate','Position',[5 80 85 25],'Enable','off');
% Y Coordinate
yCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','Y-Coordinate','Position',[85 80 85 25],'Enable','off');


% X-Y Coordinate Pushbuttons
leftButton  = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','<','Fontsize',12,'Fontweight','bold','Position',[170 60 30 25],'Callback',@pushbutton_left_Callback,'Enable','off');
rightButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','>','Fontsize',12,'Fontweight','bold','Position',[200 60 30 25],'Callback',@pushbutton_right_Callback,'Enable','off');
upButton    = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','^','Fontsize',15,'Fontweight','bold','Position',[187 90 25 30],'Callback',@pushbutton_up_Callback,'Enable','off');
downButton  = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','V','Fontsize',10,'Fontweight','bold','Position',[187 30 25 25],'Callback',@pushbutton_down_Callback,'Enable','off');

% Ok Pushbutton
okButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','OK','Position',[25 20 30 25],'Callback',@pushbutton_ok_Callback,'Enable','off');

% Save Point Pushbutton
saveButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Save Point','Position',[60 20 60 25],'Callback',@pushbutton_savePoint_Callback,'Enable','off');

% Cancel Pushbutton
cancelButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Cancel','Position',[125 20 45 25],'Callback',@pushbutton_cancel_Callback,'Enable','off');

% Reset Pushbutton
resetButton = uicontrol('Parent',pointCoordFig,'Style','pushbutton','String','Reset','Position',[275 100 45 25],'Callback',@pushbutton_reset_Callback,'Enable','off');

if enablePointCoords == 1
    enablePointCoordinates;
else
    disablePointCoordinates;
end

% if wpmActivated == 1
%     lineSelected = 1;
%     xLocationInc = xLocationInc + c/b;
%     pushbutton_up_Callback;
%     overlay;
% end

function disablePointCoordinates
global pointCoordFig leftButton rightButton lineSelected wingPointsArray1...
    wingPointsArray2 wingPointsArray3 idx1 idx2 idx3 xLocation yLocation...
    upButton downButton okButton saveButton cancelButton xCoordinateLabel...
    yCoordinateLabel zLocation polyhedralOn

% X Coordinate
% uicontrol('Parent',pointCoordFig,'Style','text','String','X-Coordinate','Position',[20 80 100 25],'Enable','off');
% % Y Coordinate
% uicontrol('Parent',pointCoordFig,'Style','text','String','Y-Coordinate','Position',[100 80 100 25],'Enable','off');

% Display point coordinates based on which line is selected
if lineSelected == 0
    % Show blank boxes for point coordinates
    uicontrol('Parent',pointCoordFig,'Style','edit','String','','Position',[26 60 50 25],'Enable','off');
    uicontrol('Parent',pointCoordFig,'Style','edit','String','','Position',[106 60 50 25],'Enable','off');

else
    switch(lineSelected)
        case 1
            % Need to find point coordinates
            xLocation1 = wingPointsArray1(idx1,1);
            yLocation1 = wingPointsArray1(idx1,2);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocation1,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation1,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
            xLocation = xLocation1;
            yLocation = yLocation1;
        case 2
            % Need to find point coordinates
            xLocation2 = wingPointsArray2(idx2,1);
            yLocation2 = wingPointsArray2(idx2,2);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocation2,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation2,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
            xLocation = xLocation2;
            yLocation = yLocation2;
        case 3
            % Need to find point coordinates
            zLocation3 = wingPointsArray3(idx3,1);
            yLocation3 = wingPointsArray3(idx3,2);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocation3,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation3,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
            zLocation = zLocation3;
            yLocation = yLocation3;
            if polyhedralOn == 1
                polyhedralMod;
            end
    end
end

% Disable Pushbuttons
xCoordinateLabel.Enable = 'off';
yCoordinateLabel.Enable = 'off';
leftButton.Enable       = 'off';
rightButton.Enable      = 'off';
upButton.Enable         = 'off';
downButton.Enable       = 'off';
okButton.Enable         = 'off';
saveButton.Enable       = 'off';
cancelButton.Enable     = 'off';

function enablePointCoordinates
global pointCoordFig leftButton rightButton lineSelected wingPointsArray1...
    wingPointsArray2 wingPointsArray3 idx1 idx2 idx3 xLocation yLocation...
    upButton downButton okButton saveButton cancelButton xCoordinateLabel...
    yCoordinateLabel resetButton zLocation zCoordinateLabel polyhedralOn

% X Coordinate
% uicontrol('Parent',pointCoordFig,'Style','text','String','X-Coordinate','Position',[10 80 80 25],'Enable','on');
% % Y Coordinate
% uicontrol('Parent',pointCoordFig,'Style','text','String','Y-Coordinate','Position',[80 80 100 25],'Enable','on');

% Display point coordinates based on which line is selected
switch(lineSelected)
    case 1
        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,1);
        yLocation1 = wingPointsArray1(idx1,2);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocation1,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation1,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
        xLocation = xLocation1;
        yLocation = yLocation1;
    case 2
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocation2,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation2,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
        xLocation = xLocation2;
        yLocation = yLocation2;
    case 3
        % Need to find point coordinates
        zLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocation3,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocation3,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
        zLocation = zLocation3;
        yLocation = yLocation3;
        if polyhedralOn == 1
            polyhedralMod;
        end
end

% Disable Pushbuttons
xCoordinateLabel.Enable = 'on';
yCoordinateLabel.Enable = 'on';
zCoordinateLabel.Enable = 'on';
leftButton.Enable       = 'on';
rightButton.Enable      = 'on';
upButton.Enable         = 'on';
downButton.Enable       = 'on';
okButton.Enable         = 'off';
saveButton.Enable       = 'on';
cancelButton.Enable     = 'on';
resetButton.Enable      = 'on';

% X-Y Coordinate Pushbuttons
function pushbutton_left_Callback(~,~)
global wingPointsArray1 LL1 LEP1 pointCoordFig wingPointsArray2...
    wingPointsArray3 LEP2 LEP3 LEP4 lineSelected LL2 idx1 idx2 idx3 LEP5...
    LEP6 xLocationInc yLocationInc storageArray1X storageArray1Y XWRTMain...
    YWRTMain wingOutline leftArrow XWRTMainC YWRTMainC storageArrayP1 rightArrow...
    tempStorageArrayX1 tempStorageArrayY1 L1 L2 L3 LEP7 LEP8 LEP9 LEP10 LPL1...
    tempStorageArrayXSort1 tempStorageArrayYSort1 LPL2 tempStorageArrayX2...
    tempStorageArrayY2 tempStorageArrayXSort2 tempStorageArrayYSort2...
    storageArray2X storageArray2Y storageArrayP2 TPL1 TPL2 TEP1 TEP2 TEP3...
    TEP4 TEP5 TEP6 TEP7 TEP8 TEP9 TEP10 topViewAxes wingPreviewLeft...
    wingPreviewRight  b c selectedCancel USP1 USP2 USP3 USP4 USP5 USP6 USP7...
    USP8 USP9 USP10 zLocationInc ZWRTMainFV YW2 tempStorageArrayZ3...
    tempStorageArrayY3 polyGam wingFrontView frontViewAxes LamLE i_w Gam...
    rootChord tipChord t_c

switch(lineSelected)
    %% 1 Leading edge selected---------------------------------------------
    %% 2 Trailing edge selected--------------------------------------------
    %% 3 Top line selected-------------------------------------------------
    case 1
        % Clear any existing points and lines
        delete([L1,LL1,L2,L3,LPL1,LPL2,LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray1(idx1,1));
            yLocationInc = cell2mat(wingPointsArray1(idx1,2))+c/b;
        elseif isempty(xLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            yLocationInc = yLocationInc + c/b;
%             xLocationInc = cell2mat(wingPointsArray1(idx1,1));
        elseif selectedCancel == 1
            xLocationInc = wingPointsArray1{idx1,1};
            yLocationInc = wingPointsArray1{idx1,2};
        end

        % Check if already at highest point based on last increment, if it is
        % then reduce increment and do nothing
        if xLocationInc < max(tempStorageArrayXSort1)
            if storageArrayP1(end) > 1

                xLocationIncPos = find(tempStorageArrayXSort1 > xLocationInc);
                xLocationIncPos = xLocationIncPos(end);
                
                for i = 1:length(xLocationIncPos)
                    if (yLocationInc) > tempStorageArrayYSort1(xLocationIncPos(i)) 
%                         yLocationInc = tempStorageArrayYSort1(xLocationIncPos(i));
                    end
                end
            end
        end

        % Adjustment for points placed at tip chord, erases old points and
        % keeps new ones, ensures they can't go past tip
        if yLocationInc >= max(YWRTMain)
            yLocationInc = max(YWRTMain);
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray1X) ~= 1 || isempty(storageArray1Y) ~= 1
            tempStorageArrayX1 = storageArray1X;
            tempStorageArrayY1 = storageArray1Y;

            tempStorageArrayX1(end+1) = xLocationInc;
            tempStorageArrayY1(end+1) = yLocationInc;
        else
            tempStorageArrayX1 = xLocationInc;
            tempStorageArrayY1 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(increasing) for the matrix
%         tempStorageArrayXSort1 = sort(tempStorageArrayX1);
%         tempStorageArrayYSort1 = sort(tempStorageArrayY1);
        

        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort1 = sort(tempStorageArrayY1,'ascend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
%         findYLocationArray = zeros(storageArrayP1(end),1);
%         rearrangedXArray   = zeros(storageArrayP1(end),1);
        
        findYLocationArray = zeros(length(tempStorageArrayX1),1);
        rearrangedXArray   = zeros(length(tempStorageArrayX1),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:storageArrayP1(end)
            intermediateArray = find(tempStorageArrayY1 == tempStorageArrayY1(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
            if length(find(tempStorageArrayYSort1 == 0)) > 1
                for j = 1:storageArrayP1(end)
                     if findYSorted(j) ~= 1
                         findYSorted(j) = 0;
                     else
                         findYSorted(j) = 1;
                     end
                end
            end
            rearrangedXArray(findYSorted) = tempStorageArrayX1(findYLocationArray(i));
        end
%=======================================================        
        
%         for i = 1:tempStorageArrayX1(end)
%             intermediateArray = find(tempStorageArrayY1 == tempStorageArrayY1(i));
%             if length(intermediateArray) > 1
%                 findFirstValue = intermediateArray == i;
%                 findSecondValue = findFirstValue == 0;
%                 intermediateArray(findSecondValue) = [];
%                 findYLocationArray(i) = intermediateArray;
%             else
%                 findYLocationArray(i) = intermediateArray;
%             end
%             findYLocationArray(i) = find(findYLocationArray == i);
%             findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
%             if length(find(tempStorageArrayYSort1 == 0)) > 1
%                 for j = 1:tempStorageArrayX1(end)
%                      if findYSorted(j) ~= 1
%                          findYSorted(j) = 0;
%                      else
%                          findYSorted(j) = 1;
%                      end
%                 end
%             end
%             findYLocationArray(i) = find(findYLocationArray == i);
%             findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
%             rearrangedXArray(findYSorted) = tempStorageArrayX1(findYLocationArray(i));
%         end
        
%=======================================================        
        tempStorageArrayXSort1 = rearrangedXArray';

        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        if yLocationInc == 0
            XWRTMain(1) = xLocationInc;
        end
        
        if yLocationInc == b/2
            findTipChordPoints = tempStorageArrayYSort1 == yLocationInc;
            XWRTMain(2) = tempStorageArrayXSort1(findTipChordPoints);
            YWRTMain(2) = tempStorageArrayYSort1(findTipChordPoints);
            tempStorageArrayYSort1(findTipChordPoints) = [];
            tempStorageArrayXSort1(findTipChordPoints) = [];
        end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
%         if min((tempStorageArrayXSort1)) < min((XWRTMain)) && yLocationInc == 0
%             [~,findMinXWRT] = min(XWRTMain);
%             findMinTemp = find(min(tempStorageArrayXSort1));
%             XWRTMain(findMinXWRT) = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = [];
%             tempStorageArrayYSort1(findMinTemp) = [];
%         elseif min((tempStorageArrayXSort1)) < min((XWRTMain)) && yLocationInc > 0
%             [~,findMinXWRT] = min(XWRTMain);
%             [~,findMinTemp] = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = XWRTMain(findMinXWRT);
%             tempStorageArrayX1(findMinTemp)     = XWRTMain(findMinXWRT);
%         end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP2) ~= 1
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];

        delete(wingOutline);
        delete(wingPreviewLeft);
        delete(wingPreviewRight);
        wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
        
        % Plot Wing Preview
        wingPreviewPlot;

        % Plot Line Points
        LEPoints;

        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);

        % Indicates left arrow has been selected
        leftArrow  = 1;
        rightArrow = 0;
     
        
    %% Trailing edge selected----------------------------------------------
    case 2
        % Clear any existing points and lines
        delete([L1,LL2,L2,L3,TPL1,TPL2,TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray2(idx2,1));
            yLocationInc = cell2mat(wingPointsArray2(idx2,2))+c/b;
        elseif isempty(xLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            yLocationInc = yLocationInc + c/b;
%             xLocationInc = cell2mat(wingPointsArray2(idx2,1));
        elseif selectedCancel == 1
            xLocationInc = wingPointsArray2{idx2,1};
            yLocationInc = wingPointsArray2{idx2,2};
        end

        % Check if already at highest point based on last increment, if it is
        % then reduce increment and do nothing
        if xLocationInc < max(tempStorageArrayXSort2)
            if storageArrayP2(end) > 1

                xLocationIncPos  = find(tempStorageArrayXSort2 > xLocationInc);

                for i = 1:length(xLocationIncPos)
                    if (yLocationInc) > tempStorageArrayYSort2(xLocationIncPos(i)) 
%                         yLocationInc = tempStorageArrayYSort2(xLocationIncPos(i));
                    end
                end
            end
        end

        % Adjustment for points placed at tip chord, erases old points and
        % keeps new ones, ensures points can't go past tip
        if yLocationInc >= max(YWRTMain)
            yLocationInc = max(YWRTMain);
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray2X) ~= 1 || isempty(storageArray2Y) ~= 1
            tempStorageArrayX2 = storageArray2X;
            tempStorageArrayY2 = storageArray2Y;

            tempStorageArrayX2(end+1) = xLocationInc;
            tempStorageArrayY2(end+1) = yLocationInc;
        else
            tempStorageArrayX2 = xLocationInc;
            tempStorageArrayY2 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(decreasing) for the matrix
%         tempStorageArrayXSort2 = sort(tempStorageArrayX2,'descend');
%         tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP2(end),1);
        rearrangedXArray   = zeros(storageArrayP2(end),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:storageArrayP2(end)
            intermediateArray = find(tempStorageArrayY2 == tempStorageArrayY2(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort2 == tempStorageArrayY2(findYLocationArray(i));
            if length(find(tempStorageArrayYSort2 == 0)) > 1
                for j = 1:storageArrayP2(end)
                     if findYSorted(j) ~= 1
                         findYSorted(j) = 0;
                     else
                         findYSorted(j) = 1;
                     end
                end
            end
            rearrangedXArray(findYSorted) = tempStorageArrayX2(findYLocationArray(i));
        end
        tempStorageArrayXSort2 = rearrangedXArray';
        
        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        if yLocationInc > 0
%             XWRTMain(end) = xLocationInc;
            
%             findZeros = tempStorageArrayYSort2 == 0;
%             findZerosX = tempStorageArrayX2(findZeros);
%             findZerosMax = max(findZerosX);
%             
%             XWRTMain(end) = findZerosMax;
            
            
        end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
        
        findZeros = find(tempStorageArrayYSort2 == 0);
        
        if length(findZeros) > 1 && yLocationInc == 0
        
           findZerosX   = tempStorageArrayX2(findZeros);
           findZerosMax = max(findZerosX);
%            if findZerosMax > XWRTMain(end)
               tempStorageArrayXSort2(end) = [];
               tempStorageArrayYSort2(end) = [];
%            end
            
            
            
%         if min((tempStorageArrayXSort2)) < min((XWRTMain)) && yLocationInc == 0
%             [~,findMinXWRT] = min(XWRTMain);
%             findMinTemp = find(min(tempStorageArrayXSort2));
%             XWRTMain(findMinXWRT) = min(tempStorageArrayXSort2);
%             tempStorageArrayXSort2(findMinTemp) = [];
%             tempStorageArrayYSort2(findMinTemp) = [];
        elseif min((tempStorageArrayXSort2)) < min((XWRTMain)) && yLocationInc > 0
            [~,findMinXWRT] = min(XWRTMain);
            [~,findMinTemp] = min(tempStorageArrayXSort2);
            tempStorageArrayXSort2(findMinTemp) = XWRTMain(findMinXWRT);
            tempStorageArrayX2(findMinTemp)     = XWRTMain(findMinXWRT);
        end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP1) ~= 1 && length(XWRTMain) > 3
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        elseif isempty(storageArrayP1) ~= 1 && length(XWRTMain) == 3
        XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:2) tempStorageArrayXSort2 XWRTMain(:,end)];
        YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:2) tempStorageArrayYSort2 YWRTMain(:,end)];
%         elseif tempStorageArrayXSort2(end) == XWRTMain(end)
%             XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) XWRTMain(:,end)];
%             YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort2 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort2 YWRTMain(:,2:end)];
% 
%         XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        
        delete(wingOutline);
        delete(wingPreviewLeft);
        delete(wingPreviewRight);
        wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
        
        % Plot Wing Preview
        wingPreviewPlot;

        % Plot Line Points
        TEPoints;

        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);

        % Indicates left arrow has been selected
        leftArrow  = 1;
        rightArrow = 0;
        
        
    %% Top Line Selected
    case 3
        % Clear any existing points and lines
        delete([L3,USP1,USP2,USP3,USP4,USP5,USP6,USP7,USP8,USP9,USP10]);
        delete(wingFrontView);
        if isempty(zLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            
            yLocationInc = cell2mat(wingPointsArray3(idx3,2))+c/b;
            slopeFV = atan((ZWRTMainFV(1)-ZWRTMainFV(2))/YW2);
            zLocationInc = (yLocationInc*tan(slopeFV)+(ZWRTMainFV(1)));
            
        elseif isempty(zLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            yLocationInc = yLocationInc + c/b;
            slopeFV = atan((ZWRTMainFV(1)-ZWRTMainFV(2))/YW2);
            zLocationInc = (yLocationInc*tan(slopeFV)+(ZWRTMainFV(1)));
            
        elseif selectedCancel == 1
            zLocationInc = wingPointsArray3{idx3,1};
            yLocationInc = wingPointsArray3{idx3,2};
        end
        
        tempStorageArrayZ3 = zLocationInc;
        tempStorageArrayY3 = yLocationInc;
        
        XW1 = 0;
        XW2=XW1 + (b/2)*tand(LamLE);
        XW3=XW1+rootChord;
        
        ZW1=rootChord*sind(i_w);
        ZW2=(XW3-XW2)*sind(i_w)+(b/2)*tand(Gam);
        ZW2Poly1 = (XW3-XW2)*sind(i_w)+(-yLocationInc)*tand(Gam);
        ZW2Poly2 = (XW3-XW2)*sind(i_w)+(-(yLocationInc+(b/2)))*tand(polyGam);
        
        ZWRTMainFV = [-(ZW1+t_c*rootChord),zLocationInc,(ZW2Poly2+zLocationInc+t_c),...
            (ZW2Poly2+t_c*tipChord+zLocationInc),zLocationInc+t_c*tipChord,0];
        YWRTMainFV = [0,yLocationInc,-YW2,-YW2,yLocationInc,0];
        wingFrontView = line(frontViewAxes,ZWRTMainFV,YWRTMainFV,'color','black','linewidth',3);
        
        axis tight equal
        xlabel('Z (ft)')
        ylabel('Y (ft)')

        grid on
        grid minor
        az = 270;
        el = -90;
        view(az,el);
        
        % Plot Line Points
        USPoints;
        
        % Activate polyhedralMod
        polyhedralMod;
        
        % Update X-Y Coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocationInc,'Position',[26 60 50 25],'Enable','off','Callback',@txtbox_zLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);

end
function pushbutton_right_Callback(~,~)
global wingPointsArray1 LL1 LEP1 pointCoordFig LL2 LEP2 LEP3 LEP4...
     wingPointsArray2 wingPointsArray3 lineSelected idx1 idx2 idx3 LEP5 ...
     LEP6 xLocationInc yLocationInc wingOutline storageArray1X storageArray1Y...
     XWRTMain YWRTMain rightArrow XWRTMainC YWRTMainC storageArrayP1...
     tempStorageArrayX1 leftArrow L1 L2 L3 tempStorageArrayY1 LEP7 LEP8...
     LEP9 LEP10 LPL1 tempStorageArrayXSort1 tempStorageArrayYSort1 LPL2...
     tempStorageArrayX2 tempStorageArrayY2 tempStorageArrayXSort2...
     tempStorageArrayYSort2 storageArrayP2 storageArray2X storageArray2Y...
     TPL1 TPL2 TEP1 TEP2 TEP3 TEP4 TEP5 TEP6 TEP7 TEP8 TEP9 TEP10...
     wingPreviewLeft wingPreviewRight c b topViewAxes strakeButton...
     selectedCancel USP1 USP2 USP3 USP4 USP5 USP6 USP7 USP8 USP9 USP10...
     zLocationInc ZWRTMainFV YW2 tempStorageArrayZ3 tempStorageArrayY3...
     polyGam wingFrontView frontViewAxes LamLE i_w Gam rootChord tipChord t_c

switch(lineSelected)
    %% Leading edge selected-----------------------------------------------
    %% 2 Trailing edge selected--------------------------------------------
    %% 3 Top line selected-------------------------------------------------
    case 1
        % Clear any existing points and lines
        delete([L1,LL1,L2,L3,LPL1,LPL2,LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray1(idx1,1));
            yLocationInc = cell2mat(wingPointsArray1(idx1,2))-c/b;
            % Ensures points can't go past root chord
            if yLocationInc <= 0
                yLocationInc = 0;
            end
        elseif isempty(xLocationInc) ~= 1 && selectedCancel || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            % Ensures points can't go past root chord
%             xLocationInc = cell2mat(wingPointsArray1(idx1,1));
            yLocationInc = yLocationInc - c/b;
            if yLocationInc <= 0
                yLocationInc = 0;
            end
        elseif selectedCancel == 1
            xLocationInc = wingPointsArray1{idx1,1};
            yLocationInc = wingPointsArray1{idx1,2};
        end

        % If a point is placed on the root chord, and are not adding a
        % strake, negate any modification to the root chord
        if yLocationInc == 0 && strakeButton.Value ~= 1
            yLocationInc = 0;
        end
        
        % Check if already at highest point based on last increment, if it is
        % then reduce increment and do nothing
        if xLocationInc > min(tempStorageArrayXSort1)
            if storageArrayP1(end) > 1

                xLocationIncPos  = find(tempStorageArrayXSort1 < xLocationInc);
                xLocationIncPos = xLocationIncPos(end);

                if (yLocationInc) < tempStorageArrayYSort1(xLocationIncPos) 
%                         yLocationInc = tempStorageArrayYSort1(xLocationIncPos);
                end
            end
        end

        % If only have one point and are at the tip then ensure can't leave tip
        % until a point is placed or canceled
        if storageArrayP1(end) == 1 && yLocationInc + 1 == max(YWRTMain)
            yLocationInc = max(tempStorageArrayY1);
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray1X) ~= 1 || isempty(storageArray1Y) ~= 1
            tempStorageArrayX1 = storageArray1X;
            tempStorageArrayY1 = storageArray1Y;
 
            tempStorageArrayX1(end+1) = xLocationInc;
            tempStorageArrayY1(end+1) = yLocationInc;
        else
            tempStorageArrayX1 = xLocationInc;
            tempStorageArrayY1 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(increasing) for the matrix
%         tempStorageArrayXSort1 = sort(tempStorageArrayX1);
%         tempStorageArrayYSort1 = sort(tempStorageArrayY1);
        
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort1 = sort(tempStorageArrayY1,'ascend');
%         tempStorageArrayXSort2 = sort(tempStorageArrayX2,'descend');

        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP1(end),1);
        rearrangedXArray   = zeros(storageArrayP1(end),1);
        
        
        % The following block of code is quite involved, but it solves a
        % fairly simple problem. When a point has been placed at the root
        % chord and then another point is placed above it on the root chord
        % then a line appears out of place due to linking up the original
        % point placed on the root chord and then the one above, instead of
        % rearranging it to plot the point above and then the point below.
        % The code below does just that.
        
%--------------------------------------------------------------------------
        % Find the points placed on the root chord
        findZeros  = tempStorageArrayY1 == 0;
        
        % Find the corresponding x-coordinate point
        findZerosX = tempStorageArrayX1(findZeros);
        
        % Find the max of those points
        findZerosXMax = findZerosX == max(findZerosX);

        % Find the number of points placed on the root chord
        lengthFindZeros = length(findZerosX);
        
        % Find location in the array of the max point
        [~,findZerosIndex] = max(findZerosXMax);
        
        % Specify an index to determine which point is in the correct order
        indexArrayYSorted = lengthFindZeros - findZerosIndex + 1;
        
        % Increment across the array of points to rearrange the
        % x-coordinate points in the correct order after the y-coordinate
        % points have been sorted
        for i = 1:storageArrayP1(end)
            
            % Find the new location of y-coordinate points after being
            % sorted
            locationArray = find(tempStorageArrayY1 == tempStorageArrayY1(i));
            
            % If have more then one point on root chord then save the first
            % one and delete the second one. Then store the point.
            if length(locationArray) > 1
                findFirstValue = locationArray == i;
                findSecondValue = findFirstValue == 0;
                locationArray(findSecondValue) = [];
                findYLocationArray(i) = locationArray;
            else
            % Store the point
                findYLocationArray(i) = locationArray;
            end
            
            % Find which points are equal to the current increment
            findYLocationArray(i) = find(findYLocationArray == i);
            
            % Find which points are on the root chord and store in
            % findYSorted
            findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
            
            % If the number of points in findYSorted is greater than one,
            % create a subarray to modify the subset of points that are on the root chord 
            if length(find(findYSorted == 1)) > 1
                subArrayYSorted = zeros(1,length(find(findYSorted == 1)));
                findIndices = findYSorted == 1;
                subArrayYSorted(indexArrayYSorted(end)) = true;
                
                % Now comes the tricky part, if the max value is already at
                % the bottom then decrease the increment to pick the
                % smaller value. But if the max is not on the bottom then
                % increase the increment to put it in the correct order
                if indexArrayYSorted == 1
                    indexArrayYSorted = indexArrayYSorted+1;
                elseif indexArrayYSorted > 1
                    indexArrayYSorted = indexArrayYSorted-1;
                end
                findYSorted(findIndices) = subArrayYSorted;
            end
            
            % Store the correctly arranged points in a array
            rearrangedXArray(findYSorted) = tempStorageArrayX1(findYLocationArray(i));
        end
        
        % Finally transpose the rearranged array and store everything in
        % the final array
        tempStorageArrayXSort1 = rearrangedXArray';
        
        
        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        if yLocationInc == 0
            XWRTMain(1) = xLocationInc;
            tempStorageArrayXSort1(1) = [];
            tempStorageArrayYSort1(1) = [];
        end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
%         if min((tempStorageArrayXSort1)) < min((XWRTMain)) && yLocationInc == 0
%             [~,findMinXWRT] = min(XWRTMain);
%             findMinTemp     = find(min(tempStorageArrayXSort1));
%             XWRTMain(findMinXWRT) = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = [];
%             tempStorageArrayYSort1(findMinTemp) = [];
%         elseif min((tempStorageArrayXSort1)) < min((XWRTMain)) && yLocationInc > 0
%             [~,findMinXWRT] = min(XWRTMain);
%             [~,findMinTemp] = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = XWRTMain(findMinXWRT);
%             tempStorageArrayX1(findMinTemp)     = XWRTMain(findMinXWRT);
%         end

        % Check if any points are out of order for final array. If they are
        % delete them. Also check points at tip chord, if a point is placed
        % above the last one at the same span location then delete the last one
%         for i = 2:length(XWRTMain)
%             if length(XWRTMain) > 3 && XWRTMain(i) < tempStorageArrayXSort1(end) && i < length(XWRTMain) && XWRTMain(i+1) > XWRTMain(i)
%                 XWRTMain(i) = [];
%                 YWRTMain(i) = [];
%                 break
%             elseif length(YWRTMain) > 3 && YWRTMain(i) == tempStorageArrayYSort1(end) && i < length(XWRTMain) && yLocationInc == YWRTMain(i)
%                 YWRTMain(i) = [];
%                 XWRTMain(i) = [];
%                 break
%             end
%         end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP2) ~= 1
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];

        delete(wingOutline);
        delete(wingPreviewLeft);
        delete(wingPreviewRight);
        wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
        
        % Plot Wing Preview
        wingPreviewPlot;

        % Plot Line Points
        LEPoints;

        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
       
        % Indicates right arrow has been selected
        rightArrow = 1;
        leftArrow  = 0;
        
    %% Trailing edge selected----------------------------------------------
    case 2
        % Clear any existing points and lines
        delete([L1,LL2,L2,L3,TPL1,TPL2,TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray2(idx2,1));
            yLocationInc = cell2mat(wingPointsArray2(idx2,2))-c/b;
            % Ensures points can't go past root chord
            if yLocationInc <= 0
                yLocationInc = 0;
            end
        elseif isempty(xLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
%             xLocationInc = cell2mat(wingPointsArray2(idx2,1));
            yLocationInc = yLocationInc - c/b;
            % Ensures points can't go past root chord
            if yLocationInc <= 0
                yLocationInc = 0;
            end
        elseif selectedCancel == 1
            xLocationInc = wingPointsArray2{idx2,1};
            yLocationInc = wingPointsArray2{idx2,2};
        end

        % Check if already at highest point based on last increment, if it is
        % then reduce increment and do nothing
        if xLocationInc > min(tempStorageArrayXSort2)
            if storageArrayP2(end) > 1

                [~,last]  = find(tempStorageArrayXSort2 < xLocationInc);
                xLocationIncPos = min(last);

                if (yLocationInc) < tempStorageArrayYSort2(xLocationIncPos) 
%                         yLocationInc = tempStorageArrayYSort2(xLocationIncPos);
                end
            end
        end

%         % Check if already at highest point based on last increment, if it is
%         % then reduce increment and do nothing
%         if xLocationInc > min(tempStorageArrayXSort1)
%             if storageArrayP1(end) > 1
% 
%                 xLocationIncPos  = find(tempStorageArrayXSort1 < xLocationInc);
%                 xLocationIncPos = xLocationIncPos(end);
% 
%                 if (yLocationInc) < tempStorageArrayYSort1(xLocationIncPos) 
%                         yLocationInc = tempStorageArrayYSort1(xLocationIncPos);
%                 end
%             end
%         end
        
        
        
        
        % If only have one point and are at the tip then ensure can't leave tip
        % until a point is placed or canceled
        if storageArrayP2(end) == 1 && yLocationInc + 1 == max(YWRTMain)
            yLocationInc = max(tempStorageArrayY2);
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray2X) ~= 1 || isempty(storageArray2Y) ~= 1
            tempStorageArrayX2 = storageArray2X;
            tempStorageArrayY2 = storageArray2Y;
 
            tempStorageArrayX2(end+1) = xLocationInc;
            tempStorageArrayY2(end+1) = yLocationInc;
        else
            tempStorageArrayX2 = xLocationInc;
            tempStorageArrayY2 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(decreasing) for the matrix
%         tempStorageArrayXSort2 = sort(tempStorageArrayX2,'descend');
%         tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
%         tempStorageArrayXSort2 = sort(tempStorageArrayX2,'descend');

        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP2(end),1);
        rearrangedXArray   = zeros(storageArrayP2(end),1);
        
        
        % The following block of code is quite involved, but it solves a
        % fairly simple problem. When a point has been placed at the root
        % chord and then another point is placed above it on the root chord
        % then a line appears out of place due to linking up the original
        % point placed on the root chord and then the one above, instead of
        % rearranging it to plot the point above and then the point below.
        % The code below does just that.
        
%--------------------------------------------------------------------------
        % Find the points placed on the root chord
        findZeros  = tempStorageArrayY2 == 0;
        
        % Find the corresponding x-coordinate point
        findZerosX = tempStorageArrayX2(findZeros);
        
        % Find the max of those points
        findZerosXMax = findZerosX == max(findZerosX);

        % Find the number of points placed on the root chord
        lengthFindZeros = length(findZerosX);
        
        % Find location in the array of the max point
        [~,findZerosIndex] = max(findZerosXMax);
        
        % Specify an index to determine which point is in the correct order
        indexArrayYSorted = lengthFindZeros - findZerosIndex + 1;
        
        % Increment across the array of points to rearrange the
        % x-coordinate points in the correct order after the y-coordinate
        % points have been sorted
        for i = 1:storageArrayP2(end)
            
            % Find the new location of y-coordinate points after being
            % sorted
            locationArray = find(tempStorageArrayY2 == tempStorageArrayY2(i));
            
            % If have more then one point on root chord then save the first
            % one and delete the second one. Then store the point.
            if length(locationArray) > 1
                findFirstValue = locationArray == i;
                findSecondValue = findFirstValue == 0;
                locationArray(findSecondValue) = [];
                findYLocationArray(i) = locationArray;
            else
            % Store the point
                findYLocationArray(i) = locationArray;
            end
            
            % Find which points are equal to the current increment
            findYLocationArray(i) = find(findYLocationArray == i);
            
            % Find which points are on the root chord and store in
            % findYSorted
            findYSorted = tempStorageArrayYSort2 == tempStorageArrayY2(findYLocationArray(i));
            
            % If the number of points in findYSorted is greater than one,
            % create a subarray to modify the subset of points that are on the root chord 
            if length(find(findYSorted == 1)) > 1
                subArrayYSorted = zeros(1,length(find(findYSorted == 1)));
                findIndices = findYSorted == 1;
                subArrayYSorted(indexArrayYSorted(end)) = true;
                
                % Now comes the tricky part, if the max value is already at
                % the bottom then decrease the increment to pick the
                % smaller value. But if the max is not on the bottom then
                % increase the increment to put it in the correct order
                if indexArrayYSorted == 1
                    indexArrayYSorted = indexArrayYSorted+1;
                elseif indexArrayYSorted > 1
                    indexArrayYSorted = indexArrayYSorted-1;
                end
                findYSorted(findIndices) = subArrayYSorted;
            end
            
            % Store the correctly arranged points in a array
            rearrangedXArray(findYSorted) = tempStorageArrayX2(findYLocationArray(i));
        end
        
        % Finally transpose the rearranged array and store everything in
        % the final array
        tempStorageArrayXSort2 = rearrangedXArray';
%--------------------------------------------------------------------------        
        
        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        if yLocationInc == 0
            findZeros = tempStorageArrayYSort2 == 0;
            findZerosX = tempStorageArrayXSort2(findZeros);
            findZerosMax = max(findZerosX);
            XWRTMain(end) = findZerosMax;
        end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
        findZeros = find(tempStorageArrayYSort2 == 0);
        
        if length(findZeros) > 1 && yLocationInc == 0
               tempStorageArrayXSort2(end) = [];
               tempStorageArrayYSort2(end) = [];
        elseif min((tempStorageArrayXSort2)) < XWRTMain(end) && yLocationInc >= 0
%             [~,findEndXWRT] = find(XWRTMain == XWRTMain(end));
%             [~,findMinXWRT] = min(XWRTMain);
%             [~,findMinTemp] = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort2(findMinTemp) = XWRTMain(findMinXWRT);
%             tempStorageArrayX2(findMinTemp)     = XWRTMain(findMinXWRT);
        end

        % Check if any points are out of order for final array. If they are
        % delete them. Also check points at tip chord, if a point is placed
        % above the last one at the same span location then delete the last one
        for i = 3:length(XWRTMain)
            if length(XWRTMain) > 3 && XWRTMain(end) > tempStorageArrayXSort2(end) && i < length(XWRTMain) && XWRTMain(i+1) > XWRTMain(i)
%                 XWRTMain(end) = [];
%                 YWRTMain(end) = [];
                break
            elseif length(YWRTMain) > 3 && YWRTMain(i) == tempStorageArrayYSort2(end) && i < length(XWRTMain) && yLocationInc == YWRTMain(i)
%                 YWRTMain(i) = [];
%                 XWRTMain(i) = [];
                break
            end
        end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP1) ~= 1 && length(XWRTMain) > 3
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        elseif isempty(storageArrayP1) ~= 1 && length(XWRTMain) == 3
        XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:2) tempStorageArrayXSort2 XWRTMain(:,end)];
        YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:2) tempStorageArrayYSort2 YWRTMain(:,end)];
%         elseif tempStorageArrayXSort2(end) == XWRTMain(end)
%             XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) XWRTMain(:,end)];
%             YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort2 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort2 YWRTMain(:,2:end)];
%         
%         XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];

        delete(wingOutline);
        delete(wingPreviewLeft);
        delete(wingPreviewRight);
        wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%         wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);

        % Plot Wing Preview
        wingPreviewPlot;
        
        % Plot Line Points
        TEPoints;

        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
       
        % Indicates right arrow has been selected
        rightArrow = 1;
        leftArrow  = 0;
        
    %% Top Line Selected
    case 3
        % Clear any existing points and lines
        delete([L3,USP1,USP2,USP3,USP4,USP5,USP6,USP7,USP8,USP9,USP10]);
        delete(wingFrontView);
        if isempty(zLocationInc) == 1 && selectedCancel ~= 1 || isempty(yLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            
            yLocationInc = cell2mat(wingPointsArray3(idx3,2))-c/b;
            slopeFV = atan((ZWRTMainFV(1)-ZWRTMainFV(2))/YW2);
            zLocationInc = (yLocationInc*tan(slopeFV)+(ZWRTMainFV(1)));
  
        elseif isempty(zLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            yLocationInc = yLocationInc - c/b;
            slopeFV = atan((ZWRTMainFV(1)-ZWRTMainFV(2))/YW2);
            zLocationInc = (yLocationInc*tan(slopeFV)+(ZWRTMainFV(1)));
            
        elseif selectedCancel == 1
            zLocationInc = wingPointsArray3{idx3,1};
            yLocationInc = wingPointsArray3{idx3,2};
        end
        
        tempStorageArrayZ3 = zLocationInc;
        tempStorageArrayY3 = yLocationInc;
        
        XW1 = 0;
        XW2=XW1 + (b/2)*tand(LamLE);
        XW3=XW1+rootChord;
        
        ZW1=rootChord*sind(i_w);
        ZW2=(XW3-XW2)*sind(i_w)+(b/2)*tand(Gam);
        ZW2Poly1 = (XW3-XW2)*sind(i_w)+(-yLocationInc)*tand(Gam);
        ZW2Poly2 = (XW3-XW2)*sind(i_w)+(-(yLocationInc+(b/2)))*tand(polyGam);
        
        ZWRTMainFV = [-(ZW1+t_c*rootChord),zLocationInc,(ZW2Poly2+zLocationInc+t_c),...
            (ZW2Poly2+t_c*tipChord+zLocationInc),zLocationInc+t_c*tipChord,0];
        YWRTMainFV = [0,yLocationInc,-YW2,-YW2,yLocationInc,0];
        wingFrontView = line(frontViewAxes,ZWRTMainFV,YWRTMainFV,'color','black','linewidth',3);
        
        axis tight equal
        xlabel('Z (ft)')
        ylabel('Y (ft)')

        grid on
        grid minor
        az = 270;
        el = -90;
        view(az,el);
        
        % Plot Line Points
        USPoints;
        
        % Activate polyhedralMod
        polyhedralMod;
        
        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocationInc,'Position',[26 60 50 25],'Enable','off','Callback',@txtbox_zLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);

end
function pushbutton_up_Callback(~,~)
global L1 LL1 L2 L3 wingPointsArray1 idx1 lineSelected LEP1 xLocationInc yLocationInc...
    storageArray1X storageArray1Y XWRTMain YWRTMain wingOutline pointCoordFig...
    upArrow XWRTMainC LEP2 LEP3 YWRTMainC storageArrayP1 tempStorageArrayX1...
    tempStorageArrayY1 LEP4 LEP5 LEP6 LEP7 LEP8 LEP9 LEP10 deletePointGo...
    tempStorageArrayXSort1 tempStorageArrayYSort1 LPL1 storageArray2X idx2...
    storageArray2Y wingPointsArray2 storageArrayP2 tempStorageArrayXSort2...
    tempStorageArrayYSort2 tempStorageArrayX2 tempStorageArrayY2 LL2 LPL2...
    TPL1 TPL2 TEP1 TEP2 TEP3 TEP4 TEP5 TEP6 TEP7 TEP8 TEP9 TEP10 topViewAxes...
    wingPreviewLeft wingPreviewRight c b strakeButton selectedCancel USP1...
    USP2 USP3 USP4 USP5 USP6 USP7 USP8 USP9 USP10 zLocationInc ZWRTMainFV YW2...
    polyGam wingFrontView frontViewAxes LamLE i_w Gam rootChord tipChord t_c...
    wingPointsArray3 idx3

switch(lineSelected)
    %% Leading edge selected-----------------------------------------------
    %% 2 Trailing edge selected--------------------------------------------
    %% 3 Top line selected-------------------------------------------------
    case 1
        % Clear any existing points and lines
        delete([L1,LL1,L2,L3,LPL1,LPL2,LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);  
        
        if selectedCancel ~= 1 && isempty(xLocationInc) == 1 ||...
                isempty(yLocationInc) == 1 && selectedCancel ~= 1 || deletePointGo == 1 && selectedCancel ~= 1
            
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray1(idx1,1))-c/b;
            yLocationInc = cell2mat(wingPointsArray1(idx1,2));
            deletePointGo = 0;
        elseif selectedCancel ~= 1 && isempty(xLocationInc) ~= 1 ||...
                isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            
            xLocationInc = xLocationInc - c/b;
%             yLocationInc = cell2mat(wingPointsArray1(idx1,2));
        elseif selectedCancel == 1
%             xLocationInc = wingPointsArray1{idx1,1};
%             yLocationInc = wingPointsArray1{idx1,2};
            xLocationInc = storageArray1X;
            yLocationInc = storageArray1Y;
%             xLocationInc = [];
%             yLocationInc = [];
%             if isempty(storageArray1X) ~= 1 && isempty(storageArray1Y) ~= 1
%                 % Check if xLocation is less than the previous value and is closer to the
%                 % root than the previous value. If true then stop incrementing the point
%                 if xLocationInc > storageArray1X(end) && yLocationInc < storageArray1Y(end)
%                 end
%             end
        end
        
%         && yLocationInc < max(tempStorageArrayYSort1)
        
        % Check if already at highest point based on last increment, if it is
        % then reduce increment and do nothing
        if isempty(tempStorageArrayYSort1) ~= 1 && isempty(yLocationInc) ~= 1 &&...
                yLocationInc(end) > min(tempStorageArrayYSort1) 
            if storageArrayP1(end) > 1

                yLocationIncPos = find(tempStorageArrayYSort1 < yLocationInc);
                yLocationIncPos = yLocationIncPos(end);

                if (xLocationInc) < tempStorageArrayXSort1(yLocationIncPos) 
%                         xLocationInc = tempStorageArrayXSort1(yLocationIncPos);
                end
            end
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if selectedCancel == 0 && isempty(storageArray1X) ~= 1 || selectedCancel == 0 &&...
                isempty(storageArray1Y) ~= 1
            tempStorageArrayX1 = storageArray1X;
            tempStorageArrayY1 = storageArray1Y;
            
            tempStorageArrayX1(end+1) = xLocationInc;
            tempStorageArrayY1(end+1) = yLocationInc;
        elseif selectedCancel == 1
            tempStorageArrayX1 = storageArray1X;
            tempStorageArrayY1 = storageArray1Y;
        else
            tempStorageArrayX1 = xLocationInc;
            tempStorageArrayY1 = yLocationInc;
        end
        

        
        % Ensure the points are arranged in the correct
        % order(increasing) for the matrix
%         tempStorageArrayXSort1 = sort(tempStorageArrayX1);
%         tempStorageArrayYSort1 = sort(tempStorageArrayY1);
        
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort1 = sort(tempStorageArrayY1,'ascend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(length(tempStorageArrayX1),1);
        rearrangedXArray   = zeros(length(tempStorageArrayX1),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:length(tempStorageArrayX1)
            intermediateArray = find(tempStorageArrayY1 == tempStorageArrayY1(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
            rearrangedXArray(findYSorted) = tempStorageArrayX1(findYLocationArray(i));
        end
        tempStorageArrayXSort1 = rearrangedXArray';
        
        
        
        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        
        
        % If a point is placed on the root chord, and are not adding a
        % strake, negate any modification to the root chord
        if isempty(yLocationInc) ~= 1 && yLocationInc == 0 && strakeButton.Value ~= 1
            xLocationInc = xLocationInc + c/b;
            tempStorageArrayXSort1(1) = [];
            tempStorageArrayYSort1(1) = [];
        elseif strakeButton.Value == 1
            XWRTMain(1) = xLocationInc;
            tempStorageArrayXSort1(1) = [];
            tempStorageArrayYSort1(1) = [];
        end

        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP2) ~= 1
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];

        delete(wingOutline);
        delete(wingPreviewLeft);
        delete(wingPreviewRight);
        wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);

        % Plot Wing Preview
        wingPreviewPlot;

        % Plot Line Points
        LEPoints;
        
        % Update X-Y coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
        
        
    %% Trailing edge selected----------------------------------------------
    case 2
        % Clear any existing points and lines
        delete([L1,LL2,L2,L3,TPL1,TPL2,TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
        
        if selectedCancel ~= 1 && isempty(xLocationInc) == 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray2(idx2,1))-c/b;
            yLocationInc = cell2mat(wingPointsArray2(idx2,2));
            
        elseif selectedCancel ~= 1 && isempty(xLocationInc) ~= 1 ||...
                isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            
            xLocationInc = xLocationInc - c/b;
%             yLocationInc = cell2mat(wingPointsArray2(idx2,2));
            if isempty(storageArray2X) ~= 1 && isempty(storageArray2Y) ~= 1
                % Check if xLocation is less than the previous value and is closer to the
                % root than the previous value. If true then stop incrementing the point
%                 if xLocationInc > storageArray2X(end) && yLocationInc < storageArray2Y(end)
%                     stopDrawing = 1;
%                     xLocationInc = storageArray2X(end);
%                 end
                [~,first] = find(storageArray2Y < yLocationInc);
                yLocationIncPosTemp = min(first);
                if xLocationInc > storageArray2X(end) && yLocationInc < storageArray2Y(end) && yLocationInc > 0
%                     stopDrawing = 1;
%                     xLocationInc = storageArray2X(end);
                elseif storageArray2Y(end) == 0 && xLocationInc > storageArray2X(end) && yLocationInc > 0
                    [~,first] = find(storageArray2Y < yLocationInc);
                    yLocationIncPosTemp = min(first);
%                     xLocationInc = storageArray2X(yLocationIncPosTemp);
                elseif yLocationInc > storageArray2Y(yLocationIncPosTemp)
%                     xLocationInc = storageArray2X(yLocationIncPosTemp);
                end
                
            end
         elseif selectedCancel == 1
            xLocationInc = wingPointsArray2{idx2,1};
            yLocationInc = wingPointsArray2{idx2,2};
         end

        % Check if already at lowest point based on last increment, if it is
        % then increase increment and do nothing
%         if yLocationInc < max(YWRTMain) || storageArrayP1(end) == 1 && xLocationInc > tempStorageArrayXSort2(end) && yLocationInc ~= max(tempStorageArrayYSort2)
        if isempty(tempStorageArrayYSort2) ~= 1 && yLocationInc > min(tempStorageArrayYSort2) 
            [~,first] = find(YWRTMain > yLocationInc);
            yLocationIncPos = min(first);

            if isempty(storageArrayP2) ~= 1 && storageArrayP2(end) > 1
                [~,first]  = find(tempStorageArrayYSort2 < yLocationInc);
                yLocationIncPosTemp = min(first);

%                 if (xLocationInc) < tempStorageArrayXSort2(yLocationIncPosTemp) 
%                         xLocationInc = tempStorageArrayXSort2(yLocationIncPosTemp);
%                 end

            % If have first point and are not at tip, then ensure can't go past
            % largest point on tip
            elseif isempty(storageArrayP2) ~= 1 && storageArrayP2(end) == 1 && xLocationInc > XWRTMain(yLocationIncPos) && yLocationInc ~= max(YWRTMain)
%                xLocationInc = XWRTMain(yLocationIncPos);
            end
        end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray2X) ~= 1 || isempty(storageArray2Y) ~= 1
            tempStorageArrayX2 = storageArray2X;
            tempStorageArrayY2 = storageArray2Y;
            
            tempStorageArrayX2(end+1) = xLocationInc;
            tempStorageArrayY2(end+1) = yLocationInc;
        else
            tempStorageArrayX2 = xLocationInc;
            tempStorageArrayY2 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(decreasing) for the matrix
%         tempStorageArrayXSort2 = sort(tempStorageArrayX2,'descend');
%         tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP2(end),1);
        rearrangedXArray   = zeros(storageArrayP2(end),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:storageArrayP2(end)
            intermediateArray = find(tempStorageArrayY2 == tempStorageArrayY2(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort2 == tempStorageArrayY2(findYLocationArray(i));
            rearrangedXArray(findYSorted) = tempStorageArrayX2(findYLocationArray(i));
        end
        tempStorageArrayXSort2 = rearrangedXArray';
        

        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
        if yLocationInc == 0
%             [~,findEndYWRT] = find(YWRTMain == yLocationInc);
%             findEndYWRT = findEndYWRT(end);
%             findMinTemp = find(min(tempStorageArrayXSort2));
%             XWRTMain(findEndYWRT) = min(tempStorageArrayXSort2);
%             tempStorageArrayXSort2(findMinTemp) = xLocationInc;
%             tempStorageArrayYSort2(findMinTemp) = yLocationInc;
        elseif min((tempStorageArrayXSort2)) < min((XWRTMain)) && yLocationInc > 0
            [~,findMinXWRT] = min(XWRTMain);
            [~,findMinTemp] = min(tempStorageArrayXSort2);
            tempStorageArrayXSort2(findMinTemp) = XWRTMain(findMinXWRT);
            tempStorageArrayX2(findMinTemp)     = XWRTMain(findMinXWRT);
        end

        % Check if any points are out of order for final array. If they are
        % delete them. Also check points at tip chord, if a point is placed
        % above the last one at the same span location then delete the last one
        for i = 2:length(XWRTMain)
            if length(XWRTMain) > 3 && XWRTMain(i) < tempStorageArrayXSort2(end) && i < length(XWRTMain) && XWRTMain(i+1) > XWRTMain(i)
%                 XWRTMain(i) = [];
%                 YWRTMain(i) = [];
                break
            elseif length(YWRTMain) > 3 && YWRTMain(i) == tempStorageArrayYSort2(end) && i < length(XWRTMain) && yLocationInc == YWRTMain(i)
%                 YWRTMain(i) = [];
%                 XWRTMain(i) = [];
                break
            end
        end
        
        if yLocationInc == 0 && length(XWRTMain) > 3 && XWRTMain(end) >= tempStorageArrayXSort2(end)
            XWRTMain(end) = xLocationInc;
            YWRTMain(end) = yLocationInc;
            tempStorageArrayXSort2(end) = [];
            tempStorageArrayYSort2(end) = [];
        end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP1) ~= 1 && length(XWRTMain) > 3
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
%         elseif tempStorageArrayXSort2(end) == XWRTMain(end)
%             XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) XWRTMain(:,end)];
%             YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) YWRTMain(:,end)];
        elseif isempty(storageArrayP1) ~= 1 && length(XWRTMain) == 3
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:2) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:2) tempStorageArrayYSort2 YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];
        
%         XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];

%         if stopDrawing ~= 1
            delete(wingOutline);
            delete(wingPreviewLeft);
            delete(wingPreviewRight);
            wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
            
            % Plot Wing Preview
            wingPreviewPlot;
            
            % Plot Line Points
            TEPoints;     
            
            % Update Wing Dimensions
%             wingDimensionsMod;
        
            % Update X-Y coordinates
            uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
%         end

    %% Top Line Selected---------------------------------------------------
    case 3
        % Okay so I think the way I want to approach this is by keeping all
        % of the original controls, but instead of moving a point along the
        % wing span and thus changing the chord with respect to that point
        % along the span, we change the dihedral along the span at that
        % point. Basically when the up button is selected it will move
        % the top point at the wing tip not the point selected along the
        % span. Thus the dihedral of the wing will be modified, not the
        % chord.
        
        % Clear any existing points and lines
        delete([L3,USP1,USP2,USP3,USP4,USP5,USP6,USP7,USP8,USP9,USP10]);
        delete(wingFrontView);
        
        if isempty(yLocationInc) == 1
            zLocationInc = cell2mat(wingPointsArray3(idx3,1));
            yLocationInc = cell2mat(wingPointsArray3(idx3,2));
        end
        
        if isempty(polyGam) ~= 1
            polyGam = polyGam + 1;
        else
            polyGam = Gam;
        end
        
        % Original plot of front view of wing. Now need to modify to
        % account for polyhedral (dihedral at a span location other than
        % the root)
        
        XW1 = 0;
        XW2=XW1 + (b/2)*tand(LamLE);
        XW3=XW1+rootChord;
        
        ZW1=rootChord*sind(i_w);
        ZW2=(XW3-XW2)*sind(i_w)+(b/2)*tand(Gam);
        ZW2Poly1 = (XW3-XW2)*sind(i_w)+(-yLocationInc)*tand(Gam);
        ZW2Poly2 = (XW3-XW2)*sind(i_w)+(-(yLocationInc+(b/2)))*tand(polyGam);
        
        ZWRTMainFV = [-(ZW1+t_c*rootChord),zLocationInc,(ZW2Poly2+zLocationInc+t_c),...
            (ZW2Poly2+t_c*tipChord+zLocationInc),zLocationInc+t_c*tipChord,0];
        YWRTMainFV = [0,yLocationInc,-YW2,-YW2,yLocationInc,0];
        wingFrontView = line(frontViewAxes,ZWRTMainFV,YWRTMainFV,'color','black','linewidth',3);
        
        axis tight equal
        xlabel('Z (ft)')
        ylabel('Y (ft)')

        grid on
        grid minor
        az = 270;
        el = -90;
        view(az,el);
        
        % Plot Line Points
        USPoints;
        
        % Activate polyhedralMod
        polyhedralMod;
        
        % Update Z-Y Coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocationInc,'Position',[26 60 50 25],'Enable','off','Callback',@txtbox_zLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);

end
% Indicate the up arrow has been selected
upArrow = 1;
function pushbutton_down_Callback(~,~)
global L1 L2 L3 wingPointsArray1 idx1 lineSelected LEP1 xLocationInc yLocationInc...
     storageArray1X storageArray1Y XWRTMain YWRTMain wingOutline pointCoordFig...
     downArrow XWRTMainC YWRTMainC storageArrayP1 tempStorageArrayX1 tempStorageArrayY1...
     LEP2 LEP3 LEP4 LEP5 LEP6 LEP7 LEP8 LEP9 LEP10 LPL1 tempStorageArrayYSort1...
     tempStorageArrayXSort1 LPL2 storageArray2X idx2 storageArray2Y wingPointsArray2...
     storageArrayP2 tempStorageArrayXSort2 tempStorageArrayYSort2 tempStorageArrayX2...
     tempStorageArrayY2 TPL1 TPL2 TEP1 TEP2 TEP3 TEP4 TEP5 TEP6 TEP7 TEP8...
     TEP9 TEP10 wingPreviewLeft wingPreviewRight topViewAxes c b...
     strakeButton selectedCancel LL1 LL2 USP1 USP2 USP3 USP4 USP5 USP6 USP7...
     USP8 USP9 USP10 zLocationInc ZWRTMainFV YW2 polyGam wingFrontView...
     frontViewAxes LamLE i_w Gam rootChord tipChord t_c wingPointsArray3 idx3

switch(lineSelected)
    %% Leading edge selected-----------------------------------------------
    %% 2 Trailing edge selected--------------------------------------------
    %% 3 Top line selected-------------------------------------------------
    case 1
        % Clear any existing points and lines
        delete([L1,LL1,L2,L3,LPL1,LPL2,LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray1(idx1,1))+c/b;
            yLocationInc = cell2mat(wingPointsArray1(idx1,2));
        elseif isempty(xLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            xLocationInc = xLocationInc + c/b;
%             yLocationInc = cell2mat(wingPointsArray1(idx1,2));
        elseif selectedCancel == 1
            xLocationInc = wingPointsArray1{idx1,1};
            yLocationInc = wingPointsArray1{idx1,2};
            
%             if isempty(storageArray1X) ~= 1 && isempty(storageArray1Y) ~= 1
%                 % Check if xLocation is less than the previous value and is closer to the
%                 % root than the previous value. If true then stop incrementing the point
%                 if xLocationInc > storageArray1X(end) && yLocationInc < storageArray1Y(end)
%                     stopDrawing = 1;
%                     xLocationInc = storageArray1X(end);
%                 end
%             end
        end
    
        % If a point is placed on the root chord, and are not adding a
        % strake, negate any modification to the root chord
        if yLocationInc == 0 && strakeButton.Value ~= 1
            xLocationInc = xLocationInc - c/b;
        end
 
        % Check if already at lowest point based on last increment, if it is
        % then increase increment and do nothing
%         if yLocationInc < max(YWRTMain) || storageArrayP1(end) == 1 && xLocationInc > tempStorageArrayXSort1(end)
% 
%             [~,first] = find(YWRTMain > yLocationInc);
% %             yLocationIncPos = min(first);
%             
%             if yLocationInc == b/2
%                 [~,first] = find(YWRTMain == yLocationInc);
% %                 yLocationIncPos = min(first);
%             end
% 
%             if storageArrayP1(end) > 1
%                 [~,first]  = find(tempStorageArrayYSort1 > yLocationInc);
% %                 yLocationIncPosTemp = min(first);
%                 
%                 if (xLocationInc) > tempStorageArrayXSort1(yLocationIncPosTemp) 
% %                         xLocationInc = tempStorageArrayXSort1(yLocationIncPosTemp);
%                 end
%                 
%                 if isempty(yLocationIncPosTemp) == 1
%                         [~,first] = find(YWRTMain > yLocationInc);
% %                         yLocationIncPosTemp = min(first);
%                 end
%                 
%                 if (xLocationInc) > XWRTMain(yLocationIncPosTemp) 
% %                         xLocationInc = XWRTMain(yLocationIncPosTemp);
%                 end
% 
%             % If have first point and are not at tip, then ensure can't go past
%             % largest point on tip
%             elseif storageArrayP1(end) == 1 && xLocationInc > XWRTMain(yLocationIncPos) && yLocationInc ~= max(YWRTMain)
% %                xLocationInc = XWRTMain(yLocationIncPos);
%             end
%         end

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray1X) ~= 1 || isempty(storageArray1Y) ~= 1
            tempStorageArrayX1 = storageArray1X;
            tempStorageArrayY1 = storageArray1Y;
            
            tempStorageArrayX1(end+1) = xLocationInc;
            tempStorageArrayY1(end+1) = yLocationInc;
        else
            tempStorageArrayX1 = xLocationInc;
            tempStorageArrayY1 = yLocationInc;
        end

        % Ensure the points are arranged in the correct
        % order(increasing) for the matrix
%         tempStorageArrayXSort1 = sort(tempStorageArrayX1);
%         tempStorageArrayYSort1 = sort(tempStorageArrayY1);
        
        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort1 = sort(tempStorageArrayY1,'ascend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP1(end),1);
        rearrangedXArray   = zeros(storageArrayP1(end),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:storageArrayP1(end)
            intermediateArray = find(tempStorageArrayY1 == tempStorageArrayY1(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort1 == tempStorageArrayY1(findYLocationArray(i));
            rearrangedXArray(findYSorted) = tempStorageArrayX1(findYLocationArray(i));
        end
        tempStorageArrayXSort1 = rearrangedXArray';

        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
        if yLocationInc == 0
            XWRTMain(1) = xLocationInc;
            tempStorageArrayXSort1(1) = [];
            tempStorageArrayYSort1(1) = [];
        end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
%         if yLocationInc == 0
%             [~,findMinXWRT] = min(XWRTMain);
%             findMinTemp = find(min(tempStorageArrayXSort1));
%             XWRTMain(findMinXWRT) = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = xLocationInc;
%             tempStorageArrayYSort1(findMinTemp) = yLocationInc;
%         elseif min((tempStorageArrayXSort1)) < min((XWRTMain)) && yLocationInc > 0
%             [~,findMinXWRT] = min(XWRTMain);
%             [~,findMinTemp] = min(tempStorageArrayXSort1);
%             tempStorageArrayXSort1(findMinTemp) = XWRTMain(findMinXWRT);
%             tempStorageArrayX1(findMinTemp)     = XWRTMain(findMinXWRT);
%         end

        % Check if any points are out of order for final array. If they are
        % delete them. Also check points at tip chord, if a point is placed
        % above the last one at the same span location then delete the last one
%         for i = 2:length(XWRTMain)
%             if length(XWRTMain) > 3 && XWRTMain(i) < tempStorageArrayXSort1(end) && i < length(XWRTMain) && XWRTMain(i+1) > XWRTMain(i)
%                 XWRTMain(i) = [];
%                 YWRTMain(i) = [];
%                 break
%             elseif length(YWRTMain) > 3 && YWRTMain(i) == tempStorageArrayYSort1(end) && i < length(XWRTMain) && yLocationInc == YWRTMain(i)
%                 YWRTMain(i) = [];
%                 XWRTMain(i) = [];
%                 break
%             end
%         end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP2) ~= 1
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1 XWRTMain(:,2:end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1 YWRTMain(:,2:end)];
        end

%         if stopDrawing ~= 1
            delete(wingOutline);
            delete(wingPreviewLeft);
            delete(wingPreviewRight);
            wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
            
            % Plot Wing Preview
            wingPreviewPlot;
            
            % Plot Line Points
            LEPoints;     
        
            % Update X-Y coordinates
            uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
%         end

    %% Trailing edge selected----------------------------------------------
    case 2
        % Clear any existing points and lines
        delete([L1,LL2,L2,L3,TPL1,TPL2,TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
        if isempty(xLocationInc) == 1 && selectedCancel ~= 1
            % Need to find point coordinates and convert from cell to matrix
            xLocationInc = cell2mat(wingPointsArray2(idx2,1))+c/b;
            yLocationInc = cell2mat(wingPointsArray2(idx2,2));
        elseif isempty(xLocationInc) ~= 1 && selectedCancel ~= 1 || isempty(yLocationInc) ~= 1 && selectedCancel ~= 1
            xLocationInc = xLocationInc + c/b;
%             yLocationInc = cell2mat(wingPointsArray2(idx2,2));
            if isempty(storageArray2X) ~= 1 && isempty(storageArray2Y) ~= 1
                % Check if xLocation is less than the previous value and is closer to the
                % root than the previous value. If true then stop incrementing the point
                [~,first] = find(storageArray2Y < yLocationInc);
                yLocationIncPosTemp = min(first);
                if xLocationInc > storageArray2X(end) && yLocationInc < storageArray2Y(end) && yLocationInc > 0
%                     stopDrawing = 1;
%                     xLocationInc = storageArray2X(end);
                elseif storageArray2Y(end) == 0 && xLocationInc > storageArray2X(end) && yLocationInc > 0
                    [~,first] = find(storageArray2Y < yLocationInc);
                    yLocationIncPosTemp = min(first);
%                     xLocationInc = storageArray2X(yLocationIncPosTemp);
                elseif yLocationInc > storageArray2Y(yLocationIncPosTemp)
%                     xLocationInc = storageArray2X(yLocationIncPosTemp);
                end
            end
         elseif selectedCancel == 1
            xLocationInc = wingPointsArray1{idx1,1};
            yLocationInc = wingPointsArray1{idx1,2};
        end

        % Check if already at lowest point based on last increment, if it is
        % then increase increment and do nothing
        if yLocationInc < max(YWRTMain) || storageArrayP2(end) == 1 && xLocationInc > tempStorageArrayXSort2(end) && yLocationInc ~= max(tempStorageArrayYSort2)

            [~,first] = find(YWRTMain > yLocationInc);
            yLocationIncPos = min(first);
%             yLocationIncPos = 4;

            if isempty(storageArrayP2) ~= 1 && storageArrayP2(end) > 1
                [~,first]  = find(tempStorageArrayYSort2 < yLocationInc);
                [~,last]   = find(tempStorageArrayYSort2 > yLocationInc);
                yLocationIncPosTempF = max(first);
                yLocationIncPosTempL = min(last);

%                 if yLocationInc ~= 0 && isempty(yLocationIncPosTempF) ~= 1
%                     xLocationInc = tempStorageArrayXSort2(yLocationIncPosTempF);
%                 end
                
                
%                 if isempty(yLocationIncPosTempF) ~= 1 && yLocationInc ~= 0 && (xLocationInc) > tempStorageArrayXSort2(yLocationIncPosTempF) && isempty(yLocationIncPosTempL) ~= 1
%                         xLocationInc = tempStorageArrayXSort2(yLocationIncPosTempF);
%                 end

            % If have first point and are not at tip, then ensure can't go past
            % largest point on tip
            elseif storageArrayP2(end) == 1 && xLocationInc > XWRTMain(yLocationIncPos) && yLocationInc ~= max(YWRTMain)
%                xLocationInc = XWRTMain(yLocationIncPos);
            end
        end
        
        
        
%         if yLocationInc < max(YWRTMain) || storageArrayP2(end) == 1 && xLocationInc > tempStorageArrayXSort2(end)
% 
%             [~,first] = find(YWRTMain > yLocationInc);
%             yLocationIncPos = min(first);
% 
%             if storageArrayP2(end) > 1
%                 [~,first]  = find(tempStorageArrayYSort2 > yLocationInc);
%                 yLocationIncPosTemp = min(first);
%                 
%                 if (xLocationInc) > tempStorageArrayXSort2(yLocationIncPosTemp) 
%                         xLocationInc = tempStorageArrayXSort2(yLocationIncPosTemp);
%                 end
%                 
%                 if isempty(yLocationIncPosTemp) == 1
%                         [~,first] = find(YWRTMain > yLocationInc);
%                         yLocationIncPosTemp = min(first);
%                 end
%                 
%                 if (xLocationInc) > XWRTMain(yLocationIncPosTemp) 
%                         xLocationInc = XWRTMain(yLocationIncPosTemp);
%                 end
% 
%             % If have first point and are not at tip, then ensure can't go past
%             % largest point on tip
%             elseif storageArrayP2(end) == 1 && xLocationInc > XWRTMain(yLocationIncPos) && yLocationInc ~= max(YWRTMain)
%                xLocationInc = XWRTMain(yLocationIncPos);
%             end
%         end
        

        % We need a temporary storage to store the new points
        % before we permanently store them
        if isempty(storageArray2X) ~= 1 || isempty(storageArray2Y) ~= 1
            tempStorageArrayX2 = storageArray2X;
            tempStorageArrayY2 = storageArray2Y;
            
            tempStorageArrayX2(end+1) = xLocationInc;
            tempStorageArrayY2(end+1) = yLocationInc;
        else
            tempStorageArrayX2 = xLocationInc;
            tempStorageArrayY2 = yLocationInc;
        end

        % Arrange the Y-coordinate points in decreasing order
        tempStorageArrayYSort2 = sort(tempStorageArrayY2,'descend');
        
        % Initialize two arrays for rearranging the X-coordinate points in
        % the correct order
        findYLocationArray = zeros(storageArrayP2(end),1);
        rearrangedXArray   = zeros(storageArrayP2(end),1);
        
        % Arrange the X-cordinate points according to the order that they
        % were inputted
        for i = 1:storageArrayP2(end)
            intermediateArray = find(tempStorageArrayY2 == tempStorageArrayY2(i));
            if length(intermediateArray) > 1
                findFirstValue = intermediateArray == i;
                findSecondValue = findFirstValue == 0;
                intermediateArray(findSecondValue) = [];
                findYLocationArray(i) = intermediateArray;
            else
                findYLocationArray(i) = intermediateArray;
            end
            findYLocationArray(i) = find(findYLocationArray == i);
            findYSorted = tempStorageArrayYSort2 == tempStorageArrayY2(findYLocationArray(i));
            rearrangedXArray(findYSorted) = tempStorageArrayX2(findYLocationArray(i));
        end
        tempStorageArrayXSort2 = rearrangedXArray';

        % If point is placed at root chord and is the first one then
        % adjusting the height will modify the wing root chord
%         if yLocationInc == 0
%             XWRTMain(end) = xLocationInc;
%         end
        
        % Adjustment for points placed at root chord, erases old points and
        % keeps new ones
        if yLocationInc == 0
%             [~,findEndYWRT] = find(YWRTMain == yLocationInc);
%             findEndYWRT = findEndYWRT(end);
%             findMinTemp = find(min(tempStorageArrayXSort2));
%             XWRTMain(findEndYWRT) = min(tempStorageArrayXSort2);
%             tempStorageArrayXSort2(findMinTemp) = xLocationInc;
%             tempStorageArrayYSort2(findMinTemp) = yLocationInc;
        elseif min((tempStorageArrayXSort2)) < min((XWRTMain)) && yLocationInc > 0
            [~,findMinXWRT] = min(XWRTMain);
            [~,findMinTemp] = min(tempStorageArrayXSort2);
            tempStorageArrayXSort2(findMinTemp) = XWRTMain(findMinXWRT);
            tempStorageArrayX2(findMinTemp)     = XWRTMain(findMinXWRT);
        end

        % Check if any points are out of order for final array. If they are
        % delete them. Also check points at tip chord, if a point is placed
        % above the last one at the same span location then delete the last one
        for i = 2:length(XWRTMain)
            if length(XWRTMain) > 3 && XWRTMain(i) < tempStorageArrayXSort2(end) && i < length(XWRTMain) && XWRTMain(i+1) > XWRTMain(i)
%                 XWRTMain(i) = [];
%                 YWRTMain(i) = [];
                break
            elseif length(YWRTMain) > 3 && YWRTMain(i) == tempStorageArrayYSort2(end) && i < length(XWRTMain) && yLocationInc == YWRTMain(i)
%                 YWRTMain(i) = [];
%                 XWRTMain(i) = [];
                break
            end
        end
        
        if yLocationInc == 0 && length(XWRTMain) > 3 && XWRTMain(end) <= tempStorageArrayXSort2(end)
            XWRTMain(end) = xLocationInc;
            YWRTMain(end) = yLocationInc;
            tempStorageArrayXSort2(end) = [];
            tempStorageArrayYSort2(end) = [];
        end
        
        % Build final array for wing outline
        % Check if trailing edge is modified if it is then keep
        % modifications and modify leading edge line as well
        if isempty(storageArrayP1) ~= 1 && length(XWRTMain) > 3
            XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        elseif isempty(storageArrayP1) ~= 1 && length(XWRTMain) == 3
        XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:2) tempStorageArrayXSort2 XWRTMain(:,end)];
        YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:2) tempStorageArrayYSort2 YWRTMain(:,end)];
%         elseif tempStorageArrayYSort2(end) == 0 || tempStorageArrayXSort2(end) == XWRTMain(end)
%             XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) XWRTMain(:,end)];
%             YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) YWRTMain(:,end)];
        else
            XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
            YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        end
        
        % Build final array for wing outline
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort XWRTMain(:,2:end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort YWRTMain(:,2:end)];
        
%         XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];

        
%         XWRTMainC = [XWRTMain(:,1:1) tempStorageArrayXSort1  XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
%         YWRTMainC = [YWRTMain(:,1:1) tempStorageArrayYSort1  YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];
        
%         if stopDrawing ~= 1
            delete(wingOutline);
            delete(wingPreviewLeft);
            delete(wingPreviewRight);
            wingOutline = line(topViewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewLeft  = line(previewAxes,XWRTMainC,YWRTMainC,'color','black','linewidth',3);
%             wingPreviewRight = line(previewAxes,XWRTMainC,-YWRTMainC,'color','black','linewidth',3);
            
            % Plot Wing Preview
            wingPreviewPlot;

            % Plot Line Points
            TEPoints;     
        
            % Update X-Y coordinates
            uicontrol('Parent',pointCoordFig,'Style','edit','String',xLocationInc,'Position',[26 60 50 25],'Enable','on','Callback',@txtbox_xLocationInc_Callback);
            uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
%         end

    %% Top Line Selected
    case 3
        % Clear any existing points and lines
        delete([L3,USP1,USP2,USP3,USP4,USP5,USP6,USP7,USP8,USP9,USP10]);
        delete(wingFrontView);
        
        if isempty(yLocationInc) == 1
            zLocationInc = cell2mat(wingPointsArray3(idx3,1));
            yLocationInc = cell2mat(wingPointsArray3(idx3,2));
        end
        
        if isempty(polyGam) ~= 1
            polyGam = polyGam - 1;
        else
            polyGam = Gam;
        end
        
        % Original plot of front view of wing. Now need to modify to
        % account for polyhedral (dihedral at a span location other than
        % the root)
        
        XW1 = 0;
        XW2=XW1 + (b/2)*tand(LamLE);
        XW3=XW1+rootChord;
        
        ZW1=rootChord*sind(i_w);
        ZW2=(XW3-XW2)*sind(i_w)+(b/2)*tand(Gam);
        ZW2Poly1 = (XW3-XW2)*sind(i_w)+(-yLocationInc)*tand(Gam);
        ZW2Poly2 = (XW3-XW2)*sind(i_w)+(-(yLocationInc+(b/2)))*tand(polyGam);
        
        ZWRTMainFV = [-(ZW1+t_c*rootChord),zLocationInc,(ZW2Poly2+zLocationInc+t_c),...
            (ZW2Poly2+t_c*tipChord+zLocationInc),zLocationInc+t_c*tipChord,0];
        YWRTMainFV = [0,yLocationInc,-YW2,-YW2,yLocationInc,0];
        wingFrontView = line(frontViewAxes,ZWRTMainFV,YWRTMainFV,'color','black','linewidth',3);
        
        axis tight equal
        xlabel('Z (ft)')
        ylabel('Y (ft)')

        grid on
        grid minor
        az = 270;
        el = -90;
        view(az,el);
        
        % Plot Line Points
        USPoints;
        
        % Activate polyhedralMod
        polyhedralMod;
        
        % Update Z-Y Coordinates
        uicontrol('Parent',pointCoordFig,'Style','edit','String',zLocationInc,'Position',[26 60 50 25],'Enable','off','Callback',@txtbox_zLocationInc_Callback);
        uicontrol('Parent',pointCoordFig,'Style','edit','String',yLocationInc,'Position',[106 60 50 25],'Enable','on','Callback',@txtbox_yLocationInc_Callback);
end
% Indicates the down arrow has been selected
downArrow = 1;

% Polyhedral-----------------------------------------------------
function polyhedralMod
global wingDimensionsModPanel polyGam
% Wing Dihedral
uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','on','String',polyGam,'Position',[135 20 45 25],'Callback',@txtbox_polyhedral_Callback);

function txtbox_polyhedral_Callback(hObject,~)
global polyGam
polyGam = str2double(get(hObject,'String'));
polyGam = polyGam - 1;
pushbutton_up_Callback;

% if selected == 1
%     pushbutton_top_Callback;
% elseif selected == 2
%     pushbutton_front_Callback;
% elseif selected == 3
%     pushbutton_side_Callback;
% elseif selected == 4
%     pushbutton_iso_Callback;
% end    
% wpmActivated = 0;
% wadActivated = 0;

% Wing Preview
function wingPreviewPlot
global XWRTMainC YWRTMainC wingPreviewLeft wingPreviewRight previewAxes...
    c tp storageArrayP1 storageArrayP2 yLocationInc lineSelected xCoordsLE...
    yCoordsLE zCoordsLE xCoordsTE yCoordsTE zCoordsTE tempStorageArrayYSort1...
    tempStorageArrayYSort2 tempStorageArrayXSort2 tempStorageArrayXSort1 b...
    tpArray LamLE Gam i_w xCoords yCoords zCoords tempStorageArrayY1 XW1...
    rightAirfoil leftAirfoil wingPreviewLeftInitial wingPreviewRightInitial...
    rootChord tipChord comboAirfoilSize comboAirfoil_coords_xRoot ZW1...
    comboAirfoil_coords_yTip comboAirfoil_coords_yRoot comboAirfoil_coords_xTip

%--------------------------------------------------------------------------
% The following code is quite involved, but it solves a fairly complex
% problem. Adding points to only the leading edge or the trailing edge is
% quite easy, all you need to do is ensure that they are in the correct
% order to build the final wing. Unfortunately, when you add points to both
% the leading and trailing edge it becomes much more complex. 

% For example say you add two points to the leading edge, so now the wing
% is broken up into three sections. Then you add a point to the trailing
% edge that is in between those two leading edge points. Now to construct
% the wing correctly you need to calculate the slope created by those two
% leading edge points and then, the difficult part, essentially mirror the
% trailing edge point to the leading edge to create another wing segment
% between the current three segments.

% The problem only becomes more complex when you want to modify those
% points by moving them along the span. Then you have to reorder every
% point correctly, and create the wing segments in the correct order.
%--------------------------------------------------------------------------

% To begin we need to determine if we need to create an extra wing segment
% or not based on whether we have a point placed on either the root chord
% or tip chord 

% If a point is placed on either the root or tip chord set addOn to 0
if isempty(yLocationInc) ~= 1 && yLocationInc == 0 || isempty(yLocationInc) ~= 1 && yLocationInc == (b/2)
    addOn = 0;
else
    addOn = 1;
end

% If one of the points on the leading edge is on the tip chord set addOn to
% 0
if isempty(storageArrayP1) ~= 1 && max(tempStorageArrayY1) == b/2
    addOn = 0;
else
    addOn = 1;
end

% addOn = 1;

% Initialize subarrays of XWRTMainC and YWRTMainC which is the completed
% arrays for housing all of the leading and trailing edge points

    % Find where the maximum and min points are along the leading edge and
    % store them in XWRTMainC and YWRTMainC and set them to a Find.
    [~,findMaxLEPoints] = find(YWRTMainC == max(YWRTMainC));
    [~,findMinLEPoints] = find(YWRTMainC == min(YWRTMainC));
    findMaxLEPoints = min(findMaxLEPoints);
    findMinLEPoints = min(findMinLEPoints);

    % Find where the maximum and min points are along the trailing edge and
    % store them in XWRTMainC and YWRTMainC and set them to a Find.
    [~,findMaxTEPoints] = find(YWRTMainC == max(YWRTMainC));
    [~,findMinTEPoints] = find(YWRTMainC == min(YWRTMainC));
    findMaxTEPoints = max(findMaxTEPoints);
    findMinTEPoints = max(findMinTEPoints);

    % Create subarrays for the X-Axis and Y-Axis along the leading edge of the
    % main arrays
    XWRTMainLE = XWRTMainC(findMinLEPoints:findMaxLEPoints);
    YWRTMainLE = YWRTMainC(findMinLEPoints:findMaxLEPoints);

    % Create subarrays for the X-Axis and Y-Axis along the trailing edge of the
    % main arrays
    XWRTMainTE = XWRTMainC(findMaxTEPoints:findMinTEPoints);
    YWRTMainTE = YWRTMainC(findMaxTEPoints:findMinTEPoints);

    % Leading Edge
    % Determine the slope of each wing segment created by adding a point
    if isempty(storageArrayP1) ~= 1 && addOn > 0
        slopeLEArray = zeros(1,storageArrayP1(end)+addOn);
        for num = 1:storageArrayP1(end)+addOn
            slopeLEArray(num) = (XWRTMainLE(num+addOn) - XWRTMainLE(num))/(YWRTMainLE(num+addOn) - YWRTMainLE(num));
%             slopeLEArray(num) = (XWRTMainLE(num+1) - XWRTMainLE(num))/(YWRTMainLE(num+1) - YWRTMainLE(num));
        end
        [~,findBehindPointLE] = find(tempStorageArrayYSort1 <= yLocationInc);
        if isempty(findBehindPointLE) == 1
            findBehindPointLE = 1;
        end
    else
        slopeLEArray = (XWRTMainLE(2) - XWRTMainLE(1))/(YWRTMainLE(2) - YWRTMainLE(1));
        findBehindPointLE       = 1;
    end

    % Trailing Edge
    % Determine the slope of each wing segment created by adding a point
    if isempty(storageArrayP2) ~= 1 && addOn > 0
        slopeTEArray = zeros(1,storageArrayP2(end)+addOn);
        for num = 1:storageArrayP2(end)+addOn
            slopeTEArray(num) = (XWRTMainTE(num+addOn) - XWRTMainTE(num))/(YWRTMainTE(num+addOn) - YWRTMainTE(num));
        end
        [~,findBehindPointTE] = find(tempStorageArrayYSort2 <= yLocationInc);
        if isempty(findBehindPointTE) == 1
            findBehindPointTE = 1;
        end
    else
        slopeTEArray = (XWRTMainTE(end) - XWRTMainTE(end-1))/(YWRTMainTE(end) - YWRTMainTE(end-1));
        findBehindPointTE     = 1;
    end
    
    
% Only perform the following computations if we have points placed on both
% the leading and trailing edge
% if isempty(storageArrayP1) ~= 1 && isempty(storageArrayP2) ~= 1
    
%         yLocationFirstWS      = zeros(1,storageArrayP1(end));
%         xLocationFirstWS      = zeros(1,storageArrayP2(end));
%         xLocationFirstWSLESP1 = zeros(1,storageArrayP1(end));
%         xLocationFirstWSLESP2 = zeros(1,storageArrayP2(end));
%         firstWSChordP1        = zeros(1,storageArrayP1(end));
%         firstWSChordP2        = zeros(1,storageArrayP2(end));
%         tpWSP1                = zeros(1,storageArrayP1(end));
%         tpWSP2                = zeros(1,storageArrayP2(end));
%         findSlopeTEPoint      = zeros(1,storageArrayP2(end));
%         airfoil_coords_xLE    = zeros(airfoil_size(1),storageArrayP1(end)+addOn);
        
        % First determine how many wing segments we have
%         if isempty(storageArrayP1) == 1
%             numWingSegments = storageArrayP2(end) + addOn;
%         elseif isempty(storageArrayP2) == 1
%             numWingSegments = storageArrayP1(end) + addOn;
%         else
%             numWingSegments = storageArrayP1(end) + storageArrayP2(end) + addOn;
%         end

        

        if isempty(storageArrayP1) == 1
            storageArrayP1 = 0;
        elseif isempty(storageArrayP2) == 1
            storageArrayP2 = 0;
        end
        
        numWingSegments = storageArrayP1(end) + storageArrayP2(end) + addOn;
        
%         pointTE               = zeros(1,numWingSegments);
        tpArray               = zeros(1,numWingSegments);
        
        % Now create a loop to gradually build up the wing for each wing
        % segment. This is where it gets fun.
        for i = 2:numWingSegments + addOn
            
            if tempStorageArrayXSort1 == 0
                tempStorageArrayXSort1 = [];
            end
            
            if tempStorageArrayYSort1 == 0
                tempStorageArrayYSort1 = [];
            end
            
            if tempStorageArrayXSort2 == 0
                tempStorageArrayXSort2 = [];
            end
            
            if tempStorageArrayYSort2 == 0
                tempStorageArrayYSort2 = [];
            end
            
            % We need an array to partition all of the leading edge points
            % as well as the ones created by the trailing edge modification
            combinedLEArrayPointsX = [XWRTMainLE tempStorageArrayXSort2];
            combinedLEArrayPointsY = [YWRTMainLE tempStorageArrayYSort2];
            combinedTEArrayPointsX = [XWRTMainTE tempStorageArrayXSort1];
            combinedTEArrayPointsY = [YWRTMainTE tempStorageArrayYSort1];
            
            if isempty(tempStorageArrayXSort1) == 1
                tempStorageArrayXSort1 = 0;
            end
            
            if isempty(tempStorageArrayYSort1) == 1
                tempStorageArrayYSort1 = 0;
            end
            
            if isempty(tempStorageArrayXSort2) == 1
                tempStorageArrayXSort2 = 0;
            end
            
            if isempty(tempStorageArrayYSort2) == 1
                tempStorageArrayYSort2 = 0;
            end

            % Begin looping across all of the inputted trailing edge points
            for jj = 1:length(tempStorageArrayXSort2)

               % Find where the trailing edge points are stored in the
               % combined array housing all of the leading and trailing
               % edge points
               if tempStorageArrayXSort1 ~= 0
                   findLEXPoints = find(combinedLEArrayPointsX == tempStorageArrayXSort2(jj));
               else
                   findLEXPoints = [];
               end
               
               findLEXPoints = find(combinedLEArrayPointsX == tempStorageArrayXSort2(jj));
               
               % Rearrange the Y Sort array in descending order
               rearrangedYSort1 = sort(tempStorageArrayYSort1,'descend');

               % Initialize two arrays for rearranging the X-coordinate points in
               % the correct order
               findYLocationArray = zeros(length(tempStorageArrayXSort1),1);
               rearrangedXArray   = zeros(length(tempStorageArrayXSort1),1);

               % Arrange the X-coordinate points according to the order that they
               % were inputted along with the rearranged Y-coordinate
               % points
               for n = 1:length(tempStorageArrayXSort1)
                   intermediateArray = find(tempStorageArrayYSort1 == tempStorageArrayYSort1(n));
                    if length(intermediateArray) > 1
                        findFirstValue = intermediateArray == n;
                        findSecondValue = findFirstValue == 0;
                        intermediateArray(findSecondValue) = [];
                        findYLocationArray(n) = intermediateArray;
                    else
                        findYLocationArray(n) = intermediateArray;
                    end
                   findYLocationArray(n) = find(findYLocationArray == n);
                   findYSorted = rearrangedYSort1 == tempStorageArrayYSort1(findYLocationArray(n));
                   rearrangedXArray(findYSorted) = tempStorageArrayXSort1(findYLocationArray(n));
                end
                rearrangedXSort1 = rearrangedXArray';

                % Find where the trailing edge point is greater than the
                % leading edge points. If it isn't then set the Find to 0
                for inc1 = 1:length(tempStorageArrayYSort1)
                    if tempStorageArrayYSort2(jj) > rearrangedYSort1(inc1)
                        findSlopeLEPoint1 = inc1;
                        break
                    else
                        findSlopeLEPoint1 = 0;
                    end
                end

                % Find where the trailing edge point is less than the
                % leading edge points. If it isn't then set the Find to 0
                for inc2 = 1:length(tempStorageArrayYSort1)
                    if tempStorageArrayYSort2(jj) < tempStorageArrayYSort1(inc2)
                        findSlopeLEPoint2 = inc2;
                        break
                    else
                        findSlopeLEPoint2 = 0;
                    end
                end

                % If the first Find is greater than the second Find, set
                % the maxPoint to the first Find and set the substitute
                % arrays to the rearranged arrays. If it isn't then do the
                % opposite and set the substitute arrays to the regular Sort
                % arrays
                if findSlopeLEPoint1 > findSlopeLEPoint2
                    maxPointLE = findSlopeLEPoint1;
                    substituteXArray = rearrangedXSort1;
                    substituteYArray = rearrangedYSort1;
                elseif findSlopeLEPoint2 > findSlopeLEPoint1
                    maxPointLE = findSlopeLEPoint2;
                    substituteXArray  = tempStorageArrayXSort1;
                    substituteYArray  = tempStorageArrayYSort1;
                else
                    maxPointLE = findSlopeLEPoint1;
                    substituteXArray = rearrangedXSort1;
                    substituteYArray = rearrangedYSort1;
                end

                if storageArrayP2(end) ~= 0 && storageArrayP1(end) == 0
                    maxPointLE = findSlopeLEPoint1;
                    substituteXArray = min(XWRTMainLE);
                    substituteYArray = min(YWRTMainLE);
                end
                
               % Determine what wing segments and subsequent slopes the
               % trailing edge points are under
               for count = storageArrayP1(end)+addOn:-1:1
                   if count > 1 && tempStorageArrayYSort2(jj) > tempStorageArrayYSort1(count-addOn)
                       slopeLEPoint = slopeLEArray(count);
                       break
                   elseif tempStorageArrayYSort2(jj) < tempStorageArrayYSort1(1)
                       slopeLEPoint = slopeLEArray(1);
                       break
                   else
                       slopeLEPoint = slopeLEArray;
                   end
               end

               % Here's the important part, for the trailing edge point found 
               % in the combined array determine its new X-Coordinate due to being
               % translated(mirrored) to the leading edge
                if isempty(findLEXPoints) ~= 1
                    combinedLEArrayPointsX(findLEXPoints) = (tempStorageArrayYSort2(jj)...
                        - substituteYArray(maxPointLE)) * slopeLEPoint + substituteXArray(maxPointLE);
                end
            end

            % Set the combined array to a new sorter array name
            pointLE = combinedLEArrayPointsX;
  
            % Begin looping across all of the inputted leading edge points
            for jj = 1:length(tempStorageArrayXSort1)
                
               % Find where the leading edge points are stored in the
               % combined array housing all of the leading and trailing
               % edge points
               if tempStorageArrayXSort2 ~= 0
                   findTEXPoints = find(combinedTEArrayPointsX == tempStorageArrayXSort1(jj));
               else
                   findTEXPoints = [];
               end
               
               findTEXPoints = find(combinedTEArrayPointsX == tempStorageArrayXSort1(jj));

               % Rearrange the Y Sort array in ascending order
               rearrangedYSort2 = sort(tempStorageArrayYSort2,'ascend');

               % Initialize two arrays for rearranging the X-coordinate points in
               % the correct order
               findYLocationArray = zeros(length(tempStorageArrayXSort2),1);
               rearrangedXArray   = zeros(length(tempStorageArrayXSort2),1);

               % Arrange the X-coordinate points according to the order that they
               % were inputted along with the rearranged Y-coordinate
               % points
               for n = 1:length(tempStorageArrayXSort2)
                   intermediateArray = find(tempStorageArrayYSort2 == tempStorageArrayYSort2(n));
                    if length(intermediateArray) > 1
                        findFirstValue = intermediateArray == n;
                        findSecondValue = findFirstValue == 0;
                        intermediateArray(findSecondValue) = [];
                        findYLocationArray(n) = intermediateArray;
                    else
                        findYLocationArray(n) = intermediateArray;
                    end
                   findYLocationArray(n) = find(findYLocationArray == n);
                   findYSorted = rearrangedYSort2 == tempStorageArrayYSort2(findYLocationArray(n));
                   rearrangedXArray(findYSorted) = tempStorageArrayXSort2(findYLocationArray(n));
                end
                rearrangedXSort2 = rearrangedXArray';

                % Find where the leading edge point is greater than the
                % trailing edge points. If it isn't then set the Find to 0
                for inc1 = 1:length(tempStorageArrayYSort2)
                    if tempStorageArrayYSort1(jj) > tempStorageArrayYSort2(inc1)
                        findSlopeTEPoint1 = inc1;
                        break
                    else
                        findSlopeTEPoint1 = 0;
                    end
                end   

                % Find where the leading edge point is less than the
                % trailing edge points. If it isn't then set the Find to 0
                for inc2 = 1:length(tempStorageArrayYSort2)
                    if tempStorageArrayYSort1(jj) < rearrangedYSort2(inc2)
                        findSlopeTEPoint2 = inc2;
                        break
                    else
                        findSlopeTEPoint2 = 0;
                    end
                end

                % If the first Find is greater than the second Find, set
                % the maxPoint to the first Find and set the substitute
                % arrays to the rearranged arrays. If it isn't then do the
                % opposite and set the substitute arrays to the regular Sort
                % arrays
                if findSlopeTEPoint1 > findSlopeTEPoint2
                    maxPointTE = findSlopeTEPoint1;
                    substituteXArray = tempStorageArrayXSort2;
                    substituteYArray = tempStorageArrayYSort2;
                elseif findSlopeTEPoint2 > findSlopeTEPoint1
                    maxPointTE = findSlopeTEPoint2;
                    substituteXArray  = rearrangedXSort2;
                    substituteYArray  = rearrangedYSort2;
                else
                    maxPointTE = findSlopeTEPoint1;
                    substituteXArray = tempStorageArrayXSort2;
                    substituteYArray = tempStorageArrayYSort2;
                end
                
                if storageArrayP1(end) ~= 0 && storageArrayP2(end) == 0
                    maxPointTE = findSlopeTEPoint1;
                    substituteXArray = min(XWRTMainTE);
                    substituteYArray = min(YWRTMainTE);
                end

               % Determine what wing segments and subsequent slopes the
               % trailing edge points are above
               for count = 1:storageArrayP2(end)+addOn
                   if tempStorageArrayYSort1(jj) > tempStorageArrayYSort2(count)
                       slopeTEPoint = slopeTEArray(count);
                       break
                   elseif tempStorageArrayYSort1(jj) < min(tempStorageArrayYSort2)
                       slopeTEPoint = slopeTEArray(end);
                       break
                   else
                       slopeTEPoint = slopeTEArray;
                   end
               end

               % Here's the important part, for the leading edge point found 
               % in the combined array determine its new X-Coordinate due to being
               % translated(mirrored) to the trailing edge
                if isempty(findTEXPoints) ~= 1
                    combinedTEArrayPointsX(findTEXPoints) = (tempStorageArrayYSort1(jj)...
                        - substituteYArray(maxPointTE)) * slopeTEPoint + substituteXArray(maxPointTE);
                end
            end
                    
            % Set the combined array to a new sorter array name
            pointTE = combinedTEArrayPointsX;

            % Arrange the Y-coordinate points in decreasing order
            sortedLEPointsY = sort(combinedLEArrayPointsY);

            % Initialize two arrays for rearranging the X-coordinate points in
            % the correct order
            findYLocationArray = zeros(length(pointLE),1);
            rearrangedXArray   = zeros(length(pointLE),1);

            % Arrange the X-coordinate points according to the order that they
            % were inputted
            for m = 1:length(combinedLEArrayPointsX)
                intermediateArray = find(combinedLEArrayPointsY == combinedLEArrayPointsY(m));
                if length(intermediateArray) > 1
                    findFirstValue = intermediateArray == m;
                    findSecondValue = findFirstValue == 0;
                    intermediateArray(findSecondValue) = [];
                    findYLocationArray(m) = intermediateArray;
                else
                    findYLocationArray(m) = intermediateArray;
                end
                findYLocationArray(m) = find(findYLocationArray == m);
                findYSorted = sortedLEPointsY == combinedLEArrayPointsY(findYLocationArray(m));
                rearrangedXArray(findYSorted) = combinedLEArrayPointsX(findYLocationArray(m));
            end
            sortedLEPointsX = rearrangedXArray;

            % Initialize two arrays for rearranging the X-coordinate points in
            % the correct order
            findYLocationArray = zeros(length(pointTE),1);
            rearrangedXArray   = zeros(length(pointTE),1);

            % Arrange the X-coordinate points according to the order that they
            % were inputted
            for m = 1:length(combinedTEArrayPointsX)
                intermediateArray = find(combinedTEArrayPointsY == combinedTEArrayPointsY(m));
                if length(intermediateArray) > 1
                    findFirstValue = intermediateArray == m;
                    findSecondValue = findFirstValue == 0;
                    intermediateArray(findSecondValue) = [];
                    findYLocationArray(m) = intermediateArray;
                else
                    findYLocationArray(m) = intermediateArray;
                end
                findYLocationArray(m) = find(findYLocationArray == m);
                findYSorted = sortedLEPointsY == combinedTEArrayPointsY(findYLocationArray(m));
                rearrangedXArray(findYSorted) = combinedTEArrayPointsX(findYLocationArray(m));
            end
            sortedTEPointsX = rearrangedXArray;
            
            tpArray(i) = (pointTE(i) - pointLE(i)) / rootChord;
            tpSub = sort(tpArray(2:end),'descend');
            tpArray = [0 tpSub];
        end
        
        tpArray = (sortedTEPointsX' - sortedLEPointsX') / rootChord;
        
        if storageArrayP1 == 0
            storageArrayP1 = [];
        elseif storageArrayP2 == 0
            storageArrayP2 = [];
        end
        
%         for i = 1:length(tpArray)
%             if tpArray(i) <= 0
%                 tpArray(i) = 0;
%             end
%         end
        
        sorted_airfoil_coords_xLE = zeros(comboAirfoilSize(1),length(pointLE));
        
        airfoil_coords_xLE = comboAirfoil_coords_xRoot * rootChord * tpArray + sortedLEPointsX';
            
        sub_airfoil_coords_xLE = airfoil_coords_xLE(ceil(comboAirfoilSize(1)/2),:);

        findLEPointsX = zeros(1,length(pointLE));
        
%         for inc = 1:length(pointLE)
%             findLEPointsX(inc) = find(sub_airfoil_coords_xLE(inc) == sortedLEPointsX);
% 
%             sorted_airfoil_coords_xLE(:,inc) = airfoil_coords_xLE(:,findLEPointsX(inc));
%         end
        
        for inc = 1:length(pointLE)
            findLEPointsX(inc) = find(sub_airfoil_coords_xLE(inc) == sortedLEPointsX, 1 );

            sorted_airfoil_coords_xLE(:,inc) = airfoil_coords_xLE(:,findLEPointsX(inc));
        end
        
        airfoil_coords_xLE = sorted_airfoil_coords_xLE;
        
        
        

%         for j = 1:incrementSlope(end)
%             for i = 1:storageArrayP1(end)+addOn
%                 % Y-Location of end of first wing segment
%                 yLocationFirstWS(i) = slopeTEArray(findBehindPointTE(j))*YWRTMainLE(i+1);
%                 xLocationFirstWS(i) = slopeLEArray(findBehindPointLE(j))*YWRTMainTE(i+1);
% 
%                 % X-Location accounting for LE sweep
%                 xLocationFirstWSLESP1(i) = yLocationFirstWS(i)+c;
%                 xLocationFirstWSLESP2(i) = xLocationFirstWS(i);
% 
%                 % Subtract LE point 
%                 firstWSChordP1(i) = xLocationFirstWSLESP1(i) - XWRTMainLE(i+1);
%                 firstWSChordP2(i) = xLocationFirstWSLESP2(i);
%                 firstWSChordP2(i) = XWRTMainTE(i+1) - xLocationFirstWSLESP2(i);
% 
%                 % Taper of wing segment
%                 tpWSP1(i) = firstWSChordP1(i)/c;
%                 tpWSP2(i) = firstWSChordP2(i)/c;
% 
%                 % Set up airfoil coordinates for each wing segment
%                 airfoil_coords_xLE(:,i) = airfoil_coords_x*c*tpWSP1(i) + XWRTMainLE(i+1);
%                 airfoil_coords_xTE(:,i) = xLocationFirstWS(i) + airfoil_coords_x*c*tpWSP2(i);
%             end
%         end

        % Set up airfoil coordinates for first point
%         airfoil_coords_x1 = airfoil_coords_x*c + pointLE(1);
        
        % Wing Area
        wingArea = (b/2)*c*(1+tp);
        
        % Wing Aspect Ratio
        ARWing = b^2/wingArea;

       % X-Coordinates
        XW1=1;
        XW2=XW1+(b/c)*tand(LamLE);
%         XW3=XW2+1;
        XW4=XW1+1;

        % Z-Coordinates
%         ZW1=FH/2+1*sind(i_w);
        ZW2=1/2+(XW4-XW2)*sind(i_w)+(ARWing)*tand(Gam);
%         ZW3=FH/2+(XW4-XW3)*sind(i_w)+(ARWing)*tand(Gam);
%         ZW4=FH/2;

        % Build final arrays along each axis to input into surface plot
%         xCoordsLE = [airfoil_coords_x1, airfoil_coords_xLE];
% %         xCoordsLE(2) = airfoil_coords_x1;
%         xCoordsLE(:,2) = [];
        
        
        xCoordsBoth = airfoil_coords_xLE;
        yCoordsBoth = (ones(comboAirfoilSize(1),1).*sortedLEPointsY(1:i));
        zCoordsMid = (comboAirfoil_coords_yRoot.*(ones(1,numWingSegments+addOn)+ZW2).*rootChord*tp);
        zCoordsEnd  = (comboAirfoil_coords_yTip.*rootChord*tp);
        zCoordsBoth = [zCoordsMid(:,1:end-1), zCoordsEnd];
     
        if storageArrayP1 == 0
            storageArrayP1 = [];
        end
        
        if storageArrayP2 == 0
            storageArrayP2 = [];
        end
        
        if tempStorageArrayXSort1 == 0
            tempStorageArrayXSort1 = [];
        end

        if tempStorageArrayYSort1 == 0
            tempStorageArrayYSort1 = [];
        end

        if tempStorageArrayXSort2 == 0
            tempStorageArrayXSort2 = [];
        end

        if tempStorageArrayYSort2 == 0
            tempStorageArrayYSort2 = [];
        end
        
% elseif isempty(storageArrayP1) ~= 1 || isempty(storageArrayP2) ~= 1
if isempty(storageArrayP1) == 1 && isempty(storageArrayP2) == 1    
    switch(lineSelected)
        %% 1 Leading Edge Modification
        %% 2 Trailing Edge Modification
        case 1
    % if isempty(storageArrayP1) ~= 1 && isempty(storageArrayP2) == 1
        % Create a new array
    %     XWRTMainWP = XWRTMainC;
    %     YWRTMainWP = YWRTMainC;

        % Erase the last points in the array
    %     XWRTMainWP(end-1:end) = [];
    %     YWRTMainWP(end-1:end) = [];

        % Slope of trailing edge
    %     slopeTE = (XWRTMain(end) - XWRTMain(end-1))/(YWRTMain(end) - YWRTMain(end-1));

    if isempty(storageArrayP1) ~= 1
        yLocationFirstWS    = zeros(1,storageArrayP1(end));
        xLocationFirstWSLES = zeros(1,storageArrayP1(end));
        firstWSChord        = zeros(1,storageArrayP1(end));
        tpWS                = zeros(1,storageArrayP1(end));
    else
        yLocationFirstWS    = 0;
        xLocationFirstWSLES = 0;
        firstWSChord        = 0;
        tpWS                = 0;
        storageArrayP1      = 0;
    end
    %     airfoil_coords_xWP  = zeros(airfoil_size(1),storageArrayP1(end)+addOn);
        airfoil_coords_xLE  = zeros(comboAirfoilSize(1),storageArrayP1(end)+addOn);

        if isempty(storageArrayP2) == 1
            incrementSlope = 1;
        else
            incrementSlope = storageArrayP2;
        end

%  YWRTMainLE = sort(YWRTMainLE,'descend');         
        
            for j = 1:incrementSlope(end)
                for i = 1:storageArrayP1(end)+addOn
                    upperAirfoilCoordsXLE = zeros(comboAirfoilSize(1),storageArrayP1(end)+addOn);
                    lowerAirfoilCoordsXLE = zeros(comboAirfoilSize(1)+1,storageArrayP1(end)+addOn);
                    
                    % Y-Location of end of first wing segment
            %         yLocationFirstWS(i) = slopeTE*YWRTMainWP(i+1);
                    yLocationFirstWS(i) = slopeTEArray(findBehindPointTE(j))*YWRTMainLE(i+1) + rootChord;

%                     XW2=XW1 + (b/2)*tand(LamLE);
                    
                    % X-Location accounting for LE sweep
                    xLocationFirstWSLES(i) = yLocationFirstWS(i);

                    % Subtract LE point 
            %         firstWSChord(i) = xLocationFirstWSLES(i) - XWRTMainWP(i+1);
                    firstWSChord(i) = xLocationFirstWSLES(i) - XWRTMainLE(i+1);
%                     firstWSChord(i) = XWRTMainLE(i+1) - xLocationFirstWSLES(i);

                    % Taper of wing segment
                    tpWS(i) = firstWSChord(i)/rootChord;

                    % Set up airfoil coordinates for each wing segment
            %         airfoil_coords_xWP(:,i) = airfoil_coords_x*c*tpWS(i) + XWRTMainWP(i+1);
%                     airfoil_coords_xLE(:,i) = comboAirfoil_coords_xRoot*c*tpWS(i) + XWRTMainLE(i+1);

                    airfoil_coords_xLE(:,i) = (yLocationFirstWS(i) - comboAirfoil_coords_xRoot*rootChord*tpWS(i));
                    
    %                 airfoil_coords_xLE(:,i) = airfoil_coords_x*c*.3422 + XWRTMainLE(i+1);
    
                    % Need to separate airfoil_coords_xLE into a upper and lower
                    % section and then invert them and put the whole array back
                    % together
                    [maxAirfoilCoordsXLE_Val,maxAirfoilCoordsXLE_Loc]   = max(airfoil_coords_xLE(:,i));
                    upperAirfoilCoordsXLE(1:maxAirfoilCoordsXLE_Loc,i) = airfoil_coords_xLE(1:maxAirfoilCoordsXLE_Loc,i);
                    lowerAirfoilCoordsXLE(maxAirfoilCoordsXLE_Loc+2:end,i) = airfoil_coords_xLE(maxAirfoilCoordsXLE_Loc+1:end,i);
                    
                    % Find zeros
                    findZerosUpper = upperAirfoilCoordsXLE == 0;
                    findZerosLower = lowerAirfoilCoordsXLE == 0;
                    
                    % Erase zeros
                    upperAirfoilCoordsXLE(findZerosUpper) = [];
                    lowerAirfoilCoordsXLE(findZerosLower) = [];
                    
                    % Add in max point so that the upper and lower are same
                    lowerAirfoilCoordsXLE = [maxAirfoilCoordsXLE_Val lowerAirfoilCoordsXLE];
                    
                    % Erase last point on lowerAirfoilCoordsXLE otherwise
                    % we would have two, only need one
                    lowerAirfoilCoordsXLE(end) = [];
                    
                    airfoil_coords_xLE(:,i)    = [lowerAirfoilCoordsXLE upperAirfoilCoordsXLE];
    
                end
            end
            
            
            
%--------------------------------------------------------------------------            
            
          
            
%         for j = 1:incrementSlope(end)
%             for i = 1:storageArrayP1(end)+addOn
%                 % X-Location of LE of wing segment
%         %         xLocationFirstWS(i) = slopeLE*YWRTMainWP(i+1);
%                 yLocationFirstWS(i) = slopeTEArray(findBehindPointTE(j))*YWRTMainLE(i+1);
% 
%                 % X-Location of TE of wing segment
%         %         slopeTE = (XWRTMain(end) - XWRTMain(end-1))/(YWRTMain(end) - YWRTMain(end-1));
%         %         xLocationWS(i) = slopeTE*YWRTMainWP(i+1);
%         %         xLocationWS(i) = slopeTE*YWRTMainTE(i+1);
% 
%                 % X-Location accounting for TE sweep
%                 xLocationFirstWSLES(i) = yLocationFirstWS(i);
% 
%                 % Subtract LE point 
%                 firstWSChord(i) = xLocationFirstWSLES(i);
%         %         firstWSChord(i) = XWRTMainWP(i+1) - xLocationFirstWSLES(i);
%                 firstWSChord(i) = XWRTMainLE(i+1) - xLocationFirstWSLES(i);
% 
%                 % Taper of wing segment
%                 tpWS(i) = firstWSChord(i)/c;
% 
%                 if tpWS(i) == 0
%                     tpWS(i) = 1;
%                 end
% 
%                 % Set up airfoil coordinates for each wing segment
%         %         airfoil_coords_xWP(:,i) = xLocationFirstWS(i) + airfoil_coords_x*c*tpWS(i);
%                 airfoil_coords_xLE(:,i) = yLocationFirstWS(i) + comboAirfoil_coords_xRoot*c*tpWS(i);
%             end
%         end
            
            
            
%--------------------------------------------------------------------------


        % For tip chord need to do something a little different
        tipChordPointsY = find(YWRTMainC == b/2);
        tipChordPointsX = XWRTMainC(tipChordPointsY);
        
        % Taper of tip chord
        tpTC = (tipChordPointsX(2)-tipChordPointsX(1)) / rootChord;
        
        % Airfoil coordinates of tip chord
        airfoil_coords_xEnd = comboAirfoil_coords_xRoot*rootChord*tpTC+tipChordPointsX(1);
        
        % Set up airfoil coordinates for first point
    %     airfoil_coords_x1 = airfoil_coords_x*c + XWRTMainWP(1);
        airfoil_coords_x1 = comboAirfoil_coords_xRoot*rootChord + XWRTMainLE(1);
%         airfoil_coords_x1 = airfoil_coords_x*(tipChordPointsX(2)-tipChordPointsX(1)) + XWRTMainLE(1);
%         airfoil_coords_x1 = airfoil_coords_x*c*tpTC;


        if addOn == 0
            xCoordsLE = [airfoil_coords_x1, airfoil_coords_xEnd];
        else
            xCoordsLE = [airfoil_coords_x1, airfoil_coords_xLE];
        end
        
        % Build final arrays along each axis to input into surface plot
    %     xCoordsLE = [airfoil_coords_x1, airfoil_coords_xWP];
%         xCoordsLE = [airfoil_coords_x1, airfoil_coords_xLE airfoil_coords_xEnd];
    %     yCoordsLE = (ones(airfoil_size(1),1).*YWRTMainWP(1:i+1));
        yCoordsLE = (ones(comboAirfoilSize(1),1).*YWRTMainLE(1:i+1));
        zCoordsLERoot = comboAirfoil_coords_yRoot.*rootChord;
        zCoordsLE     = comboAirfoil_coords_yTip.*(ones(1,storageArrayP1(end)+addOn+1).*tipChord);
%         zCoordsLE     = comboAirfoil_coords_yRoot.*(ones(1,storageArrayP1(end)+addOn+1).*rootChord*tp);
        zCoordsLE(:,1)    = zCoordsLERoot;
        
        
        %% Trailing Edge Modification
        case 2
    % elseif isempty(storageArrayP2) ~= 1 && isempty(storageArrayP1) == 1
        % Create a new array
    %     XWRTMainWP = XWRTMainC;
    %     YWRTMainWP = YWRTMainC;

        % Erase the last points in the array
    %     XWRTMainWP(1:2) = [];
    %     YWRTMainWP(1:2) = [];

        % Slope of leading edge
    %     slopeLE = (XWRTMain(2) - XWRTMain(1))/(YWRTMain(2) - YWRTMain(1));
    %     slopeLE = (XWRTMainC(end-1) - XWRTMainC(end))/(YWRTMainC(end-1) - YWRTMainC(end));

        xLocationFirstWS    = zeros(1,storageArrayP2(end));
        xLocationFirstWSLES = zeros(1,storageArrayP2(end));
        firstWSChord        = zeros(1,storageArrayP2(end));
        tpWS                = zeros(1,storageArrayP2(end));
    %     airfoil_coords_xWP  = zeros(airfoil_size(1),storageArrayP2(end)+addOn);
        airfoil_coords_xTE  = zeros(comboAirfoilSize(1),storageArrayP2(end)+addOn);

    %     if YWRTMainWP(2) == YWRTMainWP(1)
    %         YWRTMainWP(2) = [];
    %     end
        if isempty(storageArrayP1) == 1
            incrementSlope = 1;
        else
            incrementSlope = storageArrayP1;
        end

        for j = 1:incrementSlope(end)
            for i = 1:storageArrayP2(end)+addOn
                % X-Location of LE of wing segment
        %         xLocationFirstWS(i) = slopeLE*YWRTMainWP(i+1);
                xLocationFirstWS(i) = slopeLEArray(findBehindPointLE(j))*YWRTMainTE(i+1);

                % X-Location of TE of wing segment
        %         slopeTE = (XWRTMain(end) - XWRTMain(end-1))/(YWRTMain(end) - YWRTMain(end-1));
        %         xLocationWS(i) = slopeTE*YWRTMainWP(i+1);
        %         xLocationWS(i) = slopeTE*YWRTMainTE(i+1);

                % X-Location accounting for TE sweep
                xLocationFirstWSLES(i) = xLocationFirstWS(i);

                % Subtract LE point 
                firstWSChord(i) = xLocationFirstWSLES(i);
        %         firstWSChord(i) = XWRTMainWP(i+1) - xLocationFirstWSLES(i);
                firstWSChord(i) = XWRTMainTE(i+1) - xLocationFirstWSLES(i);

                % Taper of wing segment
                tpWS(i) = firstWSChord(i)/rootChord;

                if tpWS(i) == 0
                    tpWS(i) = 1;
                end

                % Set up airfoil coordinates for each wing segment
        %         airfoil_coords_xWP(:,i) = xLocationFirstWS(i) + airfoil_coords_x*c*tpWS(i);
                airfoil_coords_xTE(:,i) = xLocationFirstWS(i) + comboAirfoil_coords_xRoot*rootChord*tpWS(i);
            end
        end
        
        % For tip chord need to do something a little different
        tipChordPointsY = find(YWRTMainC == b/2);
        tipChordPointsX = XWRTMainC(tipChordPointsY);
        
        % Taper of tip chord
        tpTC = (tipChordPointsX(2)-tipChordPointsX(1)) / rootChord;
        
        % Airfoil coordinates of tip chord
        airfoil_coords_x1 = comboAirfoil_coords_xRoot*rootChord*tpTC+tipChordPointsX(1);

        % Set up airfoil coordinates for first point
    %     airfoil_coords_x1 =  XWRTMainWP(1) + airfoil_coords_x*c*tp;
    %     xLocationFirstWS(3) = slopeLE*YWRTMainWP(1);
        xLocationFirstWS(3) = slopeLEArray(findBehindPointLE)*YWRTMainTE(1);

%         airfoil_coords_x1 =  xLocationFirstWS(3) + airfoil_coords_x*c*tp;
%         airfoil_coords_x1 = airfoil_coords_x*c*tp+XWRTMainC(2);

        % Build final arrays along each axis to input into surface plot
    %     xCoordsTE = [airfoil_coords_x1, airfoil_coords_xWP];
        xCoordsTE = [airfoil_coords_x1, airfoil_coords_xTE];
    %     yCoordsTE = (ones(airfoil_size(1),1).*YWRTMainWP);
        yCoordsTE = (ones(comboAirfoilSize(1),1).*YWRTMainTE);
        zCoordsTERoot = comboAirfoil_coords_yRoot.*rootChord.*tp;
        zCoordsTE = comboAirfoil_coords_yTip.*(ones(1,storageArrayP2(end)+addOn+1).*rootChord*tp);
        zCoordsTE(:,1) = zCoordsTERoot;
    end
end
    
xCoords = xCoordsBoth;
yCoords = yCoordsBoth;
zCoords = zCoordsBoth;

%% ------------------------------------------------------------------------
% if isempty(storageArrayP1) ~= 1 && isempty(storageArrayP2) ~= 1
%         
% elseif isempty(storageArrayP1) ~= 1 && isempty(storageArrayP2) == 1
%         xCoords = xCoordsLE;
%         yCoords = yCoordsLE;
%         zCoords = zCoordsLE;
% elseif isempty(storageArrayP1) == 1 && isempty(storageArrayP2) ~= 1
%         xCoords = xCoordsTE;
%         yCoords = yCoordsTE;
%         zCoords = zCoordsTE;
% end
    
%     if isempty(xCoordsLE) == 1
%         xCoords = xCoordsTE;
%         yCoords = yCoordsTE;
%         zCoords = zCoordsTE;
%         
%     elseif isempty(xCoordsTE) == 1
%         xCoords = xCoordsLE;
%         yCoords = yCoordsLE;
%         zCoords = zCoordsLE;
%         
%     else
%         xCoords = [xCoordsLE xCoordsTE];
%         yCoords = [yCoordsLE yCoordsTE];
%         zCoords = [zCoordsLE zCoordsTE];

%         xCoords = xCoordsBoth;
%         yCoords = yCoordsBoth;
%         zCoords = zCoordsBoth;
%     end
%     xCoords = [xCoordsLE xCoordsTE];
%     yCoords = [yCoordsLE yCoordsTE];
%     zCoords = [zCoordsLE zCoordsTE];

if isempty(storageArrayP1) ~= 1 || isempty(storageArrayP2) ~= 1

    delete(wingPreviewLeft);
    delete(wingPreviewRight);
    delete(wingPreviewLeftInitial);
    delete(wingPreviewRightInitial);
    delete(rightAirfoil);
    delete(leftAirfoil);

    % Plot left wing
    wingPreviewLeft = surface(previewAxes,xCoords,yCoords,zCoords);
%     wingPreviewLeft = surface(previewAxes,xCoordsLE,yCoordsLE,zCoordsLE);
    wingPreviewLeft.EdgeColor = 'none';

    % Plot right wing
    wingPreviewRight = surface(previewAxes,xCoords,-yCoords,zCoords);
    wingPreviewRight.EdgeColor = 'none';
else

    % X-Coordinates
    XW1 = 0;
    XW2=XW1 + (b/2)*tand(LamLE);
%     XW3=XW2+tipChord;
    XW4=XW1+rootChord;

    % Z-Coordinates
    ZW1=rootChord*sind(i_w);
    ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
%     ZW3=(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);

    XWRRoot = ((comboAirfoil_coords_xRoot).*rootChord)+XW1;
    XWRTip  = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

    XWRLRoot = ((comboAirfoil_coords_xRoot).*rootChord)+XW1;
    XWRLTip = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

    YWRT3 = zeros(length(XWRRoot),2);

    ZWRLRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
    ZWRLTip = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

    YWRT3(:,1) = 0;
    YWRT3(:,2) = -b/2+((b/2)-(b/2)*cosd(Gam));
    XWRT3 = [XWRLRoot,XWRLTip];
    ZWRT3 = [ZWRLRoot,ZWRLTip];

    % Plot Left Wing
    wingPreviewLeft = surface(previewAxes,XWRT3,YWRT3,ZWRT3);
    wingPreviewLeft.EdgeColor = 'none';

    YWRT = zeros(length(XWRRoot),2);

    ZWRRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
    ZWRTip = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

    YWRT(:,1) = 0;
    YWRT(:,2) = b/2-((b/2)-(b/2)*cosd(Gam));
    XWRT = [XWRRoot,XWRTip];
    ZWRT = [ZWRRoot,ZWRTip];

    % Plot Right Wing
    wingPreviewRight = surface(previewAxes,XWRT,YWRT,ZWRT);
    wingPreviewRight.EdgeColor = 'none';
end 
    
    % Add shading to beautify plot
%     colormap(bone);
% shading(previewAxes,'interp');

%     material metal
%     lighting gouraud
%     camlight
%      shading(previewAxes,'interp');
%      grid minor
     
     hold on

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW4=XW1+rootChord;
XWR2 = ((comboAirfoil_coords_xRoot.*tipChord)+XW2);

% Y-Coordinates
% YWR2 = (airfoil_array + b/2);
YWR2 = (zeros(comboAirfoilSize) + b/2);


% Z-Coordinates
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZWR2 = ((comboAirfoil_coords_yTip+ZW2).*tipChord);

%     XW2=XW1+(b/c)*tand(LamLE);
% 
%     XWR2 = ((airfoil_coords_x.*tp+XW2).*c)-c;
%     YWR2 = (airfoil_array + b/2);
%     ZWR2 = ((airfoil_coords_y.*tp).*(c));
    

rightAirfoil = fill3(previewAxes,XWR2,YWR2,ZWR2,[.5 .5 .5]);
leftAirfoil  = fill3(previewAxes,XWR2,-YWR2,ZWR2,[.5 .5 .5]);

% Plots Points on leading edge line
function LEPoints
global LEP1 LEP2 LEP3 LEP4 LEP5 LEP6 LEP7 LEP8 LEP9 LEP10 savePointSelected...
    tempStorageArrayX1 tempStorageArrayY1 topViewAxes

delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);
if length(tempStorageArrayX1) == 1
    LEP1 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none');

    if savePointSelected == 1
        LEP1.MarkerEdgeColor = 'black';
    else
        LEP1.MarkerEdgeColor = 'green';
    end

    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
elseif length(tempStorageArrayX1) == 2
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none');

    if savePointSelected == 1
        LEP2.MarkerEdgeColor = 'black';
    else
        LEP2.MarkerEdgeColor = 'green';
    end

    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
elseif length(tempStorageArrayX1) == 3
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP3.MarkerEdgeColor = 'black';
    else
        LEP3.MarkerEdgeColor = 'green';
    end

    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
elseif length(tempStorageArrayX1) == 4
    delete([LEP1,LEP2,LEP3,LEP4]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP4.MarkerEdgeColor = 'black';
    else
        LEP4.MarkerEdgeColor = 'green';
    end

    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
elseif length(tempStorageArrayX1) == 5
    delete([LEP1,LEP2,LEP3,LEP4,LEP5]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP5.MarkerEdgeColor = 'black';
    else
        LEP5.MarkerEdgeColor = 'green';
    end

    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
elseif length(tempStorageArrayX1) == 6
    delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-5),tempStorageArrayY1(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    LEP6 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP6.MarkerEdgeColor = 'black';
    else
        LEP6.MarkerEdgeColor = 'green';
    end

    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
elseif length(tempStorageArrayX1) == 7
    delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-6),tempStorageArrayY1(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-5),tempStorageArrayY1(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    LEP6 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
    LEP7 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP7.MarkerEdgeColor = 'black';
    else
        LEP7.MarkerEdgeColor = 'green';
    end

    set(LEP7, 'ButtonDownFcn', {@currentPoint7, LEP7});
elseif length(tempStorageArrayX1) == 8
    delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-7),tempStorageArrayY1(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-6),tempStorageArrayY1(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-5),tempStorageArrayY1(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    LEP6 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
    LEP7 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP7, 'ButtonDownFcn', {@currentPoint7, LEP7});
    LEP8 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP8.MarkerEdgeColor = 'black';
    else
        LEP8.MarkerEdgeColor = 'green';
    end

    set(LEP8, 'ButtonDownFcn', {@currentPoint8, LEP8});
elseif length(tempStorageArrayX1) == 9
    delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-8),tempStorageArrayY1(end-8),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-7),tempStorageArrayY1(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-6),tempStorageArrayY1(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-5),tempStorageArrayY1(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    LEP6 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
    LEP7 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP7, 'ButtonDownFcn', {@currentPoint7, LEP7});
    LEP8 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP8, 'ButtonDownFcn', {@currentPoint8, LEP8});
    LEP9 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
    'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP9.MarkerEdgeColor = 'black';
    else
        LEP9.MarkerEdgeColor = 'green';
    end

    set(LEP9, 'ButtonDownFcn', {@currentPoint9, LEP9});
elseif length(tempStorageArrayX1) == 10
    delete([LEP1,LEP2,LEP3,LEP4,LEP5,LEP6,LEP7,LEP8,LEP9,LEP10]);
    LEP1 = line(topViewAxes,tempStorageArrayX1(end-9),tempStorageArrayY1(end-9),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    LEP2 = line(topViewAxes,tempStorageArrayX1(end-8),tempStorageArrayY1(end-8),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    LEP3 = line(topViewAxes,tempStorageArrayX1(end-7),tempStorageArrayY1(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    LEP4 = line(topViewAxes,tempStorageArrayX1(end-6),tempStorageArrayY1(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    LEP5 = line(topViewAxes,tempStorageArrayX1(end-5),tempStorageArrayY1(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    LEP6 = line(topViewAxes,tempStorageArrayX1(end-4),tempStorageArrayY1(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
    LEP7 = line(topViewAxes,tempStorageArrayX1(end-3),tempStorageArrayY1(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP7, 'ButtonDownFcn', {@currentPoint7, LEP7});
    LEP8 = line(topViewAxes,tempStorageArrayX1(end-2),tempStorageArrayY1(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP8, 'ButtonDownFcn', {@currentPoint8, LEP8});
    LEP9 = line(topViewAxes,tempStorageArrayX1(end-1),tempStorageArrayY1(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(LEP9, 'ButtonDownFcn', {@currentPoint9, LEP9});
    LEP10 = line(topViewAxes,tempStorageArrayX1(end),tempStorageArrayY1(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        LEP10.MarkerEdgeColor = 'black';
    else
        LEP10.MarkerEdgeColor = 'green';
    end

    set(LEP10, 'ButtonDownFcn', {@currentPoint10, LEP10});
end

% Plots Points on trailing edge line
function TEPoints
global TEP1 TEP2 TEP3 TEP4 TEP5 TEP6 TEP7 TEP8 TEP9 TEP10 savePointSelected...
    tempStorageArrayX2 tempStorageArrayY2 topViewAxes

delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
if length(tempStorageArrayX2) == 1
    TEP1 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none');

    if savePointSelected == 1
        TEP1.MarkerEdgeColor = 'black';
    else
        TEP1.MarkerEdgeColor = 'green';
    end

    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
elseif length(tempStorageArrayX2) == 2
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none');

    if savePointSelected == 1
        TEP2.MarkerEdgeColor = 'black';
    else
        TEP2.MarkerEdgeColor = 'green';
    end

    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
elseif length(tempStorageArrayX2) == 3
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP3.MarkerEdgeColor = 'black';
    else
        TEP3.MarkerEdgeColor = 'green';
    end

    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
elseif length(tempStorageArrayX2) == 4
    delete([TEP1,TEP2,TEP3,TEP4]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP4.MarkerEdgeColor = 'black';
    else
        TEP4.MarkerEdgeColor = 'green';
    end

    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
elseif length(tempStorageArrayX2) == 5
    delete([TEP1,TEP2,TEP3,TEP4,TEP5]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP5.MarkerEdgeColor = 'black';
    else
        TEP5.MarkerEdgeColor = 'green';
    end

    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
elseif length(tempStorageArrayX2) == 6
    delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-5),tempStorageArrayY2(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    TEP6 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP6.MarkerEdgeColor = 'black';
    else
        TEP6.MarkerEdgeColor = 'green';
    end

    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
elseif length(tempStorageArrayX2) == 7
    delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-6),tempStorageArrayY2(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-5),tempStorageArrayY2(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    TEP6 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
    TEP7 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP7.MarkerEdgeColor = 'black';
    else
        TEP7.MarkerEdgeColor = 'green';
    end

    set(TEP7, 'ButtonDownFcn', {@currentPoint7, TEP7});
elseif length(tempStorageArrayX2) == 8
    delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-7),tempStorageArrayY2(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-6),tempStorageArrayY2(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-5),tempStorageArrayY2(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    TEP6 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
    TEP7 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP7, 'ButtonDownFcn', {@currentPoint7, TEP7});
    TEP8 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP8.MarkerEdgeColor = 'black';
    else
        TEP8.MarkerEdgeColor = 'green';
    end

    set(TEP8, 'ButtonDownFcn', {@currentPoint8, TEP8});
elseif length(tempStorageArrayX2) == 9
    delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-8),tempStorageArrayY2(end-8),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-7),tempStorageArrayY2(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-6),tempStorageArrayY2(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-5),tempStorageArrayY2(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    TEP6 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
    TEP7 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP7, 'ButtonDownFcn', {@currentPoint7, TEP7});
    TEP8 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP8, 'ButtonDownFcn', {@currentPoint8, TEP8});
    TEP9 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
    'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP9.MarkerEdgeColor = 'black';
    else
        TEP9.MarkerEdgeColor = 'green';
    end

    set(TEP9, 'ButtonDownFcn', {@currentPoint9, TEP9});
elseif length(tempStorageArrayX2) == 10
    delete([TEP1,TEP2,TEP3,TEP4,TEP5,TEP6,TEP7,TEP8,TEP9,TEP10]);
    TEP1 = line(topViewAxes,tempStorageArrayX2(end-9),tempStorageArrayY2(end-9),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    TEP2 = line(topViewAxes,tempStorageArrayX2(end-8),tempStorageArrayY2(end-8),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    TEP3 = line(topViewAxes,tempStorageArrayX2(end-7),tempStorageArrayY2(end-7),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    TEP4 = line(topViewAxes,tempStorageArrayX2(end-6),tempStorageArrayY2(end-6),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    TEP5 = line(topViewAxes,tempStorageArrayX2(end-5),tempStorageArrayY2(end-5),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    TEP6 = line(topViewAxes,tempStorageArrayX2(end-4),tempStorageArrayY2(end-4),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
    TEP7 = line(topViewAxes,tempStorageArrayX2(end-3),tempStorageArrayY2(end-3),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP7, 'ButtonDownFcn', {@currentPoint7, TEP7});
    TEP8 = line(topViewAxes,tempStorageArrayX2(end-2),tempStorageArrayY2(end-2),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP8, 'ButtonDownFcn', {@currentPoint8, TEP8});
    TEP9 = line(topViewAxes,tempStorageArrayX2(end-1),tempStorageArrayY2(end-1),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
    set(TEP9, 'ButtonDownFcn', {@currentPoint9, TEP9});
    TEP10 = line(topViewAxes,tempStorageArrayX2(end),tempStorageArrayY2(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');

    if savePointSelected == 1
        TEP10.MarkerEdgeColor = 'black';
    else
        TEP10.MarkerEdgeColor = 'green';
    end

    set(TEP10, 'ButtonDownFcn', {@currentPoint10, TEP10});
end

% Plots Points on upper surface wing line
function USPoints
global USP1 USP2 USP3 USP4 USP5 USP6 USP7 USP8 USP9 USP10 savePointSelected...
    tempStorageArrayZ3 tempStorageArrayY3 frontViewAxes

delete([USP1,USP2,USP3,USP4,USP5,USP6,USP7,USP8,USP9,USP10]);
if length(tempStorageArrayZ3) == 1
    USP1 = line(frontViewAxes,tempStorageArrayZ3(end),tempStorageArrayY3(end),...
        'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none');

    if savePointSelected == 1
        USP1.MarkerEdgeColor = 'black';
    else
        USP1.MarkerEdgeColor = 'green';
    end

    set(USP1, 'ButtonDownFcn', {@currentPoint1, USP1});
end

% Okay Pushbutton
function pushbutton_ok_Callback(~,~)
global H1 H2 H3 xLocationInc yLocationInc okButtonSelected savePointSelected...
   cancelButton

delete(H1);
delete(H2);
delete(H3);

% if isempty(xLocationInc) ~= 1 || isempty(yLocationInc) ~= 1
%     storageArrayFcn;
%     if storageArrayP1(end) == length(tempStorageArrayX)
%         
%     end
% end

overlay;

% Clear local variables xLocationInc and yLocationInc
xLocationInc = [];
yLocationInc = [];
okButtonSelected = 1;
savePointSelected = 0;

% Deactivate cancel pushbutton because point is locked in. Will have to use
% delete button if want to get rid of it
cancelButton.Enable = 'off';

% Wing Dimensions
function wingDimensionsMod
global tpArray c b Gam LamLE ARWing wingDimensionsPanel wingArea tp tipChord...
    rootChord

% % Root Chord
% cR = c;
% 
% % Tip Chord
% cT = c*tpArray(end);
tipChord = tp*rootChord;

% Wing Area
wingArea = (b/2)*c*(1+tp);

%% Textboxes---------------------------------------------------------------
% Root Chord
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',rootChord,'Position',[22 80 35 25],'Callback',@txtbox_rootChord_Callback);
% Tip Chord
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',tipChord,'Position',[120 80 35 25],'Callback',@txtbox_tipChord_Callback);
% Wing Span
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',b,'Position',[220 80 35 25],'Callback',@txtbox_span_Callback);
% Aspect Ratio
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',ARWing,'Position',[310 80 35 25],'Callback',@txtbox_AR_Callback);
% Wing Dihedral
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',Gam,'Position',[20 20 35 25],'Callback',@txtbox_dihedral_Callback);
% Wing Sweep
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',LamLE,'Position',[120 20 35 25],'Callback',@txtbox_sweep_Callback);
% Wing Taper
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',tp,'Position',[220 20 35 25],'Callback',@txtbox_taper_Callback); 
% Wing Area
uicontrol('Parent',wingDimensionsPanel','Style','edit','String',wingArea,'Position',[310 20 35 25],'Callback',@txtbox_wingArea_Callback); 

%% Callback specifying which point is most current-------------------------
function currentPoint1(~, ~, ~)
global pointSelected
pointSelected = 1;
editBox;

function currentPoint2(~, ~, ~)
global pointSelected
pointSelected = 2;
editBox;

function currentPoint3(~, ~, ~)
global pointSelected
pointSelected = 3;
editBox;

function currentPoint4(~, ~, ~)
global pointSelected
pointSelected = 4;
editBox;

function currentPoint5(~, ~, ~)
global pointSelected
pointSelected = 5;
editBox;

function currentPoint6(~, ~, ~)
global pointSelected
pointSelected = 6;
editBox

% Edit box specifying what type of modification is to be performed
function editBox
global editPanel editBoxSelected
% Figure

% editFigure = figure('Visible','on','Position',[500 600 130 70],...
%     'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
%     'Name','','Resize','off','Dockcontrols','off');
editBoxSelected = 1;

%Radiobuttons
uicontrol('Parent',editPanel,'Style','radiobutton','String','Edit','Fontsize',10,'Position',[10 40 50 25],'Callback',@radiobutton_edit_Callback);

uicontrol('Parent',editPanel,'Style','radiobutton','String','Delete','Fontsize',10,'Position',[10 15 60 25],'Callback',@radiobutton_delete_Callback);

% X-Coordinate Point Position
function txtbox_xLocationInc_Callback(hObject,~)
global xLocationInc c b
xLocationInc = str2double(get(hObject,'String'));
xLocationInc = xLocationInc + c/b;
pushbutton_up_Callback;

% Y-Coordinate Point Position
function txtbox_yLocationInc_Callback(hObject,~)
global yLocationInc c b
yLocationInc = str2double(get(hObject,'String'));
yLocationInc = yLocationInc - c/b;
pushbutton_left_Callback;

% Z-Coordinate Point Position
% function txtbox_zLocationInc_Callback(hObject,~)
% global zLocationInc c b
% zLocationInc = str2double(get(hObject,'String'));
% zLocationInc = zLocationInc - c/b;
% pushbutton_left_Callback;

% Callbacks to the edit box------------------------------------------------
function radiobutton_edit_Callback(~,~)
global editFigure pointSelected lineSelected
switch(pointSelected)
    case 1
        lineSelected = 1;
    case 2
        lineSelected = 2;
end
pointSelected = 0;
delete(editFigure);
pointCoordinates;

function radiobutton_delete_Callback(~,~)
global LP1 LP2 LP3 LP4 LP5 LP6 LP7 LP8 LP9 LP10 pointSelected storageArray1X...
    storageArray1Y xLocationInc yLocationInc XWRTMainC YWRTMainC storageArrayP1...
    wingOutline deletePointGo tempStorageArrayXSort tempStorageArrayYSort

deletePointGo = 1;
switch(pointSelected)
    case 1
        delete(LP1);
        delete(wingOutline);
        if isempty(storageArray1X) == 1 || isempty(storageArray1Y) == 1 
            % Need an index into the tempStorageArray for which point is
            % selected
            deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
            deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);
            
            XWRTMainC(deletePointXMainC) = [];
            YWRTMainC(deletePointYMainC) = [];
        else
            deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
            deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);
            
            deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
            deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);
            
            XWRTMainC(deletePointXMainC) = [];
            YWRTMainC(deletePointYMainC) = [];
            storageArray1X(deletePointXStorageX) = [];
            storageArray1Y(deletePointYStorageY) = [];
        end
        overlay;
    case 2
        delete(LP2);
        delete(wingOutline);

        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];

        overlay;
    case 3 
        delete(LP3);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 4
        delete(LP4);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 5
        delete(LP5);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 6
        delete(LP6);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 7
        delete(LP7);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 8
        delete(LP8);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 9
        delete(LP9);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
    case 10
        delete(LP10);
        delete(wingOutline);
        
        deletePointXMainC = XWRTMainC == tempStorageArrayXSort(pointSelected);
        deletePointYMainC = YWRTMainC == tempStorageArrayYSort(pointSelected);

        deletePointXStorageX = storageArray1X == tempStorageArrayXSort(pointSelected);
        deletePointYStorageY = storageArray1Y == tempStorageArrayYSort(pointSelected);

        XWRTMainC(deletePointXMainC) = [];
        YWRTMainC(deletePointYMainC) = [];
        storageArray1X(deletePointXStorageX) = [];
        storageArray1Y(deletePointYStorageY) = [];
        overlay;
end
% Clear local variables xLocationInc and yLocationInc
xLocationInc = [];
yLocationInc = [];
storageArrayP1(end) = [];

% Save Point Pushbutton
function pushbutton_savePoint_Callback(~,~)
global LEP1 LEP2 LEP3 LEP4 LEP5 LEP6 LEP7 LEP8 LEP9 LEP10 leftButton rightButton...
    upButton downButton storageArrayP1 savePointSelected okButton storageArrayP2...
    TEP1 TEP2 TEP3 TEP4 TEP5 TEP6 TEP7 TEP8 TEP9 TEP10 lineSelected L1 L2

delete([L1,L2]);

% Disable X-Y Coordinate Pushbuttons
leftButton.Enable  = 'off';
rightButton.Enable = 'off';
upButton.Enable    = 'off';
downButton.Enable  = 'off';

% Enable Ok Pushbutton
okButton.Enable = 'on';

% Turn off point hightlight
switch(lineSelected)
    case 1
        if isempty(storageArrayP1) ~= 1
            if storageArrayP1(end) == 1
                LEP1.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 2
                LEP2.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 3
                LEP3.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 4
                LEP4.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 5
                LEP5.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 6
                LEP6.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 7
                LEP7.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 8
                LEP8.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 9
                LEP9.MarkerEdgeColor = 'black';
            elseif storageArrayP1(end) == 10
                LEP10.MarkerEdgeColor = 'black';
            end
        end
    case 2
        if isempty(storageArrayP1) ~= 1
            if storageArrayP2(end) == 1
                TEP1.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 2
                TEP2.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 3
                TEP3.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 4
                TEP4.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 5
                TEP5.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 6
                TEP6.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 7
                TEP7.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 8
                TEP8.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 9
                TEP9.MarkerEdgeColor = 'black';
            elseif storageArrayP2(end) == 10
                TEP10.MarkerEdgeColor = 'black';
            end
        end
end

savePointSelected = 1;

% if isempty(storageArray1X) ~= 1 && tempStorageArrayXSort(1) == storageArray1X(end)
%     LP1.MarkerEdgeColor = 'black';
% else
%     LP1.MarkerEdgeColor = 'green';
% end



% LP1.MarkerEdgeColor = 'black';
% LP2.MarkerEdgeColor = 'black';

storageArrayFcn;

% Cancel Pushbutton
function pushbutton_cancel_Callback(~,~)
global boxFigure pointCoordinatesSelected lineSelected  LEP1 storageArray1X c b...
    storageArray1Y storageArray2X storageArray2Y xLocationInc yLocationInc...
    selectedCancel storageArrayP1 storageArrayP2 okButton wingPointsArray1...
    idx1 wingPointsArray2 idx2 TEP1 cancelButton tempStorageArrayX1

% Handle to indicate cancel pushbutton was selected
selectedCancel = 1;

switch(lineSelected)
    case 1
       if isempty(storageArray1X) ~= 1 && isempty(storageArray1Y) ~= 1
             storageArrayP1(end) = [];
%            xLocationInc = storageArray1X(end);
%            yLocationInc = storageArray1Y(end);
           
%            storageArray1X(end) = [];
%            storageArray1Y(end) = [];
%            storageArrayP1(end) = [];
       else
           xLocationInc = wingPointsArray1{idx1,1};
           yLocationInc = wingPointsArray1{idx1,2};
           storageArrayP1(end) = [];
       end
       
       xLocationInc = xLocationInc + c/b;
       pushbutton_up_Callback;
       pushbutton_savePoint_Callback;
       overlay;

       delete(LEP1);
       
    case 2
       if isempty(storageArray2X) ~= 1 && isempty(storageArray2Y) ~= 1
           xLocationInc = storageArray2X(end);
           yLocationInc = storageArray2Y(end);
           
           storageArray2X(end) = [];
           storageArray2Y(end) = [];
           storageArrayP2(end) = [];
       else
           xLocationInc = wingPointsArray2{idx2,1};
           yLocationInc = wingPointsArray2{idx2,2};
       end
       
       xLocationInc = xLocationInc + c/b;
       pushbutton_up_Callback;
       pushbutton_savePoint_Callback;
       overlay;

       delete(TEP1);
       
    case 3


end

delete(boxFigure);
pointCoordinatesSelected = 0;

% Enable Ok Pushbutton
okButton.Enable = 'on';
cancelButton.Enable = 'off';

% Reset Pushbutton
function pushbutton_reset_Callback(~,~)
global storageArray1X storageArray1Y xLocationInc yLocationInc storageArrayP1...
    XWRTMainC YWRTMainC okButtonSelected deletePointGo savePointSelected...
    storageArray2X storageArray2Y storageArrayP2 LEP1 xCoordsLE yCoordsLE...
    zCoordsLE xCoordsTE yCoordsTE zCoordsTE xCoords yCoords zCoords rootChordLineDone...
    XWRTMainTopView YWRTMainTopView ZWRTMainTopView xScaleFactor yScaleFactor...
    tempStorageArrayXSort1 tempStorageArrayYSort1 tempStorageArrayXSort2...
    tempStorageArrayYSort2 wpmActivated

    storageArray1X    = [];
    storageArray1Y    = [];
    storageArrayP1    = [];
    storageArray2X    = [];
    storageArray2Y    = [];
    storageArrayP2    = [];
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
    wpmActivated      = 0;
    
wingPlanformMod;

function pointCoordinates_closereq(~,~)
global LP1 LP2 LP3 LP4 LP5 LP6 LL1 LL2 LL3 LL4 LL5 LL6 pointCoordinatesSelected...
    lineSelected H1 H2 H3 H4 H5 H6 boxFigure choiceFigure editFigure editBoxSelected
switch(lineSelected)
    case 1
       delete(LP1);
       delete(LL1);
       delete(LP4); 
       delete(LL4);
       delete(H1);
    case 2
       delete(LP2); 
       delete(LL2);
       delete(LP3);
       delete(LL3);
       delete(H2);
    case 3
       delete(LP3);
       delete(LL3);
       delete(LP2); 
       delete(LL2);
       delete(H3);
    case 4
       delete(LP4); 
       delete(LL4);
       delete(LP1);
       delete(LL1);
       delete(H4);
    case 5
       delete(LP5);
       delete(LL5);
       delete(LP6);
       delete(LL6);
       delete(H5);
    case 6
       delete(LP6);
       delete(LL6);
       delete(LP5);
       delete(LL5);
       delete(H6);
end
pointCoordinatesSelected = 0;
delete(boxFigure);
delete(choiceFigure);
if editBoxSelected == 1
    delete(editFigure);
end

% Store point coordinates into an array to use to plot and calculate curved
% lines
function storageArrayFcn
global storageArray1X storageArray1Y storageArray2X xLocationInc yLocationInc...
    storageArrayP1 lineSelected storageArray2Y storageArrayP2 wingPointsArray1...
    wingPointsArray2 idx2 idx1 storageArrayX storageArrayY selectedCancel

switch(lineSelected)
    
    %% Leading Edge
    case 1 
        if isempty(xLocationInc) ~= 1 || isempty(yLocationInc) ~= 1
            if isempty(storageArrayP1) ~= 1 && storageArrayP1(end) > 1
                if xLocationInc ~= storageArray1X(end) || yLocationInc ~= storageArray1Y(end)
                    storageArray1X(end+1) = xLocationInc;
                    storageArray1Y(end+1) = yLocationInc;
                end
            elseif isempty(storageArrayP1) ~= 1 && storageArrayP1(end) == 1 && selectedCancel ~= 1
                storageArray1X(1) = xLocationInc;
                storageArray1Y(1) = yLocationInc;
            elseif selectedCancel == 1
                % do nothing and deactivate cancel button
                selectedCancel = 0;
            end
        else
            if isempty(storageArrayP1) ~= 1 && storageArrayP1(end) > 1
%                 if isempty(xLocationInc) ~= 1 && xLocationInc ~= storageArray1X(end) || yLocationInc ~= storageArray1Y(end)
                    storageArray1X(end+1) = cell2mat(wingPointsArray1(idx1,1));
                    storageArray1Y(end+1) = cell2mat(wingPointsArray1(idx1,2));
%                 end
            elseif isempty(storageArrayP1) ~= 1 && storageArrayP1(end) == 1
                storageArray1X(1) = cell2mat(wingPointsArray1(idx1,1));
                storageArray1Y(1) = cell2mat(wingPointsArray1(idx1,2));
            end
        end
        
    %% Trailing Edge
    case 2 
        if isempty(xLocationInc) ~= 1 || isempty(yLocationInc) ~= 1
            if isempty(storageArrayP2) ~= 1 && storageArrayP2(end) > 1
                if xLocationInc ~= storageArray2X(end) || yLocationInc ~= storageArray2Y(end)
                    storageArray2X(end+1) = xLocationInc;
                    storageArray2Y(end+1) = yLocationInc;
                end
            elseif isempty(storageArrayP2) ~= 1 && storageArrayP2(end) == 1
                storageArray2X(1) = xLocationInc;
                storageArray2Y(1) = yLocationInc;
            end
        else
            if isempty(storageArrayP2) ~= 1 && storageArrayP2(end) > 1
                if xLocationInc ~= storageArray2X(end) || yLocationInc ~= storageArray2Y(end)
                    storageArray2X(end+1) = cell2mat(wingPointsArray2(idx2,1));
                    storageArray2Y(end+1) = cell2mat(wingPointsArray2(idx2,2));
                end
            elseif isempty(storageArrayP2) ~= 1 && storageArrayP2(end) == 1
                storageArray2X(1) = cell2mat(wingPointsArray2(idx2,1));
                storageArray2Y(1) = cell2mat(wingPointsArray2(idx2,2));
            end
        end
        
    %% Upper Surface
    case 3
        % So jacked up, need a new storageArray variable like
        % storageArrayP3
        if isempty(xLocationInc) ~= 1 || isempty(yLocationInc) ~= 1
            if isempty(storageArrayP1) ~= 1 && storageArrayP2(end) > 1
                if xLocationInc ~= storageArray2X(end) || yLocationInc ~= storageArray2Y(end)
                    storageArray2X(end+1) = xLocationInc;
                    storageArray2Y(end+1) = yLocationInc;
                end
            elseif isempty(storageArrayP1) ~= 1 && storageArrayP2(end) == 1
                storageArray2X(1) = xLocationInc;
                storageArray2Y(1) = yLocationInc;
            end
        else
            if isempty(storageArrayP1) ~= 1 && storageArrayP2(end) > 1
                if xLocationInc ~= storageArray2X(end) || yLocationInc ~= storageArray2Y(end)
                    storageArray2X(end+1) = cell2mat(wingPointsArray2(idx2,1));
                    storageArray2Y(end+1) = cell2mat(wingPointsArray2(idx2,2));
                end
            elseif isempty(storageArrayP1) ~= 1 && storageArrayP2(end) == 1
                storageArray2X(1) = cell2mat(wingPointsArray2(idx2,1));
                storageArray2Y(1) = cell2mat(wingPointsArray2(idx2,2));
            end
        end
end

storageArrayX = [storageArray1X storageArray2X];
storageArrayY = [storageArray1Y storageArray2Y];
