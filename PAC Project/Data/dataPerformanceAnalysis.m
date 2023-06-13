function dataPerformanceAnalysis
% Written by Mark D. Miller Jr.
% 3/1/19

% Runs the altitude calculation code
altitude;
% PsCalculations;
% PsPlot;
% minFuelClimbPlot

function takeoffLandingPerformance
% Landing
        % Weight at landing
        landingWeight = WTO - Wfuel/2;
        
        % Lift at landing
        liftLanding = landingWeight;
        
        % Stall velocity
        Vstall = sqrt(WTO_S*(2/(densityArray(1)*CLmaxL)));
        
        % Velocity over a 50ft object
        V_50 = 1.3*Vstall;
        
        % Touchdown velocity
        V_TD = 1.15*Vstall;
        
        % Dynamic Pressure at landing
        landingDynamicPressure = .5*densityArray(1)*V_50^2;
        
        % Difference in drag due to flaps
        deltaCDflaps = .015; % initial estimate
        
        % Coefficient of drag at landing
        landingCD = initialCD0estimate + K*CLmaxL^2 + deltaCDflaps + deltaCDgear;
        
        % Initial wing reference area
        initialSref = (WTO_S / WTO)^-1;
        
        % Drag at landing
        dragLanding = landingCD*landingDynamicPressure*initialSref;
        
        % Air Distance
        airDistance = liftLanding/dragLanding*(((V_50^2 - V_TD^2)/(2*gc)) + 50);
 
        % Free Roll Distance
        freeRollDistance = 3*V_TD; % the 3 is for 3sec of free roll
        
        % Ground friction with brakes on
        groundFrictionBrakes = .4; % dry concrete
        
        % Reverse thrust
        reverseThrust = 500; %[lb]
    
        % Braking Distance
            % No reverse thrust
        brakingDistanceNoR = (landingWeight/(gc*groundFrictionBrakes*densityArray(1)*...
            initialSref*((landingCD/groundFrictionBrakes)-CLmaxL)))*log(1+(densityArray(1)/2)*...
            (initialSref/landingWeight)*((landingCD/groundFrictionBrakes)-CLmaxL)*V_TD^2);
        
            % With reverse thrust
        brakingDistanceR = (landingWeight/(gc*groundFrictionBrakes*densityArray(1)*...
            initialSref*((landingCD/groundFrictionBrakes)-CLmaxL)+reverseThrust))*log(1+(densityArray(1)/2)*...
            (initialSref/landingWeight)*((landingCD/groundFrictionBrakes)-CLmaxL)*V_TD^2+reverseThrust);
        
        % Total Landing Distance
            % No reverse thrust
        landingDistance = airDistance + freeRollDistance + brakingDistanceNoR;


function PsCalculations
global WTO SrefWing SwetWing t_c CLmax_wing e0 ARWing L SrefHorz CLa_horz...
    LamLE CF vel serviceCeil thrustDry SpeedOfSound VV hh hee vals vals2 Pss...
    psAxes minFuelClimbAxes tAtRPlotsPanel pSPlotsPanel numberOfEngines
clear Pss hee velocity ii jj
% P_S Calculations
% Specific excess power calculations are adapted from a code written by Andres
% Sandoval for the FAST SST in 2017-18

% Aircraft data and ISA
T0=518.7;%R
g=32.17;%ft/s/s
R=1718;
P0= 2116;
gamma=1.4;%Ratio of Specific Heats
Swet_Sref = SwetWing/SrefWing;
Amax = 180;%ft2
eps = 1.5;
ihsup = -4;
etaT = 1;%Thrust Efficiency
thrustDryTotal = thrustDry*numberOfEngines;
%--------------------------------------------------------------------------
Mcrit = 1-0.065*(cosd(LamLE)^0.6)*(100*t_c)^0.6;
Mcdom = 1/(cosd(LamLE)^0.2);

K = 1/(pi*e0*ARWing);

% Ps Increments for Ps Plot
psIncrement = round(vel,1,'significant')/2;
vals = (0.:psIncrement:4000.);

% Ps Increments for min fuel climb plot
vals2 = (0.:10000.:150000.);
cdo = 1.12*CF*Swet_Sref;

