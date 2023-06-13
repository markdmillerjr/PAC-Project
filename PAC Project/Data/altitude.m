function altitude
% Written by Mark D. Miller Jr.
% 2/14/19

tempDensityCalculator;
gasProperties;
altitudeIncrements;

% Calculates the temperature and density at the specified service ceiling
function tempDensityCalculator

global rho serviceCeiling T
alt = serviceCeiling;
ft = 3280.8399; %[ft]
alt_km_g = alt/ft;
% r = 6378.137; %[km]
% alt_km   = (r/r+alt_km_g)*alt_km_g; %[km]

alt_km = alt_km_g;
% T0 = 287.16; %[K]
g0 = 9.8172; %[m/s^2]
R  = 287.057; %[m^2/(s^2*K)]
if alt_km >= 0 && alt_km < 11
    a1   = -6.5E-3; %[K/m]
    T0   = 288.16; %[K]
    alt0 = 0; %[km]
    rho0 = 1.225; %[kg/m^3]
    T    = T0+(a1*((alt_km*1000)-(alt0*1000))); %[K]
    rho1 = rho0*((T/T0)^-((g0/(a1*R))+1)); %[kg/m^3]
    rho  = rho1; %[kg/m^3]
elseif alt_km > 11 && alt_km < 25
    a1    = -6.5E-3; %[K/m]
    T0   = 216.66; %[K]
    alt0 = 11; %[km]
    rho0 = 1.225; %[kg/m^3]
    T    = T0;
    rho1 = rho0*((T/288.16)^-((g0/(a1*R))+1));
    rho0 = rho1*exp(-(g0/(R*T)*((alt_km*1000)-(alt0*1000))));
    rho  = rho0;
elseif alt_km > 25 && alt_km < 47
    a1   = -6.5E-3; %[K/m]
    a2   = 3.0E-3; %[K/m]
%     T0   = 288.16; %[K]
    T1   = 216.66; %[K]
    alt0 = 11; %[km]
    alt1 = 25; %[km]
    rho0 = 1.225; %[kg/m^3]
    rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
    rho0 = rho1*exp(-(g0/(R*T1)*((alt1*1000)-(alt0*1000))));
    T2   = 216.66+(a2*((alt_km*1000)-(alt1*1000)));
    rho1 = rho0*(T2/T1)^(-(g0/(a2*R))+1);
    T    = T2;
    rho  = rho1;
elseif alt_km > 47 && alt_km < 53
    a1   = -6.5E-3; %[K/m]
    a2   = 3.0E-3; %[K/m]
%     T0   = 288.16; %[K]
%     T1   = 216.66; %[K]
%     T2   = 282.66; %[K]
    alt0 = 11; %[km]
    alt1 = 25; %[km]
    alt2 = 47; %[km]
    rho0 = 1.225; %[kg/m^3]
    rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
    rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
    T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
    rho1 = rho0*(T2/216.66)^(-(g0/(a2*R))+1);
    T    = T2;
    rho0 = rho1*exp(-(g0/(R*T2)*((alt_km*1000)-(alt2*1000))));
    rho  = rho0;
elseif alt_km > 53 && alt_km < 79
    a1   = -6.5E-3; %[K/m]
    a2   = 3.0E-3; %[K/m]
    a3   = -4.5E-3; %[K/m]
%     T1   = 282.66; %[K]
    alt0 = 11; %[km]
    alt1 = 25; %[km]
    alt2 = 47; %[km]
    alt3 = 53; %[km]
    rho0 = 1.225; %[kg/m^3]
    rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
    rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
    T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
    rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
    rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
    T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
    rho1 = rho0*(T3/282.66)^(-(g0/(a3*R))+1);
    T    = T3;
    rho  = rho1;
elseif alt_km > 79 && alt_km < 90
    a1   = -6.5E-3; %[K/m]
    a2   = 3.0E-3; %[K/m]
    a3   = -4.5E-3; %[K/m]
    rho0 = 1.225; %[kg/m^3]
    alt0 = 11; %[km]
    alt1 = 25; %[km]
    alt2 = 47; %[km]
    alt3 = 53; %[km]
    alt4 = 79; %[km]
    rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
    rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
    T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
    rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
    rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
    T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
    rho1 = rho0*(T3/282.66)^(-(g0/(a3*R))+1);
    rho0 = rho1*exp(-(g0/(R*T3)*((alt_km*1000)-(alt4*1000))));
    T    = T3;
    rho  = rho0;
