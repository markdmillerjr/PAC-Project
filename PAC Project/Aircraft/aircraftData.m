function aircraftData
% % Data Analysis Code
% % Analysis of aircraft designed in MPAC
% % Written by Mark D. Miller Jr.
% % 5/9/17-
% % Major modification made in 1/19-2/19
% %------------------------------------------------------------------------

global combinedWindowsFig tab1 tab2 tab3 tab4 tab5 wingAeroPanel horzAeroPanel...
    vertAeroPanel type aircraftAeroPanel wingDimensionsPanel horzDimensionsPanel...
    vertDimensionsPanel fuseDimensionsPanel weightPanel missionPanel...
    enginePanel aeroPlotsPanel compiledAircraft flapDimensionsPanel...
    elevatorDimensionsPanel rudderDimensionsPanel takeoffDistancePanel...
    landingDistancePanel pSPlotsPanel tAtRPlotsPanel performanceDataPanel...
    aircraftCGPanel hLdSelection wingTopViewPanel horzTailTopViewPanel...
    vertTailSideViewPanel fuelTankPosition aircraftDataTab masterFile...
    aircraftParametersTab

% if isempty(type) == 1
%   errordlg('Please specify the type of engine','Invalid Input','modal');
%   uicontrol(hObject);
%   return;
% end

