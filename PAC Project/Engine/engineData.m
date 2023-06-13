function engineData
global engineManufacturer GEAETabTable PWATabTable dataCollection engineSearch...
    masterFile
% engineData(engineManufacturer)
% Written by Mark D. Miller Jr.
% 11/20/19
% Determine the selected data set.
% str = engineManufacturer.String;
% val = engineManufacturer.Value;
% Set current data to the selected data set.

% Revert file access to master file
cd(masterFile);

% Access Engine folder
cd('Engine');

if isempty(engineManufacturer) == 1
  errordlg('Please select an engine manufacturer','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

switch(engineManufacturer)
    case 'Honeywell'
        Honeywell;
    case 'Rolls-Royce Allison'
        Rolls_Royce_Allison;
    case 'General Electric Aviation Engines'
            if GEAETabTable == 1
                GEAETab1;
            elseif GEAETabTable == 2
                GEAETab2;
            end
            if dataCollection == 1
                combineGEAEData;
            end
    case 'CFM'
        CFM;
    case 'Microturbo'
        Microturbo;
    case 'Pratt & Witney Aviation'
        if PWATabTable == 1
            P_WATab1;
        elseif PWATabTable == 2
            P_WATab2;
        end
        if dataCollection == 1
            combinePWAData;
        end
    case 'International Aero Engines'
        IAE;
    case 'Rolls-Royce Turbomeca'
        Rolls_Royce_Turbomeca;
    case 'Teledyne CAE'
        Teledyne_CAE;
    case 'Williams International'
        Williams_International;
end

if engineSearch == 1
    masterEngineDatabase;
end

%% Engine Database
% Reference: Appendix J of Fundamenals of Aircraft and Airship Design Vol.
% 1 by Leland Nicolai

% Manufacturer
% Honeywell
function Honeywell
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace

%% Engine Models
% Honeywell F109-GA-100
if engineModel == 1
        engineName  = 'F109-GA-100';
        thrustDry = 1330; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = .396; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 20.7;
        BPR       = 5.0;
        Wa        = 0; %[lbm/s]
        weight    = 439; %[lb]
        diameterMax     = 29.8; %[in]
        diameterFan     = 23.5; %[in]
        engineLengthJet = 44.5; %[in];
        T_W             = 3.03; %[lb/lb]
        
% Honeywell TFE731-20
elseif engineModel == 2
        engineName  = 'TFE731-20';
        thrustDry = 3641; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = .440; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.54; 
        OPR       = 14.3;
        BPR       = 3.7;
        Wa        = 123.0; %[lbm/s]
        weight    = 836; %[lb]
        diameterMax     = 39.4; %[in]
        diameterFan     = 34.2; %[in]
        engineLengthJet = 59.7; %[in]
        T_W             = 4.355; %[lb/lb]
        
% Honeywell TFE731-40
elseif engineModel == 3
        engineName  = 'TFE731-40';
        thrustDry = 4248; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.463; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0; 
        OPR       = 22.0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 885; %[lb]
        diameterMax     = 39.4; %[in]
        diameterFan     = 28.2; %[in]
        engineLengthJet = 51.0; %[in]
        T_W             = 4.800; %[lb/lb;
        
% Honeywell TFE731-5
elseif engineModel == 4
        engineName  = 'TFE731-5';
        thrustDry = 4304; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.484; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 14.6;
        BPR       = 3.5;
        Wa        = 143.0; %[lbm/s]
        weight    = 852; %[lb]
        diameterMax     = 42.5; %[in]
        diameterFan     = 33.8; %[in]
        engineLengthJet = 65.5; %[in]
        T_W             = 5.052; %[lb/lb]
        
% Honeywell TFE731-5A
elseif engineModel == 5
        engineName  = 'TFE731-5A';
        thrustDry = 4500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.469; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 14.0;
        BPR       = 3.3;
        Wa        = 139.7; %[lbm/s]
        weight    = 988; %[lb]
        diameterMax     = 42.5; %[in]
        diameterFan     = 33.8; %[in]
        engineLengthJet = 72.0; %[in]
        T_W             = 4.555; %[lb/lb]
        
% Honeywell TFE731-60
elseif engineModel == 6
        engineName  = 'TFE731-60';
        thrustDry = 4585; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.409; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 22.0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 988; %[lb]
        diameterMax     = 42.5; %[in]
        diameterFan     = 30.7; %[in]
        engineLengthJet = 72.0; %[in]
        T_W             = 5.060; %[lb/lb;
        
% Honeywell ATF3-3
elseif engineModel == 7
        engineName  = 'ATF3-3';
        thrustDry = 5440; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.506; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 22.8;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1118; %[lb]
        diameterMax     = 33.9; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 103.2; %[in]
        T_W             = 4.866; %[lb/lb]
        
% Honeywell ATF3-6A
elseif engineModel == 8
        engineName  = 'ATF3-6A';
        thrustDry = 5440; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.503; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 21.3;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1125; %[lb]
        diameterMax     = 33.9; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 102.3; %[in]
        T_W             = 4.836; %[lb/lb]
        
% Honeywell CFE738-1-1B
elseif engineModel == 9
        engineName  = 'CFE738-1-1B';
        thrustDry = 5918; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.351; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.60;
        OPR       = 35.0;
        BPR       = 5.3;
        Wa        = 210; %[lbm/s]
        weight    = 1325; %[lb]
        diameterMax     = 47.7; %[in]
        diameterFan     = 35.5; %[in]
        engineLengthJet = 98.7; %[in]
        T_W             = 4.466; %[lb/lb]
        
% Honeywell F124-GA-100
elseif engineModel == 10
        engineName = 'F124-GA-100';
        thrustDry = 6400; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.810; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 19.4;
        BPR       = 0.5;
        Wa        = 93.8; %[lbm/s]
        weight    = 1100; %[lb]
        diameterMax     = 36.0; %[in]
        diameterFan     = 23.3; %[in]
        engineLengthJet = 66.8; %[in]
        T_W             = 5.818; %[lb/lb]
        
% Honeywell F125-GA-100
elseif engineModel == 11
        engineName = 'F125-GA-100';
        thrustDry = 6060; %[lb]
        thrustA_B = 9491; %[lb]
        SFCDry    = 0.785; %[lb/s/lb]
        SFC_A_B   = 1.98; %[lb/s/lb]
        FPR       = 0;
        OPR       = 19.0;
        BPR       = 0.5;
        Wa        = 92.60; %[lbm/s]
        weight    = 1360; %[lb]
        diameterMax     = 33.4; %[in]
        diameterFan     = 23.3; %[in]
        engineLengthJet = 140.2; %[in]
        T_W             = 6.979; %[lb/lb]
        
% Honeywell AS907
elseif engineModel == 12
        engineName = 'AS907';
        thrustDry = 6500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.420; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 21.0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1364; %[lb]
        diameterMax     = 46.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 92.4; %[in]
        T_W             = 4.765; %[lb/lb]
        
% Honeywell AS977
elseif engineModel == 13
        engineName = 'AS977';
        thrustDry = 7092; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.416; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 23.0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1364; %[lb]
        diameterMax     = 49.9; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 92.4; %[in]
        T_W             = 5.199; %[lb/lb]
        
% Honeywell LF507-1F
elseif engineModel == 14
        engineName = 'LF507-1F';
        thrustDry = 7000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.397; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 13.8;
        BPR       = 5.0;
        Wa        = 256.0; %[lbm/s]
        weight    = 1385; %[lb]
        diameterMax     = 50.0; %[in]
        diameterFan     = 41.7; %[in]
        engineLengthJet = 65.6; %[in]
        T_W             = 5.054; %[lb/lb]
        
% Honeywell LF507-1H
elseif engineModel == 15
        engineName = 'LF507-1H';
        thrustDry = 7000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.406; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 13.8;
        BPR       = 5.0;
        Wa        = 256.0; %[lbm/s]
        weight    = 1375; %[lb]
        diameterMax     = 50.0; %[in]
        diameterFan     = 41.7; %[in]
        engineLengthJet = 65.6; %[in]
        T_W             = 5.091; %[lb/lb]
        
% Honeywell ALF502L
elseif engineModel == 16
        engineName = 'ALF502L';
        thrustDry = 7500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.730; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 13.3;
        BPR       = 5.2;
        Wa        = 256.0; %[lbm/s]
        weight    = 1375; %[lb]
        diameterMax     = 50.0; %[in]
        diameterFan     = 41.7; %[in]
        engineLengthJet = 65.6; %[in]
        T_W             = 5.455; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 16;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';};

% Rolls-Royce Allison
function Rolls_Royce_Allison
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = '15S';
        thrustDry = 670; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 8.3; %[lbm/s]
        weight    = 62.1; %[lb]
        diameterMax     = 12.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 21.2; %[in]
        T_W             = 10.789; %[lb/lb]
elseif engineModel == 2
        engineName = '150+';
        thrustDry = 575; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 7.2; %[lbm/s]
        weight    = 41.2; %[lb]
        diameterMax     = 11.6; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 19.5; %[in]
        T_W             = 13.956; %[lb/lb]
elseif engineModel == 3
        engineName = '150(J104-AD-100)';
        thrustDry = 485; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.24; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 6.4; %[lbm/s]
        weight    = 41.2; %[lb]
        diameterMax     = 11.6; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 19.5; %[in]
        T_W             = 11.772; %[lb/lb]
elseif engineModel == 4
        engineName = '120';
        thrustDry = 274; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.24; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 3.4; %[lbm/s]
        weight    = 23.0; %[lb]
        diameterMax     = 8.0; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 16.0; %[in]
        T_W             = 11.913; %[lb/lb]
elseif engineModel == 5
        engineName = 'AE2100';
        thrustDry = 6000; %[shp]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.34; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 16.6;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1548; %[lb]
        diameterMax     = 24.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 108.0; %[in]
        T_W             = 0; %[lb/lb]
elseif engineModel == 6
        engineName = 'AE3007';
        thrustDry = 7150; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.39; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 24.0;
        BPR       = 5;
        Wa        = 0; %[lbm/s]
        weight    = 1581; %[lb]
        diameterMax     = 43.5; %[in]
        diameterFan     = 38.5; %[in]
        engineLengthJet = 106.5; %[in]
        T_W             = 4.522; %[lb/lb]
elseif engineModel == 7
        engineName = 'AE3007A';
        thrustDry = 7580; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.39; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 24.0;
        BPR       = 5.3;
        Wa        = 260; %[lbm/s]
        weight    = 1586; %[lb]
        diameterMax     = 43.5; %[in]
        diameterFan     = 38.5; %[in]
        engineLengthJet = 106.5; %[in]
        T_W             = 4.779; %[lb/lb]
elseif engineModel == 8
        engineName = 'AE3007C';
        thrustDry = 6495; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.39; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 24.0;
        BPR       = 5.3;
        Wa        = 240; %[lbm/s]
        weight    = 1581; %[lb]
        diameterMax     = 43.5; %[in]
        diameterFan     = 38.5; %[in]
        engineLengthJet = 106.5; %[in]
        T_W             = 4.108; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 8;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';};

% General Electric Aviation Engines(GEAE)
function GEAETab1
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'CF700';
        thrustDry = 4501; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.651; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.60;
        OPR       = 6.22;
        BPR       = 2;
        Wa        = 130; %[lbm/s]
        weight    = 767; %[lb]
        diameterMax     = 33.0; %[in]
        diameterFan     = 33.0; %[in]
        engineLengthJet = 53.6; %[in]
        T_W             = 5.868; %[lb/lb]
elseif engineModel == 2
        engineName = 'J85-GE-13';
        thrustDry = 2720; %[lb]
        thrustA_B = 4080; %[lb]
        SFCDry    = 1.03; %[lb/s/lb]
        SFC_A_B   = 2.22; %[lb/s/lb]
        FPR       = 0;
        OPR       = 7.0;
        BPR       = 0;
        Wa        = 44; %[lbm/s]
        weight    = 597; %[lb]
        diameterMax     = 17.7; %[in]
        diameterFan     = 16.1; %[in]
        engineLengthJet = 105.0; %[in]
        T_W             = 6.834; %[lb/lb]
elseif engineModel == 3
        engineName = 'J85-GE-17';
        thrustDry = 2700; %[lb]
        thrustA_B = 2850; %[lb]
        SFCDry    = 0.99; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 7.0;
        BPR       = 0;
        Wa        = 44; %[lbm/s]
        weight    = 400; %[lb]
        diameterMax     = 17.7; %[in]
        diameterFan     = 16.1; %[in]
        engineLengthJet = 40.4; %[in]
        T_W             = 7.125; %[lb/lb]
elseif engineModel == 4
        engineName = 'J85-21';
        thrustDry = 3500; %[lb]
        thrustA_B = 5000; %[lb]
        SFCDry    = 1.00; %[lb/s/lb]
        SFC_A_B   = 2.13; %[lb/s/lb]
        FPR       = 0;
        OPR       = 8.3;
        BPR       = 0;
        Wa        = 53; %[lbm/s]
        weight    = 684; %[lb]
        diameterMax     = 21.0; %[in]
        diameterFan     = 18.1; %[in]
        engineLengthJet = 112.5; %[in]
        T_W             = 7.310; %[lb/lb]
elseif engineModel == 5
        engineName = 'CFE738-1';
        thrustDry = 5918; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.371; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.60;
        OPR       = 35.0;
        BPR       = 5.3;
        Wa        = 210; %[lbm/s]
        weight    = 1325; %[lb]
        diameterMax     = 47.7; %[in]
        diameterFan     = 35.5; %[in]
        engineLengthJet = 98.7; %[in]
        T_W             = 4.466; %[lb/lb]
elseif engineModel == 6
        engineName = 'TF34-GE-100';
        thrustDry = 9065; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.37; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.50;
        OPR       = 19.8;
        BPR       = 6.2;
        Wa        = 333; %[lbm/s]
        weight    = 1440; %[lb]
        diameterMax     = 46.0; %[in]
        diameterFan     = 46.0; %[in]
        engineLengthJet = 100.0; %[in]
        T_W             = 6.295; %[lb/lb]
elseif engineModel == 7
        engineName = 'CF34-3';
        thrustDry = 9330; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.50;
        OPR       = 19.8;
        BPR       = 6.3;
        Wa        = 334; %[lbm/s]
        weight    = 1670; %[lb]
        diameterMax     = 44.0; %[in]
        diameterFan     = 44.0; %[in]
        engineLengthJet = 82.3; %[in]
        T_W             = 5.587; %[lb/lb]
elseif engineModel == 8
        engineName = 'CF34-8C1';
        thrustDry = 13790; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.37; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 1.80;
        OPR       = 27.0;
        BPR       = 5.0;
        Wa        = 440; %[lbm/s]
        weight    = 2215; %[lb]
        diameterMax     = 52.0; %[in]
        diameterFan     = 52.0; %[in]
        engineLengthJet = 128.5; %[in]
        T_W             = 6.226; %[lb/lb]
elseif engineModel == 9
        engineName = 'F101-GE-102';
        thrustDry = 18473; %[lb]
        thrustA_B = 33127; %[lb]
        SFCDry    = 0.56; %[lb/s/lb]
        SFC_A_B   = 2.29; %[lb/s/lb]
        FPR       = 2.36;
        OPR       = 26.8;
        BPR       = 1.91;
        Wa        = 352; %[lbm/s]
        weight    = 4468; %[lb]
        diameterMax     = 57.8; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 180.8; %[in]
        T_W             = 7.414; %[lb/lb]
elseif engineModel == 10
        engineName = 'F110-GE-100';
        thrustDry = 17265; %[lb]
        thrustA_B = 28992; %[lb]
        SFCDry    = 0.65; %[lb/s/lb]
        SFC_A_B   = 1.86; %[lb/s/lb]
        FPR       = 3.23;
        OPR       = 31.2;
        BPR       = 0.76;
        Wa        = 263; %[lbm/s]
        weight    = 3923; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 187.6; %[in]
        T_W             = 7.390; %[lb/lb]
elseif engineModel == 11
        engineName = 'F110-GE-400';
        thrustDry = 16333; %[lb]
        thrustA_B = 26950; %[lb]
        SFCDry    = 0.67; %[lb/s/lb]
        SFC_A_B   = 1.85; %[lb/s/lb]
        FPR       = 3.19;
        OPR       = 30.4;
        BPR       = 0.83;
        Wa        = 270; %[lbm/s]
        weight    = 4494; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 232.2; %[in]
        T_W             = 5.997; %[lb/lb]
elseif engineModel == 12
        engineName = 'F110-GE-129';
        thrustDry = 17595; %[lb]
        thrustA_B = 29474; %[lb]
        SFCDry    = 0.67; %[lb/s/lb]
        SFC_A_B   = 1.85; %[lb/s/lb]
        FPR       = 3.30;
        OPR       = 31.2;
        BPR       = 0.74;
        Wa        = 270; %[lbm/s]
        weight    = 3940; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 187.6; %[in]
        T_W             = 7.481; %[lb/lb]
elseif engineModel == 13
        engineName = 'F110-GE-129EFE';
        thrustDry = 17669; %[lb]
        thrustA_B = 33093; %[lb]
        SFCDry    = 0.68; %[lb/s/lb]
        SFC_A_B   = 1.90; %[lb/s/lb]
        FPR       = 3.83;
        OPR       = 36.4;
        BPR       = 0.68;
        Wa        = 275; %[lbm/s]
        weight    = 3990; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 185.3; %[in]
        T_W             = 8.294; %[lb/lb]
elseif engineModel == 14
        engineName = 'F118-GE-100';
        thrustDry = 20187; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.66; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 3.44;
        OPR       = 34.0;
        BPR       = 0.76;
        Wa        = 290; %[lbm/s]
        weight    = 3163; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.1; %[in]
        engineLengthJet = 100.5; %[in]
        T_W             = 6.382; %[lb/lb]
elseif engineModel == 15
        engineName = 'F118-GE-101';
        thrustDry = 15940; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.65; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 3.26;
        OPR       = 32.8;
        BPR       = 0.72;
        Wa        = 251; %[lbm/s]
        weight    = 3150; %[lb]
        diameterMax     = 47.0; %[in]
        diameterFan     = 38.0; %[in]
        engineLengthJet = 100.5; %[in]
        T_W             = 5.060; %[lb/lb]
elseif engineModel == 16
        engineName = 'F404/F1D2';
        thrustDry = 10600; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.80; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 4.10;
        OPR       = 25.0;
        BPR       = 0.37;
        Wa        = 145; %[lbm/s]
        weight    = 1730; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 27.7; %[in]
        engineLengthJet = 87.0; %[in]
        T_W             = 6.127; %[lb/lb]
elseif engineModel == 17
        engineName = 'F404/RM12';
        thrustDry = 12150; %[lb]
        thrustA_B = 18100; %[lb]
        SFCDry    = 0.81; %[lb/s/lb]
        SFC_A_B   = 1.79; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.0;
        BPR       = 0.28;
        Wa        = 152; %[lbm/s]
        weight    = 2325; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 31.0; %[in]
        engineLengthJet = 159.0; %[in]
        T_W             = 7.785; %[lb/lb]
elseif engineModel == 18
        engineName = 'F404-GE-100D';
        thrustDry = 11000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.80; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 4.30;
        OPR       = 25.0;
        BPR       = 0.30;
        Wa        = 142; %[lbm/s]
        weight    = 1802; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 31.0; %[in]
        engineLengthJet = 89.0; %[in]
        T_W             = 6.104; %[lb/lb]
elseif engineModel == 19
        engineName = 'F404-GE-400';
        thrustDry = 10650; %[lb]
        thrustA_B = 16000; %[lb]
        SFCDry    = 0.80; %[lb/s/lb]
        SFC_A_B   = 1.91; %[lb/s/lb]
        FPR       = 4.30;
        OPR       = 28.8;
        BPR       = 0.30;
        Wa        = 146; %[lbm/s]
        weight    = 2185; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 28.0; %[in]
        engineLengthJet = 159.0; %[in]
        T_W             = 7.323; %[lb/lb]
elseif engineModel == 20
        engineName = 'F404-GE-402';
        thrustDry = 11900; %[lb]
        thrustA_B = 17700; %[lb]
        SFCDry    = 0.81; %[lb/s/lb]
        SFC_A_B   = 1.79; %[lb/s/lb]
        FPR       = 4.30;
        OPR       = 28.6;
        BPR       = 0.26;
        Wa        = 146; %[lbm/s]
        weight    = 2230; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 28.0; %[in]
        engineLengthJet = 159.0; %[in]
        T_W             = 7.937; %[lb/lb]
elseif engineModel == 21
        engineName = 'F414-GE-400';
        thrustDry = 14447; %[lb]
        thrustA_B = 21496; %[lb]
        SFCDry    = 0.82; %[lb/s/lb]
        SFC_A_B   = 1.844; %[lb/s/lb]
        FPR       = 4.49;
        OPR       = 29.7;
        BPR       = 0.29;
        Wa        = 168; %[lbm/s]
        weight    = 2512; %[lb]
        diameterMax     = 39.0; %[in]
        diameterFan     = 31.2; %[in]
        engineLengthJet = 153.4; %[in]
        T_W             = 8.557; %[lb/lb]
% elseif engineModel == 22
%         engineName = 'TF-39-GE-1';
%         thrustDry = 41100; %[lb]
%         thrustA_B = 0; %[lb]
%         SFCDry    = 0.315; %[lb/s/lb]
%         SFC_A_B   = 0; %[lb/s/lb]
%         FPR       = 0;
%         OPR       = 26.0;
%         BPR       = 8.0;
%         Wa        = 1541; %[lbm/s]
%         weight    = 7026; %[lb]
%         diameterMax     = 100.0; %[in]
%         diameterFan     = 0; %[in]
%         engineLengthJet = 271.0; %[in]
%         T_W             = 0; %[lb/lb]       
end

% Number of engines
numberOfEngineModels = 21;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';'20';'21';};
function GEAETab2
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'TF-39-GE-1';
        thrustDry = 41100; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.315; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 26.0;
        BPR       = 8.0;
        Wa        = 1541; %[lbm/s]
        weight    = 7026; %[lb]
        diameterMax     = 100.0; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 271.0; %[in]
        T_W             = 0; %[lb/lb]       
end
% Number of engines
numberOfEngineModels = 1;

engineNameSpace = {'123456789';};
function combineGEAEData
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W numberOfEngineModels engineLengthJet GEAETabTable
    
GEAETab1;
masterArrayThrustDry       = zeros(1,22); % 22 is the total number of GEAE engines
masterArrayThrustA_B       = zeros(1,22);
masterArraySFCDry          = zeros(1,22);
masterArraySFC_A_B         = zeros(1,22);
masterArrayFPR             = zeros(1,22);
masterArrayOPR             = zeros(1,22);
masterArrayBPR             = zeros(1,22);
masterArrayWa              = zeros(1,22);
masterArrayWeight          = zeros(1,22);
masterArrayDiameterMax     = zeros(1,22);
masterArrayDiameterFan     = zeros(1,22);
masterArrayEngineLengthJet = zeros(1,22);
masterArrayT_W             = zeros(1,22);

tempEngineModel = 1;
for i = 1:numberOfEngineModels
    GEAETab1;
    masterArrayThrustDry(i) = thrustDry;
    tempEngineModel = tempEngineModel + 1;
end
    tempEngineModel = 1;
    for i = 1:numberOfEngineModels
        GEAETab1;
        masterArrayThrustA_B(i) = thrustA_B;
        tempEngineModel = tempEngineModel + 1;
    end
        tempEngineModel = 1;
        for i = 1:numberOfEngineModels
            GEAETab1;
            masterArraySFCDry(i) = SFCDry;
            tempEngineModel = tempEngineModel + 1;
        end
            tempEngineModel = 1;
            for i = 1:numberOfEngineModels
                GEAETab1;
                masterArraySFC_A_B(i) = SFC_A_B;
                tempEngineModel = tempEngineModel + 1;
            end
                tempEngineModel = 1;
                for i = 1:numberOfEngineModels
                    GEAETab1;
                    masterArrayFPR(i) = FPR;
                    tempEngineModel = tempEngineModel + 1;
                end
                    tempEngineModel = 1;
                    for i = 1:numberOfEngineModels
                        GEAETab1;
                        masterArrayOPR(i) = OPR;
                        tempEngineModel = tempEngineModel + 1;
                    end
                        tempEngineModel = 1;
                        for i = 1:numberOfEngineModels
                            GEAETab1;
                            masterArrayBPR(i) = BPR;
                            tempEngineModel = tempEngineModel + 1;
                        end
                            tempEngineModel = 1;
                            for i = 1:numberOfEngineModels
                                GEAETab1;
                                masterArrayWa(i) = Wa;
                                tempEngineModel = tempEngineModel + 1;
                            end
                                tempEngineModel = 1;
                                for i = 1:numberOfEngineModels
                                    GEAETab1;
                                    masterArrayWeight(i) = weight;
                                    tempEngineModel = tempEngineModel + 1;
                                end
                                    tempEngineModel = 1;
                                    for i = 1:numberOfEngineModels
                                        GEAETab1;
                                        masterArrayDiameterMax(i) = diameterMax;
                                        tempEngineModel = tempEngineModel + 1;
                                    end
                                        tempEngineModel = 1;
                                        for i = 1:numberOfEngineModels
                                            GEAETab1;
                                            masterArrayDiameterFan(i) = diameterFan;
                                            tempEngineModel = tempEngineModel + 1;
                                        end
                                            tempEngineModel = 1;
                                            for i = 1:numberOfEngineModels
                                                GEAETab1;
                                                masterArrayEngineLengthJet(i) = engineLengthJet;
                                                tempEngineModel = tempEngineModel + 1;
                                            end
                                                tempEngineModel = 1;
                                                for i = 1:numberOfEngineModels
                                                    GEAETab1;
                                                    masterArrayT_W(i) = T_W;
                                                    tempEngineModel = tempEngineModel + 1;
                                                end
GEAETab2;
j = 21 + 1; % 21 is the number of engine models in the first tab
tempEngineModel = 1;
for i = 1:numberOfEngineModels
    GEAETab2;
    masterArrayThrustDry(j) = thrustDry;
    tempEngineModel = tempEngineModel + 1;
    j = j + 1;
end
    j = 21 + 1;
    tempEngineModel = 1;
    for i = 1:numberOfEngineModels
        GEAETab2;
        masterArrayThrustA_B(j) = thrustA_B;
        tempEngineModel = tempEngineModel + 1;
        j = j + 1;
    end
        j = 21 + 1;
        tempEngineModel = 1;
        for i = 1:numberOfEngineModels
            GEAETab2;
            masterArraySFCDry(j) = SFCDry(i);
            tempEngineModel = tempEngineModel + 1;
            j = j + 1;
        end
            j = 21 + 1;
            tempEngineModel = 1;
            for i = 1:numberOfEngineModels
                GEAETab2;
                masterArraySFC_A_B(j) = SFC_A_B(i);
                tempEngineModel = tempEngineModel + 1;
                j = j + 1;
            end
                j = 21 + 1;
                tempEngineModel = 1;
                for i = 1:numberOfEngineModels
                    GEAETab2;
                    masterArrayFPR(j) = FPR(i);
                    tempEngineModel = tempEngineModel + 1;
                    j = j + 1;
                end
                    j = 21 + 1;
                    tempEngineModel = 1;
                    for i = 1:numberOfEngineModels
                        GEAETab2;
                        masterArrayOPR(j) = OPR(i);
                        tempEngineModel = tempEngineModel + 1;
                        j = j + 1;
                    end
                        j = 21 + 1;
                        tempEngineModel = 1;
                        for i = 1:numberOfEngineModels
                            GEAETab2;
                            masterArrayBPR(j) = BPR(i);
                            tempEngineModel = tempEngineModel + 1;
                            j = j + 1;
                        end
                            j = 21 + 1;
                            tempEngineModel = 1;
                            for i = 1:numberOfEngineModels
                                GEAETab2;
                                masterArrayWa(j) = Wa(i);
                                tempEngineModel = tempEngineModel + 1;
                                j = j + 1;
                            end
                                j = 21 + 1;
                                tempEngineModel = 1;
                                for i = 1:numberOfEngineModels
                                    GEAETab2;
                                    masterArrayWeight(j) = weight(i);
                                    tempEngineModel = tempEngineModel + 1;
                                    j = j + 1;
                                end
                                    j = 21 + 1;
                                    tempEngineModel = 1;
                                    for i = 1:numberOfEngineModels
                                        GEAETab2;
                                        masterArrayDiameterMax(j) = diameterMax(i);
                                        tempEngineModel = tempEngineModel + 1;
                                        j = j + 1;
                                    end
                                        j = 21 + 1;
                                        tempEngineModel = 1;
                                        for i = 1:numberOfEngineModels
                                            GEAETab2;
                                            masterArrayDiameterFan(j) = diameterFan(i);
                                            tempEngineModel = tempEngineModel + 1;
                                            j = j + 1;
                                        end
                                            j = 21 + 1;
                                            tempEngineModel = 1;
                                            for i = 1:numberOfEngineModels
                                                GEAETab2;
                                                masterArrayEngineLengthJet(j) = engineLengthJet(i);
                                                tempEngineModel = tempEngineModel + 1;
                                                j = j + 1;
                                            end
                                                j = 21 + 1;
                                                tempEngineModel = 1;
                                                for i = 1:numberOfEngineModels
                                                    GEAETab2;
                                                    masterArrayT_W(j) = T_W(i);
                                                    tempEngineModel = tempEngineModel + 1;
                                                    j = j + 1;
                                                end

if GEAETabTable == 1
    GEAETab1;
else
    GEAETab2;
end

% CFM
function CFM
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'CFM56-2';
        thrustDry = 22000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 24.7;
        BPR       = 6.0;
        Wa        = 821; %[lbm/s]
        weight    = 4612; %[lb]
        diameterMax     = 72; %[in]
        diameterFan     = 68.3; %[in]
        engineLengthJet = 95.7; %[in]
        T_W             = 4.77; %[lb/lb]
elseif engineModel == 2
        engineName = 'CFM56-3';
        thrustDry = 23500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.39; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 22.6;
        BPR       = 5.0;
        Wa        = 655; %[lbm/s]
        weight    = 4280; %[lb]
        diameterMax     = 63.0; %[in]
        diameterFan     = 60.0; %[in]
        engineLengthJet = 93.0; %[in]
        T_W             = 5.491; %[lb/lb]
elseif engineModel == 3
        engineName = 'CFM56-5-A1';
        thrustDry = 25000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.33; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 26.5;
        BPR       = 6.0;
        Wa        = 852; %[lbm/s]
        weight    = 4860; %[lb]
        diameterMax     = 72.0; %[in]
        diameterFan     = 68.3; %[in]
        engineLengthJet = 95.4; %[in]
        T_W             = 5.144; %[lb/lb]
elseif engineModel == 4
        engineName = 'CFM56-5C-2';
        thrustDry = 31200; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.32; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 31.5;
        BPR       = 6.60;
        Wa        = 1027; %[lbm/s]
        weight    = 5700; %[lb]
        diameterMax     = 76.6; %[in]
        diameterFan     = 72.3; %[in]
        engineLengthJet = 103.0; %[in]
        T_W             = 5.474; %[lb/lb]
elseif engineModel == 5
        engineName = 'CFM56-5C-3';
        thrustDry = 32500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.32; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 32.6;
        BPR       = 6.60;
        Wa        = 1027; %[lbm/s]
        weight    = 5700; %[lb]
        diameterMax     = 76.6; %[in]
        diameterFan     = 72.3; %[in]
        engineLengthJet = 103.0; %[in]
        T_W             = 5.702; %[lb/lb]
elseif engineModel == 6
        engineName = 'CFM56-5C-4';
        thrustDry = 34000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.33; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 33.9;
        BPR       = 6.60;
        Wa        = 1027; %[lbm/s]
        weight    = 5700; %[lb]
        diameterMax     = 76.6; %[in]
        diameterFan     = 72.3; %[in]
        engineLengthJet = 103.0; %[in]
        T_W             = 5.965; %[lb/lb]
elseif engineModel == 7
        engineName = 'CFM56-5B2';
        thrustDry = 31000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 32.9;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 5250; %[lb]
        diameterMax     = 72.0; %[in]
        diameterFan     = 68.3; %[in]
        engineLengthJet = 103.0; %[in]
        T_W             = 5.905; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 7;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';};

% Microturbo
function Microturbo
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'TRS 18';
        thrustDry = 259; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.22; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 3.7;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 92.6; %[lb]
        diameterMax     = 11.8; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 23.6; %[in]
        T_W             = 2.792; %[lb/lb]
elseif engineModel == 2
        engineName = 'TRS 18-1';
        thrustDry = 360; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.18; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 4.7;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 92.6; %[lb]
        diameterMax     = 11.8; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 23.6; %[in]
        T_W             = 3.885; %[lb/lb]
elseif engineModel == 3
        engineName = 'TRI 60-1';
        thrustDry = 787; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.19; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 3.7;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.1; %[in]
        T_W             = 5.491; %[lb/lb]
elseif engineModel == 4
        engineName = 'TRI 60-2';
        thrustDry = 832; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.26; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 3.8;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.1; %[in]
        T_W             = 5.805; %[lb/lb]
elseif engineModel == 5
        engineName = 'TRI 60-3';
        thrustDry = 944; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.29; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 3.9;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.1; %[in]
        T_W             = 6.589; %[lb/lb]
elseif engineModel == 6
        engineName = 'TRI 60-5';
        thrustDry = 990; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.30; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 4.1;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.1; %[in]
        T_W             = 6.909; %[lb/lb]
elseif engineModel == 7
        engineName = 'TRI 60-20';
        thrustDry = 1214; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.15; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 6.3;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.7; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.5; %[in]
        T_W             = 8.472; %[lb/lb]
elseif engineModel == 8
        engineName = 'TRI 60-30';
        thrustDry = 1214; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.10; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 6.3;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 143.3; %[lb]
        diameterMax     = 13.7; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.5; %[in]
        T_W             = 8.472; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 8;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';};

% Pratt & Witney Aviation(P&WA)
function P_WATab1
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'JT15D-5/5A';
        thrustDry = 2900; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.551; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 12.6;
        BPR       = 3.30;
        Wa        = 75; %[lbm/s]
        weight    = 632.0; %[lb]
        diameterMax     = 27.3; %[in]
        diameterFan     = 22.7; %[in]
        engineLengthJet = 63.0; %[in]
        T_W             = 4.589; %[lb/lb]
elseif engineModel == 2
        engineName = 'JT15D-5C TP';
        thrustDry = 3190; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.573; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 13.5;
        BPR       = 1.80;
        Wa        = 92; %[lbm/s]
        weight    = 665.0; %[lb]
        diameterMax     = 27.0; %[in]
        diameterFan     = 22.7; %[in]
        engineLengthJet = 45.5; %[in]
        T_W             = 4.797; %[lb/lb]
elseif engineModel == 3
        engineName = 'JT15D-5D';
        thrustDry = 3045; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.560; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 13.1;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 627.0; %[lb]
        diameterMax     = 27.3; %[in]
        diameterFan     = 22.7; %[in]
        engineLengthJet = 63.0; %[in]
        T_W             = 4.856; %[lb/lb]
elseif engineModel == 4
        engineName = 'PW305A';
        thrustDry = 4679; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.388; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 12.9;
        BPR       = 4.30;
        Wa        = 0; %[lbm/s]
        weight    = 993.0; %[lb]
        diameterMax     = 44.0; %[in]
        diameterFan     = 30.1; %[in]
        engineLengthJet = 82.0; %[in]
        T_W             = 4.712; %[lb/lb]
elseif engineModel == 5
        engineName = 'PW305B';
        thrustDry = 5266; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.391; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 12.9;
        BPR       = 4.30;
        Wa        = 0; %[lbm/s]
        weight    = 993.0; %[lb]
        diameterMax     = 44.0; %[in]
        diameterFan     = 30.1; %[in]
        engineLengthJet = 82.0; %[in]
        T_W             = 5.303; %[lb/lb]
elseif engineModel == 6
        engineName = 'PW306/5(+5)';
        thrustDry = 6040; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.400; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 4.70;
        Wa        = 207; %[lbm/s]
        weight    = 1043.0; %[lb]
        diameterMax     = 46.0; %[in]
        diameterFan     = 31.6; %[in]
        engineLengthJet = 68.1; %[in]
        T_W             = 5.791; %[lb/lb]      
elseif engineModel == 7
        engineName = 'PW308A';
        thrustDry = 6575; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.382; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1317; %[lb]
        diameterMax     = 37.0; %[in]
        diameterFan     = 33.7; %[in]
        engineLengthJet = 95.8; %[in]
        T_W             = 4.992; %[lb/lb] 
elseif engineModel == 8
        engineName = 'PW535';
        thrustDry = 3200; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.465; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 2.63;
        Wa        = 113; %[lbm/s]
        weight    = 693.0; %[lb]
        diameterMax     = 35.0; %[in]
        diameterFan     = 23.5; %[in]
        engineLengthJet = 52.9; %[in]
        T_W             = 4.618; %[lb/lb]
elseif  engineModel == 9
        engineName = 'PW600';
        thrustDry = 3000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.46; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 0;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 830; %[lb]
        diameterMax     = 27.5; %[in]
        diameterFan     = 27.5; %[in]
        engineLengthJet = 49.5; %[in]
        T_W             = 3.614; %[lb/lb]
elseif engineModel == 10
        engineName = 'F100-PW-100';
        thrustDry = 14100; %[lb]
        thrustA_B = 22600; %[lb]
        SFCDry    = 0.70; %[lb/s/lb]
        SFC_A_B   = 2.10; %[lb/s/lb]
        FPR       = 3.12;
        OPR       = 24.9;
        BPR       = 0.63;
        Wa        = 222; %[lbm/s]
        weight    = 3209.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 34.8; %[in]
        engineLengthJet = 196.3; %[in]
        T_W             = 7.043; %[lb/lb]
elseif engineModel == 11
        engineName = 'F100-PW-200';
        thrustDry = 14100; %[lb]
        thrustA_B = 22600; %[lb]
        SFCDry    = 0.70; %[lb/s/lb]
        SFC_A_B   = 2.10; %[lb/s/lb]
        FPR       = 3.12;
        OPR       = 24.9;
        BPR       = 0.63;
        Wa        = 223; %[lbm/s]
        weight    = 3209.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 34.8; %[in]
        engineLengthJet = 196.3; %[in]
        T_W             = 7.043; %[lb/lb]
elseif engineModel == 12
        engineName = 'F100-PW-220';
        thrustDry = 14590; %[lb]
        thrustA_B = 23770; %[lb]
        SFCDry    = 0.70; %[lb/s/lb]
        SFC_A_B   = 2.10; %[lb/s/lb]
        FPR       = 3.23;
        OPR       = 25.6;
        BPR       = 0.60;
        Wa        = 224; %[lbm/s]
        weight    = 3234.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 34.8; %[in]
        engineLengthJet = 206.1; %[in]
        T_W             = 7.350; %[lb/lb]
elseif engineModel == 13
        engineName = 'F100-PW-220E';
        thrustDry = 14590; %[lb]
        thrustA_B = 23770; %[lb]
        SFCDry    = 0.70; %[lb/s/lb]
        SFC_A_B   = 2.10; %[lb/s/lb]
        FPR       = 3.23;
        OPR       = 25.6;
        BPR       = 0.60;
        Wa        = 224; %[lbm/s]
        weight    = 3234.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 34.8; %[in]
        engineLengthJet = 206.1; %[in]
        T_W             = 7.350; %[lb/lb]
elseif engineModel == 14
        engineName = 'F100-PW-229';
        thrustDry = 17800; %[lb]
        thrustA_B = 29100; %[lb]
        SFCDry    = 0.74; %[lb/s/lb]
        SFC_A_B   = 2.05; %[lb/s/lb]
        FPR       = 3.70;
        OPR       = 31.6;
        BPR       = 0.39;
        Wa        = 245; %[lbm/s]
        weight    = 3830.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 34.8; %[in]
        engineLengthJet = 191.2; %[in]
        T_W             = 7.598; %[lb/lb]
elseif engineModel == 15
        engineName = 'F100-PW-229A';
        thrustDry = 20100; %[lb]
        thrustA_B = 32500; %[lb]
        SFCDry    = 0.71; %[lb/s/lb]
        SFC_A_B   = 1.86; %[lb/s/lb]
        FPR       = 3.95;
        OPR       = 34.2;
        BPR       = 0.370;
        Wa        = 275; %[lbm/s]
        weight    = 4065.0; %[lb]
        diameterMax     = 46.5; %[in]
        diameterFan     = 36.0; %[in]
        engineLengthJet = 190.7; %[in]
        T_W             = 7.995; %[lb/lb]
elseif engineModel == 16
        engineName = 'PW2037';
        thrustDry = 38350; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.34; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.6;
        BPR       = 6.00;
        Wa        = 1210; %[lbm/s]
        weight    = 7185.0; %[lb]
        diameterMax     = 84.8; %[in]
        diameterFan     = 78.5; %[in]
        engineLengthJet = 141.4; %[in]
        T_W             = 5.338; %[lb/lb]
elseif engineModel == 17
        engineName = 'PW2040';
        thrustDry = 41700; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 30.1;
        BPR       = 5.90;
        Wa        = 1255; %[lbm/s]
        weight    = 7185.0; %[lb]
        diameterMax     = 84.8; %[in]
        diameterFan     = 78.5; %[in]
        engineLengthJet = 141.4; %[in]
        T_W             = 5.804; %[lb/lb]
elseif engineModel == 18
        engineName = 'PW2043';
        thrustDry = 43000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 32.1;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 7185.0; %[lb]
        diameterMax     = 84.8; %[in]
        diameterFan     = 78.5; %[in]
        engineLengthJet = 141.4; %[in]
        T_W             = 5.985; %[lb/lb]
elseif engineModel == 19
        engineName = 'PW4052/4152';
        thrustDry = 52200; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.31; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.5;
        BPR       = 5.00;
        Wa        = 1700; %[lbm/s]
        weight    = 9400.0; %[lb]
        diameterMax     = 94.0; %[in]
        diameterFan     = 94.0; %[in]
        engineLengthJet = 132.7; %[in]
        T_W             = 5.553; %[lb/lb]
elseif engineModel == 20
        engineName = 'PW4056/4156';
        thrustDry = 56750; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.32; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 30.2;
        BPR       = 4.80;
        Wa        = 0; %[lbm/s]
        weight    = 9400.0; %[lb]
        diameterMax     = 94.0; %[in]
        diameterFan     = 94.0; %[in]
        engineLengthJet = 132.7; %[in]
        T_W             = 6.037; %[lb/lb]
elseif engineModel == 21
        engineName = 'PW4060/4360';
        thrustDry = 60000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.33; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 31.5;
        BPR       = 4.70;
        Wa        = 0; %[lbm/s]
        weight    = 9400.0; %[lb]
        diameterMax     = 94.0; %[in]
        diameterFan     = 94.0; %[in]
        engineLengthJet = 132.7; %[in]
        T_W             = 6.383; %[lb/lb]
elseif engineModel == 21
        engineName = 'PW6122';
        thrustDry = 22000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.2;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 5080.0; %[lb]
        diameterMax     = 56.5; %[in]
        diameterFan     = 56.5; %[in]
        engineLengthJet = 107.4; %[in]
        T_W             = 4.331; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 21;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';'16';'17';'18';'19';'20';'21';};
function P_WATab2
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'PW6162';
        thrustDry = 24000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.37; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 29.6;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 5080.0; %[lb]
        diameterMax     = 56.5; %[in]
        diameterFan     = 56.5; %[in]
        engineLengthJet = 107.4; %[in]
        T_W             = 4.724; %[lb/lb]
elseif engineModel == 2
        engineName = 'PW6122';
        thrustDry = 22000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.2;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 5080.0; %[lb]
        diameterMax     = 56.5; %[in]
        diameterFan     = 56.5; %[in]
        engineLengthJet = 107.4; %[in]
        T_W             = 4.331; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 2;

engineNameSpace = {'123456789';'2';};
function combinePWAData
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W numberOfEngineModels engineLengthJet PWATabTable
    
P_WATab1;
masterArrayThrustDry       = zeros(1,23); % 23 is the total number of GEAE engines
masterArrayThrustA_B       = zeros(1,23);
masterArraySFCDry          = zeros(1,23);
masterArraySFC_A_B         = zeros(1,23);
masterArrayFPR             = zeros(1,23);
masterArrayOPR             = zeros(1,23);
masterArrayBPR             = zeros(1,23);
masterArrayWa              = zeros(1,23);
masterArrayWeight          = zeros(1,23);
masterArrayDiameterMax     = zeros(1,23);
masterArrayDiameterFan     = zeros(1,23);
masterArrayEngineLengthJet = zeros(1,23);
masterArrayT_W             = zeros(1,23);

tempEngineModel = 1;
for i = 1:numberOfEngineModels
    P_WATab1;
    masterArrayThrustDry(i) = thrustDry;
    tempEngineModel = tempEngineModel + 1;
end
    tempEngineModel = 1;
    for i = 1:numberOfEngineModels
        P_WATab1;
        masterArrayThrustA_B(i) = thrustA_B;
        tempEngineModel = tempEngineModel + 1;
    end
        tempEngineModel = 1;
        for i = 1:numberOfEngineModels
            P_WATab1;
            masterArraySFCDry(i) = SFCDry;
            tempEngineModel = tempEngineModel + 1;
        end
            tempEngineModel = 1;
            for i = 1:numberOfEngineModels
                P_WATab1;
                masterArraySFC_A_B(i) = SFC_A_B;
                tempEngineModel = tempEngineModel + 1;
            end
                tempEngineModel = 1;
                for i = 1:numberOfEngineModels
                    P_WATab1;
                    masterArrayFPR(i) = FPR;
                    tempEngineModel = tempEngineModel + 1;
                end
                    tempEngineModel = 1;
                    for i = 1:numberOfEngineModels
                        P_WATab1;
                        masterArrayOPR(i) = OPR;
                        tempEngineModel = tempEngineModel + 1;
                    end
                        tempEngineModel = 1;
                        for i = 1:numberOfEngineModels
                            P_WATab1;
                            masterArrayBPR(i) = BPR;
                            tempEngineModel = tempEngineModel + 1;
                        end
                        tempEngineModel = 1;
                            for i = 1:numberOfEngineModels
                                P_WATab1;
                                masterArrayWa(i) = Wa;
                                tempEngineModel = tempEngineModel + 1;
                            end
                                tempEngineModel = 1;
                                for i = 1:numberOfEngineModels
                                    P_WATab1;
                                    masterArrayWeight(i) = weight;
                                    tempEngineModel = tempEngineModel + 1;
                                end
                                    tempEngineModel = 1;
                                    for i = 1:numberOfEngineModels
                                        P_WATab1;
                                        masterArrayDiameterMax(i) = diameterMax;
                                        tempEngineModel = tempEngineModel + 1;
                                    end
                                        tempEngineModel = 1;
                                        for i = 1:numberOfEngineModels
                                            P_WATab1;
                                            masterArrayDiameterFan(i) = diameterFan;
                                            tempEngineModel = tempEngineModel + 1;
                                        end
                                            tempEngineModel = 1;
                                            for i = 1:numberOfEngineModels
                                                P_WATab1;
                                                masterArrayEngineLengthJet(i) = engineLengthJet;
                                                tempEngineModel = tempEngineModel + 1;
                                            end
                                                tempEngineModel = 1;
                                                for i = 1:numberOfEngineModels
                                                    P_WATab1;
                                                    masterArrayT_W(i) = T_W;
                                                    tempEngineModel = tempEngineModel + 1;
                                                end
P_WATab2;
j = 21 + 1; % 21 is the number of engine models in the first tab
tempEngineModel = 1;
for i = 1:numberOfEngineModels
    P_WATab2;
    masterArrayThrustDry(j) = thrustDry;
    tempEngineModel = tempEngineModel + 1;
    j = j + 1;
end
    j = 21 + 1;
    tempEngineModel = 1;
    for i = 1:numberOfEngineModels
        P_WATab2;
        masterArrayThrustA_B(j) = thrustA_B;
        tempEngineModel = tempEngineModel + 1;
        j = j + 1;
    end
        j = 21 + 1;
        tempEngineModel = 1;
        for i = 1:numberOfEngineModels
            P_WATab2;
            masterArraySFCDry(j) = SFCDry;
            tempEngineModel = tempEngineModel + 1;
            j = j + 1;
        end
            j = 21 + 1;
            tempEngineModel = 1;
            for i = 1:numberOfEngineModels
                P_WATab2;
                masterArraySFC_A_B(j) = SFC_A_B;
                tempEngineModel = tempEngineModel + 1;
                j = j + 1;
            end
                j = 21 + 1;
                tempEngineModel = 1;
                for i = 1:numberOfEngineModels
                    P_WATab2;
                    masterArrayFPR(j) = FPR;
                    tempEngineModel = tempEngineModel + 1;
                    j = j + 1;
                end
                    j = 21 + 1;
                    tempEngineModel = 1;
                    for i = 1:numberOfEngineModels
                        P_WATab2;
                        masterArrayOPR(j) = OPR;
                        tempEngineModel = tempEngineModel + 1;
                        j = j + 1;
                    end
                        j = 21 + 1;
                        tempEngineModel = 1;
                        for i = 1:numberOfEngineModels
                            P_WATab2;
                            masterArrayBPR(j) = BPR;
                            tempEngineModel = tempEngineModel + 1;
                            j = j + 1;
                        end
                            j = 21 + 1;
                            tempEngineModel = 1;
                            for i = 1:numberOfEngineModels
                                P_WATab2;
                                masterArrayWa(j) = Wa;
                                tempEngineModel = tempEngineModel + 1;
                                j = j + 1;
                            end
                                j = 21 + 1;
                                tempEngineModel = 1;
                                for i = 1:numberOfEngineModels
                                    P_WATab2;
                                    masterArrayWeight(j) = weight;
                                    tempEngineModel = tempEngineModel + 1;
                                    j = j + 1;
                                end
                                    j = 21 + 1;
                                    tempEngineModel = 1;
                                    for i = 1:numberOfEngineModels
                                        P_WATab2;
                                        masterArrayDiameterMax(j) = diameterMax;
                                        tempEngineModel = tempEngineModel + 1;
                                        j = j + 1;
                                    end
                                        j = 21 + 1;
                                        tempEngineModel = 1;
                                        for i = 1:numberOfEngineModels
                                            P_WATab2;
                                            masterArrayDiameterFan(j) = diameterFan;
                                            tempEngineModel = tempEngineModel + 1;
                                            j = j + 1;
                                        end
                                            j = 21 + 1;
                                            tempEngineModel = 1;
                                            for i = 1:numberOfEngineModels
                                                P_WATab2;
                                                masterArrayEngineLengthJet(j) = engineLengthJet;
                                                tempEngineModel = tempEngineModel + 1;
                                                j = j + 1;
                                            end
                                                j = 21 + 1;
                                                tempEngineModel = 1;
                                                for i = 1:numberOfEngineModels
                                                    P_WATab2;
                                                    masterArrayT_W(j) = T_W;
                                                    tempEngineModel = tempEngineModel + 1;
                                                    j = j + 1;
                                                end
 
if PWATabTable == 1
    P_WATab1;
else
    P_WATab2;
end

% International Aero Engines(IAE)
function IAE
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'V2500-A1';
        thrustDry = 25000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 29.7;
        BPR       = 5.40;
        Wa        = 783; %[lbm/s]
        weight    = 5074.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 4.927; %[lb/lb]
elseif engineModel == 2
        engineName = 'V2522-A5';
        thrustDry = 22000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.34; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 25.2;
        BPR       = 5.00;
        Wa        = 738; %[lbm/s]
        weight    = 5252.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 4.189; %[lb/lb]
elseif engineModel == 3
        engineName = 'V2524-A5';
        thrustDry = 23500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 26.5;
        BPR       = 4.80;
        Wa        = 784; %[lbm/s]
        weight    = 5252.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 4.474; %[lb/lb]
elseif engineModel == 4
        engineName = 'V2525-D5';
        thrustDry = 25000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 27.7;
        BPR       = 4.80;
        Wa        = 784; %[lbm/s]
        weight    = 5252.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 4.760; %[lb/lb]
elseif engineModel == 5
        engineName = 'V2527-A5';
        thrustDry = 26500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 30.0;
        BPR       = 4.70;
        Wa        = 825; %[lbm/s]
        weight    = 5252.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 5.046; %[lb/lb]
elseif engineModel == 6
        engineName = 'V528-D5';
        thrustDry = 28000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.35; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 30.4;
        BPR       = 4.70;
        Wa        = 825; %[lbm/s]
        weight    = 5252.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 5.331; %[lb/lb]
elseif engineModel == 7
        engineName = 'V2530-A5';
        thrustDry = 31400; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 31.6;
        BPR       = 4.60;
        Wa        = 848; %[lbm/s]
        weight    = 5139.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 6.110; %[lb/lb]
elseif engineModel == 8
        engineName = 'V2530-D5';
        thrustDry = 30000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 31.6;
        BPR       = 4.60;
        Wa        = 848; %[lbm/s]
        weight    = 5139.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 5.838; %[lb/lb]
elseif engineModel == 9
        engineName = 'V2533-A5';
        thrustDry = 33000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.36; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 33.4;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 5074.0; %[lb]
        diameterMax     = 67.5; %[in]
        diameterFan     = 63.0; %[in]
        engineLengthJet = 126.0; %[in]
        T_W             = 6.504; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 9;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';'9';};

% Rolls-Royce/Turbomeca
function Rolls_Royce_Turbomeca
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'Adour MK.861';
        thrustDry = 5710; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.74; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 11.3;
        BPR       = 0.8;
        Wa        = 95; %[lbm/s]
        weight    = 1240.0; %[lb]
        diameterMax     = 30.0; %[in]
        diameterFan     = 22.3; %[in]
        engineLengthJet = 77.0; %[in]
        T_W             = 4.605; %[lb/lb]
elseif engineModel == 2
        engineName = 'Adour MK.871';
        thrustDry = 5990; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.78; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 11.3;
        BPR       = 0.8;
        Wa        = 97.6; %[lbm/s]
        weight    = 1306.0; %[lb]
        diameterMax     = 30.9; %[in]
        diameterFan     = 22.3; %[in]
        engineLengthJet = 77.0; %[in]
        T_W             = 4.587; %[lb/lb]
elseif engineModel == 3
        engineName = 'Adour MK.811/815';
        thrustDry = 8400; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.78; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 11.3;
        BPR       = 0;
        Wa        = 0; %[lbm/s]
        weight    = 1633.0; %[lb]
        diameterMax     = 30.8; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 114.0; %[in]
        T_W             = 5.144; %[lb/lb]
elseif engineModel == 4
        engineName = 'BR700-710';
        thrustDry = 15500; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.4; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 24.0;
        BPR       = 4.2;
        Wa        = 445.0; %[lbm/s]
        weight    = 4640.0; %[lb]
        diameterMax     = 48.0; %[in]
        diameterFan     = 48.0; %[in]
        engineLengthJet = 89.0; %[in]
        T_W             = 3.341; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 4;

engineNameSpace = {'123456789';'2';'3';'4';};

% Teledyne CAE
function Teledyne_CAE
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = '304';
        thrustDry = 59; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.50;
        BPR       = 0;
        Wa        = 1.0; %[lbm/s]
        weight    = 8.5; %[lb]
        diameterMax     = 4.0; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 9.3; %[in]
        T_W             = 6.941; %[lb/lb]
elseif engineModel == 2
        engineName = '305';
        thrustDry = 90; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.26; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.70;
        BPR       = 0;
        Wa        = 1.3; %[lbm/s]
        weight    = 19; %[lb]
        diameterMax     = 6.6; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 10.7; %[in]
        T_W             = 4.737; %[lb/lb]
elseif engineModel == 3
        engineName = '312';
        thrustDry = 173; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.23; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.70;
        BPR       = 0;
        Wa        = 2.6; %[lbm/s]
        weight    = 38; %[lb]
        diameterMax     = 8.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 13.4; %[in]
        T_W             = 4.553; %[lb/lb]
elseif engineModel == 4
        engineName = 'J700-CA-400';
        thrustDry = 177; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.21; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.70;
        BPR       = 0;
        Wa        = 2.6; %[lbm/s]
        weight    = 39; %[lb]
        diameterMax     = 8.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 14.8; %[in]
        T_W             = 4.538; %[lb/lb]
elseif engineModel == 5
        engineName = '320-1';
        thrustDry = 240; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.13; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.70;
        BPR       = 0;
        Wa        = 3.7; %[lbm/s]
        weight    = 50; %[lb]
        diameterMax     = 9.9; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 17.5; %[in]
        T_W             = 4.800; %[lb/lb]
elseif engineModel == 6
        engineName = '320-2';
        thrustDry = 350; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.09; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 7.90;
        BPR       = 0;
        Wa        = 4.9; %[lbm/s]
        weight    = 58; %[lb]
        diameterMax     = 9.9; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 19.3; %[in]
        T_W             = 6.034; %[lb/lb]
elseif engineModel == 7
        engineName = 'J402-CA-700';
        thrustDry = 640; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.50;
        BPR       = 0;
        Wa        = 9.5; %[lbm/s]
        weight    = 113; %[lb]
        diameterMax     = 12.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 29.7; %[in]
        T_W             = 5.664; %[lb/lb]
elseif engineModel == 8
        engineName = 'J402-CA-400';
        thrustDry = 640; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.60;
        BPR       = 0;
        Wa        = 9.6; %[lbm/s]
        weight    = 101.5; %[lb]
        diameterMax     = 12.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 29.4; %[in]
        T_W             = 6.502; %[lb/lb]
elseif engineModel == 9
        engineName = '370-9B';
        thrustDry = 640; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.20; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.50;
        BPR       = 0;
        Wa        = 9.6; %[lbm/s]
        weight    = 119; %[lb]
        diameterMax     = 12.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 23.6; %[in]
        T_W             = 5.378; %[lb/lb]
elseif engineModel == 10
        engineName = 'J402-CA-702';
        thrustDry = 960; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.03; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 8.50;
        BPR       = 0;
        Wa        = 13.7; %[lbm/s]
        weight    = 138; %[lb]
        diameterMax     = 12.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.3; %[in]
        T_W             = 6.957; %[lb/lb]
elseif engineModel == 11
        engineName = 'F408-CA-400';
        thrustDry = 1008; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.97; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 8.50;
        BPR       = 0;
        Wa        = 16.0; %[lbm/s]
        weight    = 145; %[lb]
        diameterMax     = 13.2; %[in]
        diameterFan     = 8.6; %[in]
        engineLengthJet = 37.0; %[in]
        T_W             = 6.952; %[lb/lb]
elseif engineModel == 12
        engineName = 'J69-T-25A';
        thrustDry = 1025; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.14; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 3.90;
        BPR       = 0;
        Wa        = 20.0; %[lbm/s]
        weight    = 358; %[lb]
        diameterMax     = 22.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 35.4; %[in]
        T_W             = 2.863; %[lb/lb]
elseif engineModel == 13
        engineName = 'J69-T-29';
        thrustDry = 1700; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.10; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.30;
        BPR       = 0;
        Wa        = 29.9; %[lbm/s]
        weight    = 340; %[lb]
        diameterMax     = 22.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 45.0; %[in]
        T_W             = 5.000; %[lb/lb]
elseif engineModel == 14
        engineName = 'J69-T-41A';
        thrustDry = 1920; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.10; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.50;
        BPR       = 0;
        Wa        = 29.9; %[lbm/s]
        weight    = 350; %[lb]
        diameterMax     = 22.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 45.0; %[in]
        T_W             = 5.486; %[lb/lb]
elseif engineModel == 15
        engineName = 'J69-T-406';
        thrustDry = 1920; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.11; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 5.50;
        BPR       = 0;
        Wa        = 29.9; %[lbm/s]
        weight    = 360; %[lb]
        diameterMax     = 22.5; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 45.0; %[in]
        T_W             = 5.333; %[lb/lb]
end

% Number of engines
numberOfEngineModels = 15;

engineNameSpace = {'123456789';'2';'3';'4';'5';'6';'7';'8';'9';'10';'11';'12';'13';'14';'15';};

% Williams International
function Williams_International
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineName numberOfEngineModels engineLengthJet...
    engineNameSpace
% Engine Model
if engineModel == 1
        engineName = 'F107-WR-101';
        thrustDry = 635; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.69; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 2.1;
        OPR       = 13.8;
        BPR       = 0.91;
        Wa        = 13.6; %[lbm/s]
        weight    = 141; %[lb]
        diameterMax     = 21.0; %[in]
        diameterFan     = 12.0; %[in]
        engineLengthJet = 48.5; %[in]
        T_W             = 4.504; %[lb/lb]
elseif engineModel == 2
        engineName = 'FJ44-1A';
        thrustDry = 1900; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.46; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 0;
        OPR       = 12.8;
        BPR       = 3.2;
        Wa        = 63.3; %[lbm/s]
        weight    = 452; %[lb]
        diameterMax     = 28.3; %[in]
        diameterFan     = 20.9; %[in]
        engineLengthJet = 40.28; %[in]
        T_W             = 4.204; %[lb/lb]
elseif engineModel == 3
        engineName = 'F112-WR-100';
        thrustDry = 732; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 0.68; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 2.39;
        OPR       = 16.24;
        BPR       = 0.86;
        Wa        = 14.6; %[lbm/s]
        weight    = 161; %[lb]
        diameterMax     = 18.3; %[in]
        diameterFan     = 0; %[in]
        engineLengthJet = 33.3; %[in]
        T_W             = 4.547; %[lb/lb]
elseif engineModel == 4
        engineName = 'P8300';
        thrustDry = 1000; %[lb]
        thrustA_B = 0; %[lb]
        SFCDry    = 1.29; %[lb/s/lb]
        SFC_A_B   = 0; %[lb/s/lb]
        FPR       = 2.1;
        OPR       = 13.8;
        BPR       = 0.91;
        Wa        = 13.6; %[lbm/s]
        weight    = 141; %[lb]
        diameterMax     = 21.0; %[in]
        diameterFan     = 12.0; %[in]
        engineLengthJet = 48.5; %[in]
        T_W             = 4.504; %[lb/lb]
end
% Number of engines
numberOfEngineModels = 4;

engineNameSpace = {'123456789';'2';'3';'4';};

% Master Database for Engine Search
function masterEngineDatabase
global thrustDry thrustA_B SFCDry SFC_A_B FPR OPR BPR Wa weight diameterMax...
    diameterFan T_W engineModel engineLengthJet arrayThrustDry arrayThrustA_B...
    arraySFCDry arraySFC_A_B arrayFPR arrayOPR arrayBPR arrayWa arrayWeight...
    arrayDiameterMax arrayDiameterFan arrayEngineLengthJet arrayT_W arrayEngineNames...
    engineSearch engineName

% Total number of engines from all manufacturers
%% Honeywell = 16
%% Rolls-Royce Allison = 8
%% General Electric Aviation Engines = 22
%% CFM = 7
%% Microturbo = 8
%% Pratt-Witney Aviation = 23
%% International Aero Engines = 9
%% Rolls-Royce Turbomeca = 4
%% Teledyne CAE = 15
%% Williams International = 4
%% Total: 116

% Initialize the arrays for each engine value
arrayThrustDry       = zeros(1,116)';
arrayThrustA_B       = zeros(1,116)';
arraySFCDry          = zeros(1,116)';
arraySFC_A_B         = zeros(1,116)';
arrayFPR             = zeros(1,116)';
arrayOPR             = zeros(1,116)';
arrayBPR             = zeros(1,116)';
arrayWa              = zeros(1,116)';
arrayWeight          = zeros(1,116)';
arrayDiameterMax     = zeros(1,116)';
arrayDiameterFan     = zeros(1,116)';
arrayEngineLengthJet = zeros(1,116)';
arrayT_W             = zeros(1,116)';
arrayEngineNames     = (""); % Initialize an empty string array

% Create a temporary variable to hold the actual engineModel number while
% we play with the data
tempEngineModel = engineModel;

% Start at beginning
engineModel = 1;
for i = 1:16 % Total number of engines in Honeywell
    Honeywell;
    arrayThrustDry(i)       = thrustDry;
    arrayThrustA_B(i)       = thrustA_B;
    arraySFCDry(i)          = SFCDry;
    arraySFC_A_B(i)         = SFC_A_B;
    arrayFPR(i)             = FPR;
    arrayOPR(i)             = OPR;
    arrayBPR(i)             = BPR;
    arrayWa(i)              = Wa;
    arrayWeight(i)          = weight;
    arrayDiameterMax(i)     = diameterMax;
    arrayDiameterFan(i)     = diameterFan;
    arrayEngineLengthJet(i) = engineLengthJet;
    arrayT_W(i)             = T_W;
    arrayEngineNames(i,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for j = i+1:8+i % Total number of engines in Rolls Royce Allison
    Rolls_Royce_Allison;
    arrayThrustDry(j)       = thrustDry;
    arrayThrustA_B(j)       = thrustA_B;
    arraySFCDry(j)          = SFCDry;
    arraySFC_A_B(j)         = SFC_A_B;
    arrayFPR(j)             = FPR;
    arrayOPR(j)             = OPR;
    arrayBPR(j)             = BPR;
    arrayWa(j)              = Wa;
    arrayWeight(j)          = weight;
    arrayDiameterMax(j)     = diameterMax;
    arrayDiameterFan(j)     = diameterFan;
    arrayEngineLengthJet(j) = engineLengthJet;
    arrayT_W(j)             = T_W;
    arrayEngineNames(j,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for k = j+1:j+21 % Total number of engines in GEAE tab 1
    GEAETab1;
    arrayThrustDry(k)       = thrustDry;
    arrayThrustA_B(k)       = thrustA_B;
    arraySFCDry(k)          = SFCDry;
    arraySFC_A_B(k)         = SFC_A_B;
    arrayFPR(k)             = FPR;
    arrayOPR(k)             = OPR;
    arrayBPR(k)             = BPR;
    arrayWa(k)              = Wa;
    arrayWeight(k)          = weight;
    arrayDiameterMax(k)     = diameterMax;
    arrayDiameterFan(k)     = diameterFan;
    arrayEngineLengthJet(k) = engineLengthJet;
    arrayT_W(k)             = T_W;
    arrayEngineNames(k,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for kk = k+1:k+1 % Total number of engines in GEAE tab 2
    GEAETab2;
    arrayThrustDry(kk)       = thrustDry;
    arrayThrustA_B(kk)       = thrustA_B;
    arraySFCDry(kk)          = SFCDry;
    arraySFC_A_B(kk)         = SFC_A_B;
    arrayFPR(kk)             = FPR;
    arrayOPR(kk)             = OPR;
    arrayBPR(kk)             = BPR;
    arrayWa(kk)              = Wa;
    arrayWeight(kk)          = weight;
    arrayDiameterMax(kk)     = diameterMax;
    arrayDiameterFan(kk)     = diameterFan;
    arrayEngineLengthJet(kk) = engineLengthJet;
    arrayT_W(kk)             = T_W;
    arrayEngineNames(kk,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for L = kk+1:kk+7 % Total number of engines in CFM
    CFM;
    arrayThrustDry(L)       = thrustDry;
    arrayThrustA_B(L)       = thrustA_B;
    arraySFCDry(L)          = SFCDry;
    arraySFC_A_B(L)         = SFC_A_B;
    arrayFPR(L)             = FPR;
    arrayOPR(L)             = OPR;
    arrayBPR(L)             = BPR;
    arrayWa(L)              = Wa;
    arrayWeight(L)          = weight;
    arrayDiameterMax(L)     = diameterMax;
    arrayDiameterFan(L)     = diameterFan;
    arrayEngineLengthJet(L) = engineLengthJet;
    arrayT_W(L)             = T_W;
    arrayEngineNames(L,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for m = L+1:L+8 % Total number of engines in Microturbo
    Microturbo;
    arrayThrustDry(m)       = thrustDry;
    arrayThrustA_B(m)       = thrustA_B;
    arraySFCDry(m)          = SFCDry;
    arraySFC_A_B(m)         = SFC_A_B;
    arrayFPR(m)             = FPR;
    arrayOPR(m)             = OPR;
    arrayBPR(m)             = BPR;
    arrayWa(m)              = Wa;
    arrayWeight(m)          = weight;
    arrayDiameterMax(m)     = diameterMax;
    arrayDiameterFan(m)     = diameterFan;
    arrayEngineLengthJet(m) = engineLengthJet;
    arrayT_W(m)             = T_W;
    arrayEngineNames(m,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for n = m+1:m+21 % Total number of engines in Pratt-Witney Aviation tab 1
    P_WATab1;
    arrayThrustDry(n)       = thrustDry;
    arrayThrustA_B(n)       = thrustA_B;
    arraySFCDry(n)          = SFCDry;
    arraySFC_A_B(n)         = SFC_A_B;
    arrayFPR(n)             = FPR;
    arrayOPR(n)             = OPR;
    arrayBPR(n)             = BPR;
    arrayWa(n)              = Wa;
    arrayWeight(n)          = weight;
    arrayDiameterMax(n)     = diameterMax;
    arrayDiameterFan(n)     = diameterFan;
    arrayEngineLengthJet(n) = engineLengthJet;
    arrayT_W(n)             = T_W;
    arrayEngineNames(n,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for nn = n+1:n+2 % Total number of engines in Pratt-Witney Aviation tab 2
    P_WATab2;
    arrayThrustDry(nn)       = thrustDry;
    arrayThrustA_B(nn)       = thrustA_B;
    arraySFCDry(nn)          = SFCDry;
    arraySFC_A_B(nn)         = SFC_A_B;
    arrayFPR(nn)             = FPR;
    arrayOPR(nn)             = OPR;
    arrayBPR(nn)             = BPR;
    arrayWa(nn)              = Wa;
    arrayWeight(nn)          = weight;
    arrayDiameterMax(nn)     = diameterMax;
    arrayDiameterFan(nn)     = diameterFan;
    arrayEngineLengthJet(nn) = engineLengthJet;
    arrayT_W(nn)             = T_W;
    arrayEngineNames(nn,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for o = nn+1:nn+9 % Total number of engines in International Aero Engines
    IAE;
    arrayThrustDry(o)       = thrustDry;
    arrayThrustA_B(o)       = thrustA_B;
    arraySFCDry(o)          = SFCDry;
    arraySFC_A_B(o)         = SFC_A_B;
    arrayFPR(o)             = FPR;
    arrayOPR(o)             = OPR;
    arrayBPR(o)             = BPR;
    arrayWa(o)              = Wa;
    arrayWeight(o)          = weight;
    arrayDiameterMax(o)     = diameterMax;
    arrayDiameterFan(o)     = diameterFan;
    arrayEngineLengthJet(o) = engineLengthJet;
    arrayT_W(o)             = T_W;
    arrayEngineNames(o,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for p = o+1:o+4 % Total number of engines in Rolls-Royce Turbomeca
    Rolls_Royce_Turbomeca;
    arrayThrustDry(p)       = thrustDry;
    arrayThrustA_B(p)       = thrustA_B;
    arraySFCDry(p)          = SFCDry;
    arraySFC_A_B(p)         = SFC_A_B;
    arrayFPR(p)             = FPR;
    arrayOPR(p)             = OPR;
    arrayBPR(p)             = BPR;
    arrayWa(p)              = Wa;
    arrayWeight(p)          = weight;
    arrayDiameterMax(p)     = diameterMax;
    arrayDiameterFan(p)     = diameterFan;
    arrayEngineLengthJet(p) = engineLengthJet;
    arrayT_W(p)             = T_W;
    arrayEngineNames(p,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for q = p+1:p+15 % Total number of engines in Teledyne CAE
    Teledyne_CAE;
    arrayThrustDry(q)       = thrustDry;
    arrayThrustA_B(q)       = thrustA_B;
    arraySFCDry(q)          = SFCDry;
    arraySFC_A_B(q)         = SFC_A_B;
    arrayFPR(q)             = FPR;
    arrayOPR(q)             = OPR;
    arrayBPR(q)             = BPR;
    arrayWa(q)              = Wa;
    arrayWeight(q)          = weight;
    arrayDiameterMax(q)     = diameterMax;
    arrayDiameterFan(q)     = diameterFan;
    arrayEngineLengthJet(q) = engineLengthJet;
    arrayT_W(q)             = T_W;
    arrayEngineNames(q,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = 1;
for r = q+1:q+4 % Total number of engines in Williams International
    Williams_International;
    arrayThrustDry(r)       = thrustDry;
    arrayThrustA_B(r)       = thrustA_B;
    arraySFCDry(r)          = SFCDry;
    arraySFC_A_B(r)         = SFC_A_B;
    arrayFPR(r)             = FPR;
    arrayOPR(r)             = OPR;
    arrayBPR(r)             = BPR;
    arrayWa(r)              = Wa;
    arrayWeight(r)          = weight;
    arrayDiameterMax(r)     = diameterMax;
    arrayDiameterFan(r)     = diameterFan;
    arrayEngineLengthJet(r) = engineLengthJet;
    arrayT_W(r)             = T_W;
    arrayEngineNames(r,:)   = convertCharsToStrings(engineName);
    engineModel = engineModel + 1;
end
engineModel = tempEngineModel;
% Deactivate engine search
engineSearch = 0;
