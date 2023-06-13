function PAC
% Written by Mark D. Miller Jr.
% 7/19/19
clear
clc

% Opens PAC(Preliminary Aircraft Configurator)
global combinedWindowsFig missionParametersTab combinedWindowsTabgp...
    wingParametersTab fuselageParametersTab empennageParametersTab...
    engineParametersTab aircraftParametersTab aircraftDataTab wpActivated...
    fpActivated masterFile empActivated enpActivated caActivated newFile startScreenPanel

% Returns masterFile to the current directory
masterFile = 'C:\Users\markd\OneDrive\Wing_Tail_Code';

% Variable for position of PAC's main window
pos = get(gcf, 'position');

% Set variable to position on main window
set(0, 'DefaultFigurePosition', pos);

% Set screenSize to pos
screenSize = pos;

% Get variables the X/Y dimensions of the current screen
screenPosX   = screenSize(1);
screenPosY   = screenSize(2);

% Set waitbar figure on main window
windowPosition = [(screenPosX),(screenPosY), 850, 800];

combinedWindowsFig = figure('FileName','PAC.fig','Visible','on','Position',windowPosition,...
    'Toolbar','auto','Menubar','none','NumberTitle','off','Name','PAC','Resize','off','Dockcontrols','off',...
    'WindowStyle','normal','CloseRequestFcn',@closeAll);

% Tabs
combinedWindowsTabgp   = uitabgroup('Parent',combinedWindowsFig,'Position',[.01 .01 .98 .99]);

missionParametersTab   = uitab('Parent',combinedWindowsTabgp,'Title','Mission');

engineParametersTab    = uitab('Parent',combinedWindowsTabgp,'Title','Engine');
set(engineParametersTab, 'ButtonDownFcn', {@selectedEngineParametersTab, engineParametersTab});

wingParametersTab      = uitab('Parent',combinedWindowsTabgp,'Title','Wing');
set(wingParametersTab, 'ButtonDownFcn', {@selectedWingParametersTab, wingParametersTab});

fuselageParametersTab  = uitab('Parent',combinedWindowsTabgp,'Title','Fuselage');
set(fuselageParametersTab, 'ButtonDownFcn', {@selectedFuselageParametersTab, fuselageParametersTab});

empennageParametersTab = uitab('Parent',combinedWindowsTabgp,'Title','Empennage');
set(empennageParametersTab, 'ButtonDownFcn', {@selectedEmpennageParametersTab, empennageParametersTab});

aircraftParametersTab  = uitab('Parent',combinedWindowsTabgp,'Title','Aircraft');
set(aircraftParametersTab, 'ButtonDownFcn', {@selectedAircraftParametersTab, aircraftParametersTab});

aircraftDataTab        = uitab('Parent',combinedWindowsTabgp,'Title','Aircraft Data');

% Close Start Screen
delete(startScreenPanel);

file = uimenu('Parent',combinedWindowsFig,'Text','File','Text','&File');
newFile = uimenu('Parent',file,'Text','File','Text','New');
newFile.MenuSelectedFcn = @openNewFile;
uimenu('Parent',file,'Text','File','Text','Open');
uimenu('Parent',file,'Text','File','Text','Save');
load = uimenu('Parent',file,'Text','Load');
aircraftDrawing = uimenu('Parent',load,'Text','Aircraft Drawing');
aircraftDrawing.MenuSelectedFcn = @loadAircraftDrawing;

% Handles to selecting the various tabs in PAC, a value of 0 indicates the tab
% has not been selected, a value of 1 indicates the tab has been selected
% Constraint Analysis(ca) Tab not activated
caActivated  = 0;

% Wing Parameters(wp) Tab not activated
wpActivated  = 0;

% Fuselage Parameters(fp) Tab not activated
fpActivated  = 0;

% Empennage Parameters(emp) Tab not activated
empActivated = 0;

% Engine Parameters(enp) tab not activated
enpActivated = 0;

function openNewFile(~,~)
global masterFile
cd(masterFile);
startScreen;

function loadAircraftDrawing(~,~)
global XWRTMain YWRTMain
if isempty(XWRTMain) ~= 1 && isempty(YWRTMain) ~= 1
    insertAircraftDrawing;
end

function selectedEngineParametersTab(~,~,~)
global enpActivated masterFile
if isempty(enpActivated) == 1 || enpActivated == 0
    % Revert file access to master file
    cd(masterFile);
    
    % Access Empennage folder
    cd('Engine');
    
    % Load Empennage Parameters
    engineParameters;
end

function selectedWingParametersTab(~,~,~)
global wpActivated masterFile
if isempty(wpActivated) == 1 || wpActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Wing folder
    cd('Wing');

    % Load Wing Parameters
    wingParameters;
end

function selectedFuselageParametersTab(~,~,~)
global fpActivated masterFile
if isempty(fpActivated) == 1 || fpActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Fuselage folder
    cd('Fuselage');

    % Load Fuselage Parameters
    fuselageParameters;
end

function selectedEmpennageParametersTab(~,~,~)
global empActivated masterFile
if isempty(empActivated) == 1 || empActivated == 0
    % Revert file access to master file
    cd(masterFile);
    
    % Access Empennage folder
    cd('Empennage');
    
    % Load Empennage Parameters
    empennageParameters;
    
    % Revert file access to master file
%     cd(masterFile);
end

function selectedAircraftParametersTab(~,~,~)
global apParameters masterFile
if isempty(apParameters) == 1 || apParameters == 0
    % Revert file access to master file
    cd(masterFile);
    
    % Access Empennage folder
    cd('Aircraft');
    
    % Load Empennage Parameters
    aircraftParameters;
end

function closeAll(~,~)
global combinedWindowsFig similarAircraftTable airfoilTable masterFile waitbarFig

% Revert file access to master file
cd(masterFile);

% Delete tables first then figure
delete(waitbarFig);
delete(similarAircraftTable);
delete(airfoilTable);
delete(combinedWindowsFig);
clear;
clc;

