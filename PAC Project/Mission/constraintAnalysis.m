function constraintAnalysis
% Written By Mark D. Miller Jr.
% 1/9/2020

% Performs a constraint analysis based on the mission requirements
% specified

global constraintAnalysisTab constraintAnalysisFig data initialWTO_S initialCLmaxTO...
    initialCLmaxL caActivated waitbarFig
delete(constraintAnalysisFig);
constraintAnalysisFig = axes('Parent',constraintAnalysisTab,'Position',[.08 .08 .89 .73]);

data = uipanel('Parent',constraintAnalysisTab,'Title','Data','Position',[.02 .83 .4 .15],'Fontsize',12);

sliders;
if isempty(initialWTO_S) ~= 1 && isempty(initialCLmaxTO) ~= 1 && isempty(initialCLmaxL) ~= 1
constraintAnalysisEquations;
designSpace;
end

delete(waitbarFig);

caActivated = 1;

% Create sliders to control CL's and WTO/S
function sliders
global sliderCLmaxTOname sliderCLmaxTOvalues sliderCLmaxTOslider sliderCLmaxLname...
    sliderCLmaxLvalues sliderCLmaxLslider sliderWTO_Sname sliderWTO_Svalues...
    sliderWTO_Sslider constraintAnalysisTab aircraftType
%% Fighter (Air-Air)
if aircraftType == 1
% Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.4  |  1.6  |  1.8  |  2.0  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_fighterAir_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[545 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |','Position',[540 615 250 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .2],'Position',[560 600 210 20],'Callback',@slider_fighterAir_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[415 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  50  |  60  |  70  |  80  |','Position',[360 670 150 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[365 650 140 20],'Callback',@slider_fighterAir_WTO_S_Callback);

%% Fighter (Multipurpose)
elseif aircraftType == 2
    % Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_fighterMulti_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[560 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |','Position',[540 615 250 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .2],'Position',[560 600 210 20],'Callback',@slider_fighterMulti_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  120  |  130  |  140  |  150  |','Position',[360 670 150 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[355 650 160 20],'Callback',@slider_fighterMulti_WTO_S_Callback);

%% Fighter (Air-Ground)
elseif aircraftType == 3
    % Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.4  |  1.6  |  1.8  |  2.0  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_fighterGround_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[560 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |','Position',[540 615 250 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .2],'Position',[560 600 210 20],'Callback',@slider_fighterGround_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  65  |  70  |  75  |  80  |  85  |  90  |','Position',[350 670 200 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .2],'Position',[352 650 195 20],'Callback',@slider_fighterGround_WTO_S_Callback);

%% Military Trainers
elseif aircraftType == 4
% Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.4  |  1.6  |  1.8  |  2.0  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_milTrainer_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[550 635 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |','Position',[575 620 200 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.35 .35],'Position',[600 600 150 20],'Callback',@slider_milTrainer_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  30  |  40  |  50  |  60  |','Position',[350 670 200 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.35 .35],'Position',[382 650 138 20],'Callback',@slider_milTrainer_WTO_S_Callback);

%% Military Bomber, & Transport
elseif aircraftType == 5 || aircraftType == 6
% Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_bomber_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[560 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |  2.8  |  3.0  |','Position',[540 615 280 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.17 .17],'Position',[560 600 240 20],'Callback',@slider_bomber_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  110  |  120  |  130  |  140  |  150  |','Position',[360 670 170 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.25 .3],'Position',[345 650 200 20],'Callback',@slider_bomber_WTO_S_Callback);

%% Passenger Jet
elseif aircraftType == 7
% Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_passenger_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[550 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |  2.8  |','Position',[550 615 250 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .22],'Position',[570 600 211 20],'Callback',@slider_passenger_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  110  |  120  |  130  |  140  |  150  |','Position',[360 670 170 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.25 .3],'Position',[345 650 200 20],'Callback',@slider_passenger_WTO_S_Callback);    
    
    
%% Business Jet    
elseif aircraftType == 8
% Takeoff CLmax Slider
delete(sliderCLmaxTOname);
delete(sliderCLmaxTOvalues);
delete(sliderCLmaxTOslider);
sliderCLmaxTOname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Takeoff Lift Coefficient','Position',[575 695 200 20],'Fontweight','bold');
sliderCLmaxTOvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |','Position',[610 680 130 20],'Fontweight','bold');
sliderCLmaxTOslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.335 .335],'Position',[600 660 150 20],'Callback',@slider_business_CLmaxTO_Callback);

