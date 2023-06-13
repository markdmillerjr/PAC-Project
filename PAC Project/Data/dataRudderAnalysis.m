function dataRudderAnalysis
% Written by Mark D. Miller Jr.
% 11/12/2019
global vertAirfoilFile airfoilFile
airfoilFile = vertAirfoilFile;
airfoilData;
airfoilPlots;
dataRudderAeroAnalysis;

% Rudder Analysis
function dataRudderAeroAnalysis
global LamLEVert t_c tpVert Cla_airfoil alphaArray_airfoil ClaArray_airfoil...
    SrefVert c cVert rudderHeightSpace rudderHeight rudderChord rudderAngleDeg...
    ClaArray_vert_linear_Rudder alphaArray_vert_linear_Rudder ClaArray_vert_nonlinear1_Rudder...
    alphaArray_vert_nonlinear1_Rudder ClaArray_vert_nonlinear2_Rudder...
    alphaArray_vert_nonlinear2_Rudder aL_0_vert_rudder aStarA_vert...
    ClaArray_vert_Rudder_combined alphaArray_vert_Rudder_combined height...
    LamLEVert_rad CLmax_vert alphaCLmax_vert CLa_vert aStarA_vert_rudder...
    AR_highVert ARVert aL_0_vert ClaArray_vert_nonlinear1

%% Rudder Calcs
% Leading Edge Slope
xLE = height*tand(LamLEVert);
slopeLE  = height/xLE;

% Trailing Edge Slope
xTE = cVert-(xLE+cVert*tpVert);
slopeTE = height/xTE;

% Difference in root chord due to leading edge sweep
deltaXLE = rudderHeightSpace/slopeLE;

% Difference in root chord due to taper ratio
deltaXTE = rudderHeightSpace/slopeTE;

% Area in front of leading edge
A1 = 1/2*(rudderHeight)*xLE;

% Area behind of trailing edge
A2 = 1/2*(rudderHeight)*xTE;

% Area of of root chord and rudder height
A3 = (cVert - deltaXLE - deltaXTE)*rudderHeight;

% Flapped Rudder Area
SWf = A3-(A1+A2);

% Vertical Tail Area
SrefVert = (height)*cVert*(1+tpVert);

% Rudder chord to Vertical Tail chord
Ce_Ch = rudderChord/cVert;

% ClaArray_airfoil_elevator = ClaArray_airfoil;

if rudderChord/cVert <= .1
    Kprimef = -9E-6*rudderAngleDeg^2 - .0149*rudderAngleDeg + 1.1913;
    if rudderAngleDeg > 32.5
        Kprimef = 1E-4*rudderAngleDeg^2 - .0139*rudderAngleDeg + 1.0461;
    end
elseif rudderChord/cVert > .1 && rudderChord/cVert <= .15
    Kprimef = -.0001*rudderAngleDeg^2 - .0114*rudderAngleDeg + 1.165;
    if rudderAngleDeg > 30
        Kprimef = .0001*rudderAngleDeg^2 - .0163*rudderAngleDeg + 1.0773;
    end
elseif rudderChord/cVert > .15 && rudderChord/cVert <= .2
    Kprimef = -.0006*rudderAngleDeg^2 + .0044*rudderAngleDeg + 1.043;
    if rudderAngleDeg > 27
        Kprimef = .0001*rudderAngleDeg - .0152*rudderAngleDeg + 1.0285;
    end
elseif rudderChord/cVert > .2 && rudderChord/cVert <= .25
    Kprimef = -.0008*rudderAngleDeg^2 + .009*rudderAngleDeg + 1.0097;
    if rudderAngleDeg > 26
        Kprimef = -5E-6*rudderAngleDeg^3 + .0008*rudderAngleDeg^2 - .0432*rudderAngleDeg + 1.3987;
    end
elseif rudderChord/cVert > .25 && rudderChord/cVert <= .3
    Kprimef = -.0015*rudderAngleDeg^2 + .0278*rudderAngleDeg + .8826;
    if rudderAngleDeg > 20.5
        Kprimef = -4E-6*rudderAngleDeg^3 + .0007*rudderAngleDeg^2 - .0403*rudderAngleDeg + 1.3184;
    end
elseif rudderChord/cVert > .3 && rudderChord/cVert <= .4
    Kprimef = -.0024*rudderAngleDeg^2 + .0502*rudderAngleDeg + .7351;
    if rudderAngleDeg > 19.5
        Kprimef = -.0167*rudderAngleDeg + 1.0667;
    elseif rudderAngleDeg > 28
        Kprimef = 8E-5*rudderAngleDeg^2 - .0119*rudderAngleDeg + .8713;
    end
