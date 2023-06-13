function airfoilData
% Written by Mark D. Miller Jr.
% 2/24/19

global airfoilSeries

switch(airfoilSeries)
    case 'NACA 4&5 Digit'
        NACA_Digit_4_5;
    case 'NACA 63 Series'
        NACA_Series_63;
    case 'NACA 64 Series'
        NACA_Series_64;
    case 'NACA 65 Series'
        NACA_Series_65;
    case 'NACA 66 Series'
        NACA_Series_66;
end

%% Airfoil Data Database
% Reference: NACA Report 824 Summary of Airfoil Data
% NACA 4-digit, 5-Digit and Series-6 Sections
% 83 Airfoil Profiles
% Airfoil Series Determination
    % AirfoilSeries = 1,2,3,4,5
    % 4&5 Series: AirfoilSeries = 1;
    % 63 Series: AirfoilSeries  = 2;
    % 64 Series: AirfoilSeries  = 3;
    % 65 Series: AirfoilSeries  = 4;
    % 66 Series: AirfoilSeries  = 5;
    
function NACA_Digit_4_5
global aL_0_airfoil Cla_airfoil_str aL_0_airfoil_str Clmax_airfoil_str...
cmo_airfoil_str ac_airfoil_str aClmax_airfoil_str Cla_airfoil aClmax_airfoil...
aStarA_airfoil t_c cmo_airfoil ac_airfoil Clmax_airfoil Cdmin_airfoil...
AirfoilSeries airfoilName airfoilModel numberOfAirfoilModels
    
Cdmin_airfoil = 0;
% Airfoil Model
if airfoilModel == 1
        airfoilName = '0006';
        AirfoilSeries = 1;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.25;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 9.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 0.92;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.0;
elseif airfoilModel == 2
        airfoilName = '0009';
        AirfoilSeries = 1;
        t_c = 0.09;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.109;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.25;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.4;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.32;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.4;
elseif airfoilModel == 3
        airfoilName = '1408';
        AirfoilSeries = 1;
        t_c = 0.08;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -0.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.023;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.109;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.25;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.35;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 4
        airfoilName = '1410';
        AirfoilSeries = 1;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.02;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.247;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.3;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.50;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.0;
elseif airfoilModel == 5
        airfoilName = '1412';
        AirfoilSeries = 1;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.1;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.025;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.252;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.2;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.58;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 12.0;
elseif airfoilModel == 6
        airfoilName = '2412';
        AirfoilSeries = 1;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.047;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.247;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.8;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.68;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.5;
elseif airfoilModel == 7
        airfoilName = '2415';
        AirfoilSeries = 1;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.049;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.106;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.246;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.4;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.63;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 8
        airfoilName = '2418';
        AirfoilSeries = 1;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.05;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.103;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.241;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.47;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 9
        airfoilName = '2421';
        AirfoilSeries = 1;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.04;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.103;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.241;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.47;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 10
        airfoilName = '2424';
        AirfoilSeries = 1;
        t_c = 0.24;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.04;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.098;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.231;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.29;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.4;
elseif airfoilModel == 11
        airfoilName = '4412';
        AirfoilSeries = 1;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.093;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.247;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.67;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.5;
elseif airfoilModel == 12
        airfoilName = '4415';
        AirfoilSeries = 1;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -4.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.093;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.245;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.64;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 13
        airfoilName = '4418';
        AirfoilSeries = 1;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.088;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.242;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.53;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.2;
elseif airfoilModel == 14
        airfoilName = '4421';
        AirfoilSeries = 1;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.085;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.103;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.238;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.47;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.0;
elseif airfoilModel == 15
        airfoilName = '4424';
        AirfoilSeries = 1;
        t_c = 0.24;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.082;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.1;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.239;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.38;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 4.8;
elseif airfoilModel == 16
        airfoilName = '23012';
        AirfoilSeries = 1;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.4;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.014;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.107;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.247;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 18.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.79;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 12.0;
elseif airfoilModel == 17
        airfoilName = '23015';
        AirfoilSeries = 1;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.007;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.107;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.243;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 18.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.72;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 18
        airfoilName = '23018';
        AirfoilSeries = 1;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.005;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.104;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.243;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.60;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.8;
elseif airfoilModel == 19
        airfoilName = '23021';
        AirfoilSeries = 1;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.103;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.238;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.50;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.3;
elseif airfoilModel == 20
        airfoilName = '23024';
        AirfoilSeries = 1;
        t_c = 0.24;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -0.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.097;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.231;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.40;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.7;
end
numberOfAirfoilModels = 20;

function NACA_Series_63
global aL_0_airfoil Cla_airfoil_str aL_0_airfoil_str Clmax_airfoil_str...
cmo_airfoil_str ac_airfoil_str aClmax_airfoil_str Cla_airfoil aClmax_airfoil...
aStarA_airfoil t_c cmo_airfoil ac_airfoil Clmax_airfoil Cdmin_airfoil...
AirfoilSeries airfoilName airfoilModel numberOfAirfoilModels