if compiledAircraft ~= 1
  errordlg('Please design an aircraft according to the steps outlined on the start screen','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

%% Data
% Tabs
tabgp = uitabgroup('Parent',aircraftParametersTab,'Position',[.01 .01 .98 .99]);
tab1 = uitab(tabgp,'Title','Dimensions');
tab2 = uitab(tabgp,'Title','Flaps and Control Surfaces');
tab3 = uitab(tabgp,'Title','Aerodynamics');
tab4 = uitab(tabgp,'Title','Weight and Balance');
tab5 = uitab(tabgp,'Title','Performance');
tab6 = uitab(tabgp,'Title','Stability and Control');
tab7 = uitab(tabgp,'Title','Requirements Verification');

% Panels
    % Tab1 - Dimensions
wingDimensionsPanel = uipanel('Parent',tab1,'Title','Wing Dimensions','FontSize',11,'Position',[.01 .75 .2 .25]);
horzDimensionsPanel = uipanel('Parent',tab1,'Title','Horizontal Tail Dimensions','FontSize',11,'Position',[.22 .75 .25 .25]);
vertDimensionsPanel = uipanel('Parent',tab1,'Title','Vertical Tail Dimensions','FontSize',11,'Position',[.48 .75 .25 .25]);
fuseDimensionsPanel = uipanel('Parent',tab1,'Title','Fuselage Dimensions','FontSize',11,'Position',[.74 .75 .25 .25]);
weightPanel = uipanel('Parent',tab1,'Title','Aircraft Weight','FontSize',12,'Position',[.01 .62 .31 .13]);
missionPanel = uipanel('Parent',tab1,'Title','Mission Requirements','FontSize',12,'Position',[.33 .62 .6 .13]);
enginePanel = uipanel('Parent',tab1,'Title','Engine Specifications','FontSize',12,'Position',[.4 .46 .48 .16]);

    % Tab2 - High Lift Devices
flapDimensionsPanel     = uipanel('Parent',tab2,'Title','Flap and Aileron Dimensions','Fontsize',12,'Position',[.01 .5 .98 .5]);
elevatorDimensionsPanel = uipanel('Parent',tab2,'Title','Elevator Dimensions','Fontsize',12,'Position',[.01 .01 .5 .49]);
rudderDimensionsPanel   = uipanel('Parent',tab2,'Title','Rudder Dimensions','Fontsize',12,'Position',[.52 .01 .47 .49]);
wingTopViewPanel        = uipanel('Parent',flapDimensionsPanel,'Title','Wing Top View','Fontsize',12,'Position',[.01 .2 .98 .6]);
horzTailTopViewPanel    = uipanel('Parent',elevatorDimensionsPanel,'Title','Horizontal Tail Top View','Fontsize',12,'Position',[.01 .2 .98 .6]);
vertTailSideViewPanel   = uipanel('Parent',rudderDimensionsPanel,'Title','Vertical Tail Side View','Fontsize',12,'Position',[.01 .2 .98 .6]);

    % Tab3 - Aerodynamics
wingAeroPanel = uipanel('Parent',tab3,'Title','Wing Data','FontSize',12,'Position',[.01 .75 .32 .25]);
horzAeroPanel = uipanel('Parent',tab3,'Title','Horizontal Tail Data','FontSize',12,'Position',[.34 .75 .32 .25]);
vertAeroPanel = uipanel('Parent',tab3,'Title','Vertical Tail Data','FontSize',12,'Position',[.67 .75 .32 .25]);
aircraftAeroPanel = uipanel('Parent',tab3,'Title','Aircraft Data','Fontsize',12,'Position',[.01 .5 .32 .25]);
aeroPlotsPanel    = uipanel('Parent',tab3,'Title','Plots','Fontsize',12,'Position',[.34 .05 .65 .7]);

    % Tab4 - Weight and Balance
fuelTankPosition = uipanel('Parent',tab4,'Title','Fuel Tank Positions','Fontsize',12,'Position',[.15 .01 .8 .9]);
% aircraftCGPanel     = uipanel('Parent',tab4,'Title','Aircraft CG','Fontsize',12,'Position',[.01 .5 .98 .5]);
    
    % Tab5 - Performance
takeoffDistancePanel  = uipanel('Parent',tab5,'Title','Takeoff Distance','Fontsize',12,'Position',[.01 .9 .98 .1]);
landingDistancePanel  = uipanel('Parent',tab5,'Title','Landing Distance','Fontsize',12,'Position',[.01 .8 .98 .1]);
performanceDataPanel  = uipanel('Parent',tab5,'Title','Performance Data','Fontsize',12,'Position',[.01 .47 .98 .33]);
pSPlotsPanel = uipanel('Parent',tab5,'Title','Specific Excess Power','Fontsize',12,'Position',[.01 .01 .48 .4]);
tAtRPlotsPanel = uipanel('Parent',tab5,'Title','Thrust Available vs. Thrust Required','Fontsize',12,'Position',[.51 .01 .48 .4]);

    % Tab6 - Stability and Control
    
% Revert file access to master file
cd(masterFile);

% Access Empennage folder
cd('Data');

% Run Data Programs
dataDimensions;
wingAeroData;
horizontalTailAeroData;
verticalTailAeroData;
aircraftAeroData;
aircraftDrawing;
wingAnalysis;
highLiftDevices;
aircraftFeature;
plotAeroData;
horizontalTailAnalysis;
verticalTailAnalysis;
aircraftAnalysis;
dataPerformanceAnalysis;
% dataWeightandBalanceAnalysis;

hLdSelection = 0;

%% Wing Aerodynamic Data
function wingAeroData
global wingAeroPanel

% Airfoil Data
uicontrol('Parent',wingAeroPanel,'Style','text','String','2-D:','Position',[12 105 45 25],'Fontsize',9);
% 3-D
uicontrol('Parent',wingAeroPanel,'Style','text','String','3-D:','Position',[125 105 45 25],'Fontsize',9);
% Airfoil name
uicontrol('Parent',wingAeroPanel,'Style','text','String','Airfoil:','Position',[55 125 45 25],'Fontsize',9);
% Airfoil Data
    % Cla
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_l_a:','Position',[10 85 60 25]);
    % Alpha(L=0)
uicontrol('Parent',wingAeroPanel,'Style','text','String','Alpha(l=0):','Position',[10 65 60 25]);
    % Clmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_l_max:','Position',[10 45 60 25]);
    % Cdmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_d_min:','Position',[10 25 60 25]);
    % Cmo 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_m_o','Position',[10 5 60 25]);

% Wing Data
    % CLa 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_L_a:','Position',[125 88 68 25],'Fontsize',9);
    % Alpha(L=0)
uicontrol('Parent',wingAeroPanel,'Style','text','String','Alpha(L=max):','Position',[110 68 75 25],'Fontsize',9);
    % Clmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_L_max:','Position',[125 48 60 25],'Fontsize',9);
    % Cdmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_D_min:','Position',[125 28 60 25],'Fontsize',9);
    % Cmo 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_M_o','Position',[125 8 60 25],'Fontsize',9);

%% Horizontal Tail Aerodynamic Data
function horizontalTailAeroData
global horzAeroPanel

% 2-D
uicontrol('Parent',horzAeroPanel,'Style','text','String','2-D:','Position',[12 105 45 25],'Fontsize',9);
% 3-D
uicontrol('Parent',horzAeroPanel,'Style','text','String','3-D:','Position',[125 105 45 25],'Fontsize',9);
% Airfoil name
uicontrol('Parent',horzAeroPanel,'Style','text','String','Airfoil:','Position',[60 125 45 25],'Fontsize',9);
% Airfoil Data
    % Cla
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_l_a:','Position',[10 85 60 25]);
    % Alpha(L=0)
uicontrol('Parent',horzAeroPanel,'Style','text','String','Alpha(l=0):','Position',[10 65 60 25]);
    % Clmax 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_l_max:','Position',[10 45 60 25]);
    % Cdmax 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_d_min:','Position',[10 25 60 25]);
    % Cmo 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_m_o','Position',[10 5 60 25]);

% Wing Data
    % CLa 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_L_a:','Position',[125 88 68 25],'Fontsize',9);
    % Alpha(L=0)
uicontrol('Parent',horzAeroPanel,'Style','text','String','Alpha(L=max):','Position',[110 68 75 25],'Fontsize',9);
    % Clmax 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_L_max:','Position',[125 48 60 25],'Fontsize',9);
    % Cdmax 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_D_min:','Position',[125 28 60 25],'Fontsize',9);
    % Cmo 
uicontrol('Parent',horzAeroPanel,'Style','text','String','C_M_o','Position',[125 8 60 25],'Fontsize',9);

%% Vertical Tail Aerodynamic Data
function verticalTailAeroData
global vertAeroPanel

% 2-D
uicontrol('Parent',vertAeroPanel,'Style','text','String','2-D:','Position',[12 105 45 25],'Fontsize',9);
% 3-D
uicontrol('Parent',vertAeroPanel,'Style','text','String','3-D:','Position',[125 105 45 25],'Fontsize',9);
% Airfoil name
uicontrol('Parent',vertAeroPanel,'Style','text','String','Airfoil:','Position',[60 125 45 25],'Fontsize',9);
% Airfoil Data
    % Cla
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_l_a:','Position',[10 85 60 25]);
    % Alpha(L=0)
uicontrol('Parent',vertAeroPanel,'Style','text','String','Alpha(l=0):','Position',[10 65 60 25]);
    % Clmax 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_l_max:','Position',[10 45 60 25]);
    % Cdmax 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_d_min:','Position',[10 25 60 25]);
    % Cmo 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_m_o','Position',[10 5 60 25]);

% Wing Data
    % CLa 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_L_a:','Position',[125 88 68 25],'Fontsize',9);
    % Alpha(L=0)
uicontrol('Parent',vertAeroPanel,'Style','text','String','Alpha(L=max):','Position',[110 68 75 25],'Fontsize',9);
    % Clmax 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_L_max:','Position',[125 48 60 25],'Fontsize',9);
    % Cdmax 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_D_min:','Position',[125 28 60 25],'Fontsize',9);
    % Cmo 
uicontrol('Parent',vertAeroPanel,'Style','text','String','C_M_o','Position',[125 8 60 25],'Fontsize',9);

%% Aircraft Aerodynamic Data
function aircraftAeroData
global aircraftAeroPanel

    % CLa
uicontrol('Parent',aircraftAeroPanel,'Style','text','String','C_L_a:','Position',[10 125 68 25],'Fontsize',9);
    % CD
uicontrol('Parent',aircraftAeroPanel,'Style','text','String','C_D_0:','Position',[10 105 68 25],'Fontsize',9);
    % Lift
uicontrol('Parent',aircraftAeroPanel,'Style','text','String','Lift:','Position',[10 85 68 25],'Fontsize',9);

%% Aircraft 3 View Drawing
function aircraftDrawing
% Aircraft 3 View Drawing
aircraft3View;

%% Analyze Aerodynamics----------------------------------------------------
% Analyzes airfoil/wing aerodynamics
function wingAnalysis
global Cla_wing_str aL_0_wing_str Clmax_wing_str Cdmin_wing_str Cmo_wing_str wingAirfoilFile ...
    CLa_wing_str CLmax_wing_str CDmin_wing_str CMo_wing_str wingAeroPanel alphaCLmax_wing_str
dataWingAnalysis;

% Airfoil file
uicontrol('Parent',wingAeroPanel,'Style','text','String',wingAirfoilFile,'Position',[95 138 150 15],'Fontsize',9);
% 2-D
    % Cla value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',Cla_wing_str,'Position',[60 90 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',aL_0_wing_str,'Position',[75 65 25 25]);
    % Clmax value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',Clmax_wing_str,'Position',[60 45 45 25]);
    % Cdmax value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',Cdmin_wing_str,'Position',[60 25 60 25]);
    % Cm value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',Cmo_wing_str,'Position',[60 5 60 25]);