elseif rudderChord/cVert > .4
    Kprimef = -.0021*rudderAngleDeg^2 + .0308*rudderAngleDeg + .9116;
    if rudderAngleDeg > 20
        Kprimef = -.02*rudderAngleDeg + 1.1;
    elseif rudderAngleDeg > 25
        Kprimef = .0001*rudderAngleDeg^2 - .015*rudderAngleDeg + .9024;
    end
end

if t_c >= .15
    dCl_dDeltaF = -8.958*Ce_Ch^2 + 13.791*Ce_Ch + 1.2325;
elseif t_c < .15 && t_c >= .12
    dCl_dDeltaF = -9.5243*Ce_Ch^2 + 13.783*Ce_Ch + 1.2401;
elseif t_c < .12 && t_c >= .1
    dCl_dDeltaF = -10.092*Ce_Ch^2 + 13.807*Ce_Ch + 1.2379;
elseif t_c < .1 && t_c >= .08
    dCl_dDeltaF = -11.1*Ce_Ch^2 + 14.053*Ce_Ch + 1.2271;
elseif t_c < .08 && t_c >= .06
    dCl_dDeltaF = -10.547*Ce_Ch^2 + 13.441*Ce_Ch + 1.2785;
elseif t_c < .06 && t_c >= .04
    dCl_dDeltaF = -9.416*Ce_Ch^2 + 12.573*Ce_Ch + 1.3349;
elseif t_c < .04 && t_c >= .02
    dCl_dDeltaF = -9.8365*Ce_Ch^2 + 12.58*Ce_Ch + 1.3383;
elseif t_c < .02 && t_c >= 0
    dCl_dDeltaF = -9.9429*Ce_Ch^2 + 12.6*Ce_Ch + 1.2718;
end

Cla_airfoil_rad = 1/(((1/Cla_airfoil)*pi())/180);

% rudderAngleRad = (rudderAngleDeg*pi())/180;

% Nicolai
deltaAlphaZeroLift_deg = -dCl_dDeltaF*(1/Cla_airfoil_rad)*(rudderAngleDeg)*Kprimef;

deltaAlphaStall = -.0012*rudderAngleDeg^2 - .0239*rudderAngleDeg - .019;

alphaArray_airfoil_rudder = zeros(size(alphaArray_airfoil(1)));

% Add deltaAlphaZeroLift to array of alpha values
for count = 1:length(alphaArray_airfoil)
    alphaArray_airfoil_rudder(count) = alphaArray_airfoil(count) + deltaAlphaZeroLift_deg;
%     alphaArray_airfoil_flaps(count) = alphaArray_airfoil(count) + -5;
end

% Find alpha at Clmax without flaps
Clmax_clean = max(ClaArray_airfoil);
for num1 = 1:length(alphaArray_airfoil) 
    if ClaArray_airfoil(num1) == Clmax_clean
        Clmax_clean_point = num1;
        break
    end
end

% Find alpha at Clmax with flaps
ClaArray_airfoil_rudder = Cla_airfoil*(alphaArray_airfoil_rudder-deltaAlphaZeroLift_deg);
Clmax_rudder = max(ClaArray_airfoil_rudder);

for num2 = 1:length(alphaArray_airfoil_rudder)
    if ClaArray_airfoil_rudder(num2) == Clmax_rudder
        Clmax_elevator_point = num2;
        break
    end
end
alphaStallclean = Clmax_clean/Cla_airfoil;
alphaStallElevator = Clmax_rudder/Cla_airfoil;

% Delta CLmax for Airfoil
if abs(alphaArray_airfoil(num1) - alphaArray_airfoil_rudder(num2)) ~= abs(deltaAlphaStall)
    for num3 = 1:10000
        if alphaStallElevator < alphaStallclean
            Clmax_rudder = Clmax_rudder + .001;
        elseif alphaStallElevator > alphaStallclean
            Clmax_rudder = Clmax_rudder - .001;
        end
    alphaStallElevator = (Clmax_rudder/Cla_airfoil)+deltaAlphaZeroLift_deg;
        if abs(alphaStallclean - alphaStallElevator) >= abs(deltaAlphaStall)-.005 &&...
                abs(alphaStallclean - alphaStallElevator) <= abs(deltaAlphaStall)+.005
            break
        end
    end
end

clmaxFlapsdeduction = 0;
stop = 0;
for run = 1:15
% Delta Clmax for airfoil  
deltaClmax_Airfoil = Clmax_rudder - Clmax_clean;

