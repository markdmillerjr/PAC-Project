function engineParameters
% Written by Mark D. Miller Jr.
% 1/23/19

global tab1 tab2 engineManufacturer engineDesignCriteriaPanel...
     engineModelPanel engineName engineParametersTab enpActivated masterFile...
     engineManufacturerNum 

enpActivated = 1; 
% Tabs
tabgp = uitabgroup('Parent',engineParametersTab,'Position',[.01 .01 .98 .99]);
tab1 = uitab('Parent',tabgp,'Title','Engine Selection');
tab2 = uitab('Parent',tabgp,'Title','Engine Data');

% Engine Design Criteria
engineDesignCriteriaPanel = uipanel('Parent',tab1,'Title','Engine Design Criteria','FontSize',10,'Position',[.01 .68 .3 .31]);

% Engine Model Panel
engineManufacturer_engineName = [engineManufacturer ' - ' engineName];
engineModelPanel = uipanel('Parent',tab1,'Title',{engineManufacturer_engineName},'FontSize',10,'Position',[.32 .68 .67 .22]);

% Construct the components.
% Engine Manufacturer
uicontrol('Parent',tab1,'Style','text','String','Engine Manufacturer','Position',[350 695 130 25],'Fontsize',10);

%% Popupmenus------------------------------------------------------------
% Engine Manufacturer
engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);

if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
    engineManufacturers.Value = engineManufacturerNum + 1;
else
    engineManufacturerNum = 0;
end

%% Static Texts------------------------------------------------------------
% Jet Engine Length
uicontrol('Parent',tab2,'Style','text','String','Length','Position',[250 680 90 25]);
    % Units
    uicontrol('Parent',tab2,'Style','text','String','ft','Position',[275 655 90 25]);
% Jet Engine Outer Radius
uicontrol('Parent',tab2,'Style','text','String','Outer Radius','Position',[340 680 90 25]);
    % Units
    uicontrol('Parent',tab2,'Style','text','String','ft','Position',[370 655 90 25]);

%% Pushbuttons-------------------------------------------------------------
% Jet
% Top
uicontrol('Parent',tab2,'Style','pushbutton','String','Top','Position',[575 95 60 20],'Callback',@pushbutton_topJet_Callback);    
% Front
uicontrol('Parent',tab2,'Style','pushbutton','String','Front','Position',[575 75 60 20],'Callback',@pushbutton_frontJet_Callback); 
% Side
uicontrol('Parent',tab2,'Style','pushbutton','String','Side','Position',[575 55 60 20],'Callback',@pushbutton_sideJet_Callback);   
% Isometric
uicontrol('Parent',tab2,'Style','pushbutton','String','Isometric','Position',[575 35 60 20],'Callback',@pushbutton_isoJet_Callback);    
% 3-Dimensional
uicontrol('Parent',tab2,'Style','pushbutton','String','3D View','Position',[650 95 60 20],'Callback',@pushbutton_3DJet_Callback);
% Zoom
uicontrol('Parent',tab2,'Style','pushbutton','String','Zoom','Position',[650 75 60 20],'Callback',@pushbutton_zoomJet_Callback);
% Zoom Reset
uicontrol('Parent',tab2,'Style','pushbutton','String','Zoom reset','Position',[650 55 60 20],'Callback',@pushbutton_zoom_resetJet_Callback);
% Pan
uicontrol('Parent',tab2,'Style','pushbutton','String','Pan','Position',[650 35 60 20],'Callback',@pushbutton_panJet_Callback);

engineRequirements;
if isempty(engineManufacturer) == 0
switch(engineManufacturer)
    case 'Honeywell'
        engineManufacturer = 'Honeywell';
        engineModelsHoneywell;
    case 'Rolls-Royce Allison'
        engineManufacturer = 'Rolls-Royce Allison';
        engineModelsRRA;
    case 'General Electric Aviation Engines'
        engineManufacturer = 'General Electric Aviation Engines';
        engineModelsGEAE;
    case 'CFM'
        engineManufacturer = 'CFM';
        engineModelsCFM;
    case 'Microturbo'
        engineManufacturer = 'Microturbo';
        engineModelsMicroturbo;
    case 'Pratt & Witney Aviation'
        engineManufacturer = 'Pratt & Witney Aviation';
        engineModelsPWA;
    case 'International Aero Engines'
        engineManufacturer = 'International Aero Engines';
        engineModelsIAE;
    case 'Rolls-Royce Turbomeca'
        engineManufacturer = 'Rolls-Royce Turbomeca';
        engineModelsRRT;
    case 'Teledyne CAE'
        engineManufacturer = 'Teledyne CAE';
        engineModelsTeledyneCAE;
    case 'Williams International'
        engineManufacturer = 'Williams International';
        engineModelsWI;  
end

% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');
engineData;
engineTab;
engineSelection;
engineParametersDrawingJet;
selectedEngineData;
end

% Engine Design Criteria
function engineRequirements
global engineDesignCriteriaPanel TSL_WTO WTO

% Required Thrust from selected design point
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String','Required Thrust from TSL/WTO:','Position',[10 120 130 80],'Fontsize',10);
uicontrol('Parent',engineDesignCriteriaPanel,'Style','edit','String',TSL_WTO*WTO,'Position',[142 170 65 25],'Fontsize',10,'enable','off');
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String','lbs','Position',[210 165 25 25],'Fontsize',10);

% Number of engines to meet thrust requirement
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String','Number of Engines Required','Position',[5 70 150 80],'Fontsize',10);
uicontrol('Parent',engineDesignCriteriaPanel,'Style','popupmenu','String',{'Select','1','2','3','4','6'},'Position',[145 120 50 25],'Enable','off','Callback',@popupmenu_numEngines_Callback);

% Search button that activates optimum search function to find engine that
% maximizes thrust and SFC, and minimizes weight
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String','Search for Optimum Engine','Position',[5 20 150 80],'Fontsize',10);
uicontrol('Parent',engineDesignCriteriaPanel,'Style','pushbutton','String','Search','Position',[145 75 50 25],'Fontsize',10,'Enable','off','Callback',@pushbutton_optimumSearch_Callback);

function popupmenu_numEngines_Callback(hObject,~)
global engineLimit engineDesignCriteriaPanel
str = hObject.String;
val = hObject.Value;

switch str{val}
    case '1'
        engineLimit = 1;
    case '2'
        engineLimit = 2;
    case '3'
        engineLimit = 3;
    case '4'
        engineLimit = 4;
    case '6'
        engineLimit = 6;
end
uicontrol('Parent',engineDesignCriteriaPanel,'Style','pushbutton','String','Search','Position',[145 75 50 25],'Fontsize',10,'Enable','on','Callback',@pushbutton_optimumSearch_Callback);

function pushbutton_optimumSearch_Callback(~,~)
global engineSearch arrayThrustDry arraySFCDry arrayWeight masterFile TSL_WTO WTO...
    arrayEngineNames optimumEngineThrust optimumEngineSFC optimumEngineWeight...
    optimumEngineName engineLimit engineManufacturerCallback engineManufacturer...
    engineManufacturerNum engineManufacturers tab1 engineModel errorFig

% Revert file access to master file
cd(masterFile);

% Access Wing folder
cd('Engine');

engineSearch = 1;
engineData;

