function dataElevatorAnalysis
% Written by Mark D. Miller Jr.
% 11/112019
global horzAirfoilFile airfoilFile
airfoilFile = horzAirfoilFile;
airfoilData;
airfoilPlots;
elevatorAeroAnalysis;

% Elevator Analysis
function elevatorAeroAnalysis
global  ARHorz LamLEHorz t_c tpHorz aL_0_horz Cla_airfoil CLa_horz...
    ClaArray_airfoil alphaArray_airfoil SrefHorz AR_highHorz bHorz cHorz...
    elevatorSpanSpace elevatorAngleDeg elevatorSpan elevatorChord LamLEHorz_rad...
    aStarA_horz alphaCLmax_horz CLmax_horz alphaArray_horz_Elevator_combined...
    ClaArray_horz_Elevator_combined aL_0_horz_elevator aStarA_horz_elevator...
    ClaArray_horz_nonlinear1

%% Elevator Calcs
% Leading Edge Slope
xLE = (bHorz/2)*tand(LamLEHorz);
slopeLE  = (bHorz/2)/xLE;

% Trailing Edge Slope
xTE = cHorz-(xLE+cHorz*tpHorz);
slopeTE = (bHorz/2)/xTE;

% Difference in root chord due to leading edge sweep
deltaXLE = elevatorSpanSpace/slopeLE;

% Difference in root chord due to taper ratio
deltaXTE = elevatorSpanSpace/slopeTE;

% Area in front of leading edge
A1 = 1/2*(elevatorSpan)*xLE;

% Area behind of trailing edge
A2 = 1/2*(elevatorSpan)*xTE;

% Area of of root chord and rudder height
A3 = (cHorz - deltaXLE - deltaXTE)*elevatorSpan;

% Flapped Rudder Area
SWf = A3-(A1+A2);

% Horizontal Tail Area
SrefHorz = (bHorz/2)*cHorz*(1+tpHorz);

% Elevator chord to Horizontal Tail chord
Ce_Ch = elevatorChord/cHorz;

% ClaArray_airfoil_elevator = ClaArray_airfoil;

if elevatorChord/cHorz <= .1
    Kprimef = -9E-6*elevatorAngleDeg^2 - .0149*elevatorAngleDeg + 1.1913;
    if elevatorAngleDeg > 32.5
        Kprimef = 1E-4*elevatorAngleDeg^2 - .0139*elevatorAngleDeg + 1.0461;
    end
elseif elevatorChord/cHorz > .1 && elevatorChord/cHorz <= .15
    Kprimef = -.0001*elevatorAngleDeg^2 - .0114*elevatorAngleDeg + 1.165;
    if elevatorAngleDeg > 30
        Kprimef = .0001*elevatorAngleDeg^2 - .0163*elevatorAngleDeg + 1.0773;
    end
elseif elevatorChord/cHorz > .15 && elevatorChord/cHorz <= .2
    Kprimef = -.0006*elevatorAngleDeg^2 + .0044*elevatorAngleDeg + 1.043;
    if elevatorAngleDeg > 27
        Kprimef = .0001*elevatorAngleDeg - .0152*elevatorAngleDeg + 1.0285;
    end
elseif elevatorChord/cHorz > .2 && elevatorChord/cHorz <= .25
    Kprimef = -.0008*elevatorAngleDeg^2 + .009*elevatorAngleDeg + 1.0097;
    if elevatorAngleDeg > 26
        Kprimef = -5E-6*elevatorAngleDeg^3 + .0008*elevatorAngleDeg^2 - .0432*elevatorAngleDeg + 1.3987;
    end
elseif elevatorChord/cHorz > .25 && elevatorChord/cHorz <= .3
    Kprimef = -.0015*elevatorAngleDeg^2 + .0278*elevatorAngleDeg + .8826;
    if elevatorAngleDeg > 20.5
        Kprimef = -4E-6*elevatorAngleDeg^3 + .0007*elevatorAngleDeg^2 - .0403*elevatorAngleDeg + 1.3184;
    end
