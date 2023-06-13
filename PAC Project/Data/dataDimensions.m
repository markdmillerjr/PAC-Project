function dataDimensions
% Written by Mark D. Miller Jr.
% 3/3/19

% Moved dataDimensions over to its own file and set up a new file named
% Data to compile everything together

global serviceCeil WTO maximumMach cruiseMach thrustDry thrustA_B TSFC...
    engineWeight bypassRatio overallPressureRatio

if isempty(serviceCeil) == 1 || isempty(maximumMach) == 1 || isempty(WTO) == 1 ||...
    isempty(cruiseMach) == 1 || isempty(thrustDry) == 1 || isempty(thrustA_B) == 1 ||...
    isempty(TSFC) == 1 || isempty(engineWeight) == 1 || isempty(bypassRatio) == 1 ||...
    isempty(overallPressureRatio) == 1

    serviceCeil = 60000;
    WTO = 20000;
    maximumMach = .6;
    cruiseMach = .2;
    thrustDry = 10000;
    thrustA_B = 15000;
    TSFC = .9;
    engineWeight = 500;
    bypassRatio  = .9;
    overallPressureRatio = .9;
end
wingDimensions;
horizontalTailDimensions;
verticalTailDimensions;
fuselageDimensions;
% aircraftWeight;
engineSpecifications;

%% Wing Dimensions
function wingDimensions
global cr_str ct_str b_str wingArea_str AR_str Gam_str LamLE_str tp_str...
    c tp b SrefWing ARWing Gam LamLE wingDimensionsPanel
% Wing Chord
        % Root