%Altitude and Velocity range
hh = (0.:500.:serviceCeil+1000);
h2 = (0.:5000.:serviceCeil+1000);
velIncrement = .25*SpeedOfSound;
VV = (0.:10.:vel+velIncrement);
%--------------------------------------------------------------------------
clear Pss hee velocity ii jj
for ii=1:length(hh)
 alt=hh(ii);
 temp = 0.000000051*alt^2 - 0.0053*alt + 514;
 if alt < 36152
     %temp = 59-0.00356*alt+459.7;
     press =2116*((temp)/518.67)^5.256;
 else
     %temp = -70+459.7;
     press = 473.1*2.72^(1.73-0.000048*alt);
 end
 rho = press/(R*temp);
 a= sqrt(gamma*R*temp);
 theta = temp/T0;
 delta = press/P0; 
 for jj=1:length(VV)
  Velocity=VV(jj);
  Cl=WTO/(0.5*rho*(Velocity)^2*SrefWing);
  M=Velocity/a;
  ih = (ihsup-ihsup)/(2)*M+ihsup;
  Clih =  abs(CLa_horz*(ih-eps));
  Cdih = Clih*Clih*SrefHorz/(SrefWing*pi*e0*ARWing);
  if theta*(1+0.2*M*M)<1
     Thrust = thrustDryTotal*delta*etaT*((1+0.2*M*M)^3.5);
  else
      Thrust = thrustDryTotal*delta*etaT*((1+0.2*((1/theta-1)/(0.2)))^3.5);
  end
  if (M<Mcrit)
        Cd=(cdo+K*Cl*Cl+Cdih);
        D=Cd*(0.5*rho*Velocity*Velocity*SrefWing);
        Pss(ii,jj)=Velocity/WTO*(Thrust-D)*60;
  elseif M<Mcdom && M > Mcrit
      Cdw = 4.5*3.14/SrefWing*((Amax/L)^2)*2*(0.74+0.37*cosd(LamLE))/(Mcdom-Mcrit)*(M-Mcrit);
       Cd = (cdo+K*Cl*Cl+Cdw+Cdih);
       D = Cd*(0.5*rho*Velocity*Velocity*SrefWing);
       Pss(ii,jj)=Velocity/WTO*(Thrust-D)*60;
   else
       Cdw = 4.5*3.14/SrefWing*((Amax/L)^2)*2*(0.74+0.37*cosd(LamLE))*(1-0.3*sqrt(M-Mcrit));
       Cd = (cdo+K*Cl*Cl+Cdw+Cdih);
       D = Cd*(0.5*rho*Velocity*Velocity*SrefWing);
       Pss(ii,jj)=Velocity/WTO*(Thrust-D)*60;
  end
  hee(ii,jj) = alt +.5*Velocity*Velocity/g;
  Vel1(ii,jj) = Velocity;
 end
 Mach(ii) = a;
 vstall(ii) = sqrt(2*WTO/(rho*SrefWing*CLmax_wing));
end

% function PsPlot
% global pSPlotsPanel psAxes VV hh Pss vals
% Specific Excess Power Contour Plot
delete(psAxes);
psAxes = axes('Parent',pSPlotsPanel,'Position',[.1 .16 .78 .75]);
[c1,h1]=contour(psAxes,VV*3600/6076,hh,Pss,vals,'linewidth',2);

clabel(c1,h1);
% title('Specific Excess Power');
xlabel('Airspeed (KTAS)');
ylabel('Altitude (ft)');
legend('Ps (FPM)','location','northwest');
grid on
hold on;

% function minFuelClimbPlot
% global tAtRPlotsPanel minFuelClimbAxes VV hh hee vals2 Pss vals
% Minimum Fuel Climb Contour Plot
delete(minFuelClimbAxes);
minFuelClimbAxes = axes('Parent',tAtRPlotsPanel,'Position',[.1 .16 .78 .75]);
[~,~] = contour(minFuelClimbAxes,VV*3600/6076,hh,hee,vals2, '--','linewidth',2);

hold on;
[c3,h3]=contour(minFuelClimbAxes,VV*3600/6076,hh,Pss/60,vals/100,'linewidth',2);

clabel(c3,h3);
% title('Minimum Fuel Climb');
xlabel('Airspeed (KTAS)');
ylabel('Altitude (ft)');
legend('Energy','Ps (FPS)','Vstall','location','northwest');
grid on