elseif elevatorChord/cHorz > .3 && elevatorChord/cHorz <= .4
    Kprimef = -.0024*elevatorAngleDeg^2 + .0502*elevatorAngleDeg + .7351;
    if elevatorAngleDeg > 19.5
        Kprimef = -.0167*elevatorAngleDeg + 1.0667;
    elseif elevatorAngleDeg > 28
        Kprimef = 8E-5*elevatorAngleDeg^2 - .0119*elevatorAngleDeg + .8713;
    end
elseif elevatorChord/cHorz > .4
    Kprimef = -.0021*elevatorAngleDeg^2 + .0308*elevatorAngleDeg + .9116;
    if elevatorAngleDeg > 20
        Kprimef = -.02*elevatorAngleDeg + 1.1;
    elseif elevatorAngleDeg > 25
        Kprimef = .0001*elevatorAngleDeg^2 - .015*elevatorAngleDeg + .9024;
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

% elevatorAngleRad = (elevatorAngleDeg*pi())/180;

% Nicolai
deltaAlphaZeroLift_deg = -dCl_dDeltaF*(1/Cla_airfoil_rad)*(elevatorAngleDeg)*Kprimef;

deltaAlphaStall = -.0012*elevatorAngleDeg^2 - .0239*elevatorAngleDeg - .019;

alphaArray_airfoil_elevator = zeros(size(alphaArray_airfoil(1)));

% Add deltaAlphaZeroLift to array of alpha values
for count = 1:length(alphaArray_airfoil)
    alphaArray_airfoil_elevator(count) = alphaArray_airfoil(count) + deltaAlphaZeroLift_deg;
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
ClaArray_airfoil_elevator = Cla_airfoil*(alphaArray_airfoil_elevator-deltaAlphaZeroLift_deg);
Clmax_elevator = ClaArray_airfoil_elevator(num1);

for num2 = 1:length(alphaArray_airfoil_elevator)
    if ClaArray_airfoil_elevator(num2) == Clmax_elevator
        Clmax_elevator_point = num2;
        break
    end
end
alphaStallclean = Clmax_clean/Cla_airfoil;
alphaStallElevator = Clmax_elevator/Cla_airfoil;

% Delta CLmax for Airfoil
if abs(alphaArray_airfoil(num1) - alphaArray_airfoil_elevator(num2)) ~= abs(deltaAlphaStall)
    for num3 = 1:10000
        if alphaStallElevator < alphaStallclean
            Clmax_elevator = Clmax_elevator + .001;
        elseif alphaStallElevator > alphaStallclean
            Clmax_elevator = Clmax_elevator - .001;
        end
    alphaStallElevator = (Clmax_elevator/Cla_airfoil)+deltaAlphaZeroLift_deg;
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
deltaClmax_Airfoil = Clmax_elevator - Clmax_clean;

% Before I finish the high lift calcs based on nicolai, need to compare
% data to similar calcs by Raymer.
% Raymer is dumb, not nearly as extensive as Nicolai, brandt as well.

% Sweep at Quarter Chord (x=0 at leading edge, x=1 at trailing edge)
xChordStationElevator = .25;
LamQuarterChord_rad = atan(tan(LamLEHorz_rad)-((4*(xChordStationElevator)*(1-tpHorz))/(ARHorz*(1+tpHorz))));

% Planform correction for TE elevator
LamQuarterChord_deg = (LamQuarterChord_rad*180)/pi();
Kdelta = (1-.08*cosd(LamQuarterChord_deg)^2)*cosd(LamQuarterChord_deg)^(3/4);

% Delta CLmax for Horizontal Tail
deltaCLmax_horz = deltaClmax_Airfoil*((2*SWf)/(2*SrefHorz))*Kdelta;

aStarA_horz_elevator = aStarA_horz;

alphaArray_horz_linear_Elevator = [aL_0_horz_elevator; aStarA_horz_elevator;];
ClaArray_horz_linear_Elevator   = [0; CLa_horz*(aStarA_horz_elevator-aL_0_horz_elevator);];

for run = 1:3
    k     = 0;
    delta = 0;
