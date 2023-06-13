function dataWingFlapAnalysis
% Written by Mark D. Miller Jr.
% 11/8/2019
global wingAirfoilFile airfoilFile
airfoilFile = wingAirfoilFile;
airfoilData;
airfoilPlots;
wingAeroFlapAnalysis;

% Wing Flap Analysis
function wingAeroFlapAnalysis
global aL_0_airfoil ARWing CLa_wing_str CLmax_wing_str Cla_wing LamLE aClmax_wing...
    t_c SrefWing aStarA_wing CDmin_wing_str serviceCeil tp...
    aL_0_wing Cla_airfoil CLmax_wing ClaArray_airfoil alphaArray_airfoil...
    ClaArray_wing_nonlinear1 CLa_wing c b flapAngleDeg flapSpan flapSpanSpace...
    flapChord Cf_C LamLE_rad alphaCLmax_wing array alphaArray_wing_nonlinear1_Flaps...
    ClaArray_wing_nonlinear1_Flaps alphaArray_wing_nonlinear2_Flaps...
    ClaArray_wing_nonlinear2_Flaps AR_highWing AR_lowWing CLmax_Clmax...
    Clmax_airfoil CLmax_base deltaCLmax deltaAlphaZeroLift_deg aL_0_wing_Flaps...
    aStarA_wing_Flaps alphaArray_wing_linear ClaArray_wing_linear...
    alphaArray_wing_Flaps_combined ClaArray_wing_Flaps_combined


%% Flap Calcs
% Leading Edge Slope
xLE = (b/2)*tand(LamLE);
slopeLE  = (b/2)/xLE;

% Trailing Edge Slope
xTE = c-(xLE+c*tp);
slopeTE = (b/2)/xTE;

% Difference in root chord due to leading edge sweep
deltaXLE = flapSpanSpace/slopeLE;

% Difference in root chord due to taper ratio
deltaXTE = flapSpanSpace/slopeTE;

% Area in front of leading edge
A1 = 1/2*(flapSpan)*xLE;

% Area behind of trailing edge
A2 = 1/2*(flapSpan)*xTE;

% Area of of root chord and rudder height
A3 = (c - deltaXLE - deltaXTE)*flapSpan;

% Flapped Wing Area
SWf = A3-(A1+A2);

% Wing Area
SrefWing = (b/2)*c*(1+tp);

% Flap chord to wing chord
Cf_C = flapChord/c;

% ClaArray_airfoil_flaps = ClaArray_airfoil;

if flapChord/c <= .1
    Kprimef = -9E-6*flapAngleDeg^2 - .0149*flapAngleDeg + 1.1913;
    if flapAngleDeg > 32.5
        Kprimef = 1E-4*flapAngleDeg^2 - .0139*flapAngleDeg + 1.0461;
    end
elseif flapChord/c > .1 && flapChord/c <= .15
    Kprimef = -.0001*flapAngleDeg^2 - .0114*flapAngleDeg + 1.165;
    if flapAngleDeg > 30
        Kprimef = .0001*flapAngleDeg^2 - .0163*flapAngleDeg + 1.0773;
    end
elseif flapChord/c > .15 && flapChord/c <= .2
    Kprimef = -.0006*flapAngleDeg^2 + .0044*flapAngleDeg + 1.043;
    if flapAngleDeg > 27
        Kprimef = .0001*flapAngleDeg - .0152*flapAngleDeg + 1.0285;
    end
elseif flapChord/c > .2 && flapChord/c <= .25
    Kprimef = -.0008*flapAngleDeg^2 + .009*flapAngleDeg + 1.0097;
    if flapAngleDeg > 26
        Kprimef = -5E-6*flapAngleDeg^3 + .0008*flapAngleDeg^2 - .0432*flapAngleDeg + 1.3987;
    end
elseif flapChord/c > .25 && flapChord/c <= .3
    Kprimef = -.0015*flapAngleDeg^2 + .0278*flapAngleDeg + .8826;
    if flapAngleDeg > 20.5
        Kprimef = -4E-6*flapAngleDeg^3 + .0007*flapAngleDeg^2 - .0403*flapAngleDeg + 1.3184;
    end