Cdmin_airfoil = 0;
% Airfoil Model
if airfoilModel == 1
        airfoilName = '63-006';
        AirfoilSeries = 2;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0.005;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.258;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 10.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = .87;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.7;
elseif airfoilModel == 2
        airfoilName = '63-206';
        AirfoilSeries = 2;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.9;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.037;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.254;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 10.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.06;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.0;
elseif airfoilModel == 3
        airfoilName = '63-209';
        AirfoilSeries = 2;
        t_c = 0.09;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.4;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.032;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.4;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.8;
elseif airfoilModel == 4
        airfoilName = '63-210';
        AirfoilSeries = 2;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.035;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.113;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.261;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.56;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.6;
elseif airfoilModel == 5
        airfoilName = '63(1)-012';
        AirfoilSeries = 2;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.265;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.45;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 12.8;
elseif airfoilModel == 6
        airfoilName = '63(1)-212';
        AirfoilSeries = 2;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.035;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.114;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.263;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.63;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.4;
elseif airfoilModel == 7
        airfoilName = '63(1)-412';
        AirfoilSeries = 2;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.075;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.117;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.77;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 8
        airfoilName = '63(2)-015';
        AirfoilSeries = 2;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.117;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.47;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.0;
elseif airfoilModel == 9
        airfoilName = '63(2)-215';
        AirfoilSeries = 2;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.03;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.267;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.60;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.8;
elseif airfoilModel == 10
        airfoilName = '63(2)-415';
        AirfoilSeries = 2;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.069;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.68;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 11
        airfoilName = '63(2)-615';
        AirfoilSeries = 2;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.108;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.117;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.266;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.67;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.6;
elseif airfoilModel == 12
        airfoilName = '63(3)-018';
        AirfoilSeries = 2;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.54;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.2;
elseif airfoilModel == 13
        airfoilName = '63(3)-218';
        AirfoilSeries = 2;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.4;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.033;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.5;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 14
        airfoilName = '63(3)-418';
        AirfoilSeries = 2;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.7;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -.064;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.272;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.57;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.0;
elseif airfoilModel == 15
        airfoilName = '63(3)-618';
        AirfoilSeries = 2;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.097;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.267;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.59;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 4.2;
elseif airfoilModel == 16
        airfoilName = '63(4)-221';
        AirfoilSeries = 2;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.5;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.035;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.118;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.269;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.44;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.2;
elseif airfoilModel == 17
        airfoilName = '63(4)-421';
        AirfoilSeries = 2;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.062;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.120;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.275;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.48;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.7;
elseif airfoilModel == 18
        airfoilName = '63A010';
        AirfoilSeries = 2;
        t_c = 0.10;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.005;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.254;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.20;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 19
        airfoilName = '63A210';
        AirfoilSeries = 2;
        t_c = 0.10;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.5;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.040;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.103;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.257;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.43;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
end
numberOfAirfoilModels = 19;

function NACA_Series_64
global aL_0_airfoil Cla_airfoil_str aL_0_airfoil_str Clmax_airfoil_str...
cmo_airfoil_str ac_airfoil_str aClmax_airfoil_str Cla_airfoil aClmax_airfoil...
aStarA_airfoil t_c cmo_airfoil ac_airfoil Clmax_airfoil Cdmin_airfoil...
AirfoilSeries airfoilName airfoilModel numberOfAirfoilModels
    
Cdmin_airfoil = 0;
% Airfoil Model
if airfoilModel == 1
% switch(AirfoilSeries)
%     case 'naca64-108.dat'
        airfoilName = '64-108';
        AirfoilSeries = 3;
        % t/c Thickness over chord
        t_c = 0.08;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.015;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.255;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 10.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.1;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 2
%     case 'naca64-110.dat'
        airfoilName = '64-110';
        AirfoilSeries = 3;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.020;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.261;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.4;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 3
%     case 'naca64-206.dat'
        airfoilName = '64-206';
        AirfoilSeries = 3;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.040;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.253;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.03;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 4
%     case 'naca64-208.dat'
        airfoilName = '64-208';
        AirfoilSeries = 3;
        t_c = 0.08;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.039;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.113;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.257;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 10.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.23;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.8;
elseif airfoilModel == 5
%     case 'naca64-209.dat'
        airfoilName = '64-209';
        AirfoilSeries = 3;
        t_c = 0.09;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.5;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.040;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.107;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.261;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.40;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.9;
elseif airfoilModel == 6
%     case 'naca64-210.dat'
        airfoilName = '64-210';
        AirfoilSeries = 3;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.040;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.258;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.45;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.8;