else
%     alt_km > 90 && alt_km < 105; 
    a1   = -6.5E-3; %[K/m]
    a2   = 3.0E-3; %[K/m]
    a3   = -4.5E-3; %[K/m]
    a4   = 4.0E-3;  %[K/m]
    rho0 = 1.225; %[kg/m^3]
    alt0 = 11; %[km]
    alt1 = 25; %[km]
    alt2 = 47; %[km]
    alt3 = 53; %[km]
    alt4 = 79; %[km]
    rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
    rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
    T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
    rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
    rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
    T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
    rho1 = rho0*(T3/282.66)^(-(g0/((a3)*R))+1);
    rho0 = rho1*exp(-(g0/(R*T3)*((alt_km*1000)-(alt4*1000))));
    T4   = T3+(a4*((alt4*1000)-(alt3*1000)));
    rho1 = rho0*(T4/T3)^(-(g0/(a4*R))+1);
    T    = T3;
    rho  = rho1;
end

% Calculates various gas properties such as temperature, density, pressure,
% speed of sound and mach number
function gasProperties
global T_R rho c cruiseMach Re maximumMach SpeedOfSound rho_E press...
     cruiseVelocity maxVelocity T
 
% Temperature at varying altitudes
T_R = T*(9/5); %[R]

% Temperature at sea level
T_R0 = 518.69; %[R] Temperature at sea level

% Viscosity at sea level
mu0  = 3.62E-7; %[(lb*s)/ft^2]

% Viscosity at varying altitudes
mu   = mu0*(T_R / T_R0)^(1.5)*((T_R0 + 198.72)/(T_R + 198.72)); %[(lb*s)/ft^2]

% Density
rho_E = rho*0.00194032; %[slug/ft^3]

% Ratio of specific heats for air
gamma = 1.4;

% Specific Gas Constant for air
R = 53.34; %[(ft*lbf)/(lbm*R)]

% Acceleration due to gravity
gc = 32.17; %[ft*lbm/s^2*lbf]

% Speed of sound
SpeedOfSound = sqrt(gc*gamma*R*T_R); %[ft/s]

% Cruise Velocity
cruiseVelocity = cruiseMach * SpeedOfSound; %[ft/s]

% Max Velocity
maxVelocity = maximumMach * SpeedOfSound; %[ft/s]

% Reynolds Number
Re = (rho_E*cruiseVelocity*c)./mu;

% Pressure at varying altitudes
press = gc*rho_E*R*T_R; %[lb/ft^2]

% Creates an an array of temperature and density values from sea level up
% to the service ceiling
function altitudeIncrements
global serviceCeiling rho T tempArray densityArray
tempArray    = [0;0;0;0;0];
densityArray = [0;0;0;0;0];
serviceCeilingArray = [0;0;0;0;0];
for i = 1:5
    if i == 1
        % At sea level - Takeoff
        serviceCeilingArray(i) = 0; %[ft]
    elseif i == 2
        % At sea level - Acceleration
        serviceCeilingArray(i) = 0; %[ft]
    elseif i == 3
        % At average altitude - Climb
        serviceCeilingArray(i) = serviceCeiling/2; %[ft]
    elseif i == 4
        % At service ceiling - Cruise
        serviceCeilingArray(i) = serviceCeiling; %[ft]
    elseif i == 5
        % At 10,000 ft - Loiter
        serviceCeilingArray(i) = 10000; %[ft]
    end
