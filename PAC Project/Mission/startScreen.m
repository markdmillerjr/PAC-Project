function startScreen
% Opens a start screen that lists the steps to create an aircraft
% Written by Mark D. Miller Jr.
% 2/26/19

global startScreenPanel aircraftType aircraftTypeMenu masterFile
% startScreenPanel = figure('FileName','startScreen.fig','Visible','on','Position',[10 100 850 800],...
%     'Toolbar','none','Menubar','none','NumberTitle','off','Name','Start Screen','Resize','off','Dockcontrols','off',...
%     'WindowStyle','modal');

startScreenPanel = figure('FileName','startScreen.fig','Visible','on','Position',[10 100 850 800],...
    'Toolbar','none','Menubar','none','NumberTitle','off','Name','Start Screen','Resize','off','Dockcontrols','off');

% Returns masterFile to the current directory
masterFile = pwd;

% Static Texts------------------------------------------------------------
% Welcome
uicontrol('Parent',startScreenPanel','Style','text','String','Welcome to the Preliminary Aircraft Configurator (PAC)',...
    'Position',[280 700 280 60],'FontSize',12);
% Description of program
uicontrol('Parent',startScreenPanel','Style','text','String',{'This program allows the user to create',...
'a 3-D model of an aircraft and then it analyzes the aerodynamics, performance and S&C of the aircraft'},'Position',[250 620 300 70],'fontsize',9);
% Tutorial
uicontrol('Parent',startScreenPanel','Style','text','String','To design an aircraft follow the steps below','Position',[280 620 250 25],'fontsize',9);


%% Aircraft Type
uicontrol('Parent',startScreenPanel,'Style','text','String','Aircraft Type','Position',[210 693 90 20],'Fontsize',10);

% Ensure we start in the main folder
cd(masterFile);

startScreenData;

% aircraftTypeMenu = uicontrol('Parent',startScreenPanel,'Style','popupmenu','String',{'Select',...
%     'Fighter (Air-Air)','Fighter (Multipurpose)','Fighter (Air-Ground)','Military Trainer',...
%     'Military Bomber and Transport','Military Patrol and Reconnaissance','Passenger Jet','Business Jet'},...
%     'Position',[300 690 200 25],'Callback',@popupmenu_aircraftType_Callback);

% % Revert file access to master file
% cd(masterFile);
% 
% % Access Mission folder
% cd('Mission');
% 
% if aircraftType == 1
%     missionParameters;
% %     similarAircraftTab;
% %     fighterAirAir;
% %     fighterAirAir_aircraftNames;
%     aircraftTypeMenu.Value = 2;
% %     fighterExternalLoad_aircraftNamesH_P;
% elseif aircraftType == 2
%     missionParameters;
% %     similarAircraftTab;
% %     fighterMulti;
% %     fighterMulti_aircraftNamesB_S;
%     aircraftTypeMenu.Value = 3;
% elseif aircraftType == 3
%     missionParameters;
% %     similarAircraftTab;
% %     fighterAirGround;
% %     fighterAirGround_aircraftNamesC_N;
% %     fighterAirGround_aircraftNamesN_T;
%     aircraftTypeMenu.Value = 4;
% elseif aircraftType == 4
%     missionParameters;
% %     similarAircraftTab;
% %     militaryTrainer;
% %     milTrainer_aircraftNames
%     aircraftTypeMenu.Value = 5;
% elseif aircraftType == 5
%     missionParameters;
% %     similarAircraftTab;
% %     militaryBomberTransport;
% %     milBombTransport_aircraftNamesB_T;
%     aircraftTypeMenu.Value = 6;
% elseif aircraftType == 6
%     missionParameters;
% %     similarAircraftTab;
% %     militaryPatrolRecon;
% %     milPatrolRecon_aircraftNames;
%     aircraftTypeMenu.Value = 7;
% elseif aircraftType == 7
%     missionParameters;
% %     similarAircraftTab;
% %     passengerJet;
% %     passengerJet_aircraftNamesA_H;
% %     passengerJet_aircraftNamesH_Y;
%     aircraftTypeMenu.Value = 8;
% elseif aircraftType == 8
%     missionParameters;
% %     similarAircraftTab;
% %     businessJet;
% %     businessJet_aircraftNames
%     aircraftTypeMenu.Value = 9;
% end

%% Aircraft Type
% function popupmenu_aircraftType_Callback(source,~)
% global aircraftType aircraftTypeMenu modWTO masterFile
% 
%     % Revert file access to master file
%     cd(masterFile);
% 
%     % Starts PAC
%     PAC;
% 
%   % Determine the selected data set.
%   str = source.String;
%   val = source.Value;
%   % Set current data to the selected data set.
%   switch str{val}
%       case 'Fighter (Air-Air)'
%           
%           aircraftTypeMenu.Value = 2;
%           aircraftType = 1;
% %           fighterAirAir;
%           missionParameters;
%       case 'Fighter (Multipurpose)'
%           
%           aircraftTypeMenu.Value = 3;
%           aircraftType = 2;
% %           fighterMulti;
%           missionParameters;
%       case 'Fighter (Air-Ground)'
%           
%           aircraftTypeMenu.Value = 4;
%           aircraftType = 3;
% %           fighterAirGround;
%           missionParameters;
%       case 'Military Trainer'
%           
%           aircraftTypeMenu.Value = 5;
%           aircraftType = 4;
% %           militaryTrainer;
%           missionParameters;
%       case 'Military Bomber and Transport'
%           
%           aircraftTypeMenu.Value = 6;
%           aircraftType = 5;
% %           militaryBomberTransport;
%           missionParameters;
%       case 'Military Patrol and Reconnaissance'
%           
%           aircraftTypeMenu.Value = 7;
%           aircraftType = 6;
% %           militaryPatrolRecon;
%           missionParameters;
%       case 'Passenger Jet'
%           
%           aircraftTypeMenu.Value = 8;
%           aircraftType = 7;
% %           passengerJet;
%           missionParameters;
%       case 'Business Jet'
%           
%           aircraftTypeMenu.Value = 9;
%           aircraftType = 8;
% %           businessJet;
%           missionParameters;
%   end
% % selectedWTO;
% % similarAircraftTab;
% % similarAircraftSelection;
% modWTO = [];

% if isempty(aircraftType) ~= 1
% selectedWTO;
% similarAircraftTab;
% similarAircraftSelection;
% end

% Similar Aircraft Table Tab
% function similarAircraftTab
% global missionRequirementsTab passengerTabA_H similarAircraftTabGroup aircraftType...
%     passengerTabH_Y fighterAirAirTab fighterMultiTabB_S milTrainerTab...
%     bomberTabB_T businessTab fighterAirGroundTabC_N fighterAirGroundTabN_T...
%     fighterMultiTabS_Y patrolTab bomberTabT_Y
% 
% similarAircraftTabGroup = uitabgroup('Parent',missionRequirementsTab,'Position',[.01 .05 .98 .58]);
% if aircraftType == 1
%     fighterAirAirTab = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Air)');
% elseif aircraftType == 2
%     fighterMultiTabB_S = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Multipurpose) B-S');
%     fighterMultiTabS_Y = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Multipurpose) S-Y');
% elseif aircraftType == 3
%     fighterAirGroundTabC_N = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Ground) C-N');
%     fighterAirGroundTabN_T = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Ground) N-T');
% elseif aircraftType == 4
%     milTrainerTab = uitab('Parent',similarAircraftTabGroup,'Title','Military Trainer');
% elseif aircraftType == 5
%     bomberTabB_T = uitab('Parent',similarAircraftTabGroup,'Title','Military Bomber, & Transport B-T');
%     bomberTabT_Y = uitab('Parent',similarAircraftTabGroup,'Title','Military Bomber, & Transport T-Y');
% elseif aircraftType == 6
%     patrolTab = uitab('Parent',similarAircraftTabGroup,'Title','Military Patrol, and Reconnaissance');
% elseif aircraftType == 7
%     passengerTabA_H = uitab('Parent',similarAircraftTabGroup,'Title','Passenger Jet A-H');
%     passengerTabH_Y = uitab('Parent',similarAircraftTabGroup,'Title','Passenger Jet H-Y');
% elseif aircraftType == 8
%     businessTab = uitab('Parent',similarAircraftTabGroup,'Title','Business Jet');
% end

