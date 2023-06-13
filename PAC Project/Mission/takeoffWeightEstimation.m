function takeoffWeightEstimation
% Written by Mark D. Miller Jr.
% 2/27/19
% Performs a preliminary estimate of the takeoff weight

% global masterFile
% % Revert file access to master file
% cd(masterFile);
% 
% % Access Data folder
% cd('Data');
Phase1;
Phase2;
Phase3;
Phase4;
Phase5;
Phase6;
Phase7;
Phase8;
WTO;

%% Phase 1 (Engine Start and Takeoff)
function Phase1
global W2_W1

% W2_W1 = W2/W1
W2_W1 = .975;

%% Phase 2 (Climb and Accelerate to Cruise Conditions)
function Phase2
global W3_W2 cruiseMach

W3_W2 = -.0034 * cruiseMach^2 - .0428 * cruiseMach + 1.0071;
% W3_W2 = .0002 * cruiseMach^4 - .0026 * cruiseMach^3 + .0066 * cruiseMach^2 - .0562 * cruiseMach + 1.0122;
%% Phase 3 (Cruise Out)
function Phase3
global W4_W3 aircraftType initialCD0estimate e ARWing SFCDry L_D...
     cruiseVelocity initialSFCDry combatRadius initialARWing range masterFile

% Revert file access to master file
cd(masterFile);

% Access Data folder
cd('Data');
 
% Perform altitude calculations to find velocity at service ceiling
altitude;

% Initial estimate of CD0 based on aircraft type
% Will refine once have gone through iterative process once

% Aircraft Type
if aircraftType == 1
% Fighter Air-Air or X-Plane
initialCD0estimate = .018;

elseif aircraftType == 2
% Fighter Multipurpose
initialCD0estimate = .02;

elseif aircraftType == 3
% Fighter Air-Ground
initialCD0estimate = .022;

elseif aircraftType == 4
% Military Trainer
initialCD0estimate = .02;

elseif aircraftType == 5
% Military Bomber and Transport
initialCD0estimate = .02;

elseif aircraftType == 6    
% Military Patrol and Reconnaissance
initialCD0estimate = .02;
    
elseif aircraftType == 7
% Passenger Jet
initialCD0estimate = .02;

elseif aircraftType == 8
% Business Jet
initialCD0estimate = .014;
end
%--------------------------------------
% slope of curve for subsonic wing efficiency vs. AR 

% if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
%     initialARWing = 3;
% elseif aircraftType == 4 || aircraftType == 5 || aircraftType == 6
%     initialARWing = 9;
% end

if isempty(ARWing) ~= 1
    if ARWing > 10
            e = -.0384*ARWing + .996;
    elseif ARWing < 10
            e = -.0698*ARWing + .9087;
    end
else
    if initialARWing > 10
            e = -.0384*initialARWing + .996;
    elseif initialARWing < 10
            e = -.0698*initialARWing + .9087;
    end
end

% if LamLE >= 25
%     if initialARWing > 10
%         e = -.0384*initialARWing + .996;
%     elseif initialARWing < 10
%         e = -.0698*initialARWing + .9087;
%     end
% elseif LamLE >= 15 && LamLE < 25
%     if initialARWing <= 22.5 && initialARWing > 20
%         e = -.0245*initialARWing + .9743;
%     elseif initialARWing <= 25 && initialARWing > 22.5
%         e = -.0227*initialARWing + .9955;  
%     end
% elseif aL_0_airfoil > -3
%     e = -.02*initialARWing + 1;
%     
% elseif aL_0_airfoil < -3
%     % do stuff
%     if initialARWing <= 35 && initialARWing > 30
%      e = -.0142*initialARWing + 1.0067;
%     elseif initialARWing > 35 && initialARWing < 40
%       e = -.0093*initialARWing + 1.0031;
%     end
% else
%     e = -.02*initialARWing + 1;
% end

% Drag due to lift factor
K = 1/(pi()*initialARWing*e);

% L/Dmax
L_DMax = 1/(2*sqrt(initialCD0estimate*K));
cruiseType = 2;
if cruiseType == 1
    % Constant altitude cruise
    L_D = .866*L_DMax;
elseif cruiseType == 2
    % Cruise Climb
    L_D = .943*L_DMax;
end

% initialSFCDry = .93;

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    if isempty(SFCDry) ~= 1
        W3_W4 = exp((combatRadius*SFCDry)/(cruiseVelocity*L_D));
    else
        W3_W4 = exp((combatRadius*initialSFCDry)/(cruiseVelocity*L_D));
    end