%     aL_0_horz_elevator = aL_0_horz;
    aL_0_horz_elevator = aL_0_horz + deltaAlphaZeroLift_deg;
    
    if run > 1
         if ClaArray_horz_nonlinear1_Elevator(2) - ClaArray_horz_nonlinear1_Elevator(1)/alphaArray_horz_nonlinear1_Elevator(2) - alphaArray_horz_nonlinear1_Elevator(1) < 0
             aStarA_horz_elevator = aStarA_horz_elevator - 1;
         end
    end
    A   = aStarA_horz_elevator;
    B   = alphaCLmax_horz;
    CLmax_horzTotal = CLmax_horz + deltaCLmax_horz;
    num   = 5;
    numer = 1;
    denom = num-1;
%     check = denom-1;
    alphaArray_horz_nonlinear1_Elevator = zeros(1,num);
    ClaArray_horz_nonlinear1_Elevator   = zeros(1,num);

    for i = 1:num
        if k == 1
            i = num;
        end
        % Beginning of nonlinear curve
        if i == 1
            h = A;
            alphaArray_horz_nonlinear1_Elevator(i) = h;
            ClaArray_horz_nonlinear1_Elevator(i)   = CLa_horz*(h-aL_0_horz_elevator);
        end
        % Maximum CL value, half of nonlinear curve
        if i == num
            h = alphaCLmax_horz;
            alphaArray_horz_nonlinear1_Elevator(i) = h;
            ClaArray_horz_nonlinear1_Elevator(i)   = CLmax_horzTotal;
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
                    value  = hh + alphaArray_horz_nonlinear1_Elevator(j-1);
                % Greater than halfway point and less than maximum CL value
                elseif j > ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_horz_nonlinear1_Elevator(j-1);
                    delta  = delta/(num/denom)-.07;
                end
            alphaArray_horz_nonlinear1_Elevator(j) = value;
            ClaArray_horz_nonlinear1_Elevator(j)   = CLa_horz*(value-aL_0_horz_elevator)+(delta);
            end
            k = 1;
        end
    end 
end

    % Fixes first part of nonlinear curve if needed
    if max(ClaArray_horz_nonlinear1_Elevator) > CLmax_horzTotal
        if ClaArray_horz_nonlinear1_Elevator(4) > CLmax_horzTotal
%             Point4 = ClaArray_horz_nonlinear1_Elevator(4);
            Point4A = ClaArray_horz_nonlinear1_Elevator(4) - CLmax_horzTotal + .005;
            Point4 = ClaArray_horz_nonlinear1_Elevator(4) - Point4A;
        else
            Point4 = ClaArray_horz_nonlinear1_Elevator(4);
        end
        
        if ClaArray_horz_nonlinear1_Elevator(3) > CLmax_horzTotal
%             Point3 = ClaArray_horz_nonlinear1_Elevator(3);
            Point3A = ClaArray_horz_nonlinear1_Elevator(3) - CLmax_horzTotal + .01;
            Point3 = ClaArray_horz_nonlinear1_Elevator(3) - Point3A;
        else
            Point3 = ClaArray_horz_nonlinear1_Elevator(3);
        end
        
        if ClaArray_horz_nonlinear1_Elevator(2) > CLmax_horzTotal
%             Point2 = ClaArray_horz_nonlinear1_Elevator(2);
            Point2A = ClaArray_horz_nonlinear1_Elevator(2) - CLmax_horzTotal + .03;
            Point2 = ClaArray_horz_nonlinear1_Elevator(2) - Point2A;
        else
            Point2 = ClaArray_horz_nonlinear1_Elevator(2);
        end
        
        if ClaArray_horz_nonlinear1_Elevator(1) > CLmax_horzTotal