cr_str = num2str(c);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Root Chord:','Position',[10 125 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',cr_str,'Position',[85 125 45 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','ft','Position',[120 125 15 25]);
        % Tip
ct_str = num2str(c*tp);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Tip Chord:','Position',[10 110 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',ct_str,'Position',[85 110 45 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','ft','Position',[120 110 15 25]);

% Wing Span
b_str = num2str(b);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Span:','Position',[10 95 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',b_str,'Position',[85 95 45 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','ft','Position',[120 95 15 25]);

% Wing Area
SrefWing = (b/2)*c*(1+tp);
wingArea_str = num2str(SrefWing);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Area:','Position',[10 80 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',wingArea_str,'Position',[80 80 45 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','ft^2','Position',[120 80 35 25]);

% Aspect Ratio
ARWing = (b^2)/SrefWing;
AR_str = num2str(ARWing,'%3.2f');
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Aspect Ratio:','Position',[10 65 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',AR_str,'Position',[93 65 45 25]);

% Wing Dihedral
Gam_str = num2str(Gam);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Dihedral:','Position',[10 50 75 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',Gam_str,'Position',[80 50 55 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','deg','Position',[120 50 25 25]);

% Wing Sweep
LamLE_str = num2str(LamLE);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Sweep:','Position',[10 35 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',LamLE_str,'Position',[80 35 55 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','deg','Position',[120 35 25 25]);

% Wing Taper
tp_str = num2str(tp);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','Taper:','Position',[10 20 65 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String',tp_str,'Position',[85 20 45 25]);
uicontrol('Parent',wingDimensionsPanel,'Style','text','String','-','Position',[120 20 25 25]);

%% Horizontal Tail Dimensions
function horizontalTailDimensions
global crHorz_str ctHorz_str bHorz_str wingAreaHorz_str ARHorz_str GamHorz_str...
    LamLEHorz_str tpHorz_str cHorz tpHorz bHorz ARHorz SrefHorz GamHorz LamLEHorz...
    horzDimensionsPanel
    
% Horizontal Tail Chord
        % Root
crHorz_str = num2str(cHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Root Chord:','Position',[10 125 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',crHorz_str,'Position',[85 125 45 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','ft','Position',[120 125 15 25]);
        % Tip
ctHorz_str = num2str(cHorz*tpHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Tip Chord:','Position',[10 110 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',ctHorz_str,'Position',[85 110 45 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','ft','Position',[120 110 15 25]);

% Horizontal Tail Span
bHorz_str = num2str(bHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Span:','Position',[10 95 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',bHorz_str,'Position',[85 95 45 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','ft','Position',[120 95 15 25]);

% Horizontal Tail Area
SrefHorz = (bHorz/2)*cHorz*(1+tpHorz);
wingAreaHorz_str = num2str(SrefHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Area:','Position',[10 80 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',wingAreaHorz_str,'Position',[85 80 45 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','ft^2','Position',[120 80 20 25]);

% Aspect Ratio
ARHorz = bHorz^2/SrefHorz;
ARHorz_str = num2str(ARHorz,'%3.2f');
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Aspect Ratio:','Position',[10 65 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',ARHorz_str,'Position',[93 65 45 25]);

% Horizontal Tail Dihedral
GamHorz_str = num2str(GamHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Dihedral:','Position',[10 50 75 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',GamHorz_str,'Position',[80 50 55 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','deg','Position',[120 50 25 25]);

% Horizontal Tail Sweep
LamLEHorz_str = num2str(LamLEHorz);
    % Name
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Sweep:','Position',[10 35 65 25]);
    % Value
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',LamLEHorz_str,'Position',[80 35 55 25]);
    % Units
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','deg','Position',[120 35 25 25]);

% Horizontal Tail Taper
tpHorz_str = num2str(tpHorz);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','Taper:','Position',[10 20 65 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String',tpHorz_str,'Position',[85 20 45 25]);
uicontrol('Parent',horzDimensionsPanel,'Style','text','String','-','Position',[120 20 25 25]);

%% Vertical Tail Dimensions
function verticalTailDimensions
global crVert_str ctVert_str h_str wingAreaVert_str ARVert_str LamLEVert_str tpHorz_str...
    cVert tpVert height SrefVert ARVert LamLEVert vertDimensionsPanel
    
% Vertical Tail Chord
        % Root
crVert_str = num2str(cVert);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Root Chord:','Position',[10 125 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',crVert_str,'Position',[85 125 45 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','ft','Position',[120 125 15 25]);
        % Tip
ctVert_str = num2str(cVert*tpVert);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Tip Chord:','Position',[10 110 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',ctVert_str,'Position',[85 110 45 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','ft','Position',[120 110 15 25]);

% Vertical Tail Height
h_str = num2str(height);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Span:','Position',[10 95 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',h_str,'Position',[85 95 45 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','ft','Position',[120 95 15 25]);

% Vertical Tail Area
SrefVert = height*cVert*(1+tpVert);
wingAreaVert_str = num2str(SrefVert);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Area:','Position',[10 80 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',wingAreaVert_str,'Position',[85 80 45 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','ft^2','Position',[120 80 20 25]);

% Aspect Ratio
ARVert = height^2/SrefVert;
ARVert_str = num2str(ARVert,'%3.2f');
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Aspect Ratio:','Position',[10 65 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',ARVert_str,'Position',[93 65 45 25]);

% Vertical Tail Sweep
LamLEVert_str = num2str(LamLEVert);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Sweep:','Position',[10 50 50 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',LamLEVert_str,'Position',[80 50 55 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','deg','Position',[120 50 25 25]);

% Vertical Tail Taper
tpVert_str = num2str(tpVert);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','Taper:','Position',[10 35 65 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String',tpHorz_str,'Position',[85 35 45 25]);
uicontrol('Parent',vertDimensionsPanel,'Style','text','String','-','Position',[120 35 25 25]);

%% Fuselage Dimensions
function fuselageDimensions
global length_str radius_str nL_str tL_str L R nL tL fuseDimensionsPanel

% Fuselage Length
length_str = num2str(L);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Length:','Position',[10 125 65 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String',length_str,'Position',[85 125 55 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','ft','Position',[135 125 25 25]);

% Fuselage radius
radius_str = num2str(R);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Radius:','Position',[10 110 65 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String',radius_str,'Position',[85 110 55 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','ft','Position',[135 110 25 25]);

% Nosecone Length
nL_str = num2str(nL);
% Nosecone Title
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Nosecone:','Position',[10 95 65 25],'fontsize',9);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Length:','Position',[10 80 65 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String',nL_str,'Position',[85 80 55 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','ft','Position',[135 80 25 25]);

% Tailcone Length
tL_str = num2str(tL);
% Tailcone Title
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Tailcone:','Position',[10 65 65 25],'fontsize',9);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','Length:','Position',[10 50 65 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String',tL_str,'Position',[85 50 55 25]);
uicontrol('Parent',fuseDimensionsPanel,'Style','text','String','ft','Position',[135 50 25 25]);

% %% Aircraft Weight
% function aircraftWeight
% global weightPanel WTO
% % Aircraft type
% uicontrol('Parent',weightPanel,'Style','popupmenu','String',{'Select','Fighter Air-Air or X-Plane',...
%     'Fighter Multipurpose','Fighter Air-Ground','Bomber/Transport','Light General Aviation',...
%     'High-Altitude ISR','Sailplane'},...
%     'Position',[10 21 130 25],'Callback',@popupmenu_aircraftType_Callback);
% 
% % Weight
% uicontrol('Parent',weightPanel,'Style','text','String','Aircraft Type','Position',[0 48 90 20]);
% uicontrol('Parent',weightPanel,'Style','text','String','Takeoff Weight','Position',[120 45 120 25]);
% uicontrol('Parent',weightPanel,'Style','edit','String',WTO,'Position',[150 25 60 25],'Callback',@txtbox_takeoffWeight_Callback);
% uicontrol('Parent',weightPanel,'Style','text','String','lbs','Position',[210 20 25 25]);

% %% Mission Requirements
% function missionRequirements
% global missionPanel range endurance cruiseMach maximumMach serviceCeil
% % Range
% uicontrol('Parent',missionPanel,'Style','text','String','Range','Position',[8 47 35 25]);
% uicontrol('Parent',missionPanel,'Style','edit','String',range,'Position',[10 25 45 25],'Callback',@txtbox_range_Callback);
% uicontrol('Parent',missionPanel,'Style','text','String','NM','Position',[55 20 25 25]);
% 
% % Endurance
% uicontrol('Parent',missionPanel,'Style','text','String','Endurance','Position',[85 47 60 25]);
% uicontrol('Parent',missionPanel,'Style','edit','String',endurance,'Position',[95 25 35 25],'Callback',@txtbox_endurance_Callback);
% uicontrol('Parent',missionPanel,'Style','text','String','Hr','Position',[132 20 15 25]);
% 
% % Cruise Mach
% uicontrol('Parent',missionPanel,'Style','text','String','Cruise Mach','Position',[145 47 90 25]);
% uicontrol('Parent',missionPanel,'Style','edit','String',cruiseMach,'Position',[175 25 35 25],'Callback',@txtbox_cruiseMach_Callback);
% 
% % Maximum Mach
% uicontrol('Parent',missionPanel,'Style','text','String','Maximum Mach','Position',[220 47 120 25]);
% uicontrol('Parent',missionPanel,'Style','edit','String',maximumMach,'Position',[260 25 35 25],'Callback',@txtbox_maximumMach_Callback);
% 
% % Service Ceiling
% uicontrol('Parent',missionPanel,'Style','text','String','Service Ceiling','Position',[320 47 110 25]);
% uicontrol('Parent',missionPanel,'Style','edit','String',serviceCeil,'Position',[350 25 55 25],'Callback',@txtbox_serviceCeiling_Callback);
% uicontrol('Parent',missionPanel,'Style','text','String','ft','Position',[405 20 15 25]);

%% Engine Specifications
function engineSpecifications
global enginePanel thrustDry thrustA_B TSFC engineWeight engineLength...
    engineDiameter engineLengthJet engineOuterRadiusJet engineLengthProp...
    engineOuterRadiusProp type bypassRatio overallPressureRatio

if type == 0
    engineLength = engineLengthJet;
    engineDiameter = engineOuterRadiusJet*2;
elseif type == 1
    engineLength = engineLengthProp;
    engineDiameter = engineOuterRadiusProp*2;
end

% Thrust (Dry)
uicontrol('Parent',enginePanel,'Style','text','String','Thrust(Dry)','Position',[5 65 65 25]);
uicontrol('Parent',enginePanel,'Style','edit','String',thrustDry,'Position',[10 50 45 25],'Callback',@txtbox_thrustDry_Callback);
uicontrol('Parent',enginePanel,'Style','text','String','lbs','Position',[55 45 25 25]);

% Thrust (A/B)
uicontrol('Parent',enginePanel,'Style','text','String','Thrust(A/B)','Position',[75 65 65 25]);
uicontrol('Parent',enginePanel,'Style','edit','String',thrustA_B,'Position',[85 50 45 25],'Callback',@txtbox_thrustA_B_Callback);
uicontrol('Parent',enginePanel,'Style','text','String','lbs','Position',[130 45 25 25]);

% TSFC
uicontrol('Parent',enginePanel,'Style','text','String','TSFC','Position',[163 65 35 25],'Callback',@txtbox_TSFC_Callback);
uicontrol('Parent',enginePanel,'Style','edit','String',TSFC,'Position',[160 50 45 25]);

% Weight
uicontrol('Parent',enginePanel,'Style','text','String','Weight','Position',[220 65 35 25]);
uicontrol('Parent',enginePanel,'Style','edit','String',engineWeight,'Position',[220 50 45 25],'Callback',@txtbox_engineWeight_Callback);
uicontrol('Parent',enginePanel,'Style','text','String','lbs','Position',[265 45 25 25]);

% Length
uicontrol('Parent',enginePanel,'Style','text','String','Length','Position',[10 21 35 25]);
uicontrol('Parent',enginePanel,'Style','text','String',engineLength,'Position',[10 1 45 25],'Callback',@txtbox_engineLength_Callback);
uicontrol('Parent',enginePanel,'Style','text','String','ft','Position',[45 2 25 25]);

% Diameter
uicontrol('Parent',enginePanel,'Style','text','String','Diameter','Position',[85 21 45 25]);
uicontrol('Parent',enginePanel,'Style','text','String',engineDiameter,'Position',[85 1 45 25],'Callback',@txtbox_engineDiameter_Callback);
uicontrol('Parent',enginePanel,'Style','text','String','ft','Position',[120 2 25 25]);

% Bypass Ratio
uicontrol('Parent',enginePanel,'Style','text','String','Bypass Ratio','Position',[150 21 70 25]);
uicontrol('Parent',enginePanel,'Style','edit','String',bypassRatio,'Position',[160 5 45 25],'Callback',@txtbox_bypassRatio_Callback);

% Overall Pressure Ratio
uicontrol('Parent',enginePanel,'Style','text','String','Overall Pressure Ratio','Position',[215 21 120 25]);
uicontrol('Parent',enginePanel,'Style','edit','String',overallPressureRatio,'Position',[245 5 45 25],'Callback',@txtbox_overPressRatio_Callback);

%% Aircraft Weight
function popupmenu_aircraftType_Callback(source,~)
global Wempty WTO aircraftType
  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
      case 'Fighter Air-Air or X-plane'
          aircraftType = 1; % aircraftType 1 for fighter air-to-air or developmental
          Wempty = 1.2 * (WTO^.947);
      case 'Fighter Multipurpose'
          aircraftType = 2; % aircraftType 2 for fighter multipurpose
          Wempty = .911 * (WTO^.947);
      case 'Fighter Air-Ground'
          aircraftType = 3; % aircraftType 3 for fighter air-to-ground
          Wempty = .774 * (WTO^.947);
      case 'Bomber/Transport'
          aircraftType = 4; % aircraftType 4 for Bomber/Transport
          Wempty = .911 * (WTO^.947);
      case 'Light General Aviation'
          aircraftType = 5; % aircraftType 5 for Civil Aviation
          Wempty = .911 * (WTO^.947);
      case 'High-Altitude ISR'
          aircraftType = 6; % aircraftType 6 for ISR
          Wempty = .75 * (WTO^.947);
      case 'Sailplane'
          aircraftType = 7; % aircraftType 7 for Sailplane
          Wempty = .911 * (WTO^.947);
  end

function txtbox_takeoffWeight_Callback(hObject,~)
global WTO
WTO = str2double(get(hObject,'string'));

%% Mission Requirements
function txtbox_range_Callback(hObject,~)
global range
range = str2double(get(hObject,'string'));

function txtbox_endurance_Callback(hObject,~)
global endurance
endurance = str2double(get(hObject,'string'));

function txtbox_cruiseMach_Callback(hObject,~)
global cruiseMach
cruiseMach = str2double(get(hObject,'string'));
if cruiseMach >= 1
uiwait(msgbox('Supersonic conditions are not currently modeled','Supersonic Flight','help'))
end

function txtbox_maximumMach_Callback(hObject,~)
global maximumMach
maximumMach = str2double(get(hObject,'string'));
if maximumMach >= 1
uiwait(msgbox('Supersonic conditions are not currently modeled','Supersonic Flight','help'))
end
altitude;
dataPerformanceAnalysis;

function txtbox_serviceCeiling_Callback(hObject,~)
global serviceCeil
serviceCeil = str2double(get(hObject,'string'));
altitude;
% PsCalculations;
% PsPlot;
% minFuelClimbPlot
dataPerformanceAnalysis;

%% Engine Specifications
function txtbox_thrustDry_Callback(hObject,~)
global thrustDry
thrustDry = str2double(get(hObject,'string'));

function txtbox_thrustA_B_Callback(hObject,~)
global thrustA_B
thrustA_B = str2double(get(hObject,'string'));

function txtbox_TSFC_Callback(hObject,~)
global TSFC
TSFC = str2double(get(hObject,'string'));

function txtbox_engineWeight_Callback(hObject,~)
global engineWeight
engineWeight = str2double(get(hObject,'string'));

function txtbox_engineLength_Callback(hObject,~)
global engineLength
engineLength = str2double(get(hObject,'string'));

function txtbox_engineDiameter_Callback(hObject,~)
global engineDiameter
engineDiameter = str2double(get(hObject,'string'));

function txtbox_bypassRatio_Callback(hObject,~)
global bypassRatio
bypassRatio = str2double(get(hObject,'string'));

function txtbox_overPressRatio_Callback(hObject,~)
global overallPressureRatio
overallPressureRatio = str2double(get(hObject,'string'));