elseif aircraftType == 4 || aircraftType == 5 || aircraftType == 6 || aircraftType == 7 || aircraftType == 8
    if isempty(SFCDry) ~= 1
        W3_W4 = exp((range*SFCDry)/(cruiseVelocity*L_D));
    else
        W3_W4 = exp((range*initialSFCDry)/(cruiseVelocity*L_D));
    end
end
    W4_W3 = W3_W4^-1;

%% Phase 4 (Acceleration to High Speed)
function Phase4
global W5_W4 cruiseMach maximumMach aircraftType

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    if cruiseMach < .25 
        W5_W4 = 1;
    else
        if isempty(maximumMach) == 1
            W5_W4 = 1;
        else
            Wf_Wi_1 = -.0034 * cruiseMach^2 - .0428 * cruiseMach + 1.0071;
            Wf_Wi_2 = -.0034 * maximumMach^2 - .0428 * maximumMach + 1.0071;
            W5_W4 = Wf_Wi_2/Wf_Wi_1;
        end
    end
else
    W5_W4 = 1;
end

%% Phase 5 (Combat)
function Phase5
global SFCDry thrustDry numberOfEngines combatFuel initialSFCDry...
    aircraftType combatTime arrayThrust_sim

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    if isempty(initialSFCDry) ~= 1 || isempty(arrayThrust_sim) ~= 1 || isempty(combatTime) ~= 1
        combatFuel = initialSFCDry*mean(arrayThrust_sim)*1*(combatTime/60);
    elseif isempty(SFCDry) ~= 1 || isempty(numberOfEngines) ~= 1 || isempty(thrustDry) ~= 1
        combatFuel = SFCDry*thrustDry*numberOfEngines*(combatTime/60);
    end
else
    combatFuel = 0;
end

%% Phase 6 (Cruise Back)
function Phase6
global aircraftType W7_W6 W4_W3

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    W7_W6 = W4_W3;
else
    W7_W6 = 1;
end

%% Phase 7 (Loiter)
function Phase7
global SFCDry L_D W8_W7 aircraftType initialSFCDry

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3
    % Endurance
    % E = 1/(SFCDry)*L_DMax*log(W7_W8);

    E_min = 20; %[min]

    if isempty(SFCDry) == 1
        W7_W8 = exp((E_min*60*initialSFCDry)/((L_D)*3600));
        W8_W7 = W7_W8^-1;
    else
        W7_W8 = exp((E_min*60*SFCDry)/((L_D)*3600));
        W8_W7 = W7_W8^-1;
    end
else
    W8_W7 = 1;
end

%% Phase 8 (Reserve and Trapped Fuel)
function Phase8
global reserve trapped
reserve = .05;
trapped = .01;

%% Determining WTO
function WTO
global W2_W1 W3_W2 W4_W3 W5_W4 combatFuel W7_W6 W8_W7 reserve trapped WemptyR...
    payload aircraftType passengers WTO initialWTO Wfuel masterFile typeOfEngineMenu...
    noWaitBoxFig caActivated

% Revert file access to master file
cd(masterFile);

% Access Mission folder
cd('Mission');

WTO = initialWTO;

if noWaitBoxFig == 0
% Activate popup waitbar
    if isempty(typeOfEngineMenu) ~= 1
        h = waitbarMod(0,'Please wait...');
    end
end

for i = 1:50
% Initial WTO estimate
W1 = WTO;
W5 = (W2_W1*W3_W2*W4_W3*W5_W4)*W1;

reserve_trapped = reserve + trapped;

if aircraftType == 1 || aircraftType == 2 || aircraftType == 3 || aircraftType == 4
W6 = W5 - combatFuel - payload;
W8 = (W7_W6*W8_W7)*W6;
Wfuelmission = WTO - W8 - payload;
Wfuel = (1 + reserve_trapped)*Wfuelmission;

% % Test--------------------------------
% WTO = 13000;
% W1 = WTO;
% W5 = 11491;
% 
% reserve_trapped = reserve + trapped;
% missiles = 348;
% ammo = 320;
% 
% W6 = 9083;
% W8 = 8379;
% Wfuelmission = WTO - W8 - missiles - ammo;
% Wfuel = (1 + reserve_trapped)*Wfuelmission;

