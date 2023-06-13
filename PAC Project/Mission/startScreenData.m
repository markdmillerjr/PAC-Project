function startScreenData
% Written by Mark D. Miller Jr.
% 10/30/21

global startScreenPanel aircraftType aircraftTypeMenu masterFile

aircraftTypeMenu = uicontrol('Parent',startScreenPanel,'Style','popupmenu','String',{'Select',...
    'Fighter (Air-Air)','Fighter (Multipurpose)','Fighter (Air-Ground)','Military Trainer',...
    'Military Bomber and Transport','Military Patrol and Reconnaissance','Passenger Jet','Business Jet'},...
    'Position',[300 690 200 25],'Callback',@popupmenu_aircraftType_Callback);

% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Mission');

if aircraftType == 1
    missionParameters;
%     similarAircraftTab;
%     fighterAirAir;
%     fighterAirAir_aircraftNames;
    aircraftTypeMenu.Value = 2;
%     fighterExternalLoad_aircraftNamesH_P;
elseif aircraftType == 2
    missionParameters;
%     similarAircraftTab;
%     fighterMulti;
%     fighterMulti_aircraftNamesB_S;
    aircraftTypeMenu.Value = 3;
elseif aircraftType == 3
    missionParameters;
%     similarAircraftTab;
%     fighterAirGround;
%     fighterAirGround_aircraftNamesC_N;
%     fighterAirGround_aircraftNamesN_T;
    aircraftTypeMenu.Value = 4;
elseif aircraftType == 4
    missionParameters;
%     similarAircraftTab;
%     militaryTrainer;
%     milTrainer_aircraftNames
    aircraftTypeMenu.Value = 5;
elseif aircraftType == 5
    missionParameters;
%     similarAircraftTab;
%     militaryBomberTransport;
%     milBombTransport_aircraftNamesB_T;
    aircraftTypeMenu.Value = 6;
elseif aircraftType == 6
    missionParameters;
%     similarAircraftTab;
%     militaryPatrolRecon;
%     milPatrolRecon_aircraftNames;
    aircraftTypeMenu.Value = 7;
elseif aircraftType == 7
    missionParameters;
%     similarAircraftTab;
%     passengerJet;
%     passengerJet_aircraftNamesA_H;
%     passengerJet_aircraftNamesH_Y;
    aircraftTypeMenu.Value = 8;
elseif aircraftType == 8
    missionParameters;
%     similarAircraftTab;
%     businessJet;
%     businessJet_aircraftNames
    aircraftTypeMenu.Value = 9;
end