% Target Engine Thrust
requiredThrust = ceil(TSL_WTO*WTO);
requiredThrustVector = ones(1,15)'*requiredThrust;
numberOfEngines = 1;
optimumInc = true(engineLimit,116)';
optimumThrust = zeros(engineLimit,15)';
optimumSFC    = zeros(engineLimit,15)';
optimumWeight = zeros(engineLimit,15)';
optimumNames  = string(zeros(engineLimit,15)');
findLimit     = zeros(engineLimit,15)';
limitOptimumThrust = zeros(engineLimit,15)';

% Find engines that meet the thrust requirements
for j = 1:engineLimit
    tolerance = .1;
    for i = 1:50
        optimumInc(:,j) = ismembertol(arrayThrustDry,requiredThrustVector/numberOfEngines,tolerance);
        sizeOptimum = arrayThrustDry(optimumInc(:,j));
        if length(sizeOptimum) >= 15
            tolerance = tolerance - .01;
        else
            break
        end
    end
    optimumThrust(:,j)    = [arrayThrustDry(optimumInc(:,j));zeros(1,15-length(arrayThrustDry(optimumInc(:,j))))'].*numberOfEngines;
    optimumSFC(:,j)       = [arraySFCDry(optimumInc(:,j));zeros(1,15-length(arrayThrustDry(optimumInc(:,j))))'].*numberOfEngines;
    optimumWeight(:,j)    = ceil([arrayWeight(optimumInc(:,j));zeros(1,15-length(arrayThrustDry(optimumInc(:,j))))'].*numberOfEngines);
    optimumNames(:,j)     = [arrayEngineNames(optimumInc(:,j));zeros(1,15-length(arrayEngineNames(optimumInc(:,j))))'];
    
    limitOptimumThrust(:,j) = optimumThrust(:,j)-requiredThrustVector;
    findLimit = find(limitOptimumThrust > 0);
    numberOfEngines = numberOfEngines + 1;
    
end
% numberOfEngines = numberOfEngines - 1;
limitOptimumThrust = optimumThrust(findLimit);
limitOptimumSFC    = optimumSFC(findLimit);
limitOptimumWeight = optimumWeight(findLimit);
limitOptimumNames  = optimumNames(findLimit);

meanOptimumSFC = mean(limitOptimumSFC);
pastMean       = limitOptimumSFC >= meanOptimumSFC;
pastMeanWeight = limitOptimumWeight(pastMean);
minWeight      = min(pastMeanWeight);
minWeightLoc = find(limitOptimumWeight == minWeight);

optimumEngineThrust = limitOptimumThrust(minWeightLoc);
optimumEngineSFC    = limitOptimumSFC(minWeightLoc);
optimumEngineWeight = limitOptimumWeight(minWeightLoc);
optimumEngineName   = limitOptimumNames(minWeightLoc);

if isempty(pastMean) ~= 1
    % Find manufacturer of optimum engine
    if length(optimumEngineThrust) > 1
        findMax = find(optimumEngineThrust == max(optimumEngineThrust));
        optimumEngineThrust = max(optimumEngineThrust);
        optimumEngineSFC    = optimumEngineSFC(findMax);
        optimumEngineWeight = optimumEngineWeight(findMax);
        optimumEngineName   = optimumEngineName(findMax);
    end
    opEngineLoc = find(arrayEngineNames==optimumEngineName);
else
    
% Variable for position of PAC's main window
% pos = get (gcf, 'position');
% 
% % Set variable to position on main window
% set(0, 'DefaultFigurePosition', pos);

errordlg('Number of engines is insufficient to generate required thrust','Error');

end

%% Honeywell---------------------------------------------------------------
if opEngineLoc <= 16
    % Honeywell
    engineManufacturerCallback = '(1) Honeywell';
    engineManufacturer = 'Honeywell';
    engineManufacturerNum = 1;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsHoneywell;
    
    popupmenu_engineModelsHoneywell_Callback(char(optimumEngineName));
    
    % Honeywell Engines
    engineManufacturerHoneywell = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','F109-GA-100',...
        'TFE731-20','TFE731-40','TFE731-5','TFE731-5A','TFE731-60','ATF3-3','ATF3-6A',...
        'CFE738-1-1B','F124-GA-100','F125-GA-100','AS907','AS977','LF507-1F','LF507-1H',...
        'ALF502L',},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsHoneywell_Callback);

    if isempty(engineManufacturerHoneywell) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerHoneywell.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% Rolls-Royce Allison-----------------------------------------------------    
elseif opEngineLoc >= 17 && opEngineLoc <= 24
    % Rolls-Royce Allison
    engineManufacturerCallback = '(2) Rolls-Royce Allison';
    engineManufacturer = 'Rolls-Royce Allison';
    engineManufacturerNum = 2;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsRRA;
    
    popupmenu_engineModelsRRA_Callback(char(optimumEngineName));
    
    % Rolls-Royce Allison
    engineManufacturerRRA = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','15S','150+',...
        '150(J104-AD-100)','120','AE2100','AE3007','AE3007A','AE3007C',},'Position',...
        [550 670 120 25],'Callback',@popupmenu_engineModelsRRA_Callback);

    if isempty(engineManufacturerRRA) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerRRA.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% General Electric Aviation Engines---------------------------------------
elseif opEngineLoc >=25 && opEngineLoc <= 46
    % General Electric Aviation Engines
    engineManufacturerCallback = '(3) General Electric Aviation Engines'; 
    engineManufacturer = 'General Electric Aviation Engines';
    engineManufacturerNum = 3;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsGEAE;
    
    popupmenu_engineModelsGEAE_Callback(char(optimumEngineName));
    
    % General Electric Aviation Engines
    engineManufacturerGEAE = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','CF700','J85-GE-13',...
        'J85-GE-17','J85-21','CFE738-1','TF34-GE-100','CF34-3','CF34-8C1','F101-GE-102',...
        'F110-GE-100','F110-GE-400','F110-GE-129','F110-GE-129EFE','F118-GE-100','F118-GE-101',...
        'F404/F1D2','F404/RM12','F404-GE-100D','F404-GE-400','F404-GE-402','F414-GE-400',...
        'TF-39-GE-1',},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsGEAE_Callback); 

    if isempty(engineManufacturerGEAE) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerGEAE.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% CFM---------------------------------------------------------------------
elseif opEngineLoc >= 47 && opEngineLoc <= 53
    % CFM
    engineManufacturerCallback = '(4) CFM';
    engineManufacturer = 'CFM';
    engineManufacturerNum = 4;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsCFM;
    
    popupmenu_engineModelsCFM_Callback(char(optimumEngineName));
    
    % CFM
    engineManufacturerCFM = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','CFM56-2','CFM56-3',...
        'CFM56-5-A1','CFM56-5C-2','CFM56-5C-3','CFM56-5C-4','CFM56-5B2',},'Position',...
        [550 670 120 25],'Callback',@popupmenu_engineModelsCFM_Callback);

    if isempty(engineManufacturerCFM) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerCFM.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% Microturbo--------------------------------------------------------------
elseif opEngineLoc >= 54 && opEngineLoc <= 61
    % Microturbo
    engineManufacturerCallback = '(5) Microturbo';
    engineManufacturer = 'Microturbo';
    engineManufacturerNum = 5;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsMicroturbo;
    
    popupmenu_engineModelsMicroturbo_Callback(char(optimumEngineName));
    
    % Microturbo
    engineManufacturerMicro = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','TRS 18',...
        'TRS 18-1','TRI 60-1','TRI 60-2','TRI 60-3','TRI 60-5','TRI 60-20','TRI 60-30',},...
        'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsMicroturbo_Callback);

    if isempty(engineManufacturerMicro) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerMicro.Value = engineModel+1;
    else
        engineModel = 0;
    end

%% Pratt-Witney Aviation---------------------------------------------------
elseif opEngineLoc >= 62 && opEngineLoc <= 84
    % Pratt-Witney Aviation
    engineManufacturerCallback = '(6) Pratt & Witney Aviation';
    engineManufacturer = 'Pratt & Witney Aviation';
    engineManufacturerNum = 6;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsPWA;
    
    popupmenu_engineModelsPWA_Callback(char(optimumEngineName));
    
    % Pratt & Witney Aviation
    engineManufacturerPWA = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','JT15D-5/5A',...
        'JT15D-5C TP','JT15D-5D','PW305A','PW305B','PW306/5(+5)','PW308A','PW535','PW600',...
        'F100-PW-100','F100-PW-200','F100-PW-220','F100-PW-220E','F100-PW-229','F100-PW-229A',...
        'PW2037','PW2040','PW2043','PW4052/4152','PW4056/4156','PW4060/4360','PW6122','PW6162'},...
        'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsPWA_Callback);

    if isempty(engineManufacturerPWA) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerPWA.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% International Aero Engines----------------------------------------------
elseif opEngineLoc >= 85 && opEngineLoc <= 93
    % International Aero Engines
    engineManufacturerCallback = '(7) International Aero Engines';
    engineManufacturer = 'International Aero Engines';
    engineManufacturerNum = 7;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsIAE;
    
    popupmenu_engineModelsIAE_Callback(char(optimumEngineName));
    
    % International Aero Engines(IAE)
    engineManufacturerIAE = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','V2500-A1',...
        'V2522-A5','V2524-A5','V2525-D5','V2527-A5','V528-D5','V2530-A5','V2530-D5','V2533-A5'},...
        'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsIAE_Callback);

    if isempty(engineManufacturerIAE) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerIAE.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% Rolls-Royce Turbomeca---------------------------------------------------