% Landing CLmax Slider
delete(sliderCLmaxLname);
delete(sliderCLmaxLvalues);
delete(sliderCLmaxLslider);
sliderCLmaxLname   = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','Landing Lift Coefficient','Position',[550 630 250 20],'Fontweight','bold');
sliderCLmaxLvalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  1.6  |  1.8  |  2.0  |  2.2  |  2.4  |  2.6  |','Position',[540 615 250 20],'Fontweight','bold');
sliderCLmaxLslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.2 .22],'Position',[560 600 211 20],'Callback',@slider_business_CLmaxL_Callback);

% WTO/S Slider
delete(sliderWTO_Sname);
delete(sliderWTO_Svalues);
delete(sliderWTO_Sslider);
sliderWTO_Sname  = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','WTO/S','Position',[430 685 40 20],'Fontweight','bold');
sliderWTO_Svalues = uicontrol('Parent',constraintAnalysisTab,'Style','text','String','|  50  |  60  |  70  |  80  |  90  |','Position',[360 670 170 20],'Fontweight','bold');
sliderWTO_Sslider = uicontrol('Parent',constraintAnalysisTab,'Style','slider','Min',0,'Max',1,'SliderStep',[.25 .3],'Position',[362 650 167 20],'Callback',@slider_business_WTO_S_Callback);    
%%
end

% Slider callbacks for each type of aircraft
function slider_fighterAir_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO  data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialWTO_S = 50;
elseif sliderValue > .15 && sliderValue <= .335
    initialWTO_S = 60;
elseif sliderValue > .335 && sliderValue <= .67
    initialWTO_S = 70;
elseif sliderValue > .67 && sliderValue <= 1
    initialWTO_S = 80;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterAir_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.4;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.6;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 1.8;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.0;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.6;
    initialWTO_S  = 120;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterAir_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .17
    initialCLmaxL = 1.6;
elseif sliderValue >= .17 && sliderValue <= .34
    initialCLmaxL = 1.8;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.0;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.2;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.4;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 2.6;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialWTO_S   = 50;
end
constraintAnalysisEquations;
designSpace;

function slider_fighterMulti_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .25
    initialWTO_S = 120;
elseif sliderValue > .25 && sliderValue <= .5
    initialWTO_S = 130;
elseif sliderValue > .5 && sliderValue <= .75
    initialWTO_S = 140;
elseif sliderValue > .75 && sliderValue <= 1
    initialWTO_S = 150;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterMulti_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.6;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.8;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 2.0;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.2;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.6;
    initialWTO_S  = 120;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterMulti_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .17
    initialCLmaxL = 1.6;
elseif sliderValue >= .17 && sliderValue <= .34
    initialCLmaxL = 1.8;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.0;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.2;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.4;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 2.6;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialWTO_S   = 120;
end
constraintAnalysisEquations;
designSpace;

function slider_fighterGround_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .1
    initialWTO_S = 65;
elseif sliderValue > .1 && sliderValue <= .2
    initialWTO_S = 70;
elseif sliderValue > .2 && sliderValue <= .4
    initialWTO_S = 75;
elseif sliderValue > .4 && sliderValue <= .6
    initialWTO_S = 80;
elseif sliderValue > .6 && sliderValue <= .8
    initialWTO_S = 85;
elseif sliderValue > .8 && sliderValue <= 1
    initialWTO_S = 90;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterGround_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.4;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.6;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 1.8;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.0;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.6;
    initialWTO_S  = 65;
end
constraintAnalysisEquations;
designSpace;
function slider_fighterGround_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .17
    initialCLmaxL = 1.6;