end
for i = 1:5
        alt = serviceCeilingArray(i);
        ft = 3280.8399; %[ft]
        alt_km_g = alt/ft;
        alt_km = alt_km_g;
        g0 = 9.8172; %[m/s^2]
        R  = 287.057; %[m^2/(s^2*K)]
    if alt_km >= 0 && alt_km < 11
        a1   = -6.5E-3; %[K/m]
        T0   = 288.16; %[K]
        alt0 = 0; %[km]
        rho0 = 1.225; %[kg/m^3]
        T    = T0+(a1*((alt_km*1000)-(alt0*1000))); %[K]
        rho1 = rho0*((T/T0)^-((g0/(a1*R))+1)); %[kg/m^3]
        rho  = rho1; %[kg/m^3]
    elseif alt_km > 11 && alt_km < 25
        a1    = -6.5E-3; %[K/m]
        T0   = 216.66; %[K]
        alt0 = 11; %[km]
        rho0 = 1.225; %[kg/m^3]
        T    = T0;
        rho1 = rho0*((T/288.16)^-((g0/(a1*R))+1));
        rho0 = rho1*exp(-(g0/(R*T)*((alt_km*1000)-(alt0*1000))));
        rho  = rho0;
    elseif alt_km > 25 && alt_km < 47
        a1   = -6.5E-3; %[K/m]
        a2   = 3.0E-3; %[K/m]
        T1   = 216.66; %[K]
        alt0 = 11; %[km]
        alt1 = 25; %[km]
        rho0 = 1.225; %[kg/m^3]
        rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
        rho0 = rho1*exp(-(g0/(R*T1)*((alt1*1000)-(alt0*1000))));
        T2   = 216.66+(a2*((alt_km*1000)-(alt1*1000)));
        rho1 = rho0*(T2/T1)^(-(g0/(a2*R))+1);
        T    = T2;
        rho  = rho1;
    elseif alt_km > 47 && alt_km < 53
        a1   = -6.5E-3; %[K/m]
        a2   = 3.0E-3; %[K/m]
        alt0 = 11; %[km]
        alt1 = 25; %[km]
        alt2 = 47; %[km]
        rho0 = 1.225; %[kg/m^3]
        rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
        rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
        T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
        rho1 = rho0*(T2/216.66)^(-(g0/(a2*R))+1);
        T    = T2;
        rho0 = rho1*exp(-(g0/(R*T2)*((alt_km*1000)-(alt2*1000))));
        rho  = rho0;
    elseif alt_km > 53 && alt_km < 79
        a1   = -6.5E-3; %[K/m]
        a2   = 3.0E-3; %[K/m]
        a3   = -4.5E-3; %[K/m]
        alt0 = 11; %[km]
        alt1 = 25; %[km]
        alt2 = 47; %[km]
        alt3 = 53; %[km]
        rho0 = 1.225; %[kg/m^3]
        rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
        rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
        T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
        rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
        rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
        T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
        rho1 = rho0*(T3/282.66)^(-(g0/(a3*R))+1);
        T    = T3;
        rho  = rho1;
    elseif alt_km > 79 && alt_km < 90
        a1   = -6.5E-3; %[K/m]
        a2   = 3.0E-3; %[K/m]
        a3   = -4.5E-3; %[K/m]
        rho0 = 1.225; %[kg/m^3]
        alt0 = 11; %[km]
        alt1 = 25; %[km]
        alt2 = 47; %[km]
        alt3 = 53; %[km]
        alt4 = 79; %[km]
        rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
        rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
        T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
        rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
        rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
        T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
        rho1 = rho0*(T3/282.66)^(-(g0/(a3*R))+1);
        rho0 = rho1*exp(-(g0/(R*T3)*((alt_km*1000)-(alt4*1000))));
        T    = T3;
        rho  = rho0;
    else
        a1   = -6.5E-3; %[K/m]
        a2   = 3.0E-3; %[K/m]
        a3   = -4.5E-3; %[K/m]
        a4   = 4.0E-3;  %[K/m]
        rho0 = 1.225; %[kg/m^3]
        alt0 = 11; %[km]
        alt1 = 25; %[km]
        alt2 = 47; %[km]
        alt3 = 53; %[km]
        alt4 = 79; %[km]
        rho1 = rho0*((216.66/288.16)^-((g0/((a1)*R))+1));
        rho0 = rho1*exp(-(g0/(R*216.66)*((alt1*1000)-(alt0*1000))));
        T2   = 216.66+(a2*((alt2*1000)-(alt1*1000)));
        rho1 = rho0*(282.66/216.66)^(-(g0/((a2)*R))+1);
        rho0 = rho1*exp(-(g0/(R*T2)*((alt3*1000)-(alt2*1000))));
        T3   = 282.66+(a3*((alt3*1000)-(alt2*1000)));
        rho1 = rho0*(T3/282.66)^(-(g0/((a3)*R))+1);
        rho0 = rho1*exp(-(g0/(R*T3)*((alt_km*1000)-(alt4*1000))));
        T4   = T3+(a4*((alt4*1000)-(alt3*1000)));
        rho1 = rho0*(T4/T3)^(-(g0/(a4*R))+1);
        T    = T3;
        rho  = rho1;
    end
    % Temperature at varying altitudes
    T_R = T*(9/5); %[R]
    
    % Density
    rho_E = rho*0.00194032; %[slug/ft^3]
    
    % Array of temperature values from sea level to service ceiling
    tempArray(i) = T_R;
    
    % Array of density values from sea level to service ceiling
    densityArray(i) = rho_E;
end
 