elseif opEngineLoc >= 94 && opEngineLoc <= 97
    % Rolls-Royce Turbomeca
    engineManufacturerCallback = '(8) Rolls-Royce Turbomeca';
    engineManufacturer = 'Rolls-Royce Turbomeca';
    engineManufacturerNum = 8;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsRRT;
    
    popupmenu_engineModelsRRT_Callback(char(optimumEngineName));
    
    % Rolls-Royce Turbomeca
   engineManufacturerRRT = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','Adour MK.861',...
        'Adour MK.871','Adour MK.811/815','BR700-710'},'Position',[550 670 120 25],...
        'Callback',@popupmenu_engineModelsRRT_Callback);

    if isempty(engineManufacturerRRT) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerRRT.Value = engineModel+1;
    else
        engineModel = 0;
    end

%% Teledyne CAE------------------------------------------------------------
elseif opEngineLoc >= 105 && opEngineLoc <= 112
    % Teledyne CAE
    engineManufacturerCallback = '(9) Teledyne CAE';
    engineManufacturer = 'Teledyne CAE';
    engineManufacturerNum = 9;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsTeledyneCAE;
    
    popupmenu_engineModelsTeledyneCAE_Callback(char(optimumEngineName));

    % Teledyne CAE
    engineManufacturerTeledyneCAE = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','304','305',...
        '312','J700-CA-400','320-1','320-2','J402-CA-700','J402-CA-400','370-9B',...
        'J402-CA-702','F408-CA-400','J69-T-25A','J69-T-29','J69-T-41A','J69-T-406'},...
        'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsTeledyneCAE_Callback);

    if isempty(engineManufacturerTeledyneCAE) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerTeledyneCAE.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
%% Williams International--------------------------------------------------
elseif opEngineLoc >= 113 && opEngineLoc <= 116
    % Williams International
    engineManufacturerCallback = '(10) Williams International';
    engineManufacturer = 'Williams International';
    engineManufacturerNum = 10;
    
    popupmenu_engineManufacturer_Callback(engineManufacturerCallback);
    
    % Engine Manufacturer
    engineManufacturers = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','(1) Honeywell','(2) Rolls-Royce Allison',...
    '(3) General Electric Aviation Engines','(4) CFM','(5) Microturbo','(6) Pratt & Witney Aviation','(7) International Aero Engines',...
    '(8) Rolls-Royce Turbomeca','(9) Teledyne CAE','(10) Williams International'},'Position',[310 670 200 25],'Callback',@popupmenu_engineManufacturer_Callback);
    
    if isempty(engineManufacturers) ~= 1 && isempty(engineManufacturerNum) ~= 1
        engineManufacturers.Value = engineManufacturerNum + 1;
    else
        engineManufacturerNum = 0;
    end
    
    engineModelsWI;
    
    popupmenu_engineModelsWI_Callback(char(optimumEngineName));
    
    % Williams International
    engineManufacturerWI = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','F107-WR-101',...
        'FJ44-1A','F112-WR-100','P8300'},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsWI_Callback);

    if isempty(engineManufacturerWI) ~= 1 && isempty(engineModel) ~= 1
        engineManufacturerWI.Value = engineModel+1;
    else
        engineModel = 0;
    end
    
end

engineManufacturerCallback = [];

% Display the optimum engine that meets the requirements
chosenOptimumEngine;

function chosenOptimumEngine
global engineDesignCriteriaPanel optimumEngineName
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String','Optimum Engine:','Position',[2 20 110 25],'Fontsize',10);
uicontrol('Parent',engineDesignCriteriaPanel,'Style','text','String',optimumEngineName,'Position',[110 20 110 25],'Fontsize',10);

% Engine Manufacturers
function popupmenu_engineManufacturer_Callback(hObject,~)
global engineManufacturer engineManufacturerNum engineModel masterFile...
    engineManufacturerCallback engineDesignCriteriaPanel

% Reset engine model to no selection
engineModel = 0;

% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

if isempty(engineManufacturerCallback) ~= 1
    switch engineManufacturerCallback
        case '(1) Honeywell'
            engineManufacturer = 'Honeywell';
            engineManufacturerNum = 1;
            engineModelsHoneywell;
        case '(2) Rolls-Royce Allison'
            engineManufacturer = 'Rolls-Royce Allison';
            engineManufacturerNum = 2;
            engineModelsRRA;
        case '(3) General Electric Aviation Engines'
            engineManufacturer = 'General Electric Aviation Engines';
            engineManufacturerNum = 3;
            engineModelsGEAE;
        case '(4) CFM'
            engineManufacturer = 'CFM';
            engineManufacturerNum = 4;
            engineModelsCFM;
        case '(5) Microturbo'
            engineManufacturer = 'Microturbo';
            engineManufacturerNum = 5;
            engineModelsMicroturbo;
        case '(6) Pratt & Witney Aviation'
            engineManufacturer = 'Pratt & Witney Aviation';
            engineManufacturerNum = 6;
            engineModelsPWA;
        case '(7) International Aero Engines'
            engineManufacturer = 'International Aero Engines';
            engineManufacturerNum = 7;
            engineModelsIAE;
        case '(8) Rolls-Royce Turbomeca'
            engineManufacturer = 'Rolls-Royce Turbomeca';
            engineManufacturerNum = 8;
            engineModelsRRT;
        case '(9) Teledyne CAE'
            engineManufacturer = 'Teledyne CAE';
            engineManufacturerNum = 9;
            engineModelsTeledyneCAE;
        case '(10) Williams International'
            engineManufacturer = 'Williams International';
            engineManufacturerNum = 10;
            engineModelsWI;  
    end
else
    % Determine the selected data set.
str = hObject.String;
val = hObject.Value;

    switch str{val}
        case '(1) Honeywell'
            engineManufacturer = 'Honeywell';
            engineManufacturerNum = 1;
            engineModelsHoneywell;
        case '(2) Rolls-Royce Allison'
            engineManufacturer = 'Rolls-Royce Allison';
            engineManufacturerNum = 2;
            engineModelsRRA;
        case '(3) General Electric Aviation Engines'
            engineManufacturer = 'General Electric Aviation Engines';
            engineManufacturerNum = 3;
            engineModelsGEAE;
        case '(4) CFM'
            engineManufacturer = 'CFM';
            engineManufacturerNum = 4;
            engineModelsCFM;
        case '(5) Microturbo'
            engineManufacturer = 'Microturbo';
            engineManufacturerNum = 5;
            engineModelsMicroturbo;
        case '(6) Pratt & Witney Aviation'
            engineManufacturer = 'Pratt & Witney Aviation';
            engineManufacturerNum = 6;
            engineModelsPWA;
        case '(7) International Aero Engines'
            engineManufacturer = 'International Aero Engines';
            engineManufacturerNum = 7;
            engineModelsIAE;
        case '(8) Rolls-Royce Turbomeca'
            engineManufacturer = 'Rolls-Royce Turbomeca';
            engineManufacturerNum = 8;
            engineModelsRRT;
        case '(9) Teledyne CAE'
            engineManufacturer = 'Teledyne CAE';
            engineManufacturerNum = 9;
            engineModelsTeledyneCAE;
        case '(10) Williams International'
            engineManufacturer = 'Williams International';
            engineManufacturerNum = 10;
            engineModelsWI;  
    end
end

% engineData;
engineTab;
engineSelection;
preEngineModelPanelFcn;

% Enable popupmenu after engine manufacturer is selected
uicontrol('Parent',engineDesignCriteriaPanel,'Style','popupmenu','String',...
    {'Select','1','2','3','4','6'},'Position',[145 120 50 25],'Enable','on','Callback',@popupmenu_numEngines_Callback);

function engineTab
global tab1 engineManufacturerNum honeywell rollsRoyceAllison GEAETab1...
    GEAETab2 CFM microTurbo prattWitneyTab1 prattWitneyTab2 interAeroEngines...
    rollsRoyceTurbo teledyneCAE williamsInter

engineTabGroup = uitabgroup('Parent',tab1,'Position',[.01 .05 .98 .63]);
if engineManufacturerNum == 1
    honeywell = uitab('Parent',engineTabGroup,'Title','Honeywell');
elseif engineManufacturerNum == 2
    rollsRoyceAllison = uitab('Parent',engineTabGroup,'Title','Rolls-Royce Allison');
elseif engineManufacturerNum == 3
    GEAETab1 = uitab('Parent',engineTabGroup,'Title','General Electric Aviation Engines Tab 1');
    GEAETab2 = uitab('Parent',engineTabGroup,'Title','General Electric Aviation Engines Tab 2');
elseif engineManufacturerNum == 4
    CFM = uitab('Parent',engineTabGroup,'Title','CFM');
elseif engineManufacturerNum == 5
    microTurbo = uitab('Parent',engineTabGroup,'Title','MicroTurbo');