% 3-D
    % Cla value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',CLa_wing_str,'Position',[180 93 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',alphaCLmax_wing_str,'Position',[185 65 45 25]);
    % Clmax value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',CLmax_wing_str,'Position',[190 45 35 25]);
    % Cdmax value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',CDmin_wing_str,'Position',[180 25 50 25]);
    % Cm value
    uicontrol('Parent',wingAeroPanel,'Style','text','String',CMo_wing_str,'Position',[176 5 60 25]);
     
% Analyzes horizontal tail aerodynamics
function horizontalTailAnalysis
global Cla_horz_str aL_0_horz_str Clmax_horz_str Cdmin_horz_str Cmo_horz_str horzAirfoilFile...
    CLa_horz_str CLmax_horz_str CDmin_horz_str CMo_horz_str horzAeroPanel alphaCLmax_horz_str
dataHorzAnalysis;

% Airfoil file
uicontrol('Parent',horzAeroPanel,'Style','text','String',horzAirfoilFile,'Position',[95 138 150 15],'Fontsize',9);
% 2-D
    % Cla value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',Cla_horz_str,'Position',[60 90 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',aL_0_horz_str,'Position',[60 65 45 25]);
    % Clmax value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',Clmax_horz_str,'Position',[60 45 45 25]);
    % Cdmax value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',Cdmin_horz_str,'Position',[60 25 60 25]);
    % Cm value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',Cmo_horz_str,'Position',[60 5 60 25]);
