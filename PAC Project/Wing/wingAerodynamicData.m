function wingAerodynamicData
% Written By Mark D. Miller Jr.
% 12/29/2019

global wingAeroDataTab wingAeroPanel wingAeroPlotsPanel airfoilName wadActivated...
    masterFile wingParametersTab CLvsAlphaTab CDvsCLTab CMacvsCLTab...
    clvaActivated cdvclActivated cmvclActivated airfoil_size

wingAeroPanel = uipanel('Parent',wingAeroDataTab,'Title','Wing Data','FontSize',12,'Position',[0 .75 .35 .25]);
wingAeroPlotsPanel = uipanel('Parent',wingAeroDataTab,'Title','Aerodynamic Data','FontSize',12,'Position',[.01 .01 .98 .74]);

% Tabs
wingAeroTabgp = uitabgroup('Parent',wingAeroDataTab,'Position',[0 0 1 .75]);

% tabgp = uitabgroup('Parent',combinedWindowsFig,'Position',[.27 .01 .72 .99]);
CLvsAlphaTab    = uitab('Parent',wingAeroTabgp,'Title','CL vs. Alpha');
set(CLvsAlphaTab, 'ButtonDownFcn', {@selectedCLvsAlphaTab, CLvsAlphaTab});

CDvsCLTab    = uitab('Parent',wingAeroTabgp,'Title','CD vs. CL');
set(CDvsCLTab, 'ButtonDownFcn', {@selectedCDvsCLTab, CDvsCLTab});
% 
CMacvsCLTab = uitab('Parent',wingAeroTabgp,'Title','CMac vs. CL');
set(CMacvsCLTab, 'ButtonDownFcn', {@selectedCMacvsCLTab, CMacvsCLTab});

% wingAeroDataTab    = uitab('Parent',wingAeroTabgp,'Title','Wing Aerodynamic Data');
% set(wingAeroDataTab, 'ButtonDownFcn', {@selectedAeroTab, wingAeroDataTab});
% 
% wingStructuresTab  = uitab('Parent',wingAeroTabgp,'Title','Wing Structure');

% Revert file access to master file
cd(masterFile)

% Access Airfoil folder
cd('Airfoil');

if airfoil_size > 0
    clvaActivated  = 0;
    cdvclActivated = 0;
    cmvclActivated = 0;
end

wingAeroData;
wingAnalysis;
selectedCLvsAlphaTab;
selectedCDvsCLTab;
selectedCMacvsCLTab;

% Wing aero data is opened
wadActivated = 1;

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
uicontrol('Parent',wingAeroPanel,'Style','text','String','Alpha(l=0):','Position',[5 58 60 25]);
    % Clmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_l_max:','Position',[10 32 60 25]);
    % Cdmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_d_min:','Position',[10 5 60 25]);
    % Cmo 
% uicontrol('Parent',wingAeroPanel,'Style','text','String','C_m_o','Position',[10 5 60 25]);

% Wing Data
    % CLa 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_L_a:','Position',[125 85 68 25],'FontWeight','bold');
    % Alpha(L=0)
uicontrol('Parent',wingAeroPanel,'Style','text','String','Alpha(L=max):','Position',[110 58 85 25],'FontWeight','bold');
    % Clmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_L_max:','Position',[125 32 60 25],'FontWeight','bold');
    % Cdmax 
uicontrol('Parent',wingAeroPanel,'Style','text','String','C_D_min:','Position',[125 5 60 25],'FontWeight','bold');
    % Cmo 
% uicontrol('Parent',wingAeroPanel,'Style','text','String','C_M_o','Position',[125 8 60 25],'Fontsize',9);

% Analyzes airfoil/wing aerodynamics
function wingAnalysis
global Cla_wing_str aL_0_wing_str Clmax_wing_str Cdmin_wing_str Cmo_wing_str wingAirfoilFile ...
    CLa_wing_str CLmax_wing_str CDmin_wing_str CMo_wing_str wingAeroPanel alphaCLmax_wing_str...
    airfoilFile aircraftFeature airfoilName airfoilModel masterFile

% Revert file access to master file
cd(masterFile);

% Access Data file
cd('Data');

% Load Data Wing Analysis
dataWingAnalysis;

% Airfoil file
uicontrol('Parent',wingAeroPanel,'Style','edit','String',airfoilName,'Position',[100 135 140 15],'Fontsize',9,'Enable','off');
% 2-D
    % Cla value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',Cla_wing_str,'Position',[65 93 40 20],'Enable','off');
    % Alpha(L=0) value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',aL_0_wing_str,'Position',[65 65 40 20],'Enable','off');
    % Clmax value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',Clmax_wing_str,'Position',[65 38 40 20],'Enable','off');
    % Cdmax value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',Cdmin_wing_str,'Position',[65 10 40 20],'Enable','off');
    % Cm value