elseif engineManufacturerNum == 6
    prattWitneyTab1 = uitab('Parent',engineTabGroup,'Title','Pratt & Witney Aviation Tab 1');
    prattWitneyTab2 = uitab('Parent',engineTabGroup,'Title','Pratt & Witney Aviation Tab 2');
elseif engineManufacturerNum == 7
    interAeroEngines = uitab('Parent',engineTabGroup,'Title','International Aero Engines');
elseif engineManufacturerNum == 8
    rollsRoyceTurbo = uitab('Parent',engineTabGroup,'Title','Rolls-Royce Turbomeca');
elseif engineManufacturerNum == 9
    teledyneCAE = uitab('Parent',engineTabGroup,'Title','Teledyne CAE');
elseif engineManufacturerNum == 10
    williamsInter = uitab('Parent',engineTabGroup,'Title','Williams International');
end

% Engine Table Selection
function engineSelection
global tab1 thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan engineLengthJet T_W engineModel engineNameSpace numberOfEngineModels...
    engineManufacturerNum honeywell rollsRoyceAllison GEAETab1 GEAETab2...
    GEAETabTable CFM microTurbo prattWitneyTab1 prattWitneyTab2 interAeroEngines...
    rollsRoyceTurbo teledyneCAE williamsInter PWATabTable masterFile...
    dataCollection

% Reset dataCollection value to 0
dataCollection = 0;

% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