% % Step 1
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 1: Design the wing','Position',[10 580 150 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Wing Parameters window','Position',[57 560 200 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the wing airfoil','Position',[48 540 150 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Input the wing chord, span, dihedral, sweep, and taper','Position',[33 520 350 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Close the Wing Parameters window','Position',[57 500 200 25],'fontsize',9);
% 
% % Step 2
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 2: Design the fuselage','Position',[20 470 150 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Fuselage Parameters window','Position',[45 450 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the fuselage length and radius','Position',[41 430 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the nose cone length','Position',[45 410 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the tail cone length','Position',[40 390 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Close the Fuselage Parameters window','Position',[45 370 250 25],'fontsize',9);
% 
% % Step 3
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 3: Design the empennage','Position',[17 340 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Empennage Parameters window','Position',[52 320 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the horizontal tail airfoil','Position',[58 300 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the vertical tail airfoil','Position',[50 280 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the empennage configuration, Conventional, Cruciform or T-Tail ','Position',[42 270 250 35],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the horizontal tail chord, span, dihedral, sweep, taper, and incidence','Position',[42 235 250 35],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the vertical tail chord, span, sweep, and taper','Position',[5 210 400 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Close the Empennage Parameters window','Position',[52 190 250 25],'fontsize',9);
% 
% % Step 4
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 4: Design the engine','Position',[7 165 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Engine Parameters window','Position',[40 145 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String',{'-For a jet engine select the "Jet Engine" tab, for a propeller',...
%     'engine select the "Propeller Engine" tab'},'Position',[-82 115 600 35],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-For a jet engine specify the engine length and outer radius','Position',[43 90 350 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String',{'-For a propeller engine specify the number of blades, blade length,',...
%     'blade chord, engine length and outer radius'},'Position',[48 60 380 35],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Close the Engine Parameters window','Position',[40 35 250 25],'fontsize',9);
% 
% % Step 5
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 5: Build the aircraft','Position',[430 580 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Aircraft Parameters window','Position',[453 560 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Input the wing position relative to the tail','Position',[460 540 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Input the wing location, high, mid or low','Position',[458 520 250 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Specify the type of engine and the number of engines','Position',[471 480 200 45],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Input the engine distance along the X, Y, and Z axes','Position',[473 445 200 45],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-If have more than 2 engines specify the distance between the engines','Position',[475 410 200 45],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Close the Aircraft Parameters window','Position',[453 375 250 45],'fontsize',9);
% 
% % Step 6
% uicontrol('Parent',startScreenPanel','Style','text','String','Step 6: Analyze the aircraft','Position',[430 365 180 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String','-Open the Aircraft Data window','Position',[463 345 200 25],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String',{'-In the Aircraft Weight panel, specify the',...
%     'type of aircraft and the aircraft weight'},'Position',[460 315 250 35],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String',{'-In the Mission Requirements panel,',...
%     'specify the aircraft Range, Endurance,',...
%     'Cruise Mach number, Maximum Mach number',...
%     'and Service Ceiling'},'Position',[352 250 450 65],'fontsize',9);
% uicontrol('Parent',startScreenPanel','Style','text','String',{'-In the Engine Specifications panel,',...
%     'specify the Engine Dry Thrust, Afterburner Thrust, TSFC, Weight, Length, Diameter,',...
%     'Bypass Ratio and Overall Pressure Ratio'},'Position',[451 205 250 45],'fontsize',9);