elseif sliderValue >= .17 && sliderValue <= .34
    initialCLmaxL = 1.8;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.0;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.2;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.4;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 2.6;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialWTO_S   = 65;
end
constraintAnalysisEquations;
designSpace;

function slider_milTrainer_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .25
    initialWTO_S = 30;
elseif sliderValue > .25 && sliderValue <= .5
    initialWTO_S = 40;
elseif sliderValue > .5 && sliderValue <= .75
    initialWTO_S = 50;
elseif sliderValue > .75 && sliderValue <= 1
    initialWTO_S = 60;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
end
constraintAnalysisEquations;
designSpace;
function slider_milTrainer_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.4;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.6;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 1.8;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.0;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.6;
    initialWTO_S  = 30;
end
constraintAnalysisEquations;
designSpace;
function slider_milTrainer_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .17
    initialCLmaxL = 1.6;
elseif sliderValue >= .17 && sliderValue <= .34
    initialCLmaxL = 1.8;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.0;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.2;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.4;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 2.6;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.4;
    initialWTO_S   = 30;
end
constraintAnalysisEquations;
designSpace;

function slider_bomber_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .125
    initialWTO_S = 110;
elseif sliderValue > .125 && sliderValue <= .25
    initialWTO_S = 120;
elseif sliderValue > .25 && sliderValue <= .5
    initialWTO_S = 130;
elseif sliderValue > .5 && sliderValue <= .75
    initialWTO_S = 140;
elseif sliderValue > .75 && sliderValue <= 1
    initialWTO_S = 150;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.8;
end
constraintAnalysisEquations;
designSpace;
function slider_bomber_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.6;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.8;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 2.0;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.2;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.8;
    initialWTO_S  = 110;
end
constraintAnalysisEquations;
designSpace;
function slider_bomber_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .075
    initialCLmaxL = 1.8;
elseif sliderValue >= .075 && sliderValue <= .17
    initialCLmaxL = 2.0;
elseif sliderValue > .17 && sliderValue <= .34
    initialCLmaxL = 2.2;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.4;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.6;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.8;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 3.0;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialWTO_S   = 110;
end
constraintAnalysisEquations;
designSpace;

function slider_passenger_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .125
    initialWTO_S = 110;
elseif sliderValue > .125 && sliderValue <= .25
    initialWTO_S = 120;
elseif sliderValue > .25 && sliderValue <= .5
    initialWTO_S = 130;
elseif sliderValue > .5 && sliderValue <= .75
    initialWTO_S = 140;
elseif sliderValue > .75 && sliderValue <= 1
    initialWTO_S = 150;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.8;
end
constraintAnalysisEquations;
designSpace;
function slider_passenger_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.6;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.8;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 2.0;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.2;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.8;
    initialWTO_S  = 110;
end
constraintAnalysisEquations;
designSpace;
function slider_passenger_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .075
    initialCLmaxL = 1.8;
elseif sliderValue >= .075 && sliderValue <= .17
    initialCLmaxL = 2.0;
elseif sliderValue > .17 && sliderValue <= .34
    initialCLmaxL = 2.2;
elseif sliderValue > .34 && sliderValue <= .51
    initialCLmaxL = 2.4;
elseif sliderValue > .51 && sliderValue <= .68
    initialCLmaxL = 2.6;
elseif sliderValue > .68 && sliderValue <= .85
    initialCLmaxL = 2.8;
elseif sliderValue > .85 && sliderValue <= 1
    initialCLmaxL = 3.0;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialWTO_S   = 110;
end
constraintAnalysisEquations;
designSpace;

function slider_business_WTO_S_Callback(hObject,~,~)
global initialWTO_S initialCLmaxL dot initialCLmaxTO data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .125
    initialWTO_S = 50;
elseif sliderValue > .125 && sliderValue <= .25
    initialWTO_S = 60;
elseif sliderValue > .25 && sliderValue <= .5
    initialWTO_S = 70;
elseif sliderValue > .5 && sliderValue <= .75
    initialWTO_S = 80;