%             Point1 = ClaArray_horz_nonlinear1_Elevator(1);
            Point1A = ClaArray_horz_nonlinear1_Elevator(1) - CLmax_horzTotal + .05;
            Point1 =  ClaArray_horz_nonlinear1_Elevator(1) - Point1A;
        else 
            Point1 = CLa_horz*(aStarA_horz_elevator-aL_0_horz_elevator);
            % Smoothing out transition between linear-nonlinear points.

            aStarA_test = aStarA_horz_elevator;
            slopePoint1 = CLa_horz*(aStarA_horz_elevator-aL_0_horz_elevator);
            slopePoint2 = Point2;
            slopePoint3 = aStarA_horz_elevator;
            slopePoint4 = alphaArray_horz_nonlinear1_Elevator(2);
            slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
            
            if slopeCheck < 0
                for i = 1:50
                    aStarA_test = aStarA_test - .1;
                    Point1 = CLa_horz*(aStarA_test - aL_0_horz_Elevator);
                    slopePoint1 = Point1;
                    slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
                    if slopeCheck < .05 && slopeCheck > .03
                        break
                    end
                end
            end
        end
        
        ClaArray_horz_nonlinear1_Elevator = [Point1 Point2 Point3 Point4 CLmax_horzTotal];
    end
        
    array_Flaps = ClaArray_horz_nonlinear1_Elevator;
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_horz_nonlinear1_Elevator(5) - ClaArray_horz_nonlinear1_Elevator(4)) /...
                (alphaArray_horz_nonlinear1_Elevator(5) - alphaArray_horz_nonlinear1_Elevator(4)) > .022
                beta = linspace(array_Flaps(3),array_Flaps(5),50);
            for i = 1:30
                ClaArray_horz_nonlinear1_Elevator(4) = beta(i);
                if (ClaArray_horz_nonlinear1_Elevator(5) - ClaArray_horz_nonlinear1_Elevator(4)) /...
                        (alphaArray_horz_nonlinear1_Elevator(5) - alphaArray_horz_nonlinear1_Elevator(4)) < .022
                    break
                else
                end
            end
        end
    
    % Final check of high lift devices curve
    % Need to correct curve for low aspect ratio because the CLmax is
    % too high because it is based on a high aspect ratio assumption.
    differenceInCleanNElevatorCL = ClaArray_horz_nonlinear1_Elevator(3)-ClaArray_horz_nonlinear1(3);
    if stop == 0
        if deltaCLmax_horz - differenceInCleanNElevatorCL >= .015
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_elevator - Clmax_clean;

                % Delta CLmax for Horizontal Tail
                deltaCLmax_horz = deltaClmax_Airfoil*((2*SWf)/(2*SrefHorz))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction + .001;

                Clmax_elevator = Clmax_elevator - clmaxFlapsdeduction;
                if abs(differenceInCleanNElevatorCL - deltaCLmax_horz) <= .015
                    stop = 1;
                    break
                end
            end
        elseif differenceInCleanNElevatorCL > deltaCLmax_horz
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_elevator - Clmax_clean;

                % Delta CLmax for Horizontal Tail
                deltaCLmax_horz = deltaClmax_Airfoil*((2*SWf)/(2*SrefHorz))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction - .001;

                Clmax_elevator = Clmax_elevator - clmaxFlapsdeduction;
                if abs(differenceInCleanNElevatorCL - deltaCLmax_horz) <= .015
                    stop = 1;
                    break
                end
            end
        end
    end