if engineManufacturerNum == 1
    engineTable = uitable('Parent',honeywell,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
        engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesHoneywell;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 2
    engineTable = uitable('Parent',rollsRoyceAllison,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
        engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesRRA;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 3
    for j = 1:2
        if j == 1
            GEAETabTable = 1;
            engineData;
            engineTable = uitable('Parent',GEAETab1,'Position',[8 5 774 422]);
            engineNamesGEAETab1;
        elseif j == 2
            GEAETabTable = 2;
            engineData;
            engineTable = uitable('Parent',GEAETab2,'Position',[8 5 774 422]);
            engineNamesGEAETab2;
        end
        
        engineTableArray = zeros(numberOfEngineModels,13);
        tempEngineModel = engineModel;
        for engineModel = 1:numberOfEngineModels
            engineData;
        engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
            (diameterFan/12) (engineLengthJet/12) T_W;]); 
        end

        engineTableArrayCell = num2cell(engineTableArray);

        RowName = zeros(numberOfEngineModels,1);
        RowNamestr = num2cell(RowName);
        for engineModel = 1:numberOfEngineModels
            engineData;
            RowNamestr(engineModel) = engineNameSpace(engineModel);
        end

        ColumnWidth = zeros(1,13);
        ColumnWidthstr = num2cell(ColumnWidth);
        for engineModel = 1:13
            engineData;
            ColumnWidthstr(engineModel) = {'auto'};
        end

        engineTable.Data = engineTableArrayCell;
        engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
            'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
        engineTable.ColumnWidth = ColumnWidthstr;
        engineTable.RowName = RowNamestr;
        engineTable.FontSize = 9;
    end
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 4
    engineTable = uitable('Parent',CFM,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
    %     engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesCFM;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 5
    engineTable = uitable('Parent',microTurbo,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
        engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesMicroturbo;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 6
    for j = 1:2
        if j == 1
            PWATabTable = 1;
            engineData;
            engineTable = uitable('Parent',prattWitneyTab1,'Position',[8 5 774 422]);
            engineNamesPWATab1;
        elseif j == 2
            PWATabTable = 2;
            engineData;
            engineTable = uitable('Parent',prattWitneyTab2,'Position',[8 5 774 422]);
            engineNamesPWATab2;
        end
        
        engineTableArray = zeros(numberOfEngineModels,13);
        tempEngineModel = engineModel;
        for engineModel = 1:numberOfEngineModels
            engineData;
        engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
            (diameterFan/12) (engineLengthJet/12) T_W;]); 
        end

        engineTableArrayCell = num2cell(engineTableArray);

        RowName = zeros(numberOfEngineModels,1);
        RowNamestr = num2cell(RowName);
        for engineModel = 1:numberOfEngineModels
            engineData;
            RowNamestr(engineModel) = engineNameSpace(engineModel);
        end

        ColumnWidth = zeros(1,13);
        ColumnWidthstr = num2cell(ColumnWidth);
        for engineModel = 1:13
            engineData;
            ColumnWidthstr(engineModel) = {'auto'};
        end

        engineTable.Data = engineTableArrayCell;
        engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
            'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
        engineTable.ColumnWidth = ColumnWidthstr;
        engineTable.RowName = RowNamestr;
        engineTable.FontSize = 9;
    end
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 7
    engineTable = uitable('Parent',interAeroEngines,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
    %     engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesIAE;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 8
    engineTable = uitable('Parent',rollsRoyceTurbo,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
    %     engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesRRT;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 9
    engineTable = uitable('Parent',teledyneCAE,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
    %     engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesTeledyneCAE;
    engineModel = tempEngineModel;
    engineData;
elseif engineManufacturerNum == 10
    engineTable = uitable('Parent',williamsInter,'Position',[8 5 774 422]);
    engineTableArray = zeros(numberOfEngineModels,13);
    tempEngineModel = engineModel;
    for engineModel = 1:numberOfEngineModels
        engineData;
    engineTableArray(engineModel,:) = ([thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight (diameterMax/12)...
        (diameterFan/12) (engineLengthJet/12) T_W;]); 
    end

    engineTableArrayCell = num2cell(engineTableArray);

    RowName = zeros(numberOfEngineModels,1);
    RowNamestr = num2cell(RowName);
    for engineModel = 1:numberOfEngineModels
    %     engineData;
        RowNamestr(engineModel) = engineNameSpace(engineModel);
    end

    ColumnWidth = zeros(1,13);
    ColumnWidthstr = num2cell(ColumnWidth);
    for engineModel = 1:13
        engineData;
        ColumnWidthstr(engineModel) = {'auto'};
    end

    engineTable.Data = engineTableArrayCell;
    engineTable.ColumnName = {'Thrust Dry [lbs]'; 'Thrust A/B [lbs]'; 'SFC Dry [lb/(lb*hr)]';'SFC A/B [lb/(lb*hr)]'; 'FPR';...
        'OPR'; 'BPR'; 'MFR [lbm/s]'; 'Weight [lb]'; 'Max Diameter [ft]'; 'Fan Diameter [ft]'; 'Length [ft]'; 'T_W [lb/lb]';};
    engineTable.ColumnWidth = ColumnWidthstr;
    engineTable.RowName = RowNamestr;
    engineTable.FontSize = 9;
    
    % Run engine names
    engineNamesWI;
    engineModel = tempEngineModel;
    engineData;
end





  



% Undefined values
uicontrol('Parent',tab1,'Style','text','String','*A value of 0 represents no data for that engine','Position',[8 12 270 19],'Enable','off','FontWeight','Bold');

function preEngineModelPanelFcn
global engineModelPanel tab1 engineManufacturer
engineManufacturer_engineName = [engineManufacturer ' - ' ' - '];
engineModelPanel = uipanel('Parent',tab1,'Title',{engineManufacturer_engineName},'FontSize',10,'Position',[.32 .68 .67 .22]);

function engineModelPanelFcn
global engineName engineModelPanel tab1 engineManufacturer wpActivated
engineManufacturer_engineName = [engineManufacturer ' - ' engineName];
delete(engineModelPanel);
engineModelPanel = uipanel('Parent',tab1,'Title',{engineManufacturer_engineName},'FontSize',10,'Position',[.32 .68 .67 .22]);

wpActivated = 0;

%% Engine Models
function engineModelsHoneywell
global tab1 engineManufacturerHoneywell engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Honeywell Engines
engineManufacturerHoneywell = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','F109-GA-100',...
    'TFE731-20','TFE731-40','TFE731-5','TFE731-5A','TFE731-60','ATF3-3','ATF3-6A',...
    'CFE738-1-1B','F124-GA-100','F125-GA-100','AS907','AS977','LF507-1F','LF507-1H',...
    'ALF502L',},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsHoneywell_Callback);

if isempty(engineManufacturerHoneywell) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerHoneywell.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesHoneywell
global honeywell
uicontrol('Parent',honeywell,'Style','edit','String','F109-GA-100','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','TFE731-20','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','TFE731-40','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','TFE731-5','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','TFE731-5A','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','TFE731-60','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','ATF3-3','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','ATF3-6A','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','CFE738-1-1B','Position',[8 244 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','F124-GA-100','Position',[8 226 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','F125-GA-100','Position',[8 208 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','AS907','Position',[8 190 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','AS977','Position',[8 172 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','LF507-1F','Position',[8 154 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','LF507-1H','Position',[8 136 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',honeywell,'Style','edit','String','ALF502L','Position',[8 118 103 20],'Enable','off','FontWeight','Bold');

function engineModelsRRA
global tab1 engineManufacturerRRA engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Rolls-Royce Allison
engineManufacturerRRA = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','15S','150+',...
    '150(J104-AD-100)','120','AE2100','AE3007','AE3007A','AE3007C',},'Position',...
    [550 670 120 25],'Callback',@popupmenu_engineModelsRRA_Callback);

if isempty(engineManufacturerRRA) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerRRA.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesRRA
global rollsRoyceAllison
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','15S','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','150+','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','150(J104-AD-100)','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','120','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','AE2100','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','AE3007','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','AE3007A','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceAllison,'Style','edit','String','AE3007C','Position',[8 262 103 20],'Enable','off','FontWeight','Bold');

function engineModelsGEAE
global tab1 engineManufacturerGEAE engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% General Electric Aviation Engines
engineManufacturerGEAE = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','CF700','J85-GE-13',...
    'J85-GE-17','J85-21','CFE738-1','TF34-GE-100','CF34-3','CF34-8C1','F101-GE-102',...
    'F110-GE-100','F110-GE-400','F110-GE-129','F110-GE-129EFE','F118-GE-100','F118-GE-101',...
    'F404/F1D2','F404/RM12','F404-GE-100D','F404-GE-400','F404-GE-402','F414-GE-400',...
    'TF-39-GE-1',},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsGEAE_Callback); 

if isempty(engineManufacturerGEAE) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerGEAE.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesGEAETab1
global GEAETab1
uicontrol('Parent',GEAETab1,'Style','edit','String','CF700','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','J85-GE-13','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','J85-GE-17','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','J85-21','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','CFE738-1','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','TF34-GE-100','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','CF34-3','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','CF34-8C1','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F101-GE-102','Position',[8 244 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F110-GE-100','Position',[8 226 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F110-GE-400','Position',[8 208 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F110-GE-129','Position',[8 190 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F110-GE-129EFE','Position',[8 172 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F118-GE-100','Position',[8 154 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F118-GE-101','Position',[8 136 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F404/F1D2','Position',[8 118 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F404/RM12','Position',[8 100 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F404-GE-100D','Position',[8 82 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F404-GE-400','Position',[8 64 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F404-GE-402','Position',[8 46 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',GEAETab1,'Style','edit','String','F414-GE-400','Position',[8 28 103 20],'Enable','off','FontWeight','Bold');
function engineNamesGEAETab2
global GEAETab2
uicontrol('Parent',GEAETab2,'Style','edit','String','TF-39-GE-1','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');

function engineModelsCFM
global tab1 engineManufacturerCFM engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% CFM
engineManufacturerCFM = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','CFM56-2','CFM56-3',...
    'CFM56-5-A1','CFM56-5C-2','CFM56-5C-3','CFM56-5C-4','CFM56-5B2',},'Position',...
    [550 670 120 25],'Callback',@popupmenu_engineModelsCFM_Callback);

if isempty(engineManufacturerCFM) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerCFM.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesCFM
global CFM
uicontrol('Parent',CFM,'Style','edit','String','CFM56-2','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-3','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-5-A1','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-5C-2','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-5C-3','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-5C-4','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',CFM,'Style','edit','String','CFM56-5B2','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');

function engineModelsMicroturbo
global tab1 engineManufacturerMicro engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Microturbo
engineManufacturerMicro = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','TRS 18',...
    'TRS 18-1','TRI 60-1','TRI 60-2','TRI 60-3','TRI 60-5','TRI 60-20','TRI 60-30',},...
    'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsMicroturbo_Callback);

if isempty(engineManufacturerMicro) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerMicro.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesMicroturbo
global microTurbo
uicontrol('Parent',microTurbo,'Style','edit','String','TRS 18','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRS 18-1','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-1','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-2','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-3','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-5','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-20','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',microTurbo,'Style','edit','String','TRI 60-30','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');

function engineModelsPWA
global tab1 engineManufacturerPWA engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Pratt & Witney Aviation
engineManufacturerPWA = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','JT15D-5/5A',...
    'JT15D-5C TP','JT15D-5D','PW305A','PW305B','PW306/5(+5)','PW308A','PW535','PW600',...
    'F100-PW-100','F100-PW-200','F100-PW-220','F100-PW-220E','F100-PW-229','F100-PW-229A',...
    'PW2037','PW2040','PW2043','PW4052/4152','PW4056/4156','PW4060/4360','PW6122','PW6162'},...
    'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsPWA_Callback);

if isempty(engineManufacturerPWA) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerPWA.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesPWATab1
global prattWitneyTab1
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','JT15D-5/5A','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','JT15D-5C TP','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','JT15D-5D','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW305A','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW305B','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW306/5(+5)','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW308A','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW535','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW600','Position',[8 244 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-100','Position',[8 226 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-200','Position',[8 208 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-220','Position',[8 190 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-220E','Position',[8 172 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-229','Position',[8 154 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','F100-PW-229A','Position',[8 136 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW2037','Position',[8 118 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW2040','Position',[8 100 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW2043','Position',[8 82 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW4052/4152','Position',[8 64 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW4056/4156','Position',[8 46 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab1,'Style','edit','String','PW4060/4360','Position',[8 28 103 20],'Enable','off','FontWeight','Bold');
function engineNamesPWATab2
global prattWitneyTab2
uicontrol('Parent',prattWitneyTab2,'Style','edit','String','PW6122','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',prattWitneyTab2,'Style','edit','String','PW6162','Position',[8 370 103 20],'Enable','off','FontWeight','Bold');

function engineModelsIAE
global tab1 engineManufacturerIAE engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% International Aero Engines(IAE)
engineManufacturerIAE = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','V2500-A1',...
    'V2522-A5','V2524-A5','V2525-D5','V2527-A5','V528-D5','V2530-A5','V2530-D5','V2533-A5'},...
    'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsIAE_Callback);

if isempty(engineManufacturerIAE) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerIAE.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesIAE
global interAeroEngines
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2500-A1','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2522-A5','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2524-A5','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2525-D5','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2527-A5','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V528-D5','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2530-A5','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2530-D5','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',interAeroEngines,'Style','edit','String','V2533-A5','Position',[8 244 103 19],'Enable','off','FontWeight','Bold');

function engineModelsRRT
global tab1 engineManufacturerRRT engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Rolls-Royce Turbomeca
uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','Adour MK.861',...
    'Adour MK.871','Adour MK.811/815','BR700-710'},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsRRT_Callback);

if isempty(engineManufacturerRRT) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerRRT.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesRRT
global rollsRoyceTurbo
uicontrol('Parent',rollsRoyceTurbo,'Style','edit','String','Adour MK.861','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceTurbo,'Style','edit','String','Adour MK.871','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceTurbo,'Style','edit','String','Adour MK.811/815','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',rollsRoyceTurbo,'Style','edit','String','BR700-710','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');

function engineModelsTeledyneCAE
global tab1 engineManufacturerTeledyneCAE engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Teledyne CAE
uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','304','305',...
    '312','J700-CA-400','320-1','320-2','J402-CA-700','J402-CA-400','370-9B',...
    'J402-CA-702','F408-CA-400','J69-T-25A','J69-T-29','J69-T-41A','J69-T-406'},...
    'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsTeledyneCAE_Callback);

if isempty(engineManufacturerTeledyneCAE) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerTeledyneCAE.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesTeledyneCAE
global teledyneCAE
uicontrol('Parent',teledyneCAE,'Style','edit','String','304','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','305','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','312','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J700-CA-400','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','320-1','Position',[8 316 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','320-2','Position',[8 298 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J402-CA-700','Position',[8 280 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J402-CA-400','Position',[8 262 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','370-9B','Position',[8 244 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J402-CA-702','Position',[8 226 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','F408-CA-400','Position',[8 208 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J69-T-25A','Position',[8 190 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J69-T-29','Position',[8 172 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J69-T-41A','Position',[8 154 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',teledyneCAE,'Style','edit','String','J69-T-406','Position',[8 136 103 19],'Enable','off','FontWeight','Bold');

function engineModelsWI
global tab1 engineManufacturerWI engineModel
% Engine Model
uicontrol('Parent',tab1,'Style','text','String','Engine Model','Position',[550 695 120 25],'Fontsize',10);

%% Engine Models
% Williams International
engineManufacturerWI = uicontrol('Parent',tab1','Style','popupmenu','String',{'Select','F107-WR-101',...
    'FJ44-1A','F112-WR-100','P8300'},'Position',[550 670 120 25],'Callback',@popupmenu_engineModelsWI_Callback);

if isempty(engineManufacturerWI) ~= 1 && isempty(engineModel) ~= 1
    engineManufacturerWI.Value = engineModel+1;
else
    engineModel = 0;
end
function engineNamesWI
global williamsInter
uicontrol('Parent',williamsInter,'Style','edit','String','F107-WR-101','Position',[8 388 103 20],'Enable','off','FontWeight','Bold');
uicontrol('Parent',williamsInter,'Style','edit','String','FJ44-1A','Position',[8 370 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',williamsInter,'Style','edit','String','F112-WR-100','Position',[8 352 103 19],'Enable','off','FontWeight','Bold');
uicontrol('Parent',williamsInter,'Style','edit','String','P8300','Position',[8 334 103 19],'Enable','off','FontWeight','Bold');

%% Engine Model Popupmenus
function popupmenu_engineModelsHoneywell_Callback(hObject,~)
global engineModel engineManufacturer masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Honeywell';

if isempty(engineManufacturerCallback) ~= 1
    switch optimumEngineName
        case 'F109-GA-100'
            engineModel = 1;
        case 'TFE731-20'
            engineModel = 2;
        case 'TFE731-40'
            engineModel = 3;
        case 'TFE731-5'
            engineModel = 4;
        case 'TFE731-5A'
            engineModel = 5;
        case 'TFE731-60'
            engineModel = 6;
        case 'ATF3-3'
            engineModel = 7;
        case 'ATF3-6A'
            engineModel = 8;
        case 'CFE738-1-1B'
            engineModel = 9;
        case 'F124-GA-100'
            engineModel = 10;
        case 'F125-GA-100'
            engineModel = 11;
        case 'AS907'
            engineModel = 12;
        case 'AS977'
            engineModel = 13;
        case 'LF507-1F'
            engineModel = 14;
        case 'LF507-1H'
            engineModel = 15;
        case 'ALF502L'
            engineModel = 16;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'F109-GA-100'
            engineModel = 1;
        case 'TFE731-20'
            engineModel = 2;
        case 'TFE731-40'
            engineModel = 3;
        case 'TFE731-5'
            engineModel = 4;
        case 'TFE731-5A'
            engineModel = 5;
        case 'TFE731-60'
            engineModel = 6;
        case 'ATF3-3'
            engineModel = 7;
        case 'ATF3-6A'
            engineModel = 8;
        case 'CFE738-1-1B'
            engineModel = 9;
        case 'F124-GA-100'
            engineModel = 10;
        case 'F125-GA-100'
            engineModel = 11;
        case 'AS907'
            engineModel = 12;
        case 'AS977'
            engineModel = 13;
        case 'LF507-1F'
            engineModel = 14;
        case 'LF507-1H'
            engineModel = 15;
        case 'ALF502L'
            engineModel = 16;
    end
end

% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
% engineOutline;
engineParametersDrawingJet;
engineParametersPicture;
engineDescription;

function popupmenu_engineModelsRRA_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Rolls-Royce Allison';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case '15S'
            engineModel = 1;
        case '150+'
            engineModel = 2;
        case '150(J104-AD-100)'
            engineModel = 3;
        case '120'
            engineModel = 4;
        case 'AE2100'
            engineModel = 5;
        case 'AE3007'
            engineModel = 6;
        case 'AE3007A'
            engineModel = 7;
        case 'AE3007C'
            engineModel = 8;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case '15S'
            engineModel = 1;
        case '150+'
            engineModel = 2;
        case '150(J104-AD-100)'
            engineModel = 3;
        case '120'
            engineModel = 4;
        case 'AE2100'
            engineModel = 5;
        case 'AE3007'
            engineModel = 6;
        case 'AE3007A'
            engineModel = 7;
        case 'AE3007C'
            engineModel = 8;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsGEAE_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection GEAETabTable...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'General Electric Aviation Engines';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case 'CF700'
            engineModel = 1;
        case 'J85-GE-13'
            engineModel = 2;
        case 'J85-GE-17'
            engineModel = 3;
        case 'J85-21'
            engineModel = 4;
        case 'CFE738-1'
            engineModel = 5;
        case 'TF34-GE-100'
            engineModel = 6;
        case 'CF34-3'
            engineModel = 7;
        case 'CF34-8C1'
            engineModel = 8;
        case 'F101-GE-102'
            engineModel = 9;
        case 'F110-GE-100'
            engineModel = 10;
        case 'F110-GE-400'
            engineModel = 11;
        case 'F110-GE-129'
            engineModel = 12;
        case 'F110-GE-129EFE'
            engineModel = 13;
        case 'F118-GE-100'
            engineModel = 14;
        case 'F118-GE-101'
            engineModel = 15;
        case 'F404/F1D2'
            engineModel = 16;
        case 'F404/RM12'
            engineModel = 17;
        case 'F404-GE-100D'
            engineModel = 18;
        case 'F404-GE-400'
            engineModel = 19;
        case 'F404-GE-402'
            engineModel = 20;
        case 'F414-GE-400'
            engineModel = 21;
        case 'TF-39-GE-1'
            engineModel = 1;
            GEAETabTable = 2;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    GEAETabTable = 1;
    switch str{val}
        case 'CF700'
            engineModel = 1;
        case 'J85-GE-13'
            engineModel = 2;
        case 'J85-GE-17'
            engineModel = 3;
        case 'J85-21'
            engineModel = 4;
        case 'CFE738-1'
            engineModel = 5;
        case 'TF34-GE-100'
            engineModel = 6;
        case 'CF34-3'
            engineModel = 7;
        case 'CF34-8C1'
            engineModel = 8;
        case 'F101-GE-102'
            engineModel = 9;
        case 'F110-GE-100'
            engineModel = 10;
        case 'F110-GE-400'
            engineModel = 11;
        case 'F110-GE-129'
            engineModel = 12;
        case 'F110-GE-129EFE'
            engineModel = 13;
        case 'F118-GE-100'
            engineModel = 14;
        case 'F118-GE-101'
            engineModel = 15;
        case 'F404/F1D2'
            engineModel = 16;
        case 'F404/RM12'
            engineModel = 17;
        case 'F404-GE-100D'
            engineModel = 18;
        case 'F404-GE-400'
            engineModel = 19;
        case 'F404-GE-402'
            engineModel = 20;
        case 'F414-GE-400'
            engineModel = 21;
        case 'TF-39-GE-1'
            engineModel = 1;
            GEAETabTable = 2;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsCFM_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'CFM';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case 'CFM56-2'
            engineModel = 1;
        case 'CFM56-3'
            engineModel = 2;
        case 'CFM56-5-A1'
            engineModel = 3;
        case 'CFM56-5C-2'
            engineModel = 4;
        case 'CFM56-5C-3'
            engineModel = 5;
        case 'CFM56-5C-4'
            engineModel = 6;
        case 'CFM56-5B2'
            engineModel = 7;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'CFM56-2'
            engineModel = 1;
        case 'CFM56-3'
            engineModel = 2;
        case 'CFM56-5-A1'
            engineModel = 3;
        case 'CFM56-5C-2'
            engineModel = 4;
        case 'CFM56-5C-3'
            engineModel = 5;
        case 'CFM56-5C-4'
            engineModel = 6;
        case 'CFM56-5B2'
            engineModel = 7;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsMicroturbo_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Microturbo';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case 'TRS 18'
            engineModel = 1;
        case 'TRS 18-1'
            engineModel = 2;
        case 'TRI 60-1'
            engineModel = 3;
        case 'TRI 60-2'
            engineModel = 4;
        case 'TRI 60-3'
            engineModel = 5;
        case 'TRI 60-5'
            engineModel = 6;
        case 'TRI 60-20'
            engineModel = 7;
        case 'TRI 60-30'
            engineModel = 8;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'TRS 18'
            engineModel = 1;
        case 'TRS 18-1'
            engineModel = 2;
        case 'TRI 60-1'
            engineModel = 3;
        case 'TRI 60-2'
            engineModel = 4;
        case 'TRI 60-3'
            engineModel = 5;
        case 'TRI 60-5'
            engineModel = 6;
        case 'TRI 60-20'
            engineModel = 7;
        case 'TRI 60-30'
            engineModel = 8;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsPWA_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection PWATabTable...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Pratt & Witney Aviation';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case 'JT15D-5/5A'
            engineModel = 1;
        case 'JT15D-5C TP'
            engineModel = 2;
        case 'JT15D-5D'
            engineModel = 3;
        case 'PW305A'
            engineModel = 4;
        case 'PW305B'
            engineModel = 5;
        case 'PW306/5(+5)'
            engineModel = 6;
        case 'PW308A'
            engineModel = 7;
        case 'PW535'
            engineModel = 8;
        case 'PW600'
            engineModel = 9;
        case 'F100-PW-100'
            engineModel = 10;
        case 'F100-PW-200'
            engineModel = 11;
        case 'F100-PW-220'
            engineModel = 12;
        case 'F100-PW-220E'
            engineModel = 13;
        case 'F100-PW-229'
            engineModel = 14;
        case 'F100-PW-229A'
            engineModel = 15;
        case 'PW2037'
            engineModel = 16;
        case 'PW2040'
            engineModel = 17;
        case 'PW2043'
            engineModel = 18;
        case 'PW4052/4152'
            engineModel = 19;
        case 'PW4056/4156'
            engineModel = 20;
        case 'PW4060/4360'
            engineModel = 21;
        case 'PW6122'
            engineModel = 1;
            PWATabTable = 2;
        case 'PW6162'
            engineModel = 2;
            PWATabTable = 2;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    PWATabTable = 1;
    switch str{val}
        case 'JT15D-5/5A'
            engineModel = 1;
        case 'JT15D-5C TP'
            engineModel = 2;
        case 'JT15D-5D'
            engineModel = 3;
        case 'PW305A'
            engineModel = 4;
        case 'PW305B'
            engineModel = 5;
        case 'PW306/5(+5)'
            engineModel = 6;
        case 'PW308A'
            engineModel = 7;
        case 'PW535'
            engineModel = 8;
        case 'PW600'
            engineModel = 9;
        case 'F100-PW-100'
            engineModel = 10;
        case 'F100-PW-200'
            engineModel = 11;
        case 'F100-PW-220'
            engineModel = 12;
        case 'F100-PW-220E'
            engineModel = 13;
        case 'F100-PW-229'
            engineModel = 14;
        case 'F100-PW-229A'
            engineModel = 15;
        case 'PW2037'
            engineModel = 16;
        case 'PW2040'
            engineModel = 17;
        case 'PW2043'
            engineModel = 18;
        case 'PW4052/4152'
            engineModel = 19;
        case 'PW4056/4156'
            engineModel = 20;
        case 'PW4060/4360'
            engineModel = 21;
        case 'PW6122'
            engineModel = 1;
            PWATabTable = 2;
        case 'PW6162'
            engineModel = 2;
            PWATabTable = 2;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsIAE_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'International Aero Engines';

if isempty(engineManufacturerCallback) ~= 1
        switch char(optimumEngineName)
            case 'V2500-A1'
                engineModel = 1;
            case 'V2522-A5'
                engineModel = 2;
            case 'V2524-A5'
                engineModel = 3;
            case 'V2525-D5'
                engineModel = 4;
            case 'V2527-A5'
                engineModel = 5;
            case 'V528-D5'
                engineModel = 6;
            case 'V2530-A5'
                engineModel = 7;
            case 'V2530-D5'
                engineModel = 8;
            case 'V2533-A5'
                engineModel = 9;
        end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'V2500-A1'
            engineModel = 1;
        case 'V2522-A5'
            engineModel = 2;
        case 'V2524-A5'
            engineModel = 3;
        case 'V2525-D5'
            engineModel = 4;
        case 'V2527-A5'
            engineModel = 5;
        case 'V528-D5'
            engineModel = 6;
        case 'V2530-A5'
            engineModel = 7;
        case 'V2530-D5'
            engineModel = 8;
        case 'V2533-A5'
            engineModel = 9;
    end
end

% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsRRT_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Rolls-Royce Turbomeca';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case 'Adour MK.861'
            engineModel = 1;
        case 'Adour MK.871'
            engineModel = 2;
        case 'Adour MK.811/815'
            engineModel = 3;
        case 'BR700-710'
            engineModel = 4;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'Adour MK.861'
            engineModel = 1;
        case 'Adour MK.871'
            engineModel = 2;
        case 'Adour MK.811/815'
            engineModel = 3;
        case 'BR700-710'
            engineModel = 4;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsTeledyneCAE_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Teledyne CAE';

if isempty(engineManufacturerCallback) ~= 1
    switch char(optimumEngineName)
        case '304'
            engineModel = 1;
        case '305'
            engineModel = 2;
        case '312'
            engineModel = 3;
        case 'J700-CA-400'
            engineModel = 4;
        case '320-1'
            engineModel = 5;
        case '320-2'
            engineModel = 6;
        case 'J402-CA-700'
            engineModel = 7;
        case 'J402-CA-400'
            engineModel = 8;
        case '370-9B'
            engineModel = 9;
        case 'J402-CA-702'
            engineModel = 10;
        case 'F408-CA-400'
            engineModel = 11;
        case 'J69-T-25A'
            engineModel = 12;
        case 'J69-T-29'
            engineModel = 13;
        case 'J69-T-41A'
            engineModel = 14;
        case 'J69-T-406'  
            engineModel = 15;
    end
else
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case '304'
            engineModel = 1;
        case '305'
            engineModel = 2;
        case '312'
            engineModel = 3;
        case 'J700-CA-400'
            engineModel = 4;
        case '320-1'
            engineModel = 5;
        case '320-2'
            engineModel = 6;
        case 'J402-CA-700'
            engineModel = 7;
        case 'J402-CA-400'
            engineModel = 8;
        case '370-9B'
            engineModel = 9;
        case 'J402-CA-702'
            engineModel = 10;
        case 'F408-CA-400'
            engineModel = 11;
        case 'J69-T-25A'
            engineModel = 12;
        case 'J69-T-29'
            engineModel = 13;
        case 'J69-T-41A'
            engineModel = 14;
        case 'J69-T-406'  
            engineModel = 15;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

function popupmenu_engineModelsWI_Callback(hObject,~)
global engineManufacturer engineModel masterFile dataCollection...
    engineManufacturerCallback optimumEngineName

% Set dataCollection to 1 to activate combo engine data file in engineData
dataCollection = 1;
engineManufacturer = 'Williams International';

if isempty(engineManufacturerCallback) ~= 1
    switch optimumEngineName
        case 'F107-WR-101'
            engineModel = 1;
        case 'FJ44-1A'
            engineModel = 2;
        case 'F112-WR-100'
            engineModel = 3;
        case 'P8300'
            engineModel = 4;
    end
else
    
    % Determine the selected data set.
    str = hObject.String;
    val = hObject.Value;
    % Set current data to the selected data set.
    switch str{val}
        case 'F107-WR-101'
            engineModel = 1;
        case 'FJ44-1A'
            engineModel = 2;
        case 'F112-WR-100'
            engineModel = 3;
        case 'P8300'
            engineModel = 4;
    end
end
% Load Engine Data
% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Engine');

engineData;
pushbutton_isoJet_Callback;
selectedEngineData;
engineParametersDrawingJet;
engineParametersPicture;
% engineOutline;
engineDescription;

%% Selected Engine Data
function selectedEngineData
global engineLengthJet diameterMax thrustDry thrustA_B SFCDry SFC_A_B...
    FPR OPR BPR Wa weight tab2 engineModelPanel
engineModelPanelFcn;
% Construct the components.
%% Static Texts------------------------------------------------------------
% Engine Dry Thrust
uicontrol('Parent',engineModelPanel,'Style','text','String','Thrust:','Position',[10 110 40 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',thrustDry,'Position',[12 95 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lbs','Position',[55 88 20 25],'Fontsize',9);

% Engine Afterburner Thrust
uicontrol('Parent',engineModelPanel,'Style','text','String','A/B Thrust:','Position',[65 110 120 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',thrustA_B,'Position',[100 95 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lbs','Position',[140 88 25 25],'Fontsize',9);

% Engine Dry SFC
uicontrol('Parent',engineModelPanel,'Style','text','String','Dry SFC:','Position',[180 110 60 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',SFCDry,'Position',[190 95 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lb/(lb*hr)','Position',[235 88 50 25],'Fontsize',9);

% Engine Afterburner SFC
uicontrol('Parent',engineModelPanel,'Style','text','String','A/B SFC:','Position',[270 110 120 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',SFC_A_B,'Position',[310 95 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lb/(lb*hr)','Position',[355 88 50 25],'Fontsize',9);

% Engine Fan Pressure Ratio
uicontrol('Parent',engineModelPanel,'Style','text','String','FPR:','Position',[430 110 35 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',FPR,'Position',[430 95 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lb/(lb*hr)','Position',[475 88 50 25],'Fontsize',9);

% Engine Overall Pressure Ratio
uicontrol('Parent',engineModelPanel,'Style','text','String','OPR:','Position',[10 48 35 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',OPR,'Position',[12 30 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lb/(lb*hr)','Position',[55 22 50 25],'Fontsize',9);

% Engine Bypass Pressure Ratio
uicontrol('Parent',engineModelPanel,'Style','text','String','BPR:','Position',[130 48 35 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',BPR,'Position',[130 30 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lb/(lb*hr)','Position',[175 22 50 25],'Fontsize',9);

% Engine Mass Flow Rate
uicontrol('Parent',engineModelPanel,'Style','text','String','MFR:','Position',[250 48 35 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',Wa,'Position',[250 30 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lbm/s','Position',[290 22 40 25],'Fontsize',9);

% Engine Weight
uicontrol('Parent',engineModelPanel,'Style','text','String','Weight:','Position',[350 48 50 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',weight,'Position',[355 30 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','lbs','Position',[395 22 25 25],'Fontsize',9);

% Engine Max Diameter
uicontrol('Parent',engineModelPanel,'Style','text','String','Max Diameter:','Position',[440 48 90 25],'Fontsize',9);
uicontrol('Parent',engineModelPanel,'Style','edit','String',diameterMax/12,'Position',[460 30 40 20],'Enable','off');
uicontrol('Parent',engineModelPanel,'Style','text','String','ft','Position',[500 22 15 25],'Fontsize',9);
% 
% % Engine Fan Diameter
% uicontrol('Parent',engineModelPanel,'Style','text','String','Fan Diameter:','Position',[5 25 80 25]);
% uicontrol('Parent',engineModelPanel,'Style','edit','String',diameterMax/12,'Position',[10 5 50 20],'Enable','off');
% uicontrol('Parent',engineModelPanel,'Style','text','String','ft','Position',[60 5 25 25]);
% 
% % Engine Length
% uicontrol('Parent',engineModelPanel,'Style','text','String','Length:','Position',[110 25 50 25]);
% uicontrol('Parent',engineModelPanel,'Style','edit','String',engineLengthJet/12,'Position',[110 5 50 20],'Enable','off');
% uicontrol('Parent',engineModelPanel,'Style','text','String','ft','Position',[150 5 25 25]);
% 
% % Engine Thrust/Weight
% uicontrol('Parent',engineModelPanel,'Style','text','String','T / W:','Position',[190 25 50 25]);
% uicontrol('Parent',engineModelPanel,'Style','edit','String',T_W,'Position',[190 5 50 20],'Enable','off');
% uicontrol('Parent',engineModelPanel,'Style','text','String','lb/lb','Position',[240 5 25 25]);

engineLengthJetstr = num2str(engineLengthJet/12,'%3.3f');
diameterMaxstr =num2str(diameterMax/12,'%3.3f');

% Engine Length
uicontrol('Parent',tab2,'Style','text','String','Length','Position',[250 680 90 25]);
uicontrol('Parent',tab2,'Style','text','String',engineLengthJetstr,'Position',[270 655 50 25]);
uicontrol('Parent',tab2,'Style','text','String','ft','Position',[310 655 25 25]);

% % Engine Outer Radius
uicontrol('Parent',tab2,'Style','text','String','Outer Radius','Position',[340 680 90 25]);
uicontrol('Parent',tab2,'Style','text','String',diameterMaxstr,'Position',[350 655 50 25]);
uicontrol('Parent',tab2,'Style','text','String','ft','Position',[400 655 25 25]);

%% Jet Engine Drawing
function engineParametersDrawingJet
global engineLengthJet diameterMax engineFigJet engineModelPanel...
     tab2 tabSelected enginePos_xDir enginePos_yDir enginePos_zDir...
     engineManufacturer engineName
 
engineManufacturer_engineName = [engineManufacturer ' - ' engineName];
engineModelPanel = uipanel('Parent',tab2,'Title',{engineManufacturer_engineName},'FontSize',12,'Position',[.32 .4 .45 .5]);
delete(engineFigJet);
engineFigJet = axes('Parent',engineModelPanel,'Position',[0.1 0.1 .8 .85]);
tabSelected = 1;
enginePos_xDir = 0;
enginePos_yDir = 0;
enginePos_zDir = 0;

fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;

iArrayFront = [1 .95 .88 .78 .6];
iArrayRear = [1 .95 .8 .7 .6];
engineInnerRadiusJet = diameterMax*.7;

%% Engine
% Engine Outer Casing 
[xcf,zcf,ycf] = cylinder(diameterMax); 
surface((y-ycf*engineLengthJet)-enginePos_xDir,(xcf+x)+enginePos_yDir,(z+zcf*1)+enginePos_zDir,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Front
[xcn,zcn,ycn] = cylinder(diameterMax.*(iArrayFront)); 
zcn(6:end,:) = zcn(6:end,:)-diameterMax/100; 
ycn = -ycn.*.7*diameterMax; 
surface((y-ycn)-enginePos_xDir,(xcn+x)+enginePos_yDir,(z+zcn*1)+enginePos_zDir,'facecolor'...
    ,fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMax*.6); 
surface((y-ycf*engineLengthJet+engineInnerRadiusJet)-enginePos_xDir,(xcf+x)+enginePos_yDir,...
    (z+zcf*1)+enginePos_zDir,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Rear
[xcn,zcn,ycn] = cylinder(diameterMax.*(iArrayRear)); 
zcn(6:end,:) = zcn(6:end,:)-diameterMax/100; 
ycn = -ycn.*.7*diameterMax; 
surface((-(y-ycn)-engineLengthJet)-enginePos_xDir,(-xcn+x)+enginePos_yDir,(z+zcn*1)+enginePos_zDir,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMax*.6); 
surface(((y-ycf*engineLengthJet-engineInnerRadiusJet))-enginePos_xDir,(xcf+x)+enginePos_yDir,...
    (z+zcf*1)+enginePos_zDir,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting gouraud;
camlight headlight;

function engineParametersPicture
global enginePicturePanel tab2 engineManufacturer engineName masterFile

engineManufacturer_engineName = [engineManufacturer ' - ' engineName];
enginePicturePanel = uipanel('Parent',tab2,'Title',{engineManufacturer_engineName},'FontSize',12,'Position',[.5 .4 .49 .5]);
enginePic = axes('Parent',enginePicturePanel,'Position',[0.1 0.1 .8 .85]);
% Revert file access to master file
cd(masterFile);

% Access Engine Database folder
cd('Engine/Engine Database');

% Load aircraft drawing
fileEnginePicture = dir('Garrett F109.jpg');

% Input aircraft drawing file into MATLAB
enginePicture = imread(fileEnginePicture.name);

% Revert file access to master file
% cd(masterFile);

% Load aircraft drawing image
image(enginePicture);

% Determine size of drawing
sizeVector = size(enginePicture);
xLimPic = sizeVector(2);
yLimPic = sizeVector(1);

axis off

function engineDescription
global tab2
engineInfoPanel = uipanel('Parent',tab2,'Title','Description','FontSize',12,'Position',[.01 .18 .98 .22]);

%% Engine Sizing Views
function pushbutton_topJet_Callback(~,~)
global selected
engineParametersDrawingJet;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 90;
view(az,el);
lighting gouraud
selected = 1;

function pushbutton_frontJet_Callback(~,~)
global selected
engineParametersDrawingJet;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 0;
view(az,el);
lighting gouraud
selected = 2;

function pushbutton_sideJet_Callback(~,~)
global selected
engineParametersDrawingJet;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 180;
el = 360;
view(az,el);
lighting gouraud
selected = 3;

function pushbutton_isoJet_Callback(~,~)
global selected
engineParametersDrawingJet;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]);
lighting gouraud
selected = 4;

function pushbutton_3DJet_Callback(~,~)
% h = rotate3d;
% h.ActionPreCallback = @myprecallback;
% h.ActionPostCallback = @mypostcallback;
% h.Enable = 'on';

function pushbutton_zoomJet_Callback(~,~)
% global engineFigJet
% z = zoom;
% setAxes3DPanAndZoomStyle(z,engineFigJet,'camera');
% zoom on

function pushbutton_zoom_resetJet_Callback(~,~)
% zoom out

function pushbutton_panJet_Callback(~,~)
% global engineFigJet
% p = pan;
% setAxes3DPanAndZoomStyle(p,engineFigJet,'camera');
% pan on
