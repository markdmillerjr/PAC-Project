function missionParameters
% Written by Mark D. Miller Jr.
% 11/29/19

global missionRequirementsTab aircraftType constraintAnalysisTab masterFile...
    missionParametersTab aircraftTypeMenu waitbarFig dataCollection

% Variable to denote whether or not need to access combined data arrays in
% aircraft database. Set initially to 0, a value of 1 indicates need to
% access combined data arrays, otherwise do not.
dataCollection = 0;

% delete(startScreenPanel);

% Tabs
% tabgp = uitabgroup('Parent',combinedWindowsFig,'Position',[.27 .01 .72 .99]);

tabgp = uitabgroup('Parent',missionParametersTab,'Position',[0 0 1 1]);
missionRequirementsTab = uitab('Parent',tabgp,'Title','Mission Requirements');

constraintAnalysisTab = uitab('Parent',tabgp,'Title','Constraint Analysis');
set(constraintAnalysisTab, 'ButtonDownFcn', {@selectedConstraintAnalysisTab, constraintAnalysisTab});

% Revert file access to master file
cd(masterFile);
    
%% Aircraft Type
uicontrol('Parent',missionRequirementsTab,'Style','text','String','Aircraft Type','Position',[210 693 90 20],'Fontsize',10);

aircraftTypeMenu = uicontrol('Parent',missionRequirementsTab,'Style','popupmenu','String',{'Select',...
    'Fighter (Air-Air)','Fighter (Multipurpose)','Fighter (Air-Ground)','Military Trainer',...
    'Military Bomber and Transport','Military Patrol and Reconnaissance','Passenger Jet','Business Jet'},...
    'Position',[300 690 200 25],'Callback',@popupmenu_aircraftType_Callback);

if aircraftType == 1
    similarAircraftTab;
    fighterAirAir;
    fighterAirAir_aircraftNames;
    aircraftTypeMenu.Value = 2;
%     fighterExternalLoad_aircraftNamesH_P;
    delete(waitbarFig);
elseif aircraftType == 2
    similarAircraftTab;
    fighterMulti;
    fighterMulti_aircraftNamesB_S;
    aircraftTypeMenu.Value = 3;
    delete(waitbarFig);
elseif aircraftType == 3
    similarAircraftTab;
    fighterAirGround;
    fighterAirGround_aircraftNamesC_N;
    fighterAirGround_aircraftNamesN_T;
    aircraftTypeMenu.Value = 4;
    delete(waitbarFig);
elseif aircraftType == 4
    similarAircraftTab;
    militaryTrainer;
    milTrainer_aircraftNames
    aircraftTypeMenu.Value = 5;
    delete(waitbarFig);
elseif aircraftType == 5
    similarAircraftTab;
    militaryBomberTransport;
    milBombTransport_aircraftNamesB_T;
    aircraftTypeMenu.Value = 6;
    delete(waitbarFig);
elseif aircraftType == 6
    similarAircraftTab;
    militaryPatrolRecon;
    milPatrolRecon_aircraftNames;
    aircraftTypeMenu.Value = 7;
    delete(waitbarFig);
elseif aircraftType == 7
    similarAircraftTab;
    passengerJet;
    passengerJet_aircraftNamesA_H;
    passengerJet_aircraftNamesH_Y;
    aircraftTypeMenu.Value = 8;
elseif aircraftType == 8
    similarAircraftTab;
    businessJet;
    businessJet_aircraftNames
    aircraftTypeMenu.Value = 9;
    delete(waitbarFig);
end

if isempty(aircraftType) ~= 1
selectedWTO;
similarAircraftTab;
similarAircraftSelection;

% Revert file access to master file
% cd(masterFile);

% Access Mission Folder
% constraintAnalysis;
end
delete(waitbarFig);

%% Fighter (Air-Air)
function fighterAirAir
global range payload cruiseMach maximumMach takeoffLength serviceCeiling ROC...
    missionRequirementsTab combatTime combatRadius

% Panel
fighterAirAir = uipanel('Parent',missionRequirementsTab,'Title','Fighter (Air-Air)','FontSize',12,'Position',[.01 .74 .98 .2]);