elseif flapChord/c > .3 && flapChord/c <= .4
    Kprimef = -.0024*flapAngleDeg^2 + .0502*flapAngleDeg + .7351;
    if flapAngleDeg > 19.5
        Kprimef = -.0167*flapAngleDeg + 1.0667;
    elseif flapAngleDeg > 28
        Kprimef = 8E-5*flapAngleDeg^2 - .0119*flapAngleDeg + .8713;
    end
elseif flapChord/c > .4
    Kprimef = -.0021*flapAngleDeg^2 + .0308*flapAngleDeg + .9116;
    if flapAngleDeg > 20
        Kprimef = -.02*flapAngleDeg + 1.1;
    elseif flapAngleDeg > 25
        Kprimef = .0001*flapAngleDeg^2 - .015*flapAngleDeg + .9024;
    end
end

if t_c >= .15
    dCl_dDeltaF = -8.958*Cf_C^2 + 13.791*Cf_C + 1.2325;
elseif t_c < .15 && t_c >= .12
    dCl_dDeltaF = -9.5243*Cf_C^2 + 13.783*Cf_C + 1.2401;
elseif t_c < .12 && t_c >= .1
    dCl_dDeltaF = -10.092*Cf_C^2 + 13.807*Cf_C + 1.2379;
elseif t_c < .1 && t_c >= .08
    dCl_dDeltaF = -11.1*Cf_C^2 + 14.053*Cf_C + 1.2271;
elseif t_c < .08 && t_c >= .06
    dCl_dDeltaF = -10.547*Cf_C^2 + 13.441*Cf_C + 1.2785;
elseif t_c < .06 && t_c >= .04
    dCl_dDeltaF = -9.416*Cf_C^2 + 12.573*Cf_C + 1.3349;
elseif t_c < .04 && t_c >= .02
    dCl_dDeltaF = -9.8365*Cf_C^2 + 12.58*Cf_C + 1.3383;
elseif t_c < .02 && t_c >= 0
    dCl_dDeltaF = -9.9429*Cf_C^2 + 12.6*Cf_C + 1.2718;
end

Cla_airfoil_rad = 1/(((1/Cla_airfoil)*pi())/180);

% flapAngleRad = (flapAngleDeg*pi())/180;

% Nicolai
deltaAlphaZeroLift_deg = -dCl_dDeltaF*(1/Cla_airfoil_rad)*(flapAngleDeg)*Kprimef;

deltaAlphaStall = -.0012*flapAngleDeg^2 - .0239*flapAngleDeg - .019;

alphaArray_airfoil_flaps = zeros(size(alphaArray_airfoil(1)));

% Add deltaAlphaZeroLift to array of alpha values
for count = 1:length(alphaArray_airfoil)
    alphaArray_airfoil_flaps(count) = alphaArray_airfoil(count) + deltaAlphaZeroLift_deg;
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
ClaArray_airfoil_flaps = Cla_airfoil*(alphaArray_airfoil_flaps-deltaAlphaZeroLift_deg);
Clmax_flaps = ClaArray_airfoil_flaps(num1);

for num2 = 1:length(alphaArray_airfoil_flaps)
    if ClaArray_airfoil_flaps(num2) == Clmax_flaps
        Clmax_flaps_point = num2;
        break
    end
end
alphaStallclean = Clmax_clean/Cla_airfoil;
alphaStallFlaps = Clmax_flaps/Cla_airfoil;

% Delta CLmax for Airfoil
if abs(alphaArray_airfoil(num1) - alphaArray_airfoil_flaps(num2)) ~= abs(deltaAlphaStall)
    for num3 = 1:10000
        if alphaStallFlaps < alphaStallclean
            Clmax_flaps = Clmax_flaps + .001;
        elseif alphaStallFlaps > alphaStallclean
            Clmax_flaps = Clmax_flaps - .001;
        end
    alphaStallFlaps = (Clmax_flaps/Cla_airfoil)+deltaAlphaZeroLift_deg;
        if abs(alphaStallclean - alphaStallFlaps) >= abs(deltaAlphaStall)-.005 &&...
                abs(alphaStallclean - alphaStallFlaps) <= abs(deltaAlphaStall)+.005
            break
        end
    end
end

clmaxFlapsdeduction = 0;
stop = 0;
for run = 1:15
% Delta Clmax for airfoil   
deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;

% Before I finish the high lift calcs based on nicolai, need to compare
% data to similar calcs by Raymer.
% Raymer is dumb, not nearly as extensive as Nicolai, brandt as well.