% 3-D
    % Cla value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',CLa_horz_str,'Position',[180 93 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',alphaCLmax_horz_str,'Position',[185 65 45 25]);
    % Clmax value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',CLmax_horz_str,'Position',[180 45 45 25]);
    % Cdmax value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',CDmin_horz_str,'Position',[180 25 50 25]);
    % Cm value
    uicontrol('Parent',horzAeroPanel,'Style','text','String',CMo_horz_str,'Position',[176 5 60 25]);

% Analyzes vertical tail aerodynamics
function verticalTailAnalysis   
global Cla_vert_str aL_0_vert_str Clmax_vert_str Cdmin_vert_str Cmo_vert_str vertAirfoilFile...
    CLa_vert_str CLmax_vert_str CDmin_vert_str CMo_vert_str vertAeroPanel alphaCLmax_vert_str
dataVertAnalysis;

% Airfoil file
uicontrol('Parent',vertAeroPanel,'Style','text','String',vertAirfoilFile,'Position',[95 138 150 15],'Fontsize',9);
% 2-D
    % Cla value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',Cla_vert_str,'Position',[60 90 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',aL_0_vert_str,'Position',[60 65 45 25]);
    % Clmax value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',Clmax_vert_str,'Position',[60 45 45 25]);
    % Cdmax value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',Cdmin_vert_str,'Position',[60 25 60 25]);
    % Cm value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',Cmo_vert_str,'Position',[60 5 60 25]);
% 3-D
    % Cla value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',CLa_vert_str,'Position',[180 93 45 20]);
    % Alpha(L=0) value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',alphaCLmax_vert_str,'Position',[185 65 45 25]);
    % Clmax value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',CLmax_vert_str,'Position',[180 45 45 25]);
    % Cdmax value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',CDmin_vert_str,'Position',[180 25 50 25]);
    % Cm value
    uicontrol('Parent',vertAeroPanel,'Style','text','String',CMo_vert_str,'Position',[180 5 60 25]);
 
% Analyzes aircraft aerodynamics-------------------------------------------
function aircraftAnalysis
global aircraftAeroPanel CLaAircraft_str CD0Aircraft_str CDAircraft_str LiftAircraft_str
dataAircraftAnalysis;

% CLa
%     uicontrol('Parent',aircraftAero,'Style','text','String',CLaAircraft_str,'Position',[80 125 60 25]);
% CD
    uicontrol('Parent',aircraftAeroPanel,'Style','text','String',CD0Aircraft_str,'Position',[65 103 60 25]); 