elseif sliderValue > .75 && sliderValue <= 1
    initialWTO_S = 90;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
end
constraintAnalysisEquations;
designSpace;
function slider_business_CLmaxTO_Callback(hObject,~,~)
global initialCLmaxTO dot initialCLmaxL initialWTO_S data
sliderValue = get(hObject,'Value');
if sliderValue >= 0 && sliderValue <= .15
    initialCLmaxTO = 1.6;
elseif sliderValue > .15 && sliderValue <= .34
    initialCLmaxTO = 1.8;
elseif sliderValue > .34 && sliderValue <= .67
    initialCLmaxTO = 2.0;
elseif sliderValue > .67 && sliderValue <= 1
    initialCLmaxTO = 2.2;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialCLmaxL) == 1 || isempty(initialWTO_S) == 1
    initialCLmaxL = 1.6;
    initialWTO_S  = 50;
end
constraintAnalysisEquations;
designSpace;
function slider_business_CLmaxL_Callback(hObject,~,~)
global initialCLmaxL initialWTO_S dot initialCLmaxTO data
sliderValue = get(hObject,'Value');

if sliderValue >= 0 && sliderValue <= .11
    initialCLmaxL = 1.6;
elseif sliderValue >= .11 && sliderValue <= .22
    initialCLmaxL = 1.8;
elseif sliderValue > .22 && sliderValue <= .44
    initialCLmaxL = 2.0;
elseif sliderValue > .44 && sliderValue <= .66
    initialCLmaxL = 2.2;
elseif sliderValue > .66 && sliderValue <= .88
    initialCLmaxL = 2.4;
elseif sliderValue > .88 && sliderValue <= 1
    initialCLmaxL = 2.6;
end
delete(dot);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','edit','String','','Position',[240 20 30 25],'Enable','off','Fontsize',10);
if isempty(initialWTO_S) == 1 || isempty(initialCLmaxTO) == 1
    initialCLmaxTO = 1.6;
    initialWTO_S   = 50;
end
constraintAnalysisEquations;
designSpace;

% Constraint Analysis Equations
function constraintAnalysisEquations
global thrustA_B cruiseMach rho_SL densityArray initialCD0estimate aircraftType...
    takeoffLength initialSFCDry tempArray initialARWing range cruiseVelocity...
    serviceCeiling WTO_S_Array WTO_S_LandingArray TSL_WTO_Takeoff TSL_WTO_Climb...
    TSL_WTO_Cruise TSL_WTO_LandingArray initialWTO_S initialCLmaxL initialCLmaxTO...
    waitbarFig

% Master Constraint Analysis Equation
% TSL/WTO =
% fuelFraction/thrustLapse*(q/fuelFraction*((CD0/(WTO/S))+K1*((n*fuelFraction)/q)^2*(WTO/S)))

% Thrust Lapse Ratio
alphaRatio = [0;0;0;0;0];

% Density at sea level
rho_SL = densityArray(1);
for i = 1:5
    if isempty(thrustA_B) == 1
        alphaRatio(i) = densityArray(i)/rho_SL;
    else
        alphaRatio(i) = (densityArray(i)/rho_SL)*(1+.7*cruiseMach);
    end
end

% Wing Loading
WTO_S_Array = linspace(5,initialWTO_S,round(initialWTO_S));

%% Fuel Fractions
    VTO               = zeros(size(WTO_S_Array));
    TSL_WTO_Takeoff   = zeros(size(WTO_S_Array));
    tTO               = zeros(size(WTO_S_Array));
    Wfuel_WTO_Takeoff = zeros(size(WTO_S_Array));
    betaFuelAccel     = zeros(size(WTO_S_Array));
    Wfuel_WTO_Accel       = zeros(size(WTO_S_Array));
    TSL_WTO_Accel         = zeros(size(WTO_S_Array));
    betaFuelClimb         = zeros(size(WTO_S_Array));
    TSL_WTO_Climb         = zeros(size(WTO_S_Array));
    Wfuel_WTO_Climb       = zeros(size(WTO_S_Array));
    TSL_WTO_Cruise        = zeros(size(WTO_S_Array));
    
    % Takeoff
