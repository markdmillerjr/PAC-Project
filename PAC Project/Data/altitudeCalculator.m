function altitudeCalculator(altitude)
% Written by Mark D. Miller Jr.
% 3/3/20
% Calculates the temperature and density at the specified service ceiling

alt = altitude;
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

% Temperature at sea level
T_R0 = 518.69; %[R] Temperature at sea level

% Temperature
T_R = T*(9/5); %[R]
temperature = T_R;
fprintf('Temperature: %3.2f ',temperature);
fprintf('R \n');

% Density
rho_E = rho*0.00194032; %[slug/ft^3]
density = rho_E;
fprintf('Density: %3.6f ',density);
fprintf('slug/ft^3 \n');

% Viscosity at sea level
mu0  = 3.62E-7; %[(lb*s)/ft^2]

% Viscosity
mu   = mu0*(T_R / T_R0)^(1.5)*((T_R0 + 198.72)/(T_R + 198.72)); %[(lb*s)/ft^2]
fprintf('Viscosity: %3.9G ',mu);
fprintf('(lb*s)/ft^2 \n');



