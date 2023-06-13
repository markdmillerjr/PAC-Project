function pointCoordinates
% Written by Mark D. Miller Jr.
% 12/12/19

global boxFigure leftButton rightButton lineSelected wingPointsArray1 wingPointsArray2...
    wingPointsArray3 wingPointsArray4 wingPointsArray5 wingPointsArray6...
    idx1 idx2 idx3 idx4 idx5 idx6 xLocation yLocation upButton downButton

% Didn't like the standard matlab input box so I decided to make my own.
delete(boxFigure)
% Figure
boxFigure = figure('Visible','on','Position',[500 600 270 110],...
    'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
    'Name','Point Coordinates','Resize','off','Dockcontrols','off','CloseRequestFcn',@pointCoordinates_closereq);

% X Coordinate
uicontrol('Parent',boxFigure,'Style','text','String','X-Coordinate','Position',[20 80 100 25]);
% Y Coordinate
uicontrol('Parent',boxFigure,'Style','text','String','Y-Coordinate','Position',[100 80 100 25]);

% Display point coordinates based on which line is selected
switch(lineSelected)
    case 1
        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,2);
        yLocation1 = wingPointsArray1(idx1,1);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation1,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation1,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation1;
        yLocation = yLocation1;
    case 2
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation2,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation2,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation2;
        yLocation = yLocation2;
    case 3
        % Need to find point coordinates
        xLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation3,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation3,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation3;
        yLocation = yLocation3;
    case 4
        % Need to find point coordinates
        xLocation4 = wingPointsArray4(idx4,1);
        yLocation4 = wingPointsArray4(idx4,2);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation4,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation4,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation4;
        yLocation = yLocation4;
    case 5
        % Need to find point coordinates
        xLocation5 = wingPointsArray5(idx5,1);
        yLocation5 = wingPointsArray5(idx5,2);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation5,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation5,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation5;
        yLocation = yLocation5;
    case 6
        % Need to find point coordinates
        xLocation6 = wingPointsArray6(idx6,1);
        yLocation6 = wingPointsArray6(idx6,2);
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation6,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation6,'Position',[125 60 50 25],'Enable','off');
        xLocation = xLocation6;
        yLocation = yLocation6;
end

% Y Coordinate Pushbuttons
leftButton  = uicontrol('Parent',boxFigure,'Style','pushbutton','String','<','Fontsize',12,'Fontweight','bold','Position',[190 60 30 25],'Callback',@pushbutton_left_Callback);

rightButton = uicontrol('Parent',boxFigure,'Style','pushbutton','String','>','Fontsize',12,'Fontweight','bold','Position',[220 60 30 25],'Callback',@pushbutton_right_Callback);

% Ok Pushbutton
uicontrol('Parent',boxFigure,'Style','pushbutton','String','OK','Position',[80 20 50 25],'Callback',@pushbutton_ok_Callback);

% Cancel Pushbutton
uicontrol('Parent',boxFigure,'Style','pushbutton','String','Cancel','Position',[135 20 50 25],'Callback',@pushbutton_cancel_Callback);

% Y Coordinate Pushbuttons
function pushbutton_left_Callback(~,~)
global wingPointsArray1 ax  LL1 LP1 boxFigure wingPointsArray2...
    wingPointsArray3 wingPointsArray4 LP2 LP3 LP4 lineSelected LL2 LL3 LL4...
    idx1 idx2 idx3 idx4 idx5 idx6 wingPointsArray5 wingPointsArray6 LP5 LL5...
    LP6 LL6 xLocation yLocation

switch(lineSelected)
    case 1
        % Find which point is selected and grab that position
        for i = 1:length(idx1)
            if idx1(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx1)
            dotPosition = length(idx1);
        end
        idx1(i) = 0;
        idx1(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,1);
        yLocation1 = wingPointsArray1(idx1,2);

        delete(LL1);
        delete(LP1);
        LP1 = line(ax,wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation1,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation1,'Position',[125 60 50 25],'Enable','off');
        set(LP1, 'ButtonDownFcn', {@currentPoint1, LP1});
        xLocation = xLocation1;
        yLocation = yLocation1;