elseif airfoilModel == 7
%     case 'naca64(1)-012.dat'
        airfoilName = '64(1)-012';
        AirfoilSeries = 3;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.111;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.45;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.0;
elseif airfoilModel == 8
%     case 'naca64(1)-112.dat'
        airfoilName = '64(1)-112';
        AirfoilSeries = 3;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -0.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.017;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.113;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.267;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.50;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 12.2;
elseif airfoilModel == 9
%     case 'naca64(1)-212.dat'
        airfoilName = '64(1)-212';
        AirfoilSeries = 3;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.027;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.113;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.55;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.0;
elseif airfoilModel == 10
%     case 'naca64(2)-015.dat'
        airfoilName = '64(2)-015';
        AirfoilSeries = 3;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.267;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.48;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 13.0;
elseif airfoilModel == 11
%     case 'naca64(2)-215.dat'
        airfoilName = '64(2)-215';
        AirfoilSeries = 3;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.030;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.265;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.57;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 12
%     case 'naca64(2)-415.dat'
        airfoilName = '64(2)-415';
        AirfoilSeries = 3;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.070;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.115;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.264;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.65;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 13
%     case 'naca64(3)-218.dat'
        airfoilName = '64(3)-218';
        AirfoilSeries = 3;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.027;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.115;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.53;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 14
%     case 'naca64(3)-418.dat'
        airfoilName = '64(3)-418';
        AirfoilSeries = 3;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.9;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.065;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.273;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.57;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 15
%     case 'naca64(3)-618.dat'
        airfoilName = '64(3)-618';
        AirfoilSeries = 3;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.095;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.273;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.58;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 5.6;
elseif airfoilModel == 16
%     case 'naca64(4)-221.dat'
        airfoilName = '64(4)-221';
        AirfoilSeries = 3;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.029;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.117;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.271;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.32;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.8;
elseif airfoilModel == 17
%     case 'naca64(4)-421.dat'
        airfoilName = '64(4)-421';
        AirfoilSeries = 3;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.068;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.120;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.276;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.42;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.4;
elseif airfoilModel == 18
%     case 'naca64A010.dat'
        airfoilName = '64A010';
        AirfoilSeries = 3;
        t_c = 0.10;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.253;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.23;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 19
%     case 'naca64A210.dat'
        airfoilName = '64A210';
        AirfoilSeries = 3;
        t_c = 0.10;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.5;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.040;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.251;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.44;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 20
%     case 'naca64A410.dat'  
        airfoilName = '64A410';
        AirfoilSeries = 3;
        t_c = 0.10;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.080;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.100;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.254;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.61;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
end
numberOfAirfoilModels = 20;

function NACA_Series_65
global aL_0_airfoil Cla_airfoil_str aL_0_airfoil_str Clmax_airfoil_str...
cmo_airfoil_str ac_airfoil_str aClmax_airfoil_str Cla_airfoil aClmax_airfoil...
aStarA_airfoil t_c cmo_airfoil ac_airfoil Clmax_airfoil Cdmin_airfoil...
AirfoilSeries airfoilName airfoilModel numberOfAirfoilModels

% Airfoil Model
if airfoilModel == 1
Cdmin_airfoil = 0;
% switch (airfoilFile)
%     case 'naca65-006.dat'
        airfoilName = '65-006';
        AirfoilSeries = 4;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.258;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 0.87;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.6;
elseif airfoilModel == 2
%     case 'naca65-206.dat'
        airfoilName = '65-206';
        AirfoilSeries = 4;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.031;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.105;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.257;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.03;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.0;
elseif airfoilModel == 3
%     case 'naca65-209.dat'
        airfoilName = '65-209';
        AirfoilSeries = 4;
        t_c = 0.09;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.031;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.106;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.259;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 12.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.30;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 4
%     case 'naca65-210.dat'
        airfoilName = '65-210';
        AirfoilSeries = 4;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.034;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 13.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.40;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.6;
elseif airfoilModel == 5
%     case 'naca65-410.dat'
        airfoilName = '65-410';
        AirfoilSeries = 4;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.5;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.067;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.262;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.52;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.0;
elseif airfoilModel == 6
%     case 'naca65(1)-212.dat'
        airfoilName = '65(1)-212';
        AirfoilSeries = 4;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.032;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.261;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.47;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.4;
elseif airfoilModel == 7
%     case 'naca65(1)-212a=6.dat'
        airfoilName = '65(1)-212 a=.6';
        AirfoilSeries = 4;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.4;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.033;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.269;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 14.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.50;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.6;
elseif airfoilModel == 8
%     case 'naca65(1)-412.dat'
        airfoilName = '65(1)-412';
        AirfoilSeries = 4;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -3.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.070;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.111;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.265;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.66;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.5;