% Lift
    uicontrol('Parent',aircraftAeroPanel,'Style','text','String',LiftAircraft_str,'Position',[65 83 60 25]);
   
% Popupmenu for wing, horizontal tail, vertical tail, and aircraft
% aero plots   
function aircraftFeature
global tab3
uicontrol('Parent',tab3,'Style','popupmenu','String',{'Select','Wing','Horizontal Tail',...
    'Vertical Tail','Aircraft'},'Position',[10 330 90 25],'Callback',@popupmenu_aircraftFeature_Callback);

% Selects aero plot associated with wing, horizontal tail, vertical tail or
% full aircraft
function popupmenu_aircraftFeature_Callback(source,~)
global airfoilFile wingAirfoilFile horzAirfoilFile vertAirfoilFile selectPlot...
    aircraftFeature highLiftdevicesSelected

    str = source.String;
    val = source.Value;
switch str{val}
    case 'Wing'
        aircraftFeature = 0;
        airfoilFile = wingAirfoilFile;
        if selectPlot == 1
            radio_plotCla_Callback;
        elseif selectPlot == 2
            radio_plotCdCl_Callback;
        elseif selectPlot == 3
            radio_plotCmac_Callback;
        elseif selectPlot == 4
            pushbutton_plotHighLiftDevices_Callback;
        end
    case 'Horizontal Tail'
        aircraftFeature = 1;
        airfoilFile = horzAirfoilFile;
        if selectPlot == 1
            radio_plotCla_Callback;
        elseif selectPlot == 2
            radio_plotCdCl_Callback;
        elseif selectPlot == 3
            radio_plotCmac_Callback;
        elseif selectPlot == 4
            pushbutton_plotHighLiftDevices_Callback;
        end
    case 'Vertical Tail'
        aircraftFeature = 2;
        airfoilFile = vertAirfoilFile;
        if selectPlot == 1
            radio_plotCla_Callback;
        elseif selectPlot == 2
            radio_plotCdCl_Callback;
        elseif selectPlot == 3
            radio_plotCmac_Callback;
        elseif selectPlot == 4
            pushbutton_plotHighLiftDevices_Callback;
        end
    case 'Aircraft'
        aircraftFeature = 3;
        if selectPlot == 1
            radio_plotCla_Callback;
        elseif selectPlot == 2
            radio_plotCdCl_Callback;
        elseif selectPlot == 3
            radio_plotCmac_Callback;
        elseif selectPlot == 4
            pushbutton_plotHighLiftDevices_Callback;
        end
end
    
% Radiobuttons and pushbutton for Cl_alpha, Cl_Cd Cmac_Cl, and flap Data  

function plotAeroData
global tab3

% Cl vs. alpha Button
uicontrol('Parent',tab3,'Style','radiobutton','String','Cl vs. alpha','Position',[10 310 100 25],'Callback',@radio_plotCla_Callback);

% Cd vs. Cl Button
uicontrol('Parent',tab3,'Style','radiobutton','String','Cd vs. Cl','Position',[10 290 100 25],'Callback',@radio_plotCdCl_Callback);
    
% Cma.c. vs. Cl Button
uicontrol('Parent',tab3,'Style','radiobutton','String','Cmac vs. Cl','Position',[10 270 100 25],'Callback',@radio_plotCmac_Callback);

% High Lift Devices Button
uicontrol('Parent',tab3,'Style','pushbutton','String','High Lift Devices','Position',[10 240 100 25],'Callback',@pushbutton_plotHighLiftDevices_Callback);

% CL_alpha Data
function radio_plotCla_Callback(~,~)
global alphaArray_airfoil ClaArray_airfoil aeroPlotsPanel Cla_plot CdCl_plot tab3...
    Cmac_plot selectPlot alphaArray_wing_linear alphaArray_wing_nonlinear1...
    alphaArray_wing_nonlinear2 ClaArray_wing_linear ClaArray_wing_nonlinear1...
    ClaArray_wing_nonlinear2 alphaArray_horz_linear ClaArray_horz_linear...
    alphaArray_horz_nonlinear1 ClaArray_horz_nonlinear1 alphaArray_horz_nonlinear2...
    ClaArray_horz_nonlinear2 ClaArray_vert_linear alphaArray_vert_linear...
    ClaArray_vert_nonlinear1 alphaArray_vert_nonlinear1 ClaArray_vert_nonlinear2...
    alphaArray_vert_nonlinear2 aircraftFeature AR_highWing AR_lowWing...
    AR_highHorz AR_lowHorz AR_highVert AR_lowVert hLdSelection Cla_Flaps_plot