% Before I finish the high lift calcs based on nicolai, need to compare
% data to similar calcs by Raymer.
% Raymer is dumb, not nearly as extensive as Nicolai, brandt as well.

% Sweep at Quarter Chord (x=0 at leading edge, x=1 at trailing edge)
xChordStationElevator = .25;
LamQuarterChord_rad = atan(tan(LamLEVert_rad)-((4*(xChordStationElevator)*(1-tpVert))/(ARVert*(1+tpVert))));

% Planform correction for TE elevator
LamQuarterChord_deg = (LamQuarterChord_rad*180)/pi();
Kdelta = (1-.08*cosd(LamQuarterChord_deg)^2)*cosd(LamQuarterChord_deg)^(3/4);

% Delta CLmax for Vertical Tail
deltaCLmax_vert = deltaClmax_Airfoil*((SWf)/(SrefVert))*Kdelta;

alphaArray_vert_linear_Rudder = [aL_0_vert_rudder; aStarA_vert_rudder;];
ClaArray_vert_linear_Rudder   = [0; CLa_vert*(aStarA_vert_rudder-aL_0_vert_rudder);];

aStarA_vert_rudder = aStarA_vert;

% for run = 1:3
    k     = 0;
    delta = 0;
    aL_0_vert_rudder = aL_0_vert + deltaAlphaZeroLift_deg;
    
    if run > 1
         if ClaArray_vert_nonlinear1_Rudder(2) - ClaArray_vert_nonlinear1_Rudder(1)/alphaArray_vert_nonlinear1_Rudder(2) - alphaArray_vert_nonlinear1_Rudder(1) < 0
             aStarA_vert_rudder = aStarA_vert_rudder - 1;
         end
    end
    A   = aStarA_vert_rudder;
    B   = alphaCLmax_vert;
    CLmax_vertTotal = CLmax_vert + deltaCLmax_vert;
    num   = 5;
    numer = 1;
    denom = num-1;
    check = denom-1;
    alphaArray_vert_nonlinear1_Rudder = zeros(1,num);
    ClaArray_vert_nonlinear1_Rudder   = zeros(1,num);

    for i = 1:num
        if k == 1
            i = num;
        end
        % Beginning of nonlinear curve
        if i == 1
            h = A;
            alphaArray_vert_nonlinear1_Rudder(i) = h;
            ClaArray_vert_nonlinear1_Rudder(i)   = CLa_vert*(h-aL_0_vert_rudder);
        end
        % Maximum CL value, half of nonlinear curve
        if i == num
            h = alphaCLmax_vert;
            alphaArray_vert_nonlinear1_Rudder(i) = h;
            ClaArray_vert_nonlinear1_Rudder(i)   = CLmax_vertTotal;
            break
        end
        % Between start and halfway point of nonlinear curve
        if i >= 2
            for j = 2:num-1
                % Halfway between start and maximum CL value
                if j == ceil(num/2) || numer > 1
                    h = (((A+B))/2);
                    value = h;
                    delta = delta*(num/denom);
                end
                % Greater than start and less than halfway point between start and
                % Maximum CL value
                if j < ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_vert_nonlinear1_Rudder(j-1);
                % Greater than halfway point and less than maximum CL value
                elseif j > ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_vert_nonlinear1_Rudder(j-1);
                    delta  = delta/(num/denom)-.07;
                end
            alphaArray_vert_nonlinear1_Rudder(j) = value;
            ClaArray_vert_nonlinear1_Rudder(j)   = CLa_vert*(value-aL_0_vert_rudder)+(delta);
            end
            k = 1;
        end
    end 
% end

    % Fixes first part of nonlinear curve if needed
    if max(ClaArray_vert_nonlinear1_Rudder) > CLmax_vertTotal
        if ClaArray_vert_nonlinear1_Rudder(4) > CLmax_vertTotal
%             Point4 = ClaArray_vert_nonlinear1_Rudder(4);
            Point4A = ClaArray_vert_nonlinear1_Rudder(4) - CLmax_vertTotal + .005;
            Point4 = ClaArray_vert_nonlinear1_Rudder(4) - Point4A;
        else
            Point4 = ClaArray_vert_nonlinear1_Rudder(4);
        end
        
        if ClaArray_vert_nonlinear1_Rudder(3) > CLmax_vertTotal