%     h = waitbarMod(0,'Please wait...');
    for i = 1:length(WTO_S_Array)
        % Fuel fraction at takeoff
        betaFuelTakeoff = 1;

        % Takeoff Velocity
        VTO = 1.2*sqrt(((2)/(densityArray(1)*initialCLmaxTO))*initialWTO_S); %[ft/s]

        % Dynamic Pressure at takeoff
        takeoffDynamicPressure = .5*(densityArray(1))*(VTO)^2;
        
        % Acceleration due to gravity
        gc = 32.17; %[ft/s^2]
        
        % Friction of runway with brakes off
        groundFriction = .03; % for asphalt

        % Thrust Loading
        TSL_WTO_Takeoff(i) = -(209*WTO_S_Array(i))/(2*initialCLmaxTO*alphaRatio(1)*(348*sqrt(WTO_S_Array(i)/(initialCLmaxTO*alphaRatio(1)))-5*takeoffLength));

        % Time to takeoff
        tTO(i) = VTO / (gc*((TSL_WTO_Takeoff(i))-(takeoffDynamicPressure*(initialCD0estimate/(initialWTO_S)))-groundFriction));

        % Weight of fuel for takeoff
        Wfuel_WTO_Takeoff(i) = alphaRatio(1)*(TSL_WTO_Takeoff(i))*initialSFCDry*tTO(i)*(1/3600);
        Wfuel_WTO_TakeoffMean    = mean(Wfuel_WTO_Takeoff);
        
%         waitbarMod(i/length(WTO_S_Array),h);
        clc;
    end
    delete(waitbarFig);
    % Acceleration
    for i = 1:length(WTO_S_Array)
        % Fuel fraction while accelerating
        betaFuelAccel  = betaFuelTakeoff - Wfuel_WTO_TakeoffMean;

        % Velocity while accelerating
        averageVelocity = (cruiseVelocity + VTO)/2;
        
        % Dynamic Pressure at acceleration
        accelDynamicPressure = .5*(densityArray(1))*(averageVelocity)^2;
        
        % Time to accelerate
        tAccel = (cruiseVelocity - VTO)/accelDynamicPressure;
        
        % Oswald's efficiency factor
        if aircraftType == 1 || aircraftType == 2 || aircraftType == 3 || aircraftType == 4
            % Assuming a wing sweep of 30 degrees
            e = 4.61*(1-.045*initialARWing^.68)*(cosd(30))^.15-3.1;
        elseif aircraftType == 5 || aircraftType == 6 || aircraftType == 7 || aircraftType == 8
            % Assuming a straight wing or less than 30 degrees of sweep
            e = 1.78*(1-.045*initialARWing^.68)-.64;
        end
        
        % G-loading
        n = 1;
        
        % Drag due to lift factor
        K = 1/(pi*e*initialARWing);
        
        % Thrust Loading
        TSL_WTO_Accel(i) = betaFuelAccel/alphaRatio(2)*((accelDynamicPressure/betaFuelAccel)*((initialCD0estimate/WTO_S_Array(i))+K*((n*betaFuelAccel)/accelDynamicPressure)^2*(WTO_S_Array(i))));
        
        TSL_WTO_Accel = (accelDynamicPressure/n)*sqrt(initialCD0estimate/K);
        
        % Weight of fuel for acceleration
        Wfuel_WTO_Accel = TSL_WTO_Accel*initialSFCDry*tAccel*(1/3600);