% Sweep at Quarter Chord (x=0 at leading edge, x=1 at trailing edge)
xChordStationFlaps = .25;

LamQuarterChord_rad = atan(tan(LamLE_rad)-((4*(xChordStationFlaps)*(1-tp))/(ARWing*(1+tp))));

% Planform correction for TE flaps
LamQuarterChord_deg = (LamQuarterChord_rad*180)/pi();
Kdelta = (1-.08*cosd(LamQuarterChord_deg)^2)*cosd(LamQuarterChord_deg)^(3/4);

% Delta CLmax for Wing
deltaCLmax_wing = deltaClmax_Airfoil*((2*SWf)/(2*SrefWing))*Kdelta;

aStarA_wing_Flaps = aStarA_wing;

alphaArray_wing_linear_Flaps = [aL_0_wing_Flaps; aStarA_wing_Flaps;];
ClaArray_wing_linear_Flaps   = [0; CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);];

for run = 1:3
    k     = 0;
    delta = 0;
%     aL_0_wing_Flaps = aL_0_wing;
    aL_0_wing_Flaps = aL_0_wing + deltaAlphaZeroLift_deg;
    
    if run > 1
         if ClaArray_wing_nonlinear1_Flaps(2) - ClaArray_wing_nonlinear1_Flaps(1)/alphaArray_wing_nonlinear1_Flaps(2) - alphaArray_wing_nonlinear1_Flaps(1) < 0
             aStarA_wing_Flaps = aStarA_wing_Flaps - 1;
         end
    end
    A   = aStarA_wing_Flaps;
    B   = alphaCLmax_wing;
    CLmax_wingTotal = CLmax_wing + deltaCLmax_wing;
    num   = 5;
    numer = 1;
    denom = num-1;
%     check = denom-1;
    alphaArray_wing_nonlinear1_Flaps = zeros(1,num);
    ClaArray_wing_nonlinear1_Flaps   = zeros(1,num);

    for i = 1:num
        if k == 1
            i = num;
        end
        % Beginning of nonlinear curve
        if i == 1
            h = A;
            alphaArray_wing_nonlinear1_Flaps(i) = h;
            ClaArray_wing_nonlinear1_Flaps(i)   = CLa_wing*(h-aL_0_wing_Flaps);
        end
        % Maximum CL value, half of nonlinear curve
        if i == num
            h = B;
            h = alphaCLmax_wing;
            alphaArray_wing_nonlinear1_Flaps(i) = h;
            ClaArray_wing_nonlinear1_Flaps(i)   = CLmax_wingTotal;
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
                    value  = hh + alphaArray_wing_nonlinear1_Flaps(j-1);
                % Greater than halfway point and less than maximum CL value
                elseif j > ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_wing_nonlinear1_Flaps(j-1);
                    delta  = delta/(num/denom)-.07;
                end
            alphaArray_wing_nonlinear1_Flaps(j) = value;
            ClaArray_wing_nonlinear1_Flaps(j)   = CLa_wing*(value-aL_0_wing_Flaps)+(delta);
            end
            k = 1;
        end
    end 
end
    % Fixes first part of nonlinear curve if needed
    if max(ClaArray_wing_nonlinear1_Flaps) > CLmax_wingTotal
        if ClaArray_wing_nonlinear1_Flaps(4) > CLmax_wingTotal
%             Point4 = ClaArray_wing_nonlinear1_Flaps(4);
            Point4A = ClaArray_wing_nonlinear1_Flaps(4) - CLmax_wingTotal + .005;
            Point4 = ClaArray_wing_nonlinear1_Flaps(4) - Point4A;
        else
            Point4 = ClaArray_wing_nonlinear1_Flaps(4);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(3) > CLmax_wingTotal
%             Point3 = ClaArray_wing_nonlinear1_Flaps(3);
            Point3A = ClaArray_wing_nonlinear1_Flaps(3) - CLmax_wingTotal + .01;
            Point3 = ClaArray_wing_nonlinear1_Flaps(3) - Point3A;
        else
            Point3 = ClaArray_wing_nonlinear1_Flaps(3);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(2) > CLmax_wingTotal
