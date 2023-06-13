function startScreen
% Opens a start screen that lists the steps to create an aircraft
% Written by Mark D. Miller Jr.
% 2/26/19

global startScreenPanel aircraftTypeMenu masterFile
startScreenPanel = figure('FileName','startScreen.fig','Visible','on','Position',[10 100 850 827],...
    'Toolbar','none','Menubar','none','NumberTitle','off','Name','Start Screen','Resize','off','Dockcontrols','off',...
    'WindowStyle','modal');

% Returns masterFile to the current directory
masterFile = 'C:\Users\markd\OneDrive\Wing_Tail_Code';
% masterFile = pwd;

% Revert file access to master file
cd(masterFile);

% Static Texts------------------------------------------------------------
% Welcome
uicontrol('Parent',startScreenPanel','Style','text','String','Welcome to the Preliminary Aircraft Configurator (PAC)',...
    'Position',[280 700 280 60],'FontSize',12);

% Description of program
uicontrol('Parent',startScreenPanel','Style','text','String',{'This program allows the user to create',...
'a 3-D model of an aircraft and then it analyzes the aerodynamics, performance and S&C of the aircraft'},'Position',[250 620 300 70],'fontsize',9);

%% Aircraft Type
uicontrol('Parent',startScreenPanel,'Style','text','String','Aircraft Type','Position',[210 693 90 20],'Fontsize',10);

aircraftTypeMenu = uicontrol('Parent',startScreenPanel,'Style','popupmenu','String',{'Select',...
    'Fighter (Air-Air)','Fighter (Multipurpose)','Fighter (Air-Ground)','Military Trainer',...
    'Military Bomber and Transport','Military Patrol and Reconnaissance','Passenger Jet','Business Jet'},...
    'Position',[300 690 200 25],'Callback',@popupmenu_aircraftType_Callback);

% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Mission');

function popupmenu_aircraftType_Callback(source,~)
global aircraftType masterFile

% Revert file access to master file
cd(masterFile);

% Open Mission folder
cd('Mission');

  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
      case 'Fighter (Air-Air)'
          aircraftType = 1;
      case 'Fighter (Multipurpose)'
          aircraftType = 2;
      case 'Fighter (Air-Ground)'
          aircraftType = 3;
      case 'Military Trainer'
          aircraftType = 4;
      case 'Military Bomber and Transport'
          aircraftType = 5;
      case 'Military Patrol and Reconnaissance'
          aircraftType = 6;
      case 'Passenger Jet'
          aircraftType = 7;
      case 'Business Jet'
          aircraftType = 8;
  end

% Start PAC
% Revert file access to master file
cd(masterFile);

% Access PAC folder
cd('PAC');
PAC;

% Revert file access to master file
cd(masterFile);

% Open Mission folder
cd('Mission');

if aircraftType == 1
    missionParameters;
elseif aircraftType == 2
    missionParameters;
elseif aircraftType == 3
    missionParameters;
elseif aircraftType == 4
    missionParameters;
elseif aircraftType == 5
    missionParameters;
elseif aircraftType == 6
    missionParameters;
elseif aircraftType == 7
    missionParameters;
elseif aircraftType == 8
    missionParameters;
end