%         Wfuel_WTO_AccelMean = mean(Wfuel_WTO_Accel);
    end
    % Climb
    for i = 1:length(WTO_S_Array)
        % Fuel fraction while climbing
        betaFuelClimb  = betaFuelAccel - Wfuel_WTO_Accel;
        
        % Ratio of specific heats for air
        gamma = 1.4;
        
        % Specific Gas Constant for air
        R = 53.34; %[(ft*lbf)/(lbm*R)]

        % Acceleration due to gravity
        gc = 32.17; %[ft*lbm/s^2*lbf]
        
        % Speed of sound while climbing
        climbSpeedOfSound = sqrt(gc*gamma*R*tempArray(3));
        
        % Freestream velocity while climbing due to change in altitude
        climbVfree = cruiseMach*climbSpeedOfSound;
        
        % SFC while climbing
        climbSFCDry = initialSFCDry*(alphaRatio(3)/alphaRatio(1));
        
        % Dynamic pressure while climg
        climbDynamicPressure = .5*densityArray(3)*climbVfree^2;
        
        % Thrust Loading
        TSL_WTO_Climb(i) = (betaFuelClimb/alphaRatio(3))*(climbDynamicPressure/...
            betaFuelClimb)*((initialCD0estimate/WTO_S_Array(i))+K*((n*betaFuelClimb)/climbDynamicPressure)^2*(WTO_S_Array(i)));

        % Climbing Velocity
        Vclimb = climbVfree*(((alphaRatio(3)/betaFuelClimb)*TSL_WTO_Climb(1))-...
            ((climbDynamicPressure/betaFuelClimb)*(initialCD0estimate/initialWTO_S))-((n^2*betaFuelClimb)/climbDynamicPressure)*K*initialWTO_S);
        
        % Time to climb
        tClimb = (serviceCeiling - 0)/Vclimb;
        
        % Weight of fuel for climbing
        Wfuel_WTO_Climb = alphaRatio(3)*TSL_WTO_Climb(1)*climbSFCDry*tClimb*(1/3600);
    end
    % Cruise
    for i = 1:length(WTO_S_Array)
        % Fuel fraction during cruise
        betaFuelCruise = betaFuelClimb - Wfuel_WTO_Climb;
        
        % Speed of sound while cruising
        cruiseSpeedOfSound = sqrt(gc*gamma*R*tempArray(4));
        
        % Freesstream velocity while cruising
        cruiseVfree = cruiseMach*cruiseSpeedOfSound;
        
        % SFC while cruising
        cruiseSFCDry = initialSFCDry*(alphaRatio(4)/alphaRatio(1));
        
        % Dynamic pressure while cruising
        cruiseDynamicPressure = .5*densityArray(4)*cruiseVfree^2;
        
        TSL_WTO_Cruise(i) = (betaFuelCruise/alphaRatio(4))*(cruiseDynamicPressure/...
            betaFuelCruise)*((initialCD0estimate/WTO_S_Array(i))+K*((n*betaFuelCruise)/cruiseDynamicPressure)^2*(WTO_S_Array(i)));
        
        % Lift coefficient while cruising
        cruiseCL = ((n*betaFuelCruise)/cruiseDynamicPressure)*initialWTO_S;
        
        % Drag coefficient while cruising
        cruiseCD = initialCD0estimate + K*cruiseCL^2;
        
        % Time while cruising
        tCruise = range/cruiseVfree;
        
        % Weight of fuel for cruising
        Wfuel_WTO_Cruise = betaFuelCruise*(1-exp(-((cruiseSFCDry*tCruise)/(cruiseCL/cruiseCD))));
    end
 
    % Landing
       % Wing loading at landing
       WTO_S_Landing = initialWTO_S/(alphaRatio(1)*initialCLmaxL);

       % Approach Angle
       approachAngle = 3; %[deg] approximately
        
       % Landing Distance
       landingDistance = 79.4*(initialWTO_S/(alphaRatio(1)*initialCLmaxL))+(50/tand(approachAngle));
       
       WTO_S_LandingArray = [WTO_S_Landing WTO_S_Landing];
       
       % Set top of landing line to whichever max is greater climb or
       % cruise
       if max(TSL_WTO_Climb) > max(TSL_WTO_Cruise)
            TSL_WTO_LandingArray = [0 max(TSL_WTO_Climb)];
       else
            TSL_WTO_LandingArray = [0 max(TSL_WTO_Cruise)];
       end