elseif airfoilModel == 9
%     case 'naca65(2)-215.dat'
        airfoilName = '65(2)-215';
        AirfoilSeries = 4;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.032;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.112;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.269;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.53;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 10
%     case 'naca65(2)-415.dat'
        airfoilName = '65(2)-415';
        AirfoilSeries = 4;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.060;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.111;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.268;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.61;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.7;
elseif airfoilModel == 11
%     case 'naca65(2)-415a=.5.dat'
        airfoilName = '65(2)-415 a=.5';
        AirfoilSeries = 4;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.051;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.111;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.264;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 20.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.60;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.0;
elseif airfoilModel == 12
%     case 'naca65(3)-218.dat'
        airfoilName = '65(3)-218';
        AirfoilSeries = 4;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.030;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.100;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.263;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 18.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.48;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 8.8;
elseif airfoilModel == 13
%     case 'naca65(3)-618.dat'
        airfoilName = '65(3)-618';
        AirfoilSeries = 4;
        t_c = 0.18;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -4.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.102;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.113;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.276;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 18.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.64;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 5.2;
elseif airfoilModel == 14
%     case 'naca65(4)-221.dat'
        airfoilName = '65(4)-221';
        AirfoilSeries = 4;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.029;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.115;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.274;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 20.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.46;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.0;
elseif airfoilModel == 15
%     case 'naca65(4)-421.dat'
        airfoilName = '65(4)-421';
        AirfoilSeries = 4;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.066;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.272;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 22.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.56;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 5.0;
elseif airfoilModel == 16
%     case 'naca65(4)-421a=.5.dat'
        airfoilName = '65(4)-421 a=.5';
        AirfoilSeries = 4;
        t_c = 0.21;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.8;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.052;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.116;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.272;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 20.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.43;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 5.6;
end
numberOfAirfoilModels = 16;

function NACA_Series_66
global aL_0_airfoil Cla_airfoil_str aL_0_airfoil_str Clmax_airfoil_str...
cmo_airfoil_str ac_airfoil_str aClmax_airfoil_str Cla_airfoil aClmax_airfoil...
aStarA_airfoil t_c cmo_airfoil ac_airfoil Clmax_airfoil Cdmin_airfoil...
AirfoilSeries airfoilName airfoilModel numberOfAirfoilModels
    
Cdmin_airfoil = 0;
% Airfoil Model
if airfoilModel == 1  
%     case 'naca66-006.dat'
        airfoilName = '66-006';
        AirfoilSeries = 5;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = 0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = 0;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.100;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.252;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 9.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 0.80;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 6.5;
elseif airfoilModel == 2
%     case 'naca66-206.dat'
        airfoilName = '66-206';
        AirfoilSeries = 5;
        t_c = 0.06;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.038;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.108;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.257;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 10.5;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.00;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 7.0;
elseif airfoilModel == 3
%     case 'naca66-209.dat'
        airfoilName = '66-209';
        AirfoilSeries = 5;
        t_c = 0.09;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.0;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.034;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.107;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.257;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 11.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.17;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 9.0;
elseif airfoilModel == 4
%     case 'naca66-210.dat'
        airfoilName = '66-210';
        AirfoilSeries = 5;
        t_c = 0.1;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.035;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.110;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.261;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 11.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.27;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
elseif airfoilModel == 5
%     case 'naca66(1)-212.dat'
        airfoilName = '66(1)-212';
        AirfoilSeries = 5;
        t_c = 0.12;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.2;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.032;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.102;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.259;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 15.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.46;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.6;
elseif airfoilModel == 6
%     case 'naca66(2)-215.dat'
        airfoilName = '66(2)-215';
        AirfoilSeries = 5;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -1.3;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.031;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.106;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.200;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 16.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.50;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 11.4;
elseif airfoilModel == 7
%     case 'naca66(2)-415.dat'
        airfoilName = '66(2)-415';
        AirfoilSeries = 5;
        t_c = 0.15;
        % Alpha(L=0)[deg]
        aL_0_airfoil = -2.6;
        aL_0_airfoil_str = num2str(aL_0_airfoil);
        % Cmo
        cmo_airfoil = -0.069;
        cmo_airfoil_str = num2str(cmo_airfoil);
        % Cla[1/deg]
        Cla_airfoil = 0.106;
        Cla_airfoil_str = num2str(Cla_airfoil);
        % A.C.
        ac_airfoil = 0.260;
        ac_airfoil_str = num2str(ac_airfoil);
        % Alpha Clmax[1/deg]
        aClmax_airfoil = 17.0;
        aClmax_airfoil_str = num2str(aClmax_airfoil);
        % Clmax
        Clmax_airfoil = 1.60;
        Clmax_airfoil_str = num2str(Clmax_airfoil);
        % Alpha*a[deg] Angle of attack where curve is no longer linear
        aStarA_airfoil = 10.0;
end        
numberOfAirfoilModels = 7;