%             Point3 = ClaArray_vert_nonlinear1_Rudder(3);
            Point3A = ClaArray_vert_nonlinear1_Rudder(3) - CLmax_vertTotal + .01;
            Point3 = ClaArray_vert_nonlinear1_Rudder(3) - Point3A;
        else
            Point3 = ClaArray_vert_nonlinear1_Rudder(3);
        end
        
        if ClaArray_vert_nonlinear1_Rudder(2) > CLmax_vertTotal
%             Point2 = ClaArray_vert_nonlinear1_Rudder(2);
            Point2A = ClaArray_vert_nonlinear1_Rudder(2) - CLmax_vertTotal + .03;
            Point2 = ClaArray_vert_nonlinear1_Rudder(2) - Point2A;
        else
            Point2 = ClaArray_vert_nonlinear1_Rudder(2);
        end
        
        if ClaArray_vert_nonlinear1_Rudder(1) > CLmax_vertTotal
%             Point1 = ClaArray_vert_nonlinear1_Rudder(1);
            Point1A = ClaArray_vert_nonlinear1_Rudder(1) - CLmax_vertTotal + .05;
            Point1 =  ClaArray_vert_nonlinear1_Rudder(1) - Point1A;
        else 
            Point1 = CLa_vert*(aStarA_vert_rudder-aL_0_vert_rudder);
            % Smoothing out transition between linear-nonlinear points.
            
            aStarA_test = aStarA_vert_rudder;
            slopePoint1 = CLa_vert*(aStarA_vert_rudder-aL_0_vert_rudder);
            slopePoint2 = Point2;
            slopePoint3 = aStarA_vert_rudder;
            slopePoint4 = alphaArray_vert_nonlinear1_Rudder(2);
            slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
            
            if slopeCheck < 0
                for i = 1:50
                    aStarA_test = aStarA_test - .1;
                    Point1 = CLa_vert*(aStarA_test - aL_0_vert_rudder);
                    slopePoint1 = Point1;
                    slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
                    if slopeCheck < .05 && slopeCheck > .03
                        break
                    end
                end
            end
        end
        
        ClaArray_vert_nonlinear1_Rudder = [Point1 Point2 Point3 Point4 CLmax_vertTotal];
    end
        
    array_Flaps = ClaArray_vert_nonlinear1_Rudder;
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_vert_nonlinear1_Rudder(5) - ClaArray_vert_nonlinear1_Rudder(4)) /...
                (alphaArray_vert_nonlinear1_Rudder(5) - alphaArray_vert_nonlinear1_Rudder(4)) > .022
                beta = linspace(array_Flaps(3),array_Flaps(5),50);
            for i = 1:30
                ClaArray_vert_nonlinear1_Rudder(4) = beta(i);
                if (ClaArray_vert_nonlinear1_Rudder(5) - ClaArray_vert_nonlinear1_Rudder(4)) /...
                        (alphaArray_vert_nonlinear1_Rudder(5) - alphaArray_vert_nonlinear1_Rudder(4)) < .022
                    break
                else
                end
            end
        end
        
    % Final check of high lift devices curve
    % Need to correct curve for low aspect ratio because the CLmax is
    % too high because it is based on a high aspect ratio assumption.
    differenceInCleanNRudderCL = ClaArray_vert_nonlinear1_Rudder(3)-ClaArray_vert_nonlinear1(3);
    if stop == 0
        if deltaCLmax_vert > differenceInCleanNRudderCL
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_rudder - Clmax_clean;

                % Delta CLmax for Vertical Tail
                deltaCLmax_vert = deltaClmax_Airfoil*((SWf)/(SrefVert))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction + .001;

                Clmax_rudder = Clmax_rudder - clmaxFlapsdeduction;
                if abs(differenceInCleanNRudderCL - deltaCLmax_vert) <= .015
                    stop = 1;
                    break
                end
            end
        elseif differenceInCleanNRudderCL > deltaCLmax_vert && deltaCLmax_vert > 0
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_rudder - Clmax_clean;

                % Delta CLmax for Vertical Tail
                deltaCLmax_vert = deltaClmax_Airfoil*((SWf)/(SrefVert))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction - .001;

                Clmax_rudder = Clmax_rudder - clmaxFlapsdeduction;
                if abs(differenceInCleanNRudderCL - deltaCLmax_vert) <= .015
                    stop = 1;
                    break
                end
            end
        end
    end