%     uicontrol('Parent',wingAeroPanel,'Style','edit','String',Cmo_wing_str,'Position',[60 5 40 20],'Enable','off');
% 3-D
    % Cla value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',CLa_wing_str,'Position',[195 93 40 20],'Enable','off');
    % Alpha(L=0) value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',alphaCLmax_wing_str,'Position',[195 65 40 20],'Enable','off');
    % Clmax value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',CLmax_wing_str,'Position',[195 38 40 20],'Enable','off');
    % Cdmax value
    uicontrol('Parent',wingAeroPanel,'Style','edit','String',CDmin_wing_str,'Position',[195 10 40 20],'Enable','off');
    % Cm value
%     uicontrol('Parent',wingAeroPanel,'Style','text','String',CMo_wing_str,'Position',[176 5 60 25]);
    
airfoilFile = wingAirfoilFile;
aircraftFeature = 0;

% CL_alpha Data
function selectedCLvsAlphaTab(~,~,~)
global alphaArray_airfoil ClaArray_airfoil wingAeroPlotsPanel Cla_plot CdCl_plot...
    Cmac_plot selectPlot alphaArray_wing_linear alphaArray_wing_nonlinear1...
    alphaArray_wing_nonlinear2 ClaArray_wing_linear ClaArray_wing_nonlinear1...
    ClaArray_wing_nonlinear2 AR_highWing AR_lowWing hLdSelection Cla_Flaps_plot...
    cD cM masterFile CLvsAlphaTab clvaActivated

if isempty(clvaActivated) == 1 || clvaActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Data file
    cd('Airfoil');

    % Load airfoil plots
    airfoilPlots;
    
delete(Cla_plot);
% delete(CdCl_plot);
% delete(Cmac_plot);
delete(Cla_Flaps_plot);
cD.Value = 0;
cM.Value = 0;
Cla_plot = axes('Parent',CLvsAlphaTab,'Position',[.12 .1 .82 .86]);

% Wing
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
    legend(Cla_plot,'Airfoil','Wing');
elseif AR_lowWing == 1
    xlim([-15 50]);
    ylim([0 2]);
    xlabel('\alpha (deg)','fontsize',12,'fontweight','bold');
    ylabel('C_L','fontsize',12,'fontweight','bold');
    legend(Cla_plot,'Airfoil','Wing');
end

grid on
grid minor  
end

% Lets the popupmenu know which plot is selected
selectPlot = 1;
clvaActivated = 1;

% CD_Cl Data
function selectedCDvsCLTab(~,~,~)
global ClCdArray_airfoil CdClArray_airfoil CdCl_plot Cla_plot wingAeroPlotsPanel tab3...
    Cmac_plot selectPlot Cla_Flaps_plot cL cM masterFile CDvsCLTab...
    cdvclActivated

if isempty(cdvclActivated) == 1 || cdvclActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Data file
    cd('Airfoil');

    % Load airfoil plots
    airfoilPlots;

delete(CdCl_plot);
% delete(Cla_plot);
% delete(Cmac_plot);
delete(Cla_Flaps_plot);
cL.Value = 0;
cM.Value = 0;
CdCl_plot = axes('Parent',CDvsCLTab,'Position',[.14 .11 .82 .86]);
line(CdCl_plot,ClCdArray_airfoil,CdClArray_airfoil,'linewidth',2);
xlabel('C_L');
ylabel('C_D');
xlim([0 1.7])
ylim([0 .035])
grid on
grid minor
end
% Lets the popupmenu know which plot is selected
selectPlot = 2;
cdvclActivated = 1;

% CMac Data
function selectedCMacvsCLTab(~,~,~)
global CmacArray_airfoil tab3 wingAeroPlotsPanel CdCl_plot Cla_plot Cmac_plot...
    ClCdArray_airfoil selectPlot Cla_Flaps_plot cL cD masterFile CMacvsCLTab...
    cmvclActivated

if isempty(cmvclActivated) == 1 || cmvclActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Data file
    cd('Airfoil');

    % Load airfoil plots
    airfoilPlots;

delete(Cmac_plot);
% delete(CdCl_plot);
% delete(Cla_plot);
delete(Cla_Flaps_plot);
cL.Value = 0;
cD.Value = 0;
Cmac_plot = axes('Parent',CMacvsCLTab,'Position',[.14 .11 .82 .86]);
line(Cmac_plot,ClCdArray_airfoil,CmacArray_airfoil,'linewidth',2);
xlabel('C_L');
ylabel('C_M_a_c');
xlim([0 1.7]);
ylim([-.2 .2]);
grid on
grid minor
end
% Lets the popupmenu know which plot is selected
selectPlot = 3;
cmvclActivated = 1;