%----------------
        % Find which point selected and grab that position
        for i = 1:length(idx4)
            if idx4(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx4)
            dotPosition = length(idx4);
        end
        idx4(i) = 0;
        idx4(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation4 = wingPointsArray4(idx4,1);
        yLocation4 = wingPointsArray4(idx4,2);

        delete(LL4);
        delete(LP4);
        LP4 = line(ax,wingPointsArray4{idx4,1},wingPointsArray4{idx4,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation4,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation4,'Position',[125 60 50 25],'Enable','off');
        set(LP4, 'ButtonDownFcn', {@currentPoint4, LP4});
    case 2
        % Find which point selected and grab that position
        for i = 1:length(idx2)
            if idx2(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx2)
            dotPosition = length(idx2);
        end
        idx2(i) = 0;
        idx2(dotPosition) = 1;   
        
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);

        delete(LL2);
        delete(LP2);
        LP2 = line(ax,wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation2,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation2,'Position',[125 60 50 25],'Enable','off');
        set(LP2, 'ButtonDownFcn', {@currentPoint2, LP2});
        xLocation = xLocation2;
        yLocation = yLocation2;
%----------------
        % Find which point selected and grab that position
        for i = 1:length(idx3)
            if idx3(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx3)
            dotPosition = length(idx3);
        end
        idx3(i) = 0;
        idx3(dotPosition) = 1;
 
        % Need to find point coordinates
        xLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);

        delete(LL3);
        delete(LP3);
        LP3 = line(ax,wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation3,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation3,'Position',[125 60 50 25],'Enable','off');
        set(LP3, 'ButtonDownFcn', {@currentPoint3, LP3});
    case 3
        % Find which point selected and grab that position
        for i = 1:length(idx3)
            if idx3(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx3)
            dotPosition = length(idx3);
        end
        idx3(i) = 0;
        idx3(dotPosition) = 1;
 
        % Need to find point coordinates
        xLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);

        delete(LL3);
        delete(LP3);
        LP3 = line(ax,wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation3,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation3,'Position',[125 60 50 25],'Enable','off');
        set(LP3, 'ButtonDownFcn', {@currentPoint3, LP3});
        xLocation = xLocation3;
        yLocation = yLocation3;
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx2)
            if idx2(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx2)
            dotPosition = length(idx2);
        end
        idx2(i) = 0;
        idx2(dotPosition) = 1;   
        
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);

        delete(LL2);
        delete(LP2);
        LP2 = line(ax,wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation2,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation2,'Position',[125 60 50 25],'Enable','off');
        set(LP2, 'ButtonDownFcn', {@currentPoint2, LP2});
    case 4
        % Find which point selected and grab that position
        for i = 1:length(idx4)
            if idx4(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx4)
            dotPosition = length(idx4);
        end
        idx4(i) = 0;
        idx4(dotPosition) = 1;
  
        % Need to find point coordinates
        xLocation4 = wingPointsArray4(idx4,1);
        yLocation4 = wingPointsArray4(idx4,2);

        delete(LL4);
        delete(LP4);
        LP4 = line(ax,wingPointsArray4{idx4,1},wingPointsArray4{idx4,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation4,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation4,'Position',[125 60 50 25],'Enable','off');
        set(LP4, 'ButtonDownFcn', {@currentPoint4, LP4});
        xLocation = xLocation4;
        yLocation = yLocation4;
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx1)
            if idx1(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx1)
            dotPosition = length(idx1);
        end
        idx1(i) = 0;
        idx1(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,1);
        yLocation1 = wingPointsArray1(idx1,2);

        delete(LL1);
        delete(LP1);
        LP1 = line(ax,wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation1,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation1,'Position',[125 60 50 25],'Enable','off');
        set(LP1, 'ButtonDownFcn', {@currentPoint1, LP1});
    case 5
        % Find which point selected and grab that position
        for i = 1:length(idx5)
            if idx5(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx5)
            dotPosition = length(idx5);
        end
        idx5(i) = 0;
        idx5(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation5 = wingPointsArray5(idx5,1);
        yLocation5 = wingPointsArray5(idx5,2);

        delete(LL5);
        delete(LP5);
        LP5 = line(ax,wingPointsArray5{idx5,1},wingPointsArray5{idx5,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation5,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation5,'Position',[125 60 50 25],'Enable','off');
        set(LP5, 'ButtonDownFcn', {@currentPoint5, LP5});
        xLocation = xLocation5;
        yLocation = yLocation5;
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx6)
            if idx6(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx6)
            dotPosition = length(idx6);
        end
        idx6(i) = 0;
        idx6(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation6 = wingPointsArray6(idx6,1);
        yLocation6 = wingPointsArray6(idx6,2);

        delete(LL6);
        delete(LP6);
        LP6 = line(ax,wingPointsArray6{idx6,1},wingPointsArray6{idx6,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation6,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation6,'Position',[125 60 50 25],'Enable','off');
        set(LP6, 'ButtonDownFcn', {@currentPoint6, LP6});
    case 6
        % Find which point selected and grab that position
        for i = 1:length(idx6)
            if idx6(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx6)
            dotPosition = length(idx6);
        end
        idx6(i) = 0;
        idx6(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation6 = wingPointsArray6(idx6,1);
        yLocation6 = wingPointsArray6(idx6,2);

        delete(LL6);
        delete(LP6);
        LP6 = line(ax,xLocation6,yLocation6,'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation6,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation6,'Position',[125 60 50 25],'Enable','off');
        set(LP6, 'ButtonDownFcn', {@currentPoint6, LP6});
        xLocation = xLocation6;
        yLocation = yLocation6;
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx5)
            if idx5(i) == 1
                break
            end
        end

        % Increment point position to new position
        dotPosition = i + 1;
        if dotPosition > length(idx5)
            dotPosition = length(idx5);
        end
        idx5(i) = 0;
        idx5(dotPosition) = 1;    

        % Need to find point coordinates
        xLocation5 = wingPointsArray5(idx5,1);
        yLocation5 = wingPointsArray5(idx5,2);

        delete(LL5);
        delete(LP5);
        LP5 = line(ax,wingPointsArray5{idx5,1},wingPointsArray5{idx5,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation5,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation5,'Position',[125 60 50 25],'Enable','off');
        set(LP5, 'ButtonDownFcn', {@currentPoint5, LP5});
end

function pushbutton_right_Callback(~,~)
global wingPointsArray1 ax LL1 LP1 boxFigure LL2 LL3 LL4 LP2 LP3 LP4...
    wingPointsArray2 wingPointsArray3 wingPointsArray4 lineSelected...
    idx1 idx2 idx3 idx4 idx5 idx6 wingPointsArray5 wingPointsArray6 LP5 LL5...
    LP6 LL6

switch(lineSelected)
    case 1
        % Find which point selected and grab that position
        for i = 1:length(idx1)
            if idx1(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx1(i) = 0;
        idx1(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,1);
        yLocation1 = wingPointsArray1(idx1,2);

        delete(LL1);
        delete(LP1);
        LP1 = line(ax,wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation1,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation1,'Position',[125 60 50 25],'Enable','off');
        set(LP1, 'ButtonDownFcn', {@currentPoint1, LP1});
%----------------            
        % Find which point selected and grab that position
        for i = 1:length(idx4)
            if idx4(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx4(i) = 0;
        idx4(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation4 = wingPointsArray4(idx4,1);
        yLocation4 = wingPointsArray4(idx4,2);

        delete(LL4);
        delete(LP4);
        LP4 = line(ax,wingPointsArray4{idx4,1},wingPointsArray4{idx4,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation4,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation4,'Position',[125 60 50 25],'Enable','off');
        set(LP4, 'ButtonDownFcn', {@currentPoint4, LP4});
    case 2
        % Find which point selected and grab that position
        for i = 1:length(idx2)
            if idx2(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx2(i) = 0;
        idx2(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);

        delete(LL2);
        delete(LP2);
        LP2 = line(ax,wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation2,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation2,'Position',[125 60 50 25],'Enable','off');
        set(LP2, 'ButtonDownFcn', {@currentPoint2, LP2});

%----------------            
        % Find which point selected and grab that position
        for i = 1:length(idx3)
            if idx3(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx3(i) = 0;
        idx3(dotPosition) = 1;
 
        % Need to find point coordinates
        xLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);

        delete(LL3);
        delete(LP3);
        LP3 = line(ax,wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation3,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation3,'Position',[125 60 50 25],'Enable','off');
        set(LP3, 'ButtonDownFcn', {@currentPoint3, LP3});
    case 3
        % Find which point selected and grab that position
        for i = 1:length(idx3)
            if idx3(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx3(i) = 0;
        idx3(dotPosition) = 1;
 
        % Need to find point coordinates
        xLocation3 = wingPointsArray3(idx3,1);
        yLocation3 = wingPointsArray3(idx3,2);

        delete(LL3);
        delete(LP3);
        LP3 = line(ax,wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation3,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation3,'Position',[125 60 50 25],'Enable','off');
        set(LP3, 'ButtonDownFcn', {@currentPoint3, LP3});
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx2)
            if idx2(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx2(i) = 0;
        idx2(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation2 = wingPointsArray2(idx2,1);
        yLocation2 = wingPointsArray2(idx2,2);

        delete(LL2);
        delete(LP2);
        LP2 = line(ax,wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation2,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation2,'Position',[125 60 50 25],'Enable','off');
        set(LP2, 'ButtonDownFcn', {@currentPoint2, LP2});
    case 4
        % Find which point selected and grab that position
        for i = 1:length(idx4)
            if idx4(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx4(i) = 0;
        idx4(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation4 = wingPointsArray4(idx4,1);
        yLocation4 = wingPointsArray4(idx4,2);

        delete(LL4);
        delete(LP4);
        LP4 = line(ax,wingPointsArray4{idx4,1},wingPointsArray4{idx4,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation4,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation4,'Position',[125 60 50 25],'Enable','off');
        set(LP4, 'ButtonDownFcn', {@currentPoint4, LP4});
%----------------        
        % Find which point selected and grab that position
        for i = 1:length(idx1)
            if idx1(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx1(i) = 0;
        idx1(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation1 = wingPointsArray1(idx1,1);
        yLocation1 = wingPointsArray1(idx1,2);

        delete(LL1);
        delete(LP1);
        LP1 = line(ax,wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation1,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation1,'Position',[125 60 50 25],'Enable','off');
        set(LP1, 'ButtonDownFcn', {@currentPoint1, LP1});
    case 5
        % Find which point selected and grab that position
        for i = 1:length(idx5)
            if idx5(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx5(i) = 0;
        idx5(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation5 = wingPointsArray5(idx5,1);
        yLocation5 = wingPointsArray5(idx5,2);

        delete(LL5);
        delete(LP5);
        LP5 = line(ax,wingPointsArray5{idx5,1},wingPointsArray5{idx5,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation5,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation5,'Position',[125 60 50 25],'Enable','off');
        set(LP5, 'ButtonDownFcn', {@currentPoint5, LP5});
%----------------     
        % Find which point selected and grab that position
        for i = 1:length(idx6)
            if idx6(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx6(i) = 0;
        idx6(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation6 = wingPointsArray6(idx6,1);
        yLocation6 = wingPointsArray6(idx6,2);

        delete(LL6);
        delete(LP6);
        LP6 = line(ax,wingPointsArray6{idx6,1},wingPointsArray6{idx6,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation6,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation6,'Position',[125 60 50 25],'Enable','off');
        set(LP6, 'ButtonDownFcn', {@currentPoint6, LP6});
    case 6
        % Find which point selected and grab that position
        for i = 1:length(idx6)
            if idx6(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx6(i) = 0;
        idx6(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation6 = wingPointsArray6(idx6,1);
        yLocation6 = wingPointsArray6(idx6,2);

        delete(LL6);
        delete(LP6);
        LP6 = line(ax,wingPointsArray6{idx6,1},wingPointsArray6{idx6,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation6,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation6,'Position',[125 60 50 25],'Enable','off');
        set(LP6, 'ButtonDownFcn', {@currentPoint6, LP6});
%---------------- 
        % Find which point selected and grab that position
        for i = 1:length(idx5)
            if idx5(i) == 1
                break
            end
        end
        
        % Increment point position to new position
        dotPosition = i - 1;

        if dotPosition < 1
            dotPosition = 1;
        end
        idx5(i) = 0;
        idx5(dotPosition) = 1;
        
        % Need to find point coordinates
        xLocation5 = wingPointsArray5(idx5,1);
        yLocation5 = wingPointsArray5(idx5,2);

        delete(LL5);
        delete(LP5);
        LP5 = line(ax,wingPointsArray5{idx5,1},wingPointsArray5{idx5,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
        uicontrol('Parent',boxFigure,'Style','edit','String',xLocation5,'Position',[45 60 50 25],'Enable','off');
        uicontrol('Parent',boxFigure,'Style','edit','String',yLocation5,'Position',[125 60 50 25],'Enable','off');
        set(LP5, 'ButtonDownFcn', {@currentPoint5, LP5});
end

% Okay Pushbutton
function pushbutton_ok_Callback(~,~)
global pointCoordinatesSelected boxFigure H1 H2 H3 H4 H5 H6...
    firstLineSelected secondPointSelected secondLineFigure firstPointSelected...   

delete(H1);
delete(H2);
delete(H3);
delete(H4);
delete(H5);
delete(H6);
delete(boxFigure);
pointCoordinatesSelected = 0;
firstLineSelected = 1;
secondLine;
if firstPointSelected == 1
    storageArrayFcn;
elseif secondPointSelected == 1
    storageArrayFcn
end
if secondPointSelected == 1
delete(secondLineFigure);
addChamferOrFillet;
end

function secondLine
global secondLineFigure secondLineSelected

secondLineFigure = figure('Visible','on','Position',[500 600 130 70],...
    'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
    'Name','','Resize','off','Dockcontrols','off');

uicontrol('Parent',secondLineFigure,'Style','text','String','Select second Line','Position',[0 10 130 25],'fontsize',10);
secondLineSelected = 1;

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
global editFigure editBoxSelected
% Figure
editFigure = figure('Visible','on','Position',[500 600 130 70],...
    'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
    'Name','','Resize','off','Dockcontrols','off','CloseRequestFcn',@pointCoordinates_closereq);
editBoxSelected = 1;

%Radiobuttons
uicontrol('Parent',editFigure,'Style','radiobutton','String','Edit','Fontsize',10,'Position',[40 40 100 25],'Callback',@radiobutton_edit_Callback);

uicontrol('Parent',editFigure,'Style','radiobutton','String','Delete','Fontsize',10,'Position',[40 15 100 25],'Callback',@radiobutton_delete_Callback);

% Callbacks to the edit box------------------------------------------------
function radiobutton_edit_Callback(~,~)
global editFigure pointSelected lineSelected
switch(pointSelected)
    case 1
        lineSelected = 1;
    case 2
        lineSelected = 2;
    case 3
        lineSelected = 3;
    case 4
        lineSelected = 4;
    case 5
        lineSelected = 5;
    case 6
        lineSelected = 6;
end
delete(editFigure);
pointCoordinates;

function radiobutton_delete_Callback(~,~)
global LP1 LP2 LP3 LP4 LP5 LP6 pointSelected editFigure
switch(pointSelected)
    case 1
        delete(LP1);
        delete(LP4);
    case 2
        delete(LP2);
        delete(LP3);
    case 3 
        delete(LP3);
        delete(LP2);
    case 4
        delete(LP4);
        delete(LP1);
    case 5
        delete(LP5);
        delete(LP6);
    case 6
        delete(LP6);
        delete(LP5);
end
delete(editFigure);
%--------------------------------------------------------------------------

% Cancel Pushbutton
function pushbutton_cancel_Callback(~,~)
global boxFigure pointCoordinatesSelected LP1 LP2 LP3 LP4 LP5 LP6 LL1 LL2 LL3...
    LL4 LL5 LL6 lineSelected H1 H2 H3 H4 H5 H6

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

delete(boxFigure);
pointCoordinatesSelected = 0;

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
global storageArrayX storageArrayY xLocation yLocation firstPointSelected...
    secondPointSelected
% Holds 1st and 2nd point coordinates
if firstPointSelected == 1
    storageArrayX(1) = cell2mat(xLocation);
    storageArrayY(1) = cell2mat(yLocation);
elseif secondPointSelected == 1
    storageArrayX(2) = cell2mat(xLocation);
    storageArrayY(2) = cell2mat(yLocation);
end