% Design Space Figure
function designSpace
global WTO_S_Array WTO_S_LandingArray TSL_WTO_Takeoff TSL_WTO_Climb TSL_WTO_Cruise...
    TSL_WTO_LandingArray constraintAnalysisFig takeoffLine climbLine cruiseLine...
    landingLine designSpaceFig initialWTO_S

     delete(takeoffLine);
     delete(climbLine);
     delete(cruiseLine);
     delete(landingLine);
     delete(designSpaceFig);
     legend('hide');
     
     % Initialize design space x-axis array
     designSpaceX = zeros(1,length(WTO_S_Array)*2);
     % Constrain design space to between the landing and either the climb
     % or cruise or takeoff lines whichever is greater
     i = 1;
     if WTO_S_Array(i) < max(WTO_S_Array)
         for i = 1:length(WTO_S_Array)
             designSpaceX(i) = WTO_S_Array(i)+0;
             if WTO_S_Array(i) > max(WTO_S_LandingArray)
                 designSpaceX(i) = max(WTO_S_LandingArray)-0;
             end
             if designSpaceX(i) > max(WTO_S_LandingArray)-0
                 designSpaceX(i) = max(WTO_S_LandingArray)-0;
             end
         end
     end
     if WTO_S_Array(i) == max(WTO_S_Array)
         j = i+1;
         for i = abs(-length(WTO_S_Array):-1)
             designSpaceX(j) = WTO_S_Array(i)-0;
             if WTO_S_Array(i) > max(WTO_S_LandingArray)
                 designSpaceX(j) = max(WTO_S_LandingArray)-0;
             end
             if designSpaceX(j) < WTO_S_Array(1)+0
                 designSpaceX(j) = WTO_S_Array(1)+0;
             end
             j = j + 1;
         end
     end
%      if designSpaceX(end) > WTO_S_Array(1) || designSpaceX(end) < WTO_S_Array(1)+0
%             designSpaceX(end) = WTO_S_Array(1)+0;
%      end
     % Initialize design space y-axis array
     designSpaceY = zeros(1,length(WTO_S_Array)*2);

     for i = 1:length(WTO_S_Array)
         if TSL_WTO_Climb(i) > TSL_WTO_Cruise(i) && TSL_WTO_Climb(i) > TSL_WTO_Takeoff(i)
             designSpaceY(i) = TSL_WTO_Climb(i)+0;

             % If next increment is past the landing line, set all
             % subsequent values to the last value
             if WTO_S_Array(i) > WTO_S_LandingArray(1)
                 designSpaceY(i) = designSpaceY(i-1);
                 designSpaceY(i) = TSL_WTO_Climb(i);
             end
         elseif TSL_WTO_Cruise(i) > TSL_WTO_Climb(i) && TSL_WTO_Cruise(i) > TSL_WTO_Takeoff(i)
             designSpaceY(i) = TSL_WTO_Cruise(i)+0;
             % If next increment is past the landing line, set all
             % subsequent values to the last value
             if WTO_S_Array(i) > WTO_S_LandingArray(1)
                 designSpaceY(i) = designSpaceY(i-1);
                 designSpaceY(i) = TSL_WTO_Cruise(i);
             end
         elseif TSL_WTO_Takeoff(i) > TSL_WTO_Cruise(i) && TSL_WTO_Takeoff(i) > TSL_WTO_Climb(i)
             designSpaceY(i) = TSL_WTO_Takeoff(i-1)+0;
             designSpaceY(i) = TSL_WTO_Takeoff(i);
         end
             % If next increment is past the landing line, set all
             % subsequent values to the last value
             if i > 1
                 if WTO_S_Array(i-1) > WTO_S_LandingArray(1)
                     designSpaceY(i) = designSpaceY(i-1);
                 end
             end
     end
     j = i + 1;
     for i = 1:length(WTO_S_Array)
         if max(TSL_WTO_Climb) > max(TSL_WTO_Cruise) && max(TSL_WTO_Climb) > max(TSL_WTO_Takeoff)
            designSpaceY(j) = max(TSL_WTO_Climb);
         elseif max(TSL_WTO_Cruise) > max(TSL_WTO_Climb) && max(TSL_WTO_Cruise) > max(TSL_WTO_Takeoff)
             designSpaceY(j) = max(TSL_WTO_Cruise);
         elseif max(TSL_WTO_Takeoff) > max(TSL_WTO_Climb) && max(TSL_WTO_Takeoff) > max(TSL_WTO_Cruise)
             designSpaceY(j) = max(TSL_WTO_Takeoff);
         end
         j = j + 1;
     end

     % Initialize design space z-axis array
     designSpaceZ = zeros(1,length(WTO_S_Array)*2);
     
    % Draw the takeoff line
    takeoffLine = line(constraintAnalysisFig,WTO_S_Array,TSL_WTO_Takeoff,'linewidth',4,'color','blue');
    % Draw the climb line
    climbLine = line(constraintAnalysisFig,WTO_S_Array,TSL_WTO_Climb,'linewidth',4,'color','red');
    % Draw the cruise line
    cruiseLine = line(constraintAnalysisFig,WTO_S_Array,TSL_WTO_Cruise,'linewidth',4,'color','black');
    % Draw the landing line
    landingLine = line(constraintAnalysisFig,WTO_S_LandingArray,TSL_WTO_LandingArray,'linewidth',4,'color','#4DBEEE');
    
    hold on
    
    % Draw the design space
    designSpaceFig = fill3(constraintAnalysisFig,designSpaceX,designSpaceY,designSpaceZ,[.85 .85 .85]);
    % Set a button down function to the design space so the user can
    % select the appropriate W/S and T/W
    set(designSpaceFig, 'ButtonDownFcn', {@selectedDesignSpace, designSpaceFig})
    
    % Add in labels, legend, and a grid
    xlabel('W_T_O/S','fontsize',12,'fontweight','bold');
    ylabel('T_S_L/W_T_O','fontsize',12,'fontweight','bold');
    legend(constraintAnalysisFig,'Takeoff','Climb','Cruise','Landing','Design Space','Location','northeast');
    xlim([0 initialWTO_S+10]);
    ylim([0 designSpaceY(end)+.1]);
    grid on