end 
      
    % Begins calculation of trailing nonlinear portion of curve
    num = 5;
    alphaArray_horz_nonlinear2_Elevator = zeros(1,num);
    ClaArray_horz_nonlinear2_Elevator   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_horz_nonlinear2_Elevator(i) = alphaCLmax_horz;
        end
        if i ~= 1
        alphaArray_horz_nonlinear2_Elevator(i) = ceil(alphaCLmax_horz)+i-2;
        end
    end
    
    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_horz_nonlinear2_Elevator,ClaArray_horz_nonlinear1_Elevator,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_horz_nonlinear2_Elevator(i) = alphaCLmax_horz;
        ClaArray_horz_nonlinear2_Elevator(i) = ClaArray_horz_nonlinear1_Elevator(end);
        end
        if i ~= 1
        alphaArray_horz_nonlinear2_Elevator(i) = ceil(alphaCLmax_horz)+i-2;
        ClaArray_horz_nonlinear2_Elevator(i) = equation(1) * alphaArray_horz_nonlinear2_Elevator(i)^2 + equation(2) * alphaArray_horz_nonlinear2_Elevator(i) + equation(3);
            if ClaArray_horz_nonlinear2_Elevator(i) > CLmax_horzTotal
                differenceInCLFlaps = abs(ClaArray_horz_nonlinear2_Elevator(4) - ClaArray_horz_nonlinear2_Elevator(5));
                ClaArray_horz_nonlinear2_Elevator(i) = CLmax_horzTotal;
            end
        end
    end
    
    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    ClaArray_horz_nonlinear2_Elevator = sort(ClaArray_horz_nonlinear2_Elevator,'descend');
    
    % Final fix for trailing edge of curve for high aspect ratio horizontal
    % tails
    if AR_highHorz == 1
    differenceInCLFlaps = ClaArray_horz_nonlinear2_Elevator(2) - ClaArray_horz_nonlinear2_Elevator(3);
    ClaArray_horz_nonlinear2_Elevator(4) = ClaArray_horz_nonlinear2_Elevator(4) - differenceInCLFlaps;
    end
    
    % Need to ensure the slope of the linear curve is kept constant
    slopeLinearCurve = (ClaArray_horz_linear_Elevator(2)-ClaArray_horz_linear_Elevator(1))/(alphaArray_horz_linear_Elevator(2)-alphaArray_horz_linear_Elevator(1));
 
    % Check when ClaArray_wing_linear_Flaps(2) is less than
    % ClaArray_wing_nonlinear_Flaps(1) 
    if ClaArray_horz_linear_Elevator(2) > ClaArray_horz_nonlinear1_Elevator(1)
        for i = 1:500
            ClaArray_horz_linear_Elevator(2) = ClaArray_horz_linear_Elevator(2) - .5;
            if ClaArray_horz_linear_Elevator(2) < ClaArray_horz_nonlinear1_Elevator(1) + .05 
                break
            end
        end
    end
    
    alphaArray_horz_linear_Elevator(2) = (ClaArray_horz_linear_Elevator(2)-ClaArray_horz_linear_Elevator(1))/slopeLinearCurve+alphaArray_horz_linear_Elevator(1);

    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_horz_nonlinear1_Elevator_end = alphaArray_horz_nonlinear1_Elevator;
    alphaArray_horz_nonlinear2_Elevator_end = alphaArray_horz_nonlinear2_Elevator;
    alphaArray_horz_nonlinear1_Elevator_end(1) = [];
    alphaArray_horz_nonlinear2_Elevator_end(1) = [];
    alphaArray_horz_Elevator_combined = zeros(1,9);
        for i = 1:2
            alphaArray_horz_Elevator_combined(i) = alphaArray_horz_linear_Elevator(i);
        end
        for j = 3:6
            alphaArray_horz_Elevator_combined(j) = alphaArray_horz_nonlinear1_Elevator_end(j-2);
        end
        for k = 7:9
            alphaArray_horz_Elevator_combined(k) = alphaArray_horz_nonlinear2_Elevator_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_horz_nonlinear1_Elevator_end = ClaArray_horz_nonlinear1_Elevator;
    ClaArray_horz_nonlinear2_Elevator_end = ClaArray_horz_nonlinear2_Elevator;
    ClaArray_horz_nonlinear1_Elevator_end(1) = [];
    ClaArray_horz_nonlinear2_Elevator_end(1) = [];
    ClaArray_horz_Elevator_combined = zeros(1,9);
        for i = 1:2
            ClaArray_horz_Elevator_combined(i) = ClaArray_horz_linear_Elevator(i);
        end
        for j = 3:6
            ClaArray_horz_Elevator_combined(j) = ClaArray_horz_nonlinear1_Elevator_end(j-2);
        end
        for k = 7:9
            ClaArray_horz_Elevator_combined(k) = ClaArray_horz_nonlinear2_Elevator_end(k-6);
        end