end      
        
    % Begins calculation of trailing nonlinear portion of curve
    num = 5;
    alphaArray_vert_nonlinear2_Rudder = zeros(1,num);
    ClaArray_vert_nonlinear2_Rudder   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_vert_nonlinear2_Rudder(i) = alphaCLmax_vert;
        end
        if i ~= 1
        alphaArray_vert_nonlinear2_Rudder(i) = ceil(alphaCLmax_vert)+i-2;
        end
    end

    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_vert_nonlinear2_Rudder,ClaArray_vert_nonlinear1_Rudder,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_vert_nonlinear2_Rudder(i) = alphaCLmax_vert;
        ClaArray_vert_nonlinear2_Rudder(i) = ClaArray_vert_nonlinear1_Rudder(end);
        end
        if i ~= 1
        alphaArray_vert_nonlinear2_Rudder(i) = ceil(alphaCLmax_vert)+i-2;
        ClaArray_vert_nonlinear2_Rudder(i) = equation(1) * alphaArray_vert_nonlinear2_Rudder(i)^2 + equation(2) * alphaArray_vert_nonlinear2_Rudder(i) + equation(3);
            if ClaArray_vert_nonlinear2_Rudder(i) > CLmax_vertTotal
                differenceInCLRudder = abs(ClaArray_vert_nonlinear2_Rudder(4) - ClaArray_vert_nonlinear2_Rudder(5));
                ClaArray_vert_nonlinear2_Rudder(i) = CLmax_vertTotal;
            end
        end
    end
    
    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    ClaArray_vert_nonlinear2_Rudder = sort(ClaArray_vert_nonlinear2_Rudder,'descend');
    
    % Final fix for trailing edge of curve for high aspect ratio horizontal
    % tails
    if AR_highVert == 1
    differenceInCLRudder = ClaArray_vert_nonlinear2_Rudder(2) - ClaArray_vert_nonlinear2_Rudder(3);
    ClaArray_vert_nonlinear2_Rudder(4) = ClaArray_vert_nonlinear2_Rudder(4) - differenceInCLRudder;
    end
    
    % Need to ensure the slope of the linear curve is kept constant
    slopeLinearCurve = (ClaArray_vert_linear_Rudder(2)-ClaArray_vert_linear_Rudder(1))/(alphaArray_vert_linear_Rudder(2)-alphaArray_vert_linear_Rudder(1));
 
    % Check when ClaArray_wing_linear_Flaps(2) is less than
    % ClaArray_wing_nonlinear_Flaps(1) 
    if ClaArray_vert_linear_Rudder(2) > ClaArray_vert_nonlinear1_Rudder(1)
        for i = 1:500
            ClaArray_vert_linear_Rudder(2) = ClaArray_vert_linear_Rudder(2) - .5;
            if ClaArray_vert_linear_Rudder(2) < ClaArray_vert_nonlinear1_Rudder(1) + .05 
                break
            end
        end
    end
    
    alphaArray_vert_linear_Rudder(2) = (ClaArray_vert_linear_Rudder(2)-ClaArray_vert_linear_Rudder(1))/slopeLinearCurve+alphaArray_vert_linear_Rudder(1);

    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_vert_nonlinear1_Rudder_end = alphaArray_vert_nonlinear1_Rudder;
    alphaArray_vert_nonlinear2_Rudder_end = alphaArray_vert_nonlinear2_Rudder;
    alphaArray_vert_nonlinear1_Rudder_end(1) = [];
    alphaArray_vert_nonlinear2_Rudder_end(1) = [];
    alphaArray_vert_Rudder_combined = zeros(1,9);
        for i = 1:2
            alphaArray_vert_Rudder_combined(i) = alphaArray_vert_linear_Rudder(i);
        end
        for j = 3:6
            alphaArray_vert_Rudder_combined(j) = alphaArray_vert_nonlinear1_Rudder_end(j-2);
        end
        for k = 7:9
            alphaArray_vert_Rudder_combined(k) = alphaArray_vert_nonlinear2_Rudder_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_vert_nonlinear1_Rudder_end = ClaArray_vert_nonlinear1_Rudder;
    ClaArray_vert_nonlinear2_Rudder_end = ClaArray_vert_nonlinear2_Rudder;
    ClaArray_vert_nonlinear1_Rudder_end(1) = [];
    ClaArray_vert_nonlinear2_Rudder_end(1) = [];
    ClaArray_vert_Rudder_combined = zeros(1,9);
        for i = 1:2
            ClaArray_vert_Rudder_combined(i) = ClaArray_vert_linear_Rudder(i);
        end
        for j = 3:6
            ClaArray_vert_Rudder_combined(j) = ClaArray_vert_nonlinear1_Rudder_end(j-2);
        end
        for k = 7:9
            ClaArray_vert_Rudder_combined(k) = ClaArray_vert_nonlinear2_Rudder_end(k-6);
        end