function selectedDesignSpace(~,~,designSpaceFig)
global combinedWindowsFig dot xclick yclick wpActivated
    %since this is a figure callback, the first input is the figure handle:
f=combinedWindowsFig;
obj=hittest(f);
 
if obj==designSpaceFig %if over the plot...
    %get cursor coordinates in its axes:
    a=get(designSpaceFig,'parent');
    point=get(a,'currentpoint');
    xclick=point(1,1,1);
    yclick=point(1,2,1);

    delete(dot);
    dot = line(xclick,yclick,'marker','o','markersize',9,'markerfacecolor',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','none');
end
legend('Takeoff','Climb','Cruise','Landing','Design Space','Design Point','Location','northeast');
selectedDataPoint;
wpActivated = 1;

% Displays selected thrust and wing loading
function selectedDataPoint
global xclick yclick data WTO_S TSL_WTO enpActivated

WTO_S   = xclick;
TSL_WTO = yclick;

% Takeoff Wing Loading
uicontrol('Parent',data,'Style','text','String','Takeoff Wing Loading (WTO/S):','Position',[20 50 230 25],'Fontsize',10,'Fontweight','bold');
uicontrol('Parent',data,'Style','edit','String',WTO_S,'Position',[240 55 30 25],'Enable','off','Fontsize',10);
uicontrol('Parent',data,'Style','text','String','lb/ft^2','Position',[275 50 40 25],'Fontsize',9);

% Thrust Loading
uicontrol('Parent',data,'Style','text','String','Takeoff Thrust Loading (TSL/WTO):','Position',[10 15 230 25],'Fontsize',10,'Fontweight','bold');
uicontrol('Parent',data,'Style','edit','String',TSL_WTO,'Position',[240 20 30 25],'Enable','off','Fontsize',10);

% Load Engine Parameters since now have thrust loading estimate
enpActivated = 0;