airfoilPlots;
delete(Cla_plot);
delete(CdCl_plot);
delete(Cmac_plot);
delete(Cla_Flaps_plot);
Cla_plot = axes('Parent',aeroPlotsPanel,'Position',[.12 .1 .82 .86]);

% Wing
if aircraftFeature == 0
line(Cla_plot,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
line(Cla_plot,alphaArray_wing_linear,ClaArray_wing_linear,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear2,'linewidth',2,'color','r');
hLdSelection = 0;

if AR_highWing == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

elseif AR_lowWing == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

end

% Horizontal Tail
elseif aircraftFeature == 1
line(Cla_plot,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
line(Cla_plot,alphaArray_horz_linear,ClaArray_horz_linear,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_horz_nonlinear1,ClaArray_horz_nonlinear1,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_horz_nonlinear2,ClaArray_horz_nonlinear2,'linewidth',2,'color','r');
hLdSelection = 0;

if AR_highHorz == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

elseif AR_lowHorz == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

end

% Vertical Tail
elseif aircraftFeature == 2
line(Cla_plot,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
line(Cla_plot,alphaArray_vert_linear,ClaArray_vert_linear,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_vert_nonlinear1,ClaArray_vert_nonlinear1,'linewidth',2,'color','r');
line(Cla_plot,alphaArray_vert_nonlinear2,ClaArray_vert_nonlinear2,'linewidth',2,'color','r');
hLdSelection = 0;

if AR_highVert == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

elseif AR_lowVert == 1
    
xlim([-15 50]);
ylim([0 2]);
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

end
elseif aircraftFeature == 3
    
xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
ylabel('C_L','fontsize',12,'fontweight','bold');
legend('Airfoil','Wing');

end

grid on
grid minor

% Lets the popupmenu know which plot is selected
selectPlot = 1;
uicontrol('Parent',tab3,'Style','radiobutton','String','Cd vs. Cl','Position',[10 290 100 25],'Callback',@radio_plotCdCl_Callback);
uicontrol('Parent',tab3,'Style','radiobutton','String','Cmac vs. Cl','Position',[10 270 100 25],'Callback',@radio_plotCmac_Callback);

% CD_Cl Data
function radio_plotCdCl_Callback(~,~)
global ClCdArray_airfoil CdClArray_airfoil CdCl_plot Cla_plot aeroPlotsPanel tab3...
    Cmac_plot selectPlot Cla_Flaps_plot

airfoilPlots;
delete(CdCl_plot);
delete(Cla_plot);
delete(Cmac_plot);
delete(Cla_Flaps_plot);
CdCl_plot = axes('Parent',aeroPlotsPanel,'Position',[.14 .11 .82 .86]);
line(CdCl_plot,ClCdArray_airfoil,CdClArray_airfoil,'linewidth',2);
xlabel('C_L');
ylabel('C_D');
xlim([0 1.7])
ylim([0 .035])
grid on
grid minor

% Lets the popupmenu know which plot is selected
selectPlot = 2;

uicontrol('Parent',tab3,'Style','radiobutton','String','Cl vs. alpha','Position',[10 310 100 25],'Callback',@radio_plotCla_Callback);
uicontrol('Parent',tab3,'Style','radiobutton','String','Cmac vs. Cl','Position',[10 270 100 25],'Callback',@radio_plotCmac_Callback);

% CMac Data
function radio_plotCmac_Callback(~,~)
global CmacArray_airfoil tab3 aeroPlotsPanel CdCl_plot Cla_plot Cmac_plot...
    ClCdArray_airfoil selectPlot Cla_Flaps_plot

airfoilPlots;
delete(Cmac_plot);
delete(CdCl_plot);
delete(Cla_plot);
delete(Cla_Flaps_plot);
Cmac_plot = axes('Parent',aeroPlotsPanel,'Position',[.14 .11 .82 .86]);
line(Cmac_plot,ClCdArray_airfoil,CmacArray_airfoil,'linewidth',2);
xlabel('C_L');
ylabel('C_M_a_c');
xlim([0 1.7]);
ylim([-.2 .2]);
grid on
grid minor

% Lets the popupmenu know which plot is selected
selectPlot = 3;

uicontrol('Parent',tab3,'Style','radiobutton','String','Cd vs. Cl','Position',[10 290 100 25],'Callback',@radio_plotCdCl_Callback);
uicontrol('Parent',tab3,'Style','radiobutton','String','Cl vs. alpha','Position',[10 310 100 25],'Callback',@radio_plotCla_Callback);

%% High Lift Devices
function highLiftDevices
% Performs high lift devices calculations
dataHighLiftDevices;

function pushbutton_plotHighLiftDevices_Callback(~,~)
global tab3 ClaArray_wing_combined alphaArray_wing_combined...
    alphaArray_wing_Flaps_combined ClaArray_wing_Flaps_combined Cla_plot...
    CdCl_plot Cmac_plot Cla_Flaps_plot aeroPlotsPanel...
    selectPlot aircraftFeature alphaArray_horz_combined ClaArray_horz_combined...
    alphaArray_horz_Elevator_combined ClaArray_horz_Elevator_combined...
    alphaArray_vert_Rudder_combined ClaArray_vert_Rudder_combined...
    ClaArray_vert_combined alphaArray_vert_combined highLiftdevicesSelected

highLiftdevicesSelected = 1;
airfoilPlots;
delete(Cla_Flaps_plot);
delete(Cla_plot);
delete(CdCl_plot);
delete(Cmac_plot);
Cla_Flaps_plot = axes('Parent',aeroPlotsPanel,'Position',[.12 .1 .82 .86]);

if aircraftFeature == 0
dataFlapAnalysis;

% Wing
line(Cla_Flaps_plot,alphaArray_wing_combined,ClaArray_wing_combined,'linewidth',2,'color','r');

% Flaps
line(Cla_Flaps_plot,alphaArray_wing_Flaps_combined,ClaArray_wing_Flaps_combined,'linewidth',2,'color','k');
    
% xlim([min(alphaArray_wing_Flaps_combined) 50]);
xlim([-15 50]);

ylim([0 2]);
xlabel('Alpha(deg)');
ylabel('C_L');
legend('Wing','Flaps');

elseif aircraftFeature == 1
dataElevatorAnalysis;

% Horizontal Tail
line(Cla_Flaps_plot,alphaArray_horz_combined,ClaArray_horz_combined,'linewidth',2,'color','r');

% Elevator
line(Cla_Flaps_plot,alphaArray_horz_Elevator_combined,ClaArray_horz_Elevator_combined,'linewidth',2,'color','k');

% xlim([min(alphaArray_horz_Elevator_combined) 50]);
xlim([-15 50]);

ylim([0 2]);
xlabel('Alpha(deg)');
ylabel('C_L');
legend('Horizontal Tail','Elevator');

elseif aircraftFeature == 2
dataRudderAnalysis;

% Vertical Tail
line(Cla_Flaps_plot,alphaArray_vert_combined,ClaArray_vert_combined,'linewidth',2,'color','r');

% Rudder
line(Cla_Flaps_plot,alphaArray_vert_Rudder_combined,ClaArray_vert_Rudder_combined,'linewidth',2,'color','k');

% xlim([min(alphaArray_vert_Rudder_combined) 50]);
xlim([-15 50]);

ylim([0 2]);
xlabel('Alpha(deg)');
ylabel('C_L');
legend('Vertical Tail','Rudder');
end

grid on
grid minor

% Lets the popupmenu know which plot is selected
selectPlot = 4;
uicontrol('Parent',tab3,'Style','radiobutton','String','Cd vs. Cl','Position',[10 290 100 25],'Callback',@radio_plotCdCl_Callback);
uicontrol('Parent',tab3,'Style','radiobutton','String','Cmac vs. Cl','Position',[10 270 100 25],'Callback',@radio_plotCmac_Callback);
uicontrol('Parent',tab3,'Style','radiobutton','String','Cl vs. alpha','Position',[10 310 100 25],'Callback',@radio_plotCla_Callback);

%%  Analyze Performance----------------------------------------------------

%% Analyze Weight and Balance----------------------------------------------