%             Point2 = ClaArray_wing_nonlinear1_Flaps(2);
            Point2A = ClaArray_wing_nonlinear1_Flaps(2) - CLmax_wingTotal + .03;
            Point2 = ClaArray_wing_nonlinear1_Flaps(2) - Point2A;
        else
            Point2 = ClaArray_wing_nonlinear1_Flaps(2);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(1) > CLmax_wingTotal
%             Point1 = ClaArray_wing_nonlinear1_Flaps(1);
            Point1A = ClaArray_wing_nonlinear1_Flaps(1) - CLmax_wingTotal + .05;
            Point1 =  ClaArray_wing_nonlinear1_Flaps(1) - Point1A;
        else 
            Point1 = CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);
            
            % Smoothing out transition between linear-nonlinear points.
            aStarA_test = aStarA_wing_Flaps;
            slopePoint1 = CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);
            slopePoint2 = Point2;
            slopePoint3 = aStarA_wing_Flaps;
            slopePoint4 = alphaArray_wing_nonlinear1_Flaps(2);
            slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
            
            if slopeCheck < 0
                for i = 1:50
                    aStarA_test = aStarA_test - .1;
                    Point1 = CLa_wing*(aStarA_test - aL_0_wing_Flaps);
                    slopePoint1 = Point1;
                    slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
                    if slopeCheck < .05 && slopeCheck > .03
                        break
                    end
                end
            end
        end
        
        ClaArray_wing_nonlinear1_Flaps = [Point1 Point2 Point3 Point4 CLmax_wingTotal];
    end
        
    array_Flaps = ClaArray_wing_nonlinear1_Flaps;
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_wing_nonlinear1_Flaps(5) - ClaArray_wing_nonlinear1_Flaps(4)) /...
                (alphaArray_wing_nonlinear1_Flaps(5) - alphaArray_wing_nonlinear1_Flaps(4)) > .022
                beta = linspace(array_Flaps(3),array_Flaps(5),50);
            for i = 1:30
                ClaArray_wing_nonlinear1_Flaps(4) = beta(i);
                if (ClaArray_wing_nonlinear1_Flaps(5) - ClaArray_wing_nonlinear1_Flaps(4)) /...
                        (alphaArray_wing_nonlinear1_Flaps(5) - alphaArray_wing_nonlinear1_Flaps(4)) < .022
                    break
                else
                end
            end
        end
        
    % Final check of high lift devices curve
    % Need to correct curve for low aspect ratio because the CLmax is
    % too high because it is based on a high aspect ratio assumption.
    differenceInCleanNFlapCL = ClaArray_wing_nonlinear1_Flaps(3)-ClaArray_wing_nonlinear1(3);
    if stop == 0
        if deltaCLmax_wing - differenceInCleanNFlapCL >= .015
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;

                % Delta CLmax for Wing
                deltaCLmax_wing = deltaClmax_Airfoil*((2*SWf)/(2*SrefWing))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction + .001;

                Clmax_flaps = Clmax_flaps - clmaxFlapsdeduction;
                if abs(differenceInCleanNFlapCL - deltaCLmax_wing) <= .015
                    stop = 1;
                    break
                end
            end
        elseif differenceInCleanNFlapCL > deltaCLmax_wing
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;

                % Delta CLmax for Wing
                deltaCLmax_wing = deltaClmax_Airfoil*((2*SWf)/(2*SrefWing))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction - .001;

                Clmax_flaps = Clmax_flaps - clmaxFlapsdeduction;
                if abs(differenceInCleanNFlapCL - deltaCLmax_wing) <= .015
                    stop = 1;
                    break
                end
            end
        end
    end