else
    W5_W4 = 1;
    W6_W5 = 1;
    W7_W6 = 1;
    W8_W7 = 1;
    W8_W1 = (W2_W1*W3_W2*W4_W3*W5_W4*W6_W5*W7_W6*W8_W7);
    Wfuel = (1 + reserve_trapped)*(1-W8_W1) * WTO;
end

if aircraftType == 1
    % Fighter (Air-Air)
    WemptyR = 1.2*initialWTO^.947;

elseif aircraftType == 2
    % Fighter (Multipurpose)
    WemptyR = .911*initialWTO^.947;

elseif aircraftType == 3
    % Fighter (Air-Ground)
    WemptyR = .774*initialWTO^.947;
    
elseif aircraftType == 4
    % Military Trainers
    WemptyR = .747*initialWTO^.993;

elseif aircraftType == 5
    % Military Bomber, and Transport
    WemptyR = .911*initialWTO^.947;
    
elseif aircraftType == 6
    % Military Patrol, and Reconnaissance
%     WemptyR = .75*initialWTO^.947;
    WemptyR = .3234*initialWTO^1.0294;
    
elseif aircraftType == 7
    % Passenger Jets
    WemptyR = .911*initialWTO^.947;
    
elseif aircraftType == 8
    % Business Jets
    WemptyR = .5055*initialWTO^1.0069;
    
end

% W8_W1 = W2_W1*W3_W2*W4_W3*W5_W4*combatFuel*W7_W6*W8_W7;

% Takeoff Gross Weight(TOGW)
% TOGW = WEIGHTfuel + WEIGHTfixed + WEIGHTempty;

% 1. WEIGHTempty = constant * TOGW^exponent;

% 2. WEIGHTfixed = payload + crew + equipment + systems;

% 3. WEIGHTfuel = Breguet Range Calculations;

% Only guess is TOGW need to iterate

% TOGW Estimation
% Okay this is what I'm going to do. I'm going to build an Aircraft Weights
% Database for specific real world aircraft. Then I'm going to outline the
% capabilities of each aircraft by specifying the range, service ceiling,
% payload, passengers, and cruise and maximum Mach numbers of each. Then
% I'm going to specify the engine type and the number of engines.

% With this database then for each type of aircraft specified the database
% goes to that collection of data. Then for the mission parameters specified,
% it will determine which aircraft it is closest to and then it will
% analyze the deviations from those real world values. Finally, with each
% deviation determined it will turn each one into either a positive or
% negative percentage based on the deviation. Such as if the specified
% range is 20% greater than the closest aircraft it will give it a +20%
% increase in TOGW. But if the number of passengers is 10% less than the
% closest aircraft it will give it a -10% increase in TOGW.

% Then each deviation percentage will be summed to determine the initial
% TOGW estimate. Then the code will iterate for subsequent refinements.
% This is going to take awhile. :)

% I've decided to use a similar, but different approach. Instead of
% determining the deviations from the specified values, I'm going to use
% the similar aircraft determined from the weights database. Each similar
% aircraft has an actual TOGW. Those values will be used to determine the
% initial TOGW estimate by picking a value that is similar to the actual
% values.

% Wfuel = (1 + reserve + trapped)*(1-W8_W1)*WTO;

    % Fixed Weight Estimate
    if aircraftType == 7 || aircraftType == 8
        Wfixed = passengers*200; % Accounting for a passenger weight of 200 lbs
    else 
        Wfixed = payload; %[lb]
    end
%     Wfixed = payload; %[lb]

    WemptyA = WTO - Wfuel - Wfixed;

    % Loop until WemptyA is close to WemptyR
%     if abs(WemptyA - WemptyR) <= .01 * WemptyR
% %         break
%     else
        if WemptyA > WemptyR
            if WemptyA - WemptyR > 10000
                WTO = WTO - 10000;
            elseif WemptyA - WemptyR > 1000
                WTO = WTO - 1000;
            elseif WemptyA - WemptyR > 500
                WTO = WTO - 500;
            elseif WemptyA - WemptyR > 50
                WTO = WTO - 50;
            end
        elseif WemptyR > WemptyA
            if WemptyR - WemptyA > 10000
                WTO = WTO + 10000;
            elseif WemptyR - WemptyA > 1000
                WTO = WTO + 1000;
            elseif WemptyR - WemptyA > 500
                WTO = WTO + 500;
            elseif WemptyR - WemptyA > 50
                WTO = WTO + 50;
            end
        end
%     end
    if noWaitBoxFig == 0
        waitbarMod(i/50,h);
    end
    clc;
end