% Ferry Range
uicontrol('Parent',fighterAirAir,'Style','text','String','Ferry Range','Position',[10 88 70 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','NM','Position',[70 65 25 25]);

% Combat Radius
uicontrol('Parent',fighterAirAir,'Style','text','String','Combat Radius','Position',[100 88 80 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',combatRadius,'Position',[115 75 45 20],'Callback',@txtbox_combatRadius_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','NM','Position',[160 65 25 25]);

% Payload
uicontrol('Parent',fighterAirAir,'Style','text','String','Payload','Position',[202 88 50 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',payload,'Position',[205 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','lbs','Position',[250 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',fighterAirAir,'Style','text','String','Cruise Mach Number','Position',[250 88 135 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',cruiseMach,'Position',[290 75 45 20],'Callback',@txtbox_cruiseMach_Callback);

% Maximum Mach Number
uicontrol('Parent',fighterAirAir,'Style','text','String','Maximum Mach Number','Position',[375 88 120 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',maximumMach,'Position',[410 75 45 20],'Callback',@txtbox_maximumMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',fighterAirAir,'Style','text','String','Rate of Climb','Position',[5 35 70 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',ROC,'Position',[25 20 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','ft/min','Position',[70 12 35 25]);

% Takeoff Length
uicontrol('Parent',fighterAirAir,'Style','text','String','Takeoff Length','Position',[80 35 100 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',takeoffLength,'Position',[115 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',fighterAirAir,'Style','text','String','ft','Position',[160 12 15 25]);
        
% Service Ceiling
uicontrol('Parent',fighterAirAir,'Style','text','String','Service Ceiling','Position',[180 35 80 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',serviceCeiling,'Position',[205 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','ft','Position',[250 12 15 25]);

% Combat Time
uicontrol('Parent',fighterAirAir,'Style','text','String','Combat Time','Position',[270 35 80 25]);
uicontrol('Parent',fighterAirAir,'Style','edit','String',combatTime,'Position',[290 20 45 20],'Callback',@txtbox_combatTime_Callback);
uicontrol('Parent',fighterAirAir,'Style','text','String','min','Position',[340 12 20 25]);
% uicontrol('Parent',fighterExternalLoad,'Style','text','String','*Supersonic Jets AR: 1.5-2','Position',[540 50 150 20],'Fontsize',9,'Enable','off');

% Wing Aspect Ratio Range
uicontrol('Parent',fighterAirAir,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',fighterAirAir,'Style','edit','String','1.5 - 2','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');

% Type of Engine
uicontrol('Parent',fighterAirAir,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',fighterAirAir,'Style','text','String','Turbojet or Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function fighterAirAir_aircraftNames
global fighterAirAirTab
uicontrol('Parent',fighterAirAirTab,'Style','edit','String','Convair F-102A Delta Dagger','Position',[1 346 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirAirTab,'Style','edit','String','Convair F-106A Delta Dart','Position',[1 328 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirAirTab,'Style','edit','String','Yakovlev Yak-25','Position',[1 310 171 19],'Enable','off','FontWeight','Bold');

%% Fighter (Multipurpose)
function fighterMulti
global missionRequirementsTab range payload cruiseMach ROC maximumMach takeoffLength...
    serviceCeiling combatTime combatRadius

% Panel
fighterMulti = uipanel('Parent',missionRequirementsTab,'Title','Fighter (Multipurpose)','FontSize',12,'Position',[.01 .74 .98 .2]);

% Ferry Range
uicontrol('Parent',fighterMulti,'Style','text','String','Ferry Range','Position',[10 88 70 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','NM','Position',[70 65 25 25]);

% Combat Radius
uicontrol('Parent',fighterMulti,'Style','text','String','Combat Radius','Position',[100 88 80 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',combatRadius,'Position',[115 75 45 20],'Callback',@txtbox_combatRadius_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','NM','Position',[160 65 25 25]);

% Payload
uicontrol('Parent',fighterMulti,'Style','text','String','Payload','Position',[202 88 50 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',payload,'Position',[205 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','lbs','Position',[250 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',fighterMulti,'Style','text','String','Cruise Mach Number','Position',[250 88 135 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',cruiseMach,'Position',[290 75 45 20],'Callback',@txtbox_cruiseMach_Callback);

% Maximum Mach Number
uicontrol('Parent',fighterMulti,'Style','text','String','Maximum Mach Number','Position',[375 88 120 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',maximumMach,'Position',[410 75 45 20],'Callback',@txtbox_maximumMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',fighterMulti,'Style','text','String','Rate of Climb','Position',[5 35 70 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',ROC,'Position',[25 20 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','ft/min','Position',[70 12 35 25]);

% Takeoff Length
uicontrol('Parent',fighterMulti,'Style','text','String','Takeoff Length','Position',[80 35 100 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',takeoffLength,'Position',[115 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',fighterMulti,'Style','text','String','ft','Position',[160 12 15 25]);
        
% Service Ceiling
uicontrol('Parent',fighterMulti,'Style','text','String','Service Ceiling','Position',[180 35 80 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',serviceCeiling,'Position',[205 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','ft','Position',[250 12 15 25]);

% Combat Time
uicontrol('Parent',fighterMulti,'Style','text','String','Combat Time','Position',[270 35 80 25]);
uicontrol('Parent',fighterMulti,'Style','edit','String',combatTime,'Position',[290 20 45 20],'Callback',@txtbox_combatTime_Callback);
uicontrol('Parent',fighterMulti,'Style','text','String','min','Position',[340 12 20 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',fighterMulti,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',fighterMulti,'Style','edit','String','1.5 - 2','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');

% Type of Engine
uicontrol('Parent',fighterMulti,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',fighterMulti,'Style','text','String','Turbojet or Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function fighterMulti_aircraftNamesB_S
global fighterMultiTabB_S
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','BAC 167 Strikemaster','Position',[1 346 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Canadair CL-41 G','Position',[1 328 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Dassault Etendard IV-M','Position',[1 310 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Dassault Mirage F1-C','Position',[1 292 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Dassault Super Mystere B-2','Position',[1 274 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Fairchild Republic F-105','Position',[1 256 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','General Dynamics F-111A','Position',[1 238 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Grumman F-14D','Position',[1 220 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Hawker Siddeley Gnat Mk 1','Position',[1 202 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Lockheed F-104S','Position',[1 184 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','McDonnell F-101B','Position',[1 166 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','McDonnell Douglas F-4EJ','Position',[1 148 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Mikoyan MiG-21MF','Position',[1 130 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Mikoyan MiG-23 MLD','Position',[1 112 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Mikoyan MiG-25P','Position',[1 94 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','North American A-5A','Position',[1 76 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Northrop F-5E Tiger II','Position',[1 58 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','Panavia Tornado GR4','Position',[1 40 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabB_S,'Style','edit','String','SAAB 32A Lansen','Position',[1 22 171 19],'Enable','off','FontWeight','Bold');
function fighterMulti_aircraftNamesS_Y
global fighterMultiTabS_Y
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','SAAB J 35S Draken','Position',[1 346 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','SAAB 37 Viggen','Position',[1 328 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','SAAB 105XT','Position',[1 310 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','SEPECAT Jaguar','Position',[1 292 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','Sukhoi Su-11','Position',[1 274 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','Tupolev Tu-128','Position',[1 256 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','Vought A-7 Corsair II','Position',[1 238 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterMultiTabS_Y,'Style','edit','String','Vought F-8E Crusader','Position',[1 220 171 19],'Enable','off','FontWeight','Bold');

%% Fighter (Air-Ground)
function fighterAirGround
global missionRequirementsTab range payload cruiseMach ROC maximumMach takeoffLength...
    serviceCeiling combatTime combatRadius

% Panel
fighterAirGround = uipanel('Parent',missionRequirementsTab,'Title','Fighter (Air-Ground)','FontSize',12,'Position',[.01 .74 .98 .2]);

% Ferry Range
uicontrol('Parent',fighterAirGround,'Style','text','String','Ferry Range','Position',[10 88 70 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','NM','Position',[70 65 25 25]);

% Combat Radius
uicontrol('Parent',fighterAirGround,'Style','text','String','Combat Radius','Position',[100 88 80 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',combatRadius,'Position',[115 75 45 20],'Callback',@txtbox_combatRadius_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','NM','Position',[160 65 25 25]);

% Payload
uicontrol('Parent',fighterAirGround,'Style','text','String','Payload','Position',[202 88 50 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',payload,'Position',[205 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','lbs','Position',[250 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',fighterAirGround,'Style','text','String','Cruise Mach Number','Position',[250 88 135 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',cruiseMach,'Position',[290 75 45 20],'Callback',@txtbox_cruiseMach_Callback);

% Maximum Mach Number
uicontrol('Parent',fighterAirGround,'Style','text','String','Maximum Mach Number','Position',[375 88 120 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',maximumMach,'Position',[410 75 45 20],'Callback',@txtbox_maximumMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',fighterAirGround,'Style','text','String','Rate of Climb','Position',[5 35 70 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',ROC,'Position',[25 20 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','ft/min','Position',[70 12 35 25]);

% Takeoff Length
uicontrol('Parent',fighterAirGround,'Style','text','String','Takeoff Length','Position',[80 35 100 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',takeoffLength,'Position',[115 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',fighterAirGround,'Style','text','String','ft','Position',[160 12 15 25]);
        
% Service Ceiling
uicontrol('Parent',fighterAirGround,'Style','text','String','Service Ceiling','Position',[180 35 80 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',serviceCeiling,'Position',[205 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','ft','Position',[250 12 15 25]);

% Combat Time
uicontrol('Parent',fighterAirGround,'Style','text','String','Combat Time','Position',[270 35 80 25]);
uicontrol('Parent',fighterAirGround,'Style','edit','String',combatTime,'Position',[290 20 45 20],'Callback',@txtbox_combatTime_Callback);
uicontrol('Parent',fighterAirGround,'Style','text','String','min','Position',[340 12 20 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',fighterAirGround,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',fighterAirGround,'Style','edit','String','2 - 6','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');

% Type of Engine
uicontrol('Parent',fighterAirGround,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',fighterAirGround,'Style','text','String','Turbojet or Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function fighterAirGround_aircraftNamesC_N
global fighterAirGroundTabC_N
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Cessna A-37B','Position',[1 346 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Dassault Mirage III-EP','Position',[1 328 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Dassault Mirage 5-P','Position',[1 310 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Dassault Mystere IV-A','Position',[1 292 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','De Havilland Vampire FB Mk 6','Position',[1 274 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','De Havilland Venom FB Mk 50','Position',[1 256 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Fairchild Republic A-10A','Position',[1 238 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','General Dynamics F-16C','Position',[1 220 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Grumman A-6A','Position',[1 202 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Hawker Hunter F(GA) Mk 9','Position',[1 184 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Hawker Siddeley Buccaneer S.2A','Position',[1 166 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Hawker Siddeley Harrier GR.3','Position',[1 148 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Hindustan HF-24 Marut Mk 1','Position',[1 130 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','McDonnell Douglas A-4M','Position',[1 112 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','McDonnell Douglas F-15C','Position',[1 94 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Mikoyan/Gurevich MiG-17F','Position',[1 76 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','Mikoyan MiG-19S','Position',[1 58 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','North American F-86F','Position',[1 40 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabC_N,'Style','edit','String','North American F-100','Position',[1 22 194 19],'Enable','off','FontWeight','Bold');
function fighterAirGround_aircraftNamesN_T
global fighterAirGroundTabN_T
uicontrol('Parent',fighterAirGroundTabN_T,'Style','edit','String','Northrop F-5A','Position',[1 346 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabN_T,'Style','edit','String','Soko J-1 Jastreb','Position',[1 328 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabN_T,'Style','edit','String','SUD-Aviation Vautour IIA','Position',[1 310 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabN_T,'Style','edit','String','Sukhoi Su-7B','Position',[1 292 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',fighterAirGroundTabN_T,'Style','edit','String','Sukhoi Su-17M4','Position',[1 274 194 19],'Enable','off','FontWeight','Bold');

%% Military Trainer
function militaryTrainer
global missionRequirementsTab range payload cruiseMach ROC takeoffLength serviceCeiling...
    maximumMach combatTime combatRadius

% Panel
militaryTrainer = uipanel('Parent',missionRequirementsTab,'Title','Military Trainer','FontSize',12,'Position',[.01 .74 .98 .2]);

% Ferry Range
uicontrol('Parent',militaryTrainer,'Style','text','String','Range','Position',[28 88 35 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',militaryTrainer,'Style','text','String','NM','Position',[70 65 25 25]);

% Combat Radius
% uicontrol('Parent',militaryTrainer,'Style','text','String','Combat Radius','Position',[100 88 80 25]);
% uicontrol('Parent',militaryTrainer,'Style','edit','String',combatRadius,'Position',[115 75 45 20],'Callback',@txtbox_combatRadius_Callback);
% uicontrol('Parent',militaryTrainer,'Style','text','String','NM','Position',[160 65 25 25]);

% Payload
uicontrol('Parent',militaryTrainer,'Style','text','String','Payload','Position',[137 88 50 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',payload,'Position',[140 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',militaryTrainer,'Style','text','String','lbs','Position',[190 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',militaryTrainer,'Style','text','String','Cruise Mach Number','Position',[225 88 135 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',cruiseMach,'Position',[270 75 45 20],'Callback',@txtbox_cruiseMach_Callback);

% Maximum Mach Number
uicontrol('Parent',militaryTrainer,'Style','text','String','Maximum Mach Number','Position',[375 88 120 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',maximumMach,'Position',[410 75 45 20],'Callback',@txtbox_maximumMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',militaryTrainer,'Style','text','String','Rate of Climb','Position',[10 35 70 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',ROC,'Position',[25 20 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',militaryTrainer,'Style','text','String','ft/min','Position',[70 12 35 25]);

% Takeoff Length
uicontrol('Parent',militaryTrainer,'Style','text','String','Takeoff Length','Position',[115 35 100 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',takeoffLength,'Position',[140 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',militaryTrainer,'Style','text','String','ft','Position',[190 12 15 25]);
        
% Service Ceiling
uicontrol('Parent',militaryTrainer,'Style','text','String','Service Ceiling','Position',[250 35 80 25]);
uicontrol('Parent',militaryTrainer,'Style','edit','String',serviceCeiling,'Position',[270 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',militaryTrainer,'Style','text','String','ft','Position',[315 12 15 25]);

% Combat Time
% uicontrol('Parent',militaryTrainer,'Style','text','String','Combat Time','Position',[270 35 80 25]);
% uicontrol('Parent',militaryTrainer,'Style','edit','String',combatTime,'Position',[290 20 45 20],'Callback',@txtbox_combatTime_Callback);
% uicontrol('Parent',militaryTrainer,'Style','text','String','min','Position',[340 12 20 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',militaryTrainer,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',militaryTrainer,'Style','edit','String','1.5 - 2','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');

% Type of Engine
uicontrol('Parent',militaryTrainer,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',militaryTrainer,'Style','text','String','Turbojet & Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function milTrainer_aircraftNames
global milTrainerTab
uicontrol('Parent',milTrainerTab,'Style','edit','String','Aermacchi M B 326GB','Position',[1 346 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Aero L-29 Delfin','Position',[1 328 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Aero L-39','Position',[1 310 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Aerospatiale C M 170','Position',[1 292 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Dassault/Dornier Alpha Jet','Position',[1 274 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Fuji T1','Position',[1 256 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Grumman TF-9J Cougar','Position',[1 238 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Hawker Siddeley Hawk 128','Position',[1 220 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Hindustan HJT-16 Mk 1','Position',[1 202 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Hispano HA-2200','Position',[1 184 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Lockheed T-33A','Position',[1 166 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Mikoyan/Gurevich MiG-15bis','Position',[1 148 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Mitsubishi T-2','Position',[1 130 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Morane-Saulnier 760 Paris I','Position',[1 112 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Northrop T-38A Talon','Position',[1 94 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Rockwell International T-2C','Position',[1 76 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Rockwell International T-39D','Position',[1 58 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','Soko G2-A Galeb','Position',[1 40 171 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',milTrainerTab,'Style','edit','String','WSK-Mielec TS-11 ISKRA','Position',[1 22 171 19],'Enable','off','FontWeight','Bold');

%% Military Bomber, and Transport
function militaryBomberTransport
global missionRequirementsTab range payload crew takeoffLength serviceCeiling...
    cruiseMach ROC

% Panel
milBombTransport = uipanel('Parent',missionRequirementsTab,'Title','Military Bomber, & Transport','FontSize',12,'Position',[.01 .74 .98 .2]);

% Range
uicontrol('Parent',milBombTransport,'Style','text','String','Range','Position',[28 88 35 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',milBombTransport,'Style','text','String','NM','Position',[70 65 25 25]);

% Payload
uicontrol('Parent',milBombTransport,'Style','text','String','Payload','Position',[137 88 50 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',payload,'Position',[140 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',milBombTransport,'Style','text','String','lbs','Position',[190 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',milBombTransport,'Style','text','String','Cruise Mach Number','Position',[225 88 130 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',cruiseMach,'Position',[270 75 45 20],'Callback',@txtbox_cruiseMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',milBombTransport,'Style','text','String','Rate of Climb','Position',[335 88 150 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',ROC,'Position',[390 75 45 20],'Callback',@txtbox_ROC_Callback,'Visible','on');
uicontrol('Parent',milBombTransport,'Style','text','String','ft/min','Position',[435 65 35 25]);

% Crew
uicontrol('Parent',milBombTransport,'Style','text','String','Crew','Position',[25 35 50 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',crew,'Position',[25 20 45 20],'Callback',@txtbox_crew_Callback);

% Takeoff Length
uicontrol('Parent',milBombTransport,'Style','text','String','Takeoff Length','Position',[100 35 130 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',takeoffLength,'Position',[140 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',milBombTransport,'Style','text','String','ft','Position',[185 12 15 25]);

% Service Ceiling
uicontrol('Parent',milBombTransport,'Style','text','String','Service Ceiling','Position',[220 35 130 25]);
uicontrol('Parent',milBombTransport,'Style','edit','String',serviceCeiling,'Position',[270 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',milBombTransport,'Style','text','String','ft','Position',[315 12 15 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',milBombTransport,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',milBombTransport,'Style','edit','String','6 - 9','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');
uicontrol('Parent',milBombTransport,'Style','text','String','*Supersonic Jets AR: 1.5 - 2.5','Position',[520 50 170 20],'Fontsize',9,'Enable','off');

% Type of Engine
uicontrol('Parent',milBombTransport,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',milBombTransport,'Style','text','String','Turbojet or Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function milBombTransport_aircraftNamesB_T
global bomberTabB_T
uicontrol('Parent',bomberTabB_T,'Style','edit','String','BAC VC10 Model 1106','Position',[1 346 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Boeing B-52','Position',[1 328 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Boeing C-17 Globemaster III','Position',[1 310 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Boeing KC-135A','Position',[1 292 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Boeing T-43A','Position',[1 274 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Boeing VC-137C','Position',[1 256 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Dassault Mirage IV-A','Position',[1 238 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Douglas EA-3B','Position',[1 220 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Douglas EB-66C','Position',[1 202 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','English Electric Canberra B Mk 6','Position',[1 184 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Handley Page Victor K Mk 2','Position',[1 166 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Hawker Siddeley Vulcan B.2','Position',[1 148 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Ilyushin II-28','Position',[1 130 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Kawasaki C-1','Position',[1 112 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Lockheed C-5A','Position',[1 94 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Martin B-57B','Position',[1 76 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Myasishchev M-4','Position',[1 58 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Rockwell B-1B','Position',[1 40 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',bomberTabB_T,'Style','edit','String','Tupolev Tu-16','Position',[1 22 194 19],'Enable','off','FontWeight','Bold');
function milBombTransport_aircraftNamesT_Y
global bomberTabT_Y
uicontrol('Parent',bomberTabT_Y,'Style','edit','String','Tupolev Tu-22','Position',[1 346 194 19],'Enable','off','FontWeight','Bold');

%% Military Patrol and Reconnaissance
function militaryPatrolRecon
global missionRequirementsTab range payload crew takeoffLength serviceCeiling...
    cruiseMach ROC

% Panel
milPatrolRecon = uipanel('Parent',missionRequirementsTab,'Title','Military Patrol, and Reconnaissance','FontSize',12,'Position',[.01 .74 .98 .2]);

% Range
uicontrol('Parent',milPatrolRecon,'Style','text','String','Range','Position',[28 88 35 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',milPatrolRecon,'Style','text','String','NM','Position',[70 65 25 25]);

% Payload
uicontrol('Parent',milPatrolRecon,'Style','text','String','Payload','Position',[137 88 50 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',payload,'Position',[140 75 45 20],'Callback',@txtbox_payload_Callback);
uicontrol('Parent',milPatrolRecon,'Style','text','String','lbs','Position',[190 65 25 25]);

% Cruise Mach Number
uicontrol('Parent',milPatrolRecon,'Style','text','String','Cruise Mach Number','Position',[225 88 130 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',cruiseMach,'Position',[270 75 45 20],'Callback',@txtbox_cruiseMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',milPatrolRecon,'Style','text','String','Rate of Climb','Position',[335 88 150 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',ROC,'Position',[390 75 45 20],'Callback',@txtbox_ROC_Callback,'Visible','on');
uicontrol('Parent',milPatrolRecon,'Style','text','String','ft/min','Position',[435 65 35 25]);

% Crew
uicontrol('Parent',milPatrolRecon,'Style','text','String','Crew','Position',[25 35 50 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',crew,'Position',[25 20 45 20],'Callback',@txtbox_crew_Callback);

% Takeoff Length
uicontrol('Parent',milPatrolRecon,'Style','text','String','Takeoff Length','Position',[100 35 130 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',takeoffLength,'Position',[140 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',milPatrolRecon,'Style','text','String','ft','Position',[185 12 15 25]);

% Service Ceiling
uicontrol('Parent',milPatrolRecon,'Style','text','String','Service Ceiling','Position',[220 35 130 25]);
uicontrol('Parent',milPatrolRecon,'Style','edit','String',serviceCeiling,'Position',[270 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',milPatrolRecon,'Style','text','String','ft','Position',[315 12 15 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',milPatrolRecon,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',milPatrolRecon,'Style','edit','String','6 - 9','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');
uicontrol('Parent',milPatrolRecon,'Style','text','String','*Supersonic Jets AR: 1.5 - 2.5','Position',[520 50 170 20],'Fontsize',9,'Enable','off');

% Type of Engine
uicontrol('Parent',milPatrolRecon,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',milPatrolRecon,'Style','text','String','Turbojet or Low-Bypass Turbofan','Position',[490 5 200 20],'Fontsize',9,'Fontweight','Bold');
function milPatrolRecon_aircraftNames
global patrolTab
uicontrol('Parent',patrolTab,'Style','edit','String','Boeing E-3A Sentry','Position',[1 346 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',patrolTab,'Style','edit','String','Grumman EA-6B Prowler','Position',[1 328 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',patrolTab,'Style','edit','String','Hawker Siddeley Nimrod MR Mk 1','Position',[1 310 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',patrolTab,'Style','edit','String','Lockheed S-3A','Position',[1 292 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',patrolTab,'Style','edit','String','Lockheed SR-71A','Position',[1 274 194 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',patrolTab,'Style','edit','String','Lockheed U2S','Position',[1 256 194 19],'Enable','off','FontWeight','Bold');

%% Passenger Jet
function passengerJet
global missionRequirementsTab serviceCeiling range cruiseMach passengers...
    crew ROC takeoffLength cruiseVelocity

% Panel
passengerJet = uipanel('Parent',missionRequirementsTab,'Title','Passenger Jet','FontSize',12,'Position',[.01 .74 .98 .2]);

% Range
uicontrol('Parent',passengerJet,'Style','text','String','Range','Position',[25 88 50 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',passengerJet,'Style','text','String','NM','Position',[70 65 25 25]);

% Passengers
uicontrol('Parent',passengerJet,'Style','text','String','Passengers','Position',[130 88 60 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',passengers,'Position',[140 75 45 20],'Callback',@txtbox_passengers_Callback);

% Cruise Mach Number
uicontrol('Parent',passengerJet,'Style','text','String','Cruise Mach Number','Position',[225 88 130 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',cruiseMach,'Position',[270 75 45 20],'Callback',@txtbox_cruiseMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',passengerJet,'Style','text','String','Rate of Climb','Position',[360 88 130 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',ROC,'Position',[400 75 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',passengerJet,'Style','text','String','ft/min','Position',[445 65 35 25]);

% Crew
uicontrol('Parent',passengerJet,'Style','text','String','Crew','Position',[25 35 50 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',crew,'Position',[25 20 45 20],'Callback',@txtbox_crew_Callback);

% Takeoff Length
uicontrol('Parent',passengerJet,'Style','text','String','Takeoff Length','Position',[115 35 100 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',takeoffLength,'Position',[140 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',passengerJet,'Style','text','String','ft','Position',[185 12 15 25]);

% Service Ceiling
uicontrol('Parent',passengerJet,'Style','text','String','Service Ceiling','Position',[225 35 130 25]);
uicontrol('Parent',passengerJet,'Style','edit','String',serviceCeiling,'Position',[270 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',passengerJet,'Style','text','String','ft','Position',[315 12 15 25]);

% if isempty(serviceCeiling) ~= 1
%     altitude;
%     uicontrol('Parent',passengerJet,'Style','text','String',cruiseVelocity,'Position',[320 75 45 20]);
% end

% Wing Aspect Ratio Range
uicontrol('Parent',passengerJet,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',passengerJet,'Style','edit','String','6 - 9','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');
uicontrol('Parent',passengerJet,'Style','text','String','*Supersonic Jets AR: 1.5 - 2','Position',[520 50 170 20],'Fontsize',9,'Enable','off');

% Type of Engine
uicontrol('Parent',passengerJet,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',passengerJet,'Style','text','String','High-Bypass Turbofan','Position',[500 5 200 20],'Fontsize',9,'Fontweight','Bold');
function passengerJet_aircraftNamesA_H
global passengerTabA_H
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Aerospatiale SE 210 Caravelle 12','Position',[1 346 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Aerospatiale/BAC Concorde','Position',[1 328 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Airbus A-300B2','Position',[1 310 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','BAC One-Eleven Series 475','Position',[1 292 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','BAC One-Eleven Series 500','Position',[1 274 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','BAC 1151 Super VC10','Position',[1 256 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 707-120B','Position',[1 238 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 707-320B','Position',[1 220 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 727-100','Position',[1 202 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 727-200 Advanced','Position',[1 184 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 737-100','Position',[1 166 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 737-200','Position',[1 148 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Boeing 747-200B','Position',[1 130 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Convair 880-M','Position',[1 112 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Convair 990A Coronado','Position',[1 94 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Dassault Mercure 100','Position',[1 76 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','De Havilland Comet 4C','Position',[1 58 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Fokker F28 Fellowship Mk 2000','Position',[1 40 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabA_H,'Style','edit','String','Hawker Siddeley Trident 2E','Position',[1 22 205 19],'Enable','off','FontWeight','Bold');
function passengerJet_aircraftNamesH_Y
global passengerTabH_Y
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Hawker Siddeley Trident 3B','Position',[1 346 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Ilyushin II-62M-200','Position',[1 328 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Lockheed L-1011-1 Tristar','Position',[1 310 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','McDonnell Douglas DC-8 Series 50','Position',[1 292 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','McDonnell Douglas DC-8 Super 63','Position',[1 274 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','McDonnell Douglas DC-9 Series 40','Position',[1 256 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','McDonnell Douglas DC-10 Series 30','Position',[1 238 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Tupolev Tu-104B','Position',[1 220 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Tupolev Tu-124V','Position',[1 202 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Tupolev Tu-134','Position',[1 184 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Tupolev Tu-144','Position',[1 166 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Tupolev Tu-154B-2','Position',[1 148 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','VFW-Fokker VFW 614','Position',[1 130 205 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',passengerTabH_Y,'Style','edit','String','Yakovlev Yak-40','Position',[1 112 205 19],'Enable','off','FontWeight','Bold');

%% Business Jet
function businessJet
global missionRequirementsTab range cruiseMach passengers ROC takeoffLength...
    serviceCeiling crew

% Panel
businessJet = uipanel('Parent',missionRequirementsTab,'Title','Business Jet','FontSize',12,'Position',[.01 .74 .98 .2]);

% Range
uicontrol('Parent',businessJet,'Style','text','String','Range','Position',[25 88 50 25]);
uicontrol('Parent',businessJet,'Style','edit','String',range,'Position',[25 75 45 20],'Callback',@txtbox_range_Callback);
uicontrol('Parent',businessJet,'Style','text','String','NM','Position',[70 65 25 25]);

% Passengers
uicontrol('Parent',businessJet,'Style','text','String','Passengers','Position',[95 88 130 25]);
uicontrol('Parent',businessJet,'Style','edit','String',passengers,'Position',[140 75 45 20],'Callback',@txtbox_passengers_Callback,'Visible','on');

% Cruise Mach Number
uicontrol('Parent',businessJet,'Style','text','String','Cruise Mach Number','Position',[225 88 130 25]);
uicontrol('Parent',businessJet,'Style','edit','String',cruiseMach,'Position',[270 75 45 20],'Callback',@txtbox_cruiseMach_Callback,'Visible','on');

% Rate of Climb
uicontrol('Parent',businessJet,'Style','text','String','Rate of Climb','Position',[360 88 120 25]);
uicontrol('Parent',businessJet,'Style','edit','String',ROC,'Position',[400 75 45 20],'Callback',@txtbox_ROC_Callback);
uicontrol('Parent',businessJet,'Style','text','String','ft/min','Position',[445 65 35 25]);

% Crew
uicontrol('Parent',businessJet,'Style','text','String','Crew','Position',[25 35 50 25]);
uicontrol('Parent',businessJet,'Style','edit','String',crew,'Position',[25 20 45 20],'Callback',@txtbox_crew_Callback);

% Takeoff Length
uicontrol('Parent',businessJet,'Style','text','String','Takeoff Length','Position',[100 35 130 25]);
uicontrol('Parent',businessJet,'Style','edit','String',takeoffLength,'Position',[140 20 45 20],'Callback',@txtbox_takeoffLength_Callback,'Visible','on');
uicontrol('Parent',businessJet,'Style','text','String','ft','Position',[185 12 15 25]);

% Service Ceiling
uicontrol('Parent',businessJet,'Style','text','String','Service Ceiling','Position',[225 35 130 25]);
uicontrol('Parent',businessJet,'Style','edit','String',serviceCeiling,'Position',[270 20 45 20],'Callback',@txtbox_serviceCeiling_Callback);
uicontrol('Parent',businessJet,'Style','text','String','ft','Position',[315 12 15 25]);

% Wing Aspect Ratio Range
uicontrol('Parent',businessJet,'Style','text','String','Typical Wing Aspect Ratio(AR):','Position',[500 85 200 30],'Fontsize',9);
uicontrol('Parent',businessJet,'Style','edit','String','5 - 6','Position',[580 75 55 20],'Fontsize',10,'Enable','off','Fontweight','Bold');
uicontrol('Parent',businessJet,'Style','text','String','*Supersonic Jets AR: 1.5 - 2.5','Position',[520 50 170 20],'Fontsize',9,'Enable','off');

% Type of Engine
uicontrol('Parent',businessJet,'Style','text','String','Typical Engines are:','Position',[500 15 200 30],'Fontsize',9);
uicontrol('Parent',businessJet,'Style','text','String','High-Bypass Turbofan','Position',[500 5 200 20],'Fontsize',9,'Fontweight','Bold');
function businessJet_aircraftNames
global businessTab
uicontrol('Parent',businessTab,'Style','edit','String','Aerospatiale SN 601 Corvette','Position',[1 346 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Cessna Citation 500','Position',[1 328 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Dassault Falcon 20','Position',[1 310 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Gates Learjet 25C','Position',[1 292 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Grumman Gulfstream II','Position',[1 274 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Hawker Siddeley 125 Series 600B','Position',[1 256 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','IAI 1123 Westwind','Position',[1 238 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Lockheed Jetstar','Position',[1 220 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','MBB HFB 320 Hansa','Position',[1 202 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Piaggio PD-808','Position',[1 184 182 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',businessTab,'Style','edit','String','Rockwell Sabreliner Series 60a','Position',[1 166 182 19],'Enable','off','FontWeight','Bold');

%% Aircraft Type
function popupmenu_aircraftType_Callback(source,~)
global aircraftType modWTO waitbarFig
  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
      case 'Fighter (Air-Air)'
          aircraftType = 1;
          fighterAirAir;
      case 'Fighter (Multipurpose)'
          aircraftType = 2;
          fighterMulti;
      case 'Fighter (Air-Ground)'
          aircraftType = 3;
          fighterAirGround;
      case 'Military Trainer'
          aircraftType = 4;
          militaryTrainer;
      case 'Military Bomber and Transport'
          aircraftType = 5;
          militaryBomberTransport;
      case 'Military Patrol and Reconnaissance'
          aircraftType = 6;
          militaryPatrolRecon;
      case 'Passenger Jet'
          aircraftType = 7;
          passengerJet;
      case 'Business Jet'
          aircraftType = 8;
          businessJet;
  end
selectedWTO;
similarAircraftTab;
similarAircraftSelection;
modWTO = [];
delete(waitbarFig);

% Similar Aircraft Table Tab
function similarAircraftTab
global missionRequirementsTab passengerTabA_H similarAircraftTabGroup aircraftType...
    passengerTabH_Y fighterAirAirTab fighterMultiTabB_S milTrainerTab...
    bomberTabB_T businessTab fighterAirGroundTabC_N fighterAirGroundTabN_T...
    fighterMultiTabS_Y patrolTab bomberTabT_Y

similarAircraftTabGroup = uitabgroup('Parent',missionRequirementsTab,'Position',[.01 .05 .98 .58]);
if aircraftType == 1
    fighterAirAirTab = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Air)');
elseif aircraftType == 2
    fighterMultiTabB_S = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Multipurpose) B-S');
    fighterMultiTabS_Y = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Multipurpose) S-Y');
elseif aircraftType == 3
    fighterAirGroundTabC_N = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Ground) C-N');
    fighterAirGroundTabN_T = uitab('Parent',similarAircraftTabGroup,'Title','Fighter (Air-Ground) N-T');
elseif aircraftType == 4
    milTrainerTab = uitab('Parent',similarAircraftTabGroup,'Title','Military Trainer');
elseif aircraftType == 5
    bomberTabB_T = uitab('Parent',similarAircraftTabGroup,'Title','Military Bomber, & Transport B-T');
    bomberTabT_Y = uitab('Parent',similarAircraftTabGroup,'Title','Military Bomber, & Transport T-Y');
elseif aircraftType == 6
    patrolTab = uitab('Parent',similarAircraftTabGroup,'Title','Military Patrol, and Reconnaissance');
elseif aircraftType == 7
    passengerTabA_H = uitab('Parent',similarAircraftTabGroup,'Title','Passenger Jet A-H');
    passengerTabH_Y = uitab('Parent',similarAircraftTabGroup,'Title','Passenger Jet H-Y');
elseif aircraftType == 8
    businessTab = uitab('Parent',similarAircraftTabGroup,'Title','Business Jet');
end

%% Similar Aircrft Table Selection
function similarAircraftSelection
global aircraftName numberOfAircraft missionRequirementsTab aircraftType...
    arrayRange arrayMaxSpeed arrayServiceCeiling arrayWTO arrayPayload...
    arrayPassengers arrayCrew arrayCruiseSpeed similarAircraftTable...
    arrayThrust arrayWingSpan arrayLength arrayCombatRadius arrayROC...
    fighterAirAirTab fighterMultiTabB_S milTrainerTab passengerTabA_H...
    bomberTabB_T passengerTabH_Y businessTab tab fighterAirGroundTabC_N...
    fighterAirGroundTabN_T fighterMultiTabS_Y patrolTab bomberTabT_Y...
    masterFile dataCollection

% Revert file access to master file
cd(masterFile);

% Access Aircraft Database
cd('Aircraft Database');

dataCollection = 0;

arrayPayload        = 0; 
arrayPassengers     = 0;
arrayCrew           = 0;
arrayRange          = 0; 
arrayCruiseSpeed    = 0; 
arrayMaxSpeed       = 0;
arrayServiceCeiling = 0; 
arrayROC            = 0; 
arrayCombatRadius   = 0;
arrayThrust         = 0; 
arrayWingSpan       = 0; 
arrayLength         = 0; 
arrayWTO            = 0;

if aircraftType == 1
    similarAircraftTable = uitable('Parent',fighterAirAirTab,'Position',[1 5 805 380]);
    aircraftWeightPerformanceData;
    similarAircraftTableArray = zeros(numberOfAircraft,9);
    for i = 1:numberOfAircraft
        similarAircraftTableArray(i,:) = ([ arrayWTO(i) arrayRange(i) arrayCombatRadius(i)...
            arrayMaxSpeed(i) arrayServiceCeiling(i) arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
    end

    similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

    RowName = zeros(numberOfAircraft,1);
    RowNamestr = num2cell(RowName);
    for i = 1:numberOfAircraft
        RowNamestr(i) = aircraftName(i);
    end

    ColumnWidth = zeros(1,9);
    ColumnWidthstr = num2cell(ColumnWidth);
    for i = 1:9
        ColumnWidthstr(i) = {'auto'};
    end

    similarAircraftTable.Data = similarAircraftTableArrayCell;
    similarAircraftTable.ColumnName = {'Takeoff Weight [lbs]'; 'Ferry Range [NM]';...
        'Combat Radius [NM]'; 'Max Speed [knots]'; 'Service Ceiling [ft]'; 'Rate of Climb [ft/min]';...
        'Thrust [lbs]'; 'Wing Span [ft]'; 'Fuselage Length [ft]';};
    similarAircraftTable.ColumnWidth = ColumnWidthstr;
    similarAircraftTable.RowName = RowNamestr;
    similarAircraftTable.FontSize = 9;  
    similarAircraftTable.ColumnFormat = {'short','short','short','short'}; 
    similarAircraftTable.FontWeight = 'bold';
        
elseif aircraftType == 2
    for j = 1:2
        if j == 1
            tab = 1;
            similarAircraftTable = uitable('Parent',fighterMultiTabB_S,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        elseif j == 2
            tab = 2;
            similarAircraftTable = uitable('Parent',fighterMultiTabS_Y,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        end
        similarAircraftTableArray = zeros(numberOfAircraft,9);
        for i = 1:numberOfAircraft
            similarAircraftTableArray(i,:) = ([ arrayWTO(i) arrayRange(i) arrayCombatRadius(i)...
                arrayMaxSpeed(i) arrayServiceCeiling(i) arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
        end

        similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

        RowName = zeros(numberOfAircraft,1);
        RowNamestr = num2cell(RowName);
        for i = 1:numberOfAircraft
            RowNamestr(i) = aircraftName(i);
        end

        ColumnWidth = zeros(1,9);
        ColumnWidthstr = num2cell(ColumnWidth);
        for i = 1:9
            ColumnWidthstr(i) = {'auto'};
        end

        similarAircraftTable.Data = similarAircraftTableArrayCell;
        similarAircraftTable.ColumnName = {'Takeoff Weight [lbs]'; 'Ferry Range [NM]';...
            'Combat Radius [NM]'; 'Max Speed [knots]'; 'Service Ceiling [ft]'; 'Rate of Climb [ft/min]';...
            'Thrust [lbs]'; 'Wing Span [ft]'; 'Fuselage Length [ft]';};
        similarAircraftTable.ColumnWidth = ColumnWidthstr;
        similarAircraftTable.RowName = RowNamestr;
        similarAircraftTable.FontSize = 9;
        similarAircraftTable.ColumnFormat = {'short','short','short','short'}; 
        similarAircraftTable.FontWeight = 'bold';
    end
    
elseif aircraftType == 3
    for j = 1:2
        if j == 1
            tab = 1;
            similarAircraftTable = uitable('Parent',fighterAirGroundTabC_N,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        elseif j == 2
            tab = 2;
            similarAircraftTable = uitable('Parent',fighterAirGroundTabN_T,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        end
%         aircraftWeightPerformanceData;
        similarAircraftTableArray = zeros(numberOfAircraft,9);
        for i = 1:numberOfAircraft
            similarAircraftTableArray(i,:) = ([ arrayWTO(i) arrayRange(i) arrayCombatRadius(i)...
                arrayMaxSpeed(i) arrayServiceCeiling(i) arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
        end

        similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

        RowName = zeros(numberOfAircraft,1);
        RowNamestr = num2cell(RowName);
        for i = 1:numberOfAircraft
            RowNamestr(i) = aircraftName(i);
        end

        ColumnWidth = zeros(1,9);
        ColumnWidthstr = num2cell(ColumnWidth);
        for i = 1:9
            ColumnWidthstr(i) = {'auto'};
        end

        similarAircraftTable.Data = similarAircraftTableArrayCell;
        similarAircraftTable.ColumnName = {'Takeoff Weight [lbs]'; 'Ferry Range [NM]';...
            'Combat Radius [NM]'; 'Max Speed [knots]'; 'Service Ceiling [ft]'; 'Rate of Climb [ft/min]';...
            'Thrust [lbs]'; 'Wing Span [ft]'; 'Fuselage Length [ft]';};
        similarAircraftTable.ColumnWidth = ColumnWidthstr;
        similarAircraftTable.RowName = RowNamestr;
        similarAircraftTable.FontSize = 9;  
        similarAircraftTable.ColumnFormat = {'short','short','short','short'}; 
        similarAircraftTable.FontWeight = 'bold';
    end

elseif aircraftType == 4
    similarAircraftTable = uitable('Parent',milTrainerTab,'Position',[1 5 805 380]);
    aircraftWeightPerformanceData;
    similarAircraftTableArray = zeros(numberOfAircraft,8);
    for i = 1:numberOfAircraft
        similarAircraftTableArray(i,:) = ([ arrayWTO(i) arrayRange(i) arrayMaxSpeed(i)...
             arrayServiceCeiling(i) arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
    end

    similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

    RowName = zeros(numberOfAircraft,1);
    RowNamestr = num2cell(RowName);
    for i = 1:numberOfAircraft
        RowNamestr(i) = aircraftName(i);
    end

    ColumnWidth = zeros(1,8);
    ColumnWidthstr = num2cell(ColumnWidth);
    for i = 1:8
        ColumnWidthstr(i) = {'auto'};
    end

    similarAircraftTable.Data = similarAircraftTableArrayCell;
    similarAircraftTable.ColumnName = {'Takeoff Weight [lbs]'; 'Range [NM]';...
        'Max Speed [knots]'; 'Service Ceiling [ft]'; 'Rate of Climb [ft/min]';...
        'Thrust [lbs]'; 'Wing Span [ft]'; 'Fuselage Length [ft]';};
    similarAircraftTable.ColumnWidth = ColumnWidthstr;
    similarAircraftTable.RowName = RowNamestr;
    similarAircraftTable.FontSize = 9;  
    similarAircraftTable.ColumnFormat = {'short','short','short','short'}; 
    similarAircraftTable.FontWeight = 'bold';
    
elseif aircraftType == 5
    for j = 1:2
        if j == 1
            tab = 1;
            similarAircraftTable = uitable('Parent',bomberTabB_T,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        elseif j == 2
            tab = 2;
            similarAircraftTable = uitable('Parent',bomberTabT_Y,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        end
    similarAircraftTableArray = zeros(numberOfAircraft,8);
    for i = 1:numberOfAircraft
        similarAircraftTableArray(i,:) = ([arrayWTO(i) arrayPayload(i) arrayRange(i)...
            arrayCruiseSpeed(i) arrayServiceCeiling(i)  arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
    end

    similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

    RowName = zeros(numberOfAircraft,1);
    RowNamestr = num2cell(RowName);
    for i = 1:numberOfAircraft
        RowNamestr(i) = aircraftName(i);
    end

    ColumnWidth = zeros(1,8);
    ColumnWidthstr = num2cell(ColumnWidth);
    for i = 1:8
        ColumnWidthstr(i) = {'auto'};
    end

    similarAircraftTable.Data = similarAircraftTableArrayCell;
    similarAircraftTable.ColumnName = { 'Takeoff Weight [lbs]'; 'Payload [lbs]';...
        'Range [NM]'; 'Cruise Speed [knots]'; 'Service Ceiling [ft]'; 'Thrust [lbs]';...
        'Wing Span [ft]'; 'Fuselage Length [ft]';};
    similarAircraftTable.ColumnWidth = ColumnWidthstr;
    similarAircraftTable.RowName = RowNamestr;    
    similarAircraftTable.FontWeight = 'bold';
    similarAircraftTable.FontSize = 9;  
    similarAircraftTable.ColumnFormat = {'short','short','short','short'};
    end
elseif aircraftType == 6
    similarAircraftTable = uitable('Parent',patrolTab,'Position',[1 5 805 380]);
    aircraftWeightPerformanceData;
    similarAircraftTableArray = zeros(numberOfAircraft,8);
    for i = 1:numberOfAircraft
        similarAircraftTableArray(i,:) = ([arrayWTO(i) arrayPayload(i) arrayRange(i)...
            arrayCruiseSpeed(i) arrayServiceCeiling(i)  arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
    end

    similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

    RowName = zeros(numberOfAircraft,1);
    RowNamestr = num2cell(RowName);
    for i = 1:numberOfAircraft
        RowNamestr(i) = aircraftName(i);
    end

    ColumnWidth = zeros(1,8);
    ColumnWidthstr = num2cell(ColumnWidth);
    for i = 1:8
        ColumnWidthstr(i) = {'auto'};
    end

    similarAircraftTable.Data = similarAircraftTableArrayCell;
    similarAircraftTable.ColumnName = { 'Takeoff Weight [lbs]'; 'Payload [lbs]';...
        'Range [NM]'; 'Cruise Speed [knots]'; 'Service Ceiling [ft]'; 'Thrust [lbs]';...
        'Wing Span [ft]'; 'Fuselage Length [ft]';};
    similarAircraftTable.ColumnWidth = ColumnWidthstr;
    similarAircraftTable.RowName = RowNamestr;    
    similarAircraftTable.FontWeight = 'bold';
    similarAircraftTable.FontSize = 9;  
    similarAircraftTable.ColumnFormat = {'short','short','short','short'};

elseif aircraftType == 7
    for j = 1:2
        if j == 1
            tab = 1;
            similarAircraftTable = uitable('Parent',passengerTabA_H,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        elseif j == 2
            tab = 2;
            similarAircraftTable = uitable('Parent',passengerTabH_Y,'Position',[1 5 805 380]);
            aircraftWeightPerformanceData;
        end
        
        similarAircraftTableArray = zeros(numberOfAircraft,10);
        for i = 1:numberOfAircraft
            similarAircraftTableArray(i,:) = ([arrayWTO(i) arrayPassengers(i)...
                arrayCrew(i) arrayRange(i) arrayCruiseSpeed(i) arrayServiceCeiling(i)...
                arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
        end

        similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

        RowName = zeros(numberOfAircraft,1);
        RowNamestr = num2cell(RowName);
        for i = 1:numberOfAircraft
            RowNamestr(i) = aircraftName(i);
        end

        ColumnWidth = zeros(1,10);
        ColumnWidthstr = num2cell(ColumnWidth);
        for i = 1:10
            ColumnWidthstr(i) = {'auto'};
        end

        similarAircraftTable.Data = similarAircraftTableArrayCell;
        similarAircraftTable.ColumnName = {'Takeoff Weight [lbs]'; 'Passengers';...
            'Crew'; 'Range [NM]'; 'Cruise Speed [knots]'; 'Service Ceiling [ft]';...
            'Rate of Climb [ft/min]'; 'Thrust [lb]'; 'Wing Span [ft]'; 'Fuselage length [ft]';};
        similarAircraftTable.ColumnWidth = ColumnWidthstr;
        similarAircraftTable.RowName = RowNamestr;
        similarAircraftTable.FontWeight = 'bold';
        similarAircraftTable.FontSize = 9;  
    end
elseif aircraftType == 8
    similarAircraftTable = uitable('Parent',businessTab,'Position',[1 5 805 380]);
    aircraftWeightPerformanceData;
    similarAircraftTableArray = zeros(numberOfAircraft,10);
    for i = 1:numberOfAircraft
        similarAircraftTableArray(i,:) = ([arrayWTO(i) arrayPassengers(i)...
            arrayCrew(i) arrayRange(i) arrayCruiseSpeed(i) arrayServiceCeiling(i)...
            arrayROC(i) arrayThrust(i) arrayWingSpan(i) arrayLength(i)]); 
    end

    similarAircraftTableArrayCell = num2cell(similarAircraftTableArray);

    RowName = zeros(numberOfAircraft,1);
    RowNamestr = num2cell(RowName);
    for i = 1:numberOfAircraft
        RowNamestr(i) = aircraftName(i);
    end

    ColumnWidth = zeros(1,10);
    ColumnWidthstr = num2cell(ColumnWidth);
    for i = 1:10
        ColumnWidthstr(i) = {'auto'};
    end

    similarAircraftTable.Data = similarAircraftTableArrayCell;
    similarAircraftTable.ColumnName = { 'Takeoff Weight [lbs]'; 'Passengers';...
        'Crew'; 'Range [NM]'; 'Cruise Speed [knots]'; 'Service Ceiling [ft]';...
        'Rate of Climb [ft/min]'; 'Thrust [lbs]';'Wing Span [ft]'; 'Fuselage Length [ft]';};
    similarAircraftTable.ColumnWidth = ColumnWidthstr;
    similarAircraftTable.RowName = RowNamestr;
    similarAircraftTable.FontWeight = 'bold';
    similarAircraftTable.FontSize = 9;
    similarAircraftTable.ColumnFormat = {'short','short','short','short'};
end

% Revert file access to master file
cd(masterFile);

% Access Mission Folder
cd('Mission');

if aircraftType == 1
    fighterAirAir_aircraftNames;
elseif aircraftType == 2
    fighterMulti_aircraftNamesB_S;
    fighterMulti_aircraftNamesS_Y;
elseif aircraftType == 3
    fighterAirGround_aircraftNamesC_N;
    fighterAirGround_aircraftNamesN_T;
elseif aircraftType == 4
    milTrainer_aircraftNames;
elseif aircraftType == 5
    milBombTransport_aircraftNamesB_T;
    milBombTransport_aircraftNamesT_Y;
elseif aircraftType == 6
    milPatrolRecon_aircraftNames;
elseif aircraftType == 7
    passengerJet_aircraftNamesA_H;
    passengerJet_aircraftNamesH_Y;
elseif aircraftType == 8
    businessJet_aircraftNames;
end

% Undefined values
uicontrol('Parent',missionRequirementsTab,'Style','text','String','*A value of 0 represents no data for that aircraft','Position',[10 8 270 19],'Enable','off','FontWeight','Bold');

% Selected Takeoff Weight from Similar Aircraft and Inputted Data
function selectedWTO
global missionRequirementsTab selectedWTO editButton initialARWing...
    initialWTO typeOfEngineMenu typeOfEngine waitbarFig

estimationWTO;

% Panels
selectedWTO = uipanel('Parent',missionRequirementsTab,'Title','Takeoff Weight Estimation','FontSize',12,'Position',[.01 .64 .98 .09]);

uicontrol('Parent',selectedWTO,'Style','text','String','WTO Guess: ','Position',[10 15 80 19],'Fontsize',10);
uicontrol('Parent',selectedWTO,'Style','edit','String',initialWTO,'Position',[88 15 55 20],'Enable','on','Enable','off');
uicontrol('Parent',selectedWTO,'Style','text','String','lbs','Position',[145 15 20 19],'Fontsize',10);

editButton = uicontrol('Parent',missionRequirementsTab,'Style','radio','String','Edit','Position',[180 491 40 19],'Callback',@radiobutton_edit_Callback);

uicontrol('Parent',selectedWTO,'Style','text','String','Wing AR: ','Position',[230 15 65 19],'Fontsize',10);
uicontrol('Parent',selectedWTO,'Style','edit','String',initialARWing,'Position',[290 15 30 20],'Enable','on','Callback',@txtbox_initialARWing_Callback);

uicontrol('Parent',selectedWTO,'Style','text','String','Engine Type','Position',[370 28 120 19],'Fontsize',9);
typeOfEngineMenu = uicontrol('Parent',selectedWTO,'Style','popupmenu','String',{'Select','Turbojet',...
    'Low-Bypass Turbofan','High-Bypass Turbofan'},'Position',[360 10 140 19],'Fontsize',8,'Callback',@popupmenu_typeOfEngine_Callback);

if isempty(typeOfEngineMenu) ~= 1 && isempty(typeOfEngine) ~= 1
    typeOfEngineMenu.Value = typeOfEngine + 1;
    delete(waitbarFig);
    WTOestimate;
else
    % do nothing
end

%% Final Takeoff Weight Estimate
function WTOestimate
global WTO selectedWTO masterFile waitbarFig

% Revert file access to master file
cd(masterFile);

% Access Mission Folder
cd('Mission');

% Load Takeoff Weight Estimation
takeoffWeightEstimation;

uicontrol('Parent',selectedWTO,'Style','text','String','WTO Estimate: ','Position',[515 15 100 19],'Fontsize',10);
uicontrol('Parent',selectedWTO,'Style','edit','String',WTO,'Position',[610 15 55 20],'Enable','off');
uicontrol('Parent',selectedWTO,'Style','text','String','lbs','Position',[670 15 20 19],'Fontsize',10);
delete(waitbarFig);

% Edit Takeoff Weight
function radiobutton_edit_Callback(~,~)
global selectedWTO editButton modWTO initialWTO
if editButton.Value == 1
    if isempty(modWTO) == 1
        uicontrol('Parent',selectedWTO,'Style','edit','String',initialWTO,'Position',[88 15 55 20],'Enable','on','Callback',@txtbox_modWTO_Callback);
    else
        uicontrol('Parent',selectedWTO,'Style','edit','String',modWTO,'Position',[88 15 55 20],'Enable','on','Callback',@txtbox_modWTO_Callback);
    end
elseif editButton.Value == 0
    if isempty(modWTO) == 1
        uicontrol('Parent',selectedWTO,'Style','edit','String',initialWTO,'Position',[88 15 55 20],'Enable','off');
    else
        uicontrol('Parent',selectedWTO,'Style','edit','String',modWTO,'Position',[88 15 55 20],'Enable','off');
    end
end

% Modified Takeoff Weight
function txtbox_modWTO_Callback(hObject,~)
global selectedWTO modWTO initialWTO editButton
modWTO = str2double(get(hObject,'String'));
initialWTO = modWTO;
takeoffWeightEstimation;
modWTO = initialWTO;
uicontrol('Parent',selectedWTO,'Style','edit','String',initialWTO,'Position',[88 15 55 20],'Enable','off');
editButton.Value = 0;

%% Estimating WTO from Similar Aircraft
function estimationWTO
global arrayWTO arrayCruiseSpeed arrayRange arrayPassengers...
    arrayCrew payload arrayROC arrayMaxSpeed arrayServiceCeiling...
    range passengers serviceCeiling ROC crew cruiseMach maxVelocity...
    aircraftType arrayPayload cruiseVelocity arrayWTO_sim arrayThrust arrayWingSpan...
    arrayLength maximumMach combatTime arrayRange_sim arrayServiceCeiling_sim...
    arrayMaxSpeed_sim  initialWTO initialARWing initialSFCDry dataCollection...
    masterFile combatRadius arrayCombatRadius caActivated arrayThrust_sim

arrayRange          = [];
arrayServiceCeiling = [];
arrayCruiseSpeed    = [];
arrayCombatRadius   = [];
arrayMaxSpeed       = [];
arrayPassengers     = [];
arrayCrew           = [];
arrayROC            = [];
arrayPayload        = [];
arrayThrust         = [];
arrayWingSpan       = [];
arrayLength         = [];
arrayWTO            = [];

dataCollection = 1;

% % Revert file access to master file
% cd(masterFile);
% 
% % Access Aircraft Database Folder
% cd('Aircraft Database');
% 
% % Load Aircraft Weight and Performance Data file
% aircraftWeightPerformanceData;

%% Fighters----------------------------------------------------------------
if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    if isempty(range) ~= 1 && isempty(payload) ~= 1 && isempty(combatTime) ~= 1 &&...
            isempty(maximumMach) ~= 1 && isempty(ROC) ~= 1 && isempty(serviceCeiling) ~= 1
        
        % Revert file access to master file
        cd(masterFile);

        % Access Aircraft Database Folder
        cd('Aircraft Database');

        % Load Aircraft Weight and Performance Data file
        aircraftWeightPerformanceData;
             
        % Revert file access to master file
        cd(masterFile);
        
        % Access Data folder
        cd('Data');
        
        % Load altitude file
        altitude;
        
        % Revert file access back to master file
        cd(masterFile);
        
        % Access Mission Folder
        cd('Mission');
        
        % Find aircraft with similar range
        findZeros = arrayRange == 0;
        arrayRange(findZeros) = [];
        arrayRange_sim = find(abs(arrayRange - range) == min(abs(arrayRange - range)));
        
        if length(arrayRange_sim) > 1
            arrayRange_sim(2:end) = [];
        end

        % Find aircraft with similar service ceiling
        findZeros = arrayServiceCeiling == 0;
        arrayServiceCeiling(findZeros) = [];
        arrayServiceCeiling_sim = find(abs(arrayServiceCeiling - serviceCeiling) == min(abs(arrayServiceCeiling - serviceCeiling)));
        
        if length(arrayServiceCeiling_sim) > 1
            arrayServiceCeiling_sim(2:end) = [];
        end

        % Find aircraft with similar max speed
        findZeros = arrayMaxSpeed == 0;
        arrayMaxSpeed(findZeros) = [];
        arrayMaxSpeed_sim = find(abs(arrayMaxSpeed - maxVelocity) == min(abs(arrayMaxSpeed - maxVelocity)));
        
        if length(arrayMaxSpeed_sim) > 1
            arrayMaxSpeed_sim(2:end) = [];
        end
        
        % Combat Radius of similar aircraft for takeoff weight estimate
        findZeros = arrayCombatRadius == 0;
        arrayCombatRadius(findZeros) = [];
        arrayCombatRadius_sim = find(abs(arrayCombatRadius - combatRadius) == min(abs(arrayCombatRadius - combatRadius)));
        
        if length(arrayCombatRadius_sim) > 1
            arrayCombatRadius_sim(2:end) = [];
        end
        
        % Rate of Climb(ROC) of similar aircraft for takeoff weight
        % estimate
        findZeros = arrayROC == 0;
        arrayROC(findZeros) = [];
        arrayROC_sim = find(abs(arrayROC - ROC) == min(abs(arrayROC - ROC)));
        
        if length(arrayROC_sim) > 1
            arrayROC_sim(2:end) = [];
        end
        
        % WTO of similar aircraft
        arrayWTO_sim = (arrayWTO(arrayRange_sim) + arrayWTO(arrayServiceCeiling_sim)...
            + arrayWTO(arrayMaxSpeed_sim) + arrayWTO(arrayCombatRadius_sim) + arrayWTO(arrayROC_sim))/5;
                
        % Takeoff Weight Estimate
        initialWTO = round(mean(arrayWTO_sim));
        
        % Thrust of similar aircraft for takeoff weight estimate
        findZeros = arrayThrust == 0;
        arrayThrust(findZeros) = [];
        similarWTO = abs(arrayWTO-arrayWTO_sim);
        [~,inc] = min(similarWTO);
        arrayThrust_sim = arrayThrust(inc);
        
        if isempty(initialARWing) ~= 1 && isempty(initialSFCDry) ~= 1
            takeoffWeightEstimation;
        end
    end
%% Military Trainers-------------------------------------------------------
elseif aircraftType == 4
    if isempty(range) ~= 1 && isempty(payload) ~= 1 && isempty(maximumMach) ~= 1 &&...
             isempty(ROC) ~= 1 && isempty(serviceCeiling) ~= 1
         
         % Revert file access to master file
        cd(masterFile);

        % Access Aircraft Database Folder
        cd('Aircraft Database');

        % Load Aircraft Weight and Performance Data file
        aircraftWeightPerformanceData;
             
        % Revert file access to master file
        cd(masterFile);
        
        % Access Data folder
        cd('Data');
        
        % Load altitude file
        altitude;
        
        % Revert file access back to master file
        cd(masterFile);
        
        % Access Mission Folder
        cd('Mission');
        
        % Find aircraft with similar range
        findZeros = arrayRange == 0;
        arrayRange(findZeros) = [];
        arrayRange_sim = find(abs(arrayRange - range) == min(abs(arrayRange - range)));
        
        if length(arrayRange_sim) > 1
            arrayRange_sim(2:end) = [];
        end

        % Find aircraft with similar service ceiling
        findZeros = arrayServiceCeiling == 0;
        arrayServiceCeiling(findZeros) = [];
        arrayServiceCeiling_sim = find(abs(arrayServiceCeiling - serviceCeiling) == min(abs(arrayServiceCeiling - serviceCeiling)));
        
        if length(arrayServiceCeiling_sim) > 1
            arrayServiceCeiling_sim(2:end) = [];
        end

        % Find aircraft with similar max speed
        findZeros = arrayMaxSpeed == 0;
        arrayMaxSpeed(findZeros) = [];
        arrayMaxSpeed_sim = find(abs(arrayMaxSpeed - maxVelocity) == min(abs(arrayMaxSpeed - maxVelocity)));
        
        if length(arrayMaxSpeed_sim) > 1
            arrayMaxSpeed_sim(2:end) = [];
        end
        
        % Rate of Climb(ROC) of similar aircraft for takeoff weight
        % estimate
        findZeros = arrayROC == 0;
        arrayROC(findZeros) = [];
        arrayROC_sim = find(abs(arrayROC - ROC) == min(abs(arrayROC - ROC)));
        
        if length(arrayROC_sim) > 1
            arrayROC_sim(2:end) = [];
        end

        % WTO of similar aircraft
        arrayWTO_sim = (arrayWTO(arrayRange_sim) + arrayWTO(arrayServiceCeiling_sim) + arrayWTO(arrayMaxSpeed_sim) + arrayWTO(arrayROC_sim))/5;
        
        % Takeoff Weight Estimate
        initialWTO = round(mean(arrayWTO_sim));
        if isempty(initialARWing) ~= 1 && isempty(initialSFCDry) ~= 1
            takeoffWeightEstimation;
        end
    end
%% Military Bomber, and Transport Aircraft-------------------------
elseif aircraftType == 5
    if isempty(range) ~= 1 && isempty(payload) ~= 1 && isempty(cruiseMach) ~= 1 &&...
             isempty(ROC) ~= 1 && isempty(serviceCeiling) ~= 1
         
         % Revert file access to master file
        cd(masterFile);

        % Access Aircraft Database Folder
        cd('Aircraft Database');

        % Load Aircraft Weight and Performance Data file
        aircraftWeightPerformanceData;
         
        % Revert file access to master file
        cd(masterFile);
        
        % Access Data folder
        cd('Data');
        
        % Load altitude file
        altitude;
        
        % Revert file access back to master file
        cd(masterFile);
        
        % Access Mission Folder
        cd('Mission');
        
        % Find aircraft with similar range
        findZeros = arrayRange == 0;
        arrayRange(findZeros) = [];
        arrayRange_sim = find(abs(arrayRange - range) == min(abs(arrayRange - range)));
        
        if length(arrayRange_sim) > 1
            arrayRange_sim(2:end) = [];
        end

        % Find aircraft with similar service ceiling
        findZeros = arrayServiceCeiling == 0;
        arrayServiceCeiling(findZeros) = [];
        arrayServiceCeiling_sim = find(abs(arrayServiceCeiling - serviceCeiling) == min(abs(arrayServiceCeiling - serviceCeiling)));
        
        if length(arrayServiceCeiling_sim) > 1
            arrayServiceCeiling_sim(2:end) = [];
        end

        % Find aircraft with similar cruise speed
        findZeros = arrayCruiseSpeed == 0;
        arrayCruiseSpeed(findZeros) = [];
        arrayCruiseSpeed_sim = find(abs(arrayCruiseSpeed - cruiseVelocity) == min(abs(arrayCruiseSpeed - cruiseVelocity)));
        
        if length(arrayCruiseSpeed_sim) > 1
            arrayCruiseSpeed_sim(2:end) = [];
        end

        % Find aircraft with similar payload weight
        findZeros = arrayPayload == 0;
        arrayPayload(findZeros) = [];
        arrayPayload_sim = find(abs(arrayPayload - payload) == min(abs(arrayPayload - payload)));
        
        if length(arrayPayload_sim) > 1
            arrayPayload_sim(2:end) = [];
        end

        % WTO of similar aircraft
        arrayWTO_sim = (arrayWTO(arrayRange_sim) + arrayWTO(arrayServiceCeiling_sim) + arrayWTO(arrayCruiseSpeed_sim) + arrayWTO(arrayPayload_sim))/4;

        % Takeoff Weight Estimate
        initialWTO = mean(arrayWTO_sim);
        if isempty(initialARWing) ~= 1 && isempty(initialSFCDry) ~= 1
            takeoffWeightEstimation;
        end
    end
%% Military Patrol, and Reconnisance---------------------------------------
elseif aircraftType == 6
    if isempty(range) ~= 1 && isempty(payload) ~= 1 && isempty(cruiseMach) ~= 1 &&...
             isempty(serviceCeiling) ~= 1
         
         % Revert file access to master file
        cd(masterFile);

        % Access Aircraft Database Folder
        cd('Aircraft Database');

        % Load Aircraft Weight and Performance Data file
        aircraftWeightPerformanceData;
             
        % Revert file access to master file
        cd(masterFile);
        
        % Access Data folder
        cd('Data');
        
        % Load altitude file
        altitude;
        
        % Revert file access back to master file
        cd(masterFile);
        
        % Access Mission Folder
        cd('Mission');
        
        % Find aircraft with similar range
        findZeros = arrayRange == 0;
        arrayRange(findZeros) = [];
        arrayRange_sim = find(abs(arrayRange - range) == min(abs(arrayRange - range)));
        
        if length(arrayRange_sim) > 1
            arrayRange_sim(2:end) = [];
        end

        % Find aircraft with similar service ceiling
        findZeros = arrayServiceCeiling == 0;
        arrayServiceCeiling(findZeros) = [];
        arrayServiceCeiling_sim = find(abs(arrayServiceCeiling - serviceCeiling) == min(abs(arrayServiceCeiling - serviceCeiling)));
        
        if length(arrayServiceCeiling_sim) > 1
            arrayServiceCeiling_sim(2:end) = [];
        end

        % Find aircraft with similar cruise speed
        findZeros = arrayCruiseSpeed == 0;
        arrayCruiseSpeed(findZeros) = [];
        arrayCruiseSpeed_sim = find(abs(arrayCruiseSpeed - cruiseVelocity) == min(abs(arrayCruiseSpeed - cruiseVelocity)));
        
        if length(arrayCruiseSpeed_sim) > 1
            arrayCruiseSpeed_sim(2:end) = [];
        end

        % Find aircraft with similar payload weight
        findZeros = arrayPayload == 0;
        arrayPayload(findZeros) = [];
        arrayPayload_sim = find(abs(arrayPayload - payload) == min(abs(arrayPayload - payload)));
        
        if length(arrayPayload_sim) > 1
            arrayPayload_sim(2:end) = [];
        end

        % Rate of Climb(ROC) of similar aircraft for takeoff weight
        % estimate
        findZeros = arrayROC == 0;
        arrayROC(findZeros) = [];
        arrayROC_sim = find(abs(arrayROC - ROC) == min(abs(arrayROC - ROC)));
        
        if length(arrayROC_sim) > 1
            arrayROC_sim(2:end) = [];
        end
        
        % WTO of similar aircraft
        arrayWTO_sim = (arrayWTO(arrayRange_sim) + arrayWTO(arrayServiceCeiling_sim)...
            + arrayWTO(arrayCruiseSpeed_sim) + arrayWTO(arrayPayload_sim) + arrayWTO(arrayROC_sim))/5;

        % Takeoff Weight Estimate
        initialWTO = mean(arrayWTO_sim);
        if isempty(initialARWing) ~= 1 && isempty(initialSFCDry) ~= 1
            takeoffWeightEstimation;
        end
    end
%% Passenger Jet and Business Jet------------------------------------------    
elseif aircraftType == 7 || aircraftType == 8
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(ROC) ~= 1 && ...
                 isempty(serviceCeiling) ~= 1 && isempty(passengers) ~= 1 && isempty(crew) ~= 1
             
        % Revert file access to master file
        cd(masterFile);

        % Access Aircraft Database Folder
        cd('Aircraft Database');

        % Load Aircraft Weight and Performance Data file
        aircraftWeightPerformanceData;
             
        % Revert file access to master file
        cd(masterFile);
        
        % Access Data folder
        cd('Data');
        
        % Load altitude file
        altitude;
        
        % Revert file access back to master file
        cd(masterFile);
        
        % Access Mission Folder
        cd('Mission');
        
        % Find aircraft with similar range
        findZeros = arrayRange == 0;
        arrayRange(findZeros) = [];
        arrayRange_sim = find(abs(arrayRange - range) == min(abs(arrayRange - range)));
        
        if length(arrayRange_sim) > 1
            arrayRange_sim(2:end) = [];
        end

        % Find aircraft with similar service ceiling
        findZeros = arrayServiceCeiling == 0;
        arrayServiceCeiling(findZeros) = [];
        arrayServiceCeiling_sim = find(abs(arrayServiceCeiling - serviceCeiling) == min(abs(arrayServiceCeiling - serviceCeiling)));
        
        if length(arrayServiceCeiling_sim) > 1
            arrayServiceCeiling_sim(2:end) = [];
        end
        
        % Find aircraft with similar cruise speed
        findZeros = arrayCruiseSpeed == 0;
        arrayCruiseSpeed(findZeros) = [];
        arrayCruiseSpeed_sim = find(abs(arrayCruiseSpeed - cruiseVelocity) == min(abs(arrayCruiseSpeed - cruiseVelocity)));
        
        if length(arrayCruiseSpeed_sim) > 1
            arrayCruiseSpeed_sim(2:end) = [];
        end

        % Find aircraft with similar number of passengers
        findZeros = arrayPassengers == 0;
        arrayPassengers(findZeros) = [];
        arrayPassengers_sim = find(abs(arrayPassengers - passengers) == min(abs(arrayPassengers - passengers)));
        
        if length(arrayPassengers_sim) > 1
            arrayPassengers_sim(2:end) = [];
        end
        
        % Find aircraft with similar rate of climb (ROC)
        findZeros = arrayROC == 0;
        arrayROC(findZeros) = [];
        arrayROC_sim = find(abs(arrayROC - ROC) == min(abs(arrayROC - ROC)));
        
        if length(arrayROC_sim) > 1
            arrayROC_sim(2:end) = [];
        end

        % WTO of similar aircraft
        arrayWTO_sim = (arrayWTO(arrayRange_sim) + arrayWTO(arrayServiceCeiling_sim)...
            + arrayWTO(arrayCruiseSpeed_sim) + arrayWTO(arrayPassengers_sim) + arrayWTO(arrayROC_sim))/5;

        % Takeoff Weight Estimate
        initialWTO = mean(arrayWTO_sim);
        if isempty(initialARWing) ~= 1 && isempty(initialSFCDry) ~= 1
            takeoffWeightEstimation;
        end
    end
end

% Activate Constraint Analysis
caActivated = 0;

function selectedConstraintAnalysisTab(~,~,~)
global caActivated masterFile
if isempty(caActivated) == 1 || caActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Mission folder
    cd('Mission');

    % Load Constraint Analysis
    constraintAnalysis;
end

% Pop-Up Menu
function popupmenu_typeOfEngine_Callback(hObject,~)
global initialSFCDry initialARWing aircraftType initialWTO_S initialCLmaxTO...
    initialCLmaxL caActivated typeOfEngine noWaitBoxFig

% Show waitbox figure when choose engine
noWaitBoxFig = 0;

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case 'Turbojet'
        initialSFCDry = .9;
        typeOfEngine = 1;
    case 'Low-Bypass Turbofan'
        initialSFCDry = .8;
        typeOfEngine = 2;
    case 'High-Bypass Turbofan'
        initialSFCDry = .5;
        typeOfEngine = 3;
end
if isempty(initialARWing) ~= 1
    WTOestimate;
end
if aircraftType == 1
    initialWTO_S   = 50;
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
elseif aircraftType == 2
    initialWTO_S   = 120;
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
elseif aircraftType == 3
    initialWTO_S   = 65;
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
elseif aircraftType == 4
    initialWTO_S   = 30;
    initialCLmaxTO = 1.4;
    initialCLmaxL  = 1.6;
elseif aircraftType == 5 || aircraftType == 6
    initialWTO_S   = 110;
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
elseif aircraftType == 7
    initialWTO_S   = 110;
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
elseif aircraftType == 8
    initialWTO_S   = 50;
    initialCLmaxTO = 1.6;
    initialCLmaxL  = 1.6;
end

% Textboxes
function txtbox_range_Callback(hObject,~)
global range cruiseMach serviceCeiling aircraftType passengers crew modWTO...
    initialARWing noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
range = str2double(get(hObject,'string'));
if aircraftType == 7 || aircraftType == 8
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1 &&...
            isempty(passengers) ~= 1 && isempty(crew) ~= 1
        estimationWTO;
    end
else
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1 &&...
            isempty(initialARWing) ~= 1
        estimationWTO;
    end
end
selectedWTO;
modWTO = [];

function txtbox_cruiseMach_Callback(hObject,~)
global cruiseMach range takeoffLength serviceCeiling aircraftType passengers crew...
     modWTO initialARWing masterFile noWaitBoxFig
 
% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
cruiseMach = str2double(get(hObject,'string'));
if aircraftType == 7 || aircraftType == 8
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(takeoffLength) ~= 1 &&...
            isempty(serviceCeiling) ~= 1 && isempty(passengers) ~= 1 &&...
            isempty(crew) ~= 1
        
        % Revert file access to master file
        cd(masterFile);

        % Access Data folder
        cd('Data');
        altitude;
        
        % Revert file access to master file
        cd(masterFile);

        % Access Mission folder
        cd('Mission');
        estimationWTO;
    end
else
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(takeoffLength) ~= 1 &&...
            isempty(serviceCeiling) ~= 1  && isempty(initialARWing) ~= 1
        
        % Revert file access to master file
        cd(masterFile);

        % Access Data folder
        cd('Data');
        altitude;
        
        % Revert file access to master file
        cd(masterFile);

        % Access Mission folder
        cd('Mission');
        estimationWTO;
    end
end
selectedWTO;
modWTO = [];

function txtbox_maximumMach_Callback(hObject,~)
global masterFile maximumMach cruiseMach range serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
maximumMach = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(maximumMach) ~= 1 &&...
        isempty(serviceCeiling) ~= 1
    % Revert file access to master file
        cd(masterFile);

        % Access Data folder
        cd('Data');
        altitude;
        
        % Revert file access to master file
        cd(masterFile);

        % Access Mission folder
        cd('Mission');
        estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_payload_Callback(hObject,~)
global payload range cruiseMach takeoffLength serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
payload = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(payload) ~= 1 &&...
        isempty(takeoffLength) ~= 1 && isempty(serviceCeiling) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_passengers_Callback(hObject,~)
global passengers range cruiseMach serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
passengers = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1 &&...
        isempty(passengers) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_crew_Callback(hObject,~)
global crew range cruiseMach serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
crew = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1 &&...
        isempty(crew) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_takeoffLength_Callback(hObject,~)
global range cruiseMach takeoffLength serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
takeoffLength = str2double(get(hObject,'String'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1
    estimationWTO 
end
selectedWTO;
modWTO = [];

function txtbox_serviceCeiling_Callback(hObject,~)
global serviceCeiling range cruiseMach aircraftType passengers crew modWTO...
    noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
serviceCeiling = str2double(get(hObject,'String'));
if aircraftType == 7 || aircraftType == 8
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1 &&...
            isempty(passengers) ~= 1 && isempty(crew) ~= 1
        estimationWTO;
    end
else
    if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(serviceCeiling) ~= 1
        estimationWTO
    end
end
selectedWTO;
modWTO = [];

function txtbox_ROC_Callback(hObject,~)
global ROC payload range cruiseMach takeoffLength serviceCeiling modWTO noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
ROC = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(payload) ~= 1 &&...
        isempty(takeoffLength) ~= 1 && isempty(serviceCeiling) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_combatTime_Callback(hObject,~)
global combatTime payload range cruiseMach takeoffLength serviceCeiling modWTO...
    noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
combatTime = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(payload) ~= 1 &&...
        isempty(takeoffLength) ~= 1 && isempty(serviceCeiling) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_combatRadius_Callback(hObject,~)
global combatRadius payload range cruiseMach takeoffLength serviceCeiling modWTO...
    noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
combatRadius = str2double(get(hObject,'string'));
if isempty(range) ~= 1 && isempty(cruiseMach) ~= 1 && isempty(payload) ~= 1 &&...
        isempty(takeoffLength) ~= 1 && isempty(serviceCeiling) ~= 1
    estimationWTO
end
selectedWTO;
modWTO = [];

function txtbox_initialARWing_Callback(hObject,~)
global initialARWing initialSFCDry caActivated noWaitBoxFig

% Ensure any waitbar figure is deleted
noWaitBoxFig = 1;
initialARWing = str2double(get(hObject,'String'));
if isempty(initialSFCDry) ~= 1
    WTOestimate
end
caActivated = 0;