end 
        
    
    % Begins calculation of trailing nonlinear portion of curve
    num = 5;
    alphaArray_wing_nonlinear2_Flaps = zeros(1,num);
    ClaArray_wing_nonlinear2_Flaps   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2_Flaps(i) = alphaCLmax_wing;
        end
        if i ~= 1
        alphaArray_wing_nonlinear2_Flaps(i) = ceil(alphaCLmax_wing)+i-2;
        end
    end

    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_wing_nonlinear2_Flaps,ClaArray_wing_nonlinear1_Flaps,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2_Flaps(i) = alphaCLmax_wing;
        ClaArray_wing_nonlinear2_Flaps(i) = ClaArray_wing_nonlinear1_Flaps(end);
        end
        if i ~= 1
        alphaArray_wing_nonlinear2_Flaps(i) = ceil(alphaCLmax_wing)+i-2;
        ClaArray_wing_nonlinear2_Flaps(i) = equation(1) * alphaArray_wing_nonlinear2_Flaps(i)^2 + equation(2) * alphaArray_wing_nonlinear2_Flaps(i) + equation(3);
            if ClaArray_wing_nonlinear2_Flaps(i) > CLmax_wingTotal
                differenceInCLFlaps = abs(ClaArray_wing_nonlinear2_Flaps(4) - ClaArray_wing_nonlinear2_Flaps(5));
                ClaArray_wing_nonlinear2_Flaps(i) = CLmax_wingTotal;
            end
        end
    end
    
    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    ClaArray_wing_nonlinear2_Flaps = sort(ClaArray_wing_nonlinear2_Flaps,'descend');
    
    % Final fix for trailing edge of curve for high aspect ratio wings
    if AR_highWing == 1
    differenceInCLFlaps = ClaArray_wing_nonlinear2_Flaps(2) - ClaArray_wing_nonlinear2_Flaps(3);
    ClaArray_wing_nonlinear2_Flaps(4) = ClaArray_wing_nonlinear2_Flaps(4) - differenceInCLFlaps;
    end
    
%     alphaArray_wing_linear_Flaps = [aL_0_wing_Flaps; aStarA_wing_Flaps;];
%     ClaArray_wing_linear_Flaps   = [0; CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);];
    
    % Need to ensure the slope of the linear curve is kept constant
    slopeLinearCurve = (ClaArray_wing_linear_Flaps(2)-ClaArray_wing_linear_Flaps(1))/(alphaArray_wing_linear_Flaps(2)-alphaArray_wing_linear_Flaps(1));
 
    % Check when ClaArray_wing_linear_Flaps(2) is less than
    % ClaArray_wing_nonlinear_Flaps(1) 
    if ClaArray_wing_linear_Flaps(2) > ClaArray_wing_nonlinear1_Flaps(1)
        for i = 1:500
            ClaArray_wing_linear_Flaps(2) = ClaArray_wing_linear_Flaps(2) - .5;
            if ClaArray_wing_linear_Flaps(2) < ClaArray_wing_nonlinear1_Flaps(1) + .05 
                break
            end
        end
    end
    
    alphaArray_wing_linear_Flaps(2) = (ClaArray_wing_linear_Flaps(2)-ClaArray_wing_linear_Flaps(1))/slopeLinearCurve+alphaArray_wing_linear_Flaps(1);
    
    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_wing_nonlinear1_Flaps_end = alphaArray_wing_nonlinear1_Flaps;
    alphaArray_wing_nonlinear2_Flaps_end = alphaArray_wing_nonlinear2_Flaps;
    alphaArray_wing_nonlinear1_Flaps_end(1) = [];
    alphaArray_wing_nonlinear2_Flaps_end(1) = [];
    alphaArray_wing_Flaps_combined = zeros(1,9);
        for i = 1:2
            alphaArray_wing_Flaps_combined(i) = alphaArray_wing_linear_Flaps(i);
        end
        for j = 3:6
            alphaArray_wing_Flaps_combined(j) = alphaArray_wing_nonlinear1_Flaps_end(j-2);
        end
        for k = 7:9
            alphaArray_wing_Flaps_combined(k) = alphaArray_wing_nonlinear2_Flaps_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_wing_nonlinear1_Flaps_end = ClaArray_wing_nonlinear1_Flaps;
    ClaArray_wing_nonlinear2_Flaps_end = ClaArray_wing_nonlinear2_Flaps;
    ClaArray_wing_nonlinear1_Flaps_end(1) = [];
    ClaArray_wing_nonlinear2_Flaps_end(1) = [];
    ClaArray_wing_Flaps_combined = zeros(1,9);
        for i = 1:2
            ClaArray_wing_Flaps_combined(i) = ClaArray_wing_linear_Flaps(i);
        end
        for j = 3:6
            ClaArray_wing_Flaps_combined(j) = ClaArray_wing_nonlinear1_Flaps_end(j-2);
        end
        for k = 7:9
            ClaArray_wing_Flaps_combined(k) = ClaArray_wing_nonlinear2_Flaps_end(k-6);
        end
