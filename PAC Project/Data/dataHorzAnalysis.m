function dataHorzAnalysis()
% Written by Mark D. Miller Jr.
% 2/13/19
% %------------------------------------------------------------------------
global horzAirfoilFile airfoilFile masterFile
airfoilFile = horzAirfoilFile;

% Revert file access to master file
cd(masterFile);

% Access Airfoil folder
cd('Airfoil');

airfoilData;
airfoilPlots;
horzTailAeroAnalysis

% Horizontal Tail Analysis
function horzTailAeroAnalysis
global aL_0_airfoil ARHorz CLa_horz_str CLmax_horz_str Cla_horz LamLEHorz aClmax_horz...
    t_c Re Clmind_horz aStarA_horz CDmin_horz_str serviceCeil tpHorz...
    aL_0_horz aL_0_horz_str aL_0_airfoil_str Cmo_horz Cmo_horz_str...
    Cla_airfoil Cla_airfoil_str Cla_horz_str ac_airfoil ac_airfoil_str...
    ac_horz ac_horz_str aClmax_airfoil aClmax_horz_str aClmax_airfoil_str...
    Clmax_horz Clmax_horz_str Clmax_airfoil Clmax_airfoil_str aStarA_horz_str...
    aStarA_airfoil aStarA_airfoil_str Cdmin_horz Cdmin_horz_str Clmind_horz_str...
    SwetHorz SrefHorz CLa_horz CdClArray_airfoil ClCdArray_airfoil...
    CmacArray_airfoil CMo_horz_str Cla_wing  e0Horz...
    CLHorz  maximumMach ClaArray_airfoil e_Horz alphaArray_airfoil...
    AirfoilSeries alphaArray_horz_linear alphaArray_horz_nonlinear1...
    alphaArray_horz_nonlinear2 ClaArray_horz_linear ClaArray_horz_nonlinear1...
    ClaArray_horz_nonlinear2 SrefWing kDoublePrimeHorz AR_highHorz AR_lowHorz...
    alphaCLmax_horz_str LamLEHorz_rad alphaCLmax_horz alphaArray_horz_combined...
    ClaArray_horz_combined CLmax_horz masterFile

% All aerodynamic analyses are done using Fundamentals of Aircraft and
% Airship Design-Vol 1 by (Nicolai, Carichner, 2010)

% Correction factors to account for nonelliptic lif distribution
% Going to have to first determine tau and delta at AR = 6 to establish a
% baseline, then can determine deviation from AR = 6

% Subsonic Mach Number for subsonic flight
machNumber = .2;

% 2-D to 3-D Data
% Alpha(L=0)
aL_0_horz = aL_0_airfoil;
aL_0_horz_str = aL_0_airfoil_str;

% Pitching Moment Coefficient
Cmo_horz = min(CmacArray_airfoil);
Cmo_horz_str = num2str(Cmo_horz);
CMo_horz_str = num2str(Cmo_horz);

% Lift Curve Slope
Cla_horz = Cla_airfoil;
Cla_horz_str = Cla_airfoil_str;

% Aerodynamic Center
ac_horz = ac_airfoil;
ac_horz_str = ac_airfoil_str;

% Alpha at Max Cl
aClmax_horz = aClmax_airfoil;
aClmax_horz_str = aClmax_airfoil_str;

% Maximum Lift Coefficient
Clmax_horz = Clmax_airfoil;
Clmax_horz_str = Clmax_airfoil_str;

% Alpha where Cla ceases to be linear
aStarA_horz = aStarA_airfoil;
aStarA_horz_str = aStarA_airfoil_str;

% Minimum Drag Coefficient
Cdmin_horz = min(CdClArray_airfoil);
Cdmin_horz_str = num2str(Cdmin_horz);

% Lift Coefficient at Minimum Drag Coefficient
Clmind_horz = min(ClCdArray_airfoil);
Clmind_horz_str = num2str(Clmind_horz);

for step = 1:5
% Aspect Ratio (tp = 0)
% Start here to calculate the deviation in AR
AR_6 = 6;
Tau_AR_6 = -.0011*AR_6^2+.0317*AR_6+.0148;
Delta_AR_6 = -.0003*AR_6^2+.013*AR_6-.0195;

Tau_AR = -.0011*ARHorz^2+.0317*ARHorz+.0148;
Delta_AR = -.0003*ARHorz^2+.013*ARHorz-.0195;

differenceInTau_AR   = Tau_AR - Tau_AR_6;
differenceInDelta_AR = Delta_AR - Delta_AR_6;

% Taper Ratio (AR = 6)
% Proceed to here to calculate the deviation in tp
tp_0 = 0;
Tau_tp_0 = 1.0417*tp_0^5 - 2.036*tp_0^4 + .5299*tp_0^3 + 1.2261*tp_0^2 - .7068*tp_0 + .1058;
Delta_tp_0 = -3.0769*tp_0^5 + 8.715*tp_0^4 - 9.4563*tp_0^3 + 5.0908*tp_0^2 - 1.3624*tp_0 + .1486;

Tau_tp = 1.0417*tpHorz^5 - 2.036*tpHorz^4 + .5299*tpHorz^3 + 1.2261*tpHorz^2 - .7068*tpHorz + .1058;
Delta_tp = -3.0769*tpHorz^5 + 8.715*tpHorz^4 - 9.4563*tpHorz^3 + 5.0908*tpHorz^2 - 1.3624*tpHorz + .1486;

differenceInTau_tp = Tau_tp - Tau_tp_0;
differenceInDelta_tp = Delta_tp - Delta_tp_0;

Tau = Tau_tp + differenceInTau_AR + differenceInTau_tp;
Delta = Delta_tp + differenceInDelta_AR + differenceInDelta_tp;

% Sweep at Maximum Thickness
if ARHorz >= 6
    LamMaxThickness = atand(tand(LamLEHorz)-((4*(t_c)*(1-tpHorz))/(ARHorz*(1+tpHorz))));
elseif ARHorz < 6
    LamMaxThickness = atand(tand(LamLEHorz)-((4*(t_c)*(1-tpHorz))/(ARHorz*(1+tpHorz))));
end

% Sweep at 50 percent chord
x50PercentChord = .5;
Lam50Percent = atand(tand(LamLEHorz)-((4*(x50PercentChord)*(1-tpHorz))/(ARHorz*(1+tpHorz))));

% Oswald's Efficiency Factor
e0Horz = 4.61*(1-.045*ARHorz^.68)*(cosd(LamLEHorz))^.15-3.1;

% Wing Efficiency Factor % Brandt
e_Horz = 2/(2-ARHorz+sqrt(4+ARHorz^2*(1+tand(LamMaxThickness)^2)));

% Wing Lift Curve Slope % Nicolai
Cla_wing = Cla_airfoil/(sqrt(1-machNumber^2));
CLa_horz = Cla_airfoil/(1+((57.3*Cla_airfoil*(1+Tau))/(pi()*e_Horz*ARHorz)));

% Correction for wing sweep
CLa_horz = CLa_horz*sqrt(cosd(LamMaxThickness));
CLa_horz_str = num2str(CLa_horz,3);

% Coefficient of Lift(CL)
CLHorz = CLa_horz*(alphaArray_airfoil-aL_0_horz);

% Determination of Taper Ratio Correction Factors
C1 = 28.141*tpHorz^6 - 107.43*tpHorz^5 + 145.5*tpHorz^4 - 80.429*tpHorz^3 + 10.533*tpHorz^2 + 3.4809*tpHorz - .0019;

if tpHorz >= 0 && tpHorz <= .3
    C2 = 4.1667 * tpHorz^2 + 1.6667 * tpHorz - 7E-15;
elseif tpHorz > .3 && tpHorz <= .6
    C2 = 46.165 * tpHorz^3 - 69.348 * tpHorz^2 + 33.712 * tpHorz - 4.2439;
elseif tpHorz > .6 && tpHorz <= 1
    C2 = 1.25 * tpHorz - 2.325 * tpHorz + 1.935;
end

% Determination of DeltaY
switch AirfoilSeries
    case 1
    % NACA 4 & 5 Series
deltaY = -15.737 * t_c^2 + 28.083 * t_c + .0075;
    case 2
    % NACA 63 Series
deltaY = 22.321 * t_c - .0238;
    case 3
    % NACA 64 Series
deltaY = 20.857 * t_c - .0224;
    case 4
    % NACA 65 Series
deltaY = 18.993 * t_c + .009;
    case 5
    % NACA 66 Series
deltaY = 18.175 * t_c + .0117;
end

% Determination of High-AR Horizontal Tails
AR_highHorz = 0;
AR_lowHorz  = 0;

% Determination of  Low-AR Horizontal Tails
if ARHorz > 4/((C1+1)*cosd(LamLEHorz))
AR_highHorz = 1;
elseif ARHorz < 4/((C1+1)*cosd(LamLEHorz))
AR_lowHorz = 1;
end

%% High-AR Horizontal Tails
if AR_highHorz == 1
    % Determination of CLmax_Clmax
    if deltaY <= 1.4
        % DeltaY <= 1.4
    CLmax_Clmax = 8E-5 * LamLEHorz^2 + .002 * LamLEHorz + .9006;
    elseif deltaY > 1.4 && deltaY <= 1.6
        % DeltaY = 1.6
    CLmax_Clmax = 5E-5 * LamLEHorz^2 + .0018 * LamLEHorz + .9002;
    elseif deltaY > 1.6 && deltaY <= 1.8
        %  DeltaY = 1.8
    CLmax_Clmax = 2E-5 * LamLEHorz^2 + .001 * LamLEHorz + .8996;
    elseif deltaY > 1.8 && deltaY <= 2
        % DeltaY = 2
    CLmax_Clmax = -1E-5 * LamLEHorz^2 + .0002 * LamLEHorz + .8998;
    elseif deltaY > 2 && deltaY <= 2.2
        % DeltaY = 2.2
    CLmax_Clmax = -5E-5 * LamLEHorz^2 + 2E-16 * LamLEHorz + .9;
    elseif deltaY > 2.2 && deltaY <= 2.4
        % DeltaY = 2.4
    CLmax_Clmax = -4E-7 * LamLEHorz^3 - 3E-5 * LamLEHorz^2 - .0018 * LamLEHorz + .9005;
    elseif deltaY > 2.4
        % DeltaY = 2.5
    CLmax_Clmax = -1E-6 * LamLEHorz^3 + 5E-5 * LamLEHorz^2 - .0039 * LamLEHorz + .9;
    end

    % Horizontal Tail Sweep [rad]
    LamLEHorz_rad = (LamLEHorz*pi())/180;
    
    % Maximum Coefficient of Lift
    CLmax_horz = CLmax_Clmax*Clmax_airfoil;
    CLmax_horz_str = num2str(CLmax_horz);

    % Determination of DeltaAlphaCLmax
    if deltaY <= 1.2
        deltaAlphaCLmax = .0027 * LamLEHorz^2 + .0288 * LamLEHorz + 1.8126;
    elseif deltaY > 1.2 && deltaY <= 2
        deltaAlphaCLmax = .001 * LamLEHorz^2 + .1064 * LamLEHorz - .0271;
    elseif deltaY > 2 && deltaY <= 3
        deltaAlphaCLmax = .0008 * LamLEHorz^2 + .0475 * LamLEHorz + 1.1224;
    elseif deltaY > 3 || deltaY >= 4
        deltaAlphaCLmax = .0005 * LamLEHorz^2 - .0113 * LamLEHorz + 2.0836;
    end
    
    % Alpha CLmax(aCLmax)
    alphaCLmax_horz = (CLmax_horz/CLa_horz) + aL_0_horz + deltaAlphaCLmax;
    alphaCLmax_horz_str = num2str(alphaCLmax_horz,'%3.3f');

    % Minimum Coefficient of Lift
    Clmin_airfoil = min(ClaArray_airfoil);
 
    k     = 0;
    delta = 0;
    A   = aStarA_horz;
    B   = alphaCLmax_horz;
    num   = 5;
    numer = 1;
    denom = num-1;
    check = denom-1;
    alphaArray_horz_nonlinear1 = zeros(1,num);
    ClaArray_horz_nonlinear1   = zeros(1,num);

    for i = 1:num
        if k == 1
            i = num;
        end
        % Beginning of nonlinear curve
        if i == 1
            h = A;
            alphaArray_horz_nonlinear1(i) = h;
            ClaArray_horz_nonlinear1(i)   = CLa_horz*(h-aL_0_horz);
        end
        % Maximum CL value, half of nonlinear curve
        if i == num
            h = B;
            h = alphaCLmax_horz;
            alphaArray_horz_nonlinear1(i) = h;
            ClaArray_horz_nonlinear1(i)   = CLmax_horz;
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
                    value  = hh + alphaArray_horz_nonlinear1(j-1);
                % Greater than halfway point and less than maximum CL value
                elseif j > ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_horz_nonlinear1(j-1);
                    delta  = delta/(num/denom)-.07;
                end
            alphaArray_horz_nonlinear1(j) = value;
            ClaArray_horz_nonlinear1(j)   = CLa_horz*(value-aL_0_horz)+(delta);
            end
            k = 1;
        end
    end

    if step > 1
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_horz_nonlinear1(5) - ClaArray_horz_nonlinear1(4)) / (alphaArray_horz_nonlinear1(5) - alphaArray_horz_nonlinear1(4)) > .022
                beta = linspace(array(3),array(5),50);
            for i = 1:30
                ClaArray_horz_nonlinear1(4) = beta(i);
                if (ClaArray_horz_nonlinear1(5) - ClaArray_horz_nonlinear1(4)) / (alphaArray_horz_nonlinear1(5) - alphaArray_horz_nonlinear1(4)) < .022
                    break
                else
                end
            end
        end
    end

    % Begins calculation of trailing nonlinear portion of curve
    alpha = 5;
    num = 5;
    alphaArray_horz_nonlinear2 = zeros(1,num);
    ClaArray_horz_nonlinear2   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_horz_nonlinear2(i) = alphaCLmax_horz;
        end
        if i ~= 1
        alphaArray_horz_nonlinear2(i) = ceil(alphaCLmax_horz)+i-2;
        end
    end

    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_horz_nonlinear2,ClaArray_horz_nonlinear1,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_horz_nonlinear2(i) = alphaCLmax_horz;
        ClaArray_horz_nonlinear2(i) = ClaArray_horz_nonlinear1(end);
        end
        if i ~= 1
        alphaArray_horz_nonlinear2(i) = ceil(alphaCLmax_horz)+i-2;
        ClaArray_horz_nonlinear2(i) = equation(1) * alphaArray_horz_nonlinear2(i)^2 + equation(2) * alphaArray_horz_nonlinear2(i) + equation(3);
        end
    end

    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    j = num;
    array = ClaArray_horz_nonlinear2;
    for i = 1:num
        if i == 1
        ClaArray_horz_nonlinear2(i) = array(i);
        end
        if i ~= 1
        ClaArray_horz_nonlinear2(i) = array(j);
        j = j - 1;
        end
    end

    % 1st line-linear
    alphaArray_horz_linear = [aL_0_horz; aStarA_horz;];
    ClaArray_horz_linear   = [0; CLa_horz*(aStarA_horz-aL_0_horz);];

    alphaArray_horz_nonlinear2(end) = [];
    ClaArray_horz_nonlinear2(end) = [];
    
    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_horz_nonlinear1_end = alphaArray_horz_nonlinear1;
    alphaArray_horz_nonlinear2_end = alphaArray_horz_nonlinear2;
    alphaArray_horz_nonlinear1_end(1) = [];
    alphaArray_horz_nonlinear2_end(1) = [];
    alphaArray_horz_combined = zeros(1,9);
        for i = 1:2
            alphaArray_horz_combined(i) = alphaArray_horz_linear(i);
        end
        for j = 3:6
            alphaArray_horz_combined(j) = alphaArray_horz_nonlinear1_end(j-2);
        end
        for k = 7:9
            alphaArray_horz_combined(k) = alphaArray_horz_nonlinear2_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_horz_nonlinear1_end = ClaArray_horz_nonlinear1;
    ClaArray_horz_nonlinear2_end = ClaArray_horz_nonlinear2;
    ClaArray_horz_nonlinear1_end(1) = [];
    ClaArray_horz_nonlinear2_end(1) = [];
    ClaArray_horz_combined = zeros(1,9);
        for i = 1:2
            ClaArray_horz_combined(i) = ClaArray_horz_linear(i);
        end
        for j = 3:6
            ClaArray_horz_combined(j) = ClaArray_horz_nonlinear1_end(j-2);
        end
        for k = 7:9
            ClaArray_horz_combined(k) = ClaArray_horz_nonlinear2_end(k-6);
        end
end

%% Low-AR Horizontal Tails
    if AR_lowHorz == 1
        % Beta for subsonic flight
        beta = sqrt(1-machNumber^2);

        % Calculation of (C1+1)*(AR/beta)*cos(LamLE)
        X = (C1+1)*(ARHorz/beta)*cosd(LamLEHorz);
        
        % Calculation of (C2+1)*(AR)tan(LamLE)
        Y = (C2 + 1)*(ARHorz)*tand(LamLEHorz);

        % Calculation of AR*cos(LamLE)*[1+4*Lam^2]
        Z = ARHorz*cosd(LamLEHorz)*(1+4*tpHorz^2);

        % Determination of (CLmax)base
        if deltaY == 0
            CLmax_base = .7031 * X^3 - 2.5625 * X^2 + 2.4125 * X + .77;
        elseif deltaY > 0 && deltaY <= .25
            CLmax_base = .2839 * X^3 - 1.6129 * X^2 + 1.9033 * X + .75;
        elseif deltaY > .25 && deltaY <= .5
            CLmax_base = .0337 * X^5 - .3789 * X^4 + 1.6073 * X^3 - 3.1193 * X^2 + 2.4810 * X + .6209;
        elseif deltaY > .5 && deltaY <= .75
            CLmax_base = 1.0547 * X^3 - 2.9531 * X^2 + 2.5375 * X + .55;
        elseif deltaY > .75 && deltaY <= 1
            CLmax_base = .0261 * X^5 - .2992 * X^4 + 1.3195 * X^3 - 2.7213 * X^2 + 2.3632 * X + .5002;
        elseif deltaY >= 1
            CLmax_base = .0261 * X^5 - .2992 * X^4 + 1.3195 * X^3 - 2.7213 * X^2 + 2.3632 * X + .5002;
            if X >= 1.2 && deltaY >= 1.35
                CLmax_base = -.0221 * X^3 + .2375 * X^2 - .8709 * X + 1.8869;
            end
        end

        % Determination of DeltaCLmax
        if machNumber <= .2
            deltaCLmax = -4E-5 * Y^4 + .0005 * Y^3 + .0037 * Y^2 + .008 * Y -.1108;
        elseif machNumber > .2 && machNumber <= .4
            deltaCLmax = -5E-5 * Y^4 + .0006 * Y^3 + .0016 * Y^2 + .014 * Y - .1119;
        elseif machNumber >= .4
            deltaCLmax = -2E-5 * Y^4 + 9E-5 * Y^3 + .0034 * Y^2 + .0128 * Y - .1121;
        end

        % Determination of (aCLmax)base
        aCLmax_base = .6273 * X^6 - 7.0378 * X^5 + 29.108 * X^4 - 52.633 * X^3 + 36.167 * X^2 - 7.5202 * X + 35.984;

        % Determination of DeltaACLmax(deg)
        if Z == 0
            deltaACLmax = .3347 * Y^2 - 3.8167 * Y + 10.025;
        elseif Z > 0 && Z <= 2
            deltaACLmax = .4375 * Y^2 - 4.0294 * Y + 9.0206;
        elseif Z > 2 && Z <= 3
            deltaACLmax = .6901 * Y^2 - 4.7524 * Y + 7.6596;
        elseif Z > 3 && Z <= 4
            deltaACLmax = .9335 * Y^2 - 5.1663 * Y + 5.2757;
        elseif Z > 4 && Z <= 5
            deltaACLmax = -.0932 * Y^3 + 1.8052 * Y^2 - 6.5444 * Y + 2.8396;
        elseif Z > 5 && Z <= 6
            deltaACLmax = -.4195 * Y^3 + 3.7208 * Y^2 - 8.2242 * Y - .0025;
        elseif Z > 6 && Z <= 7
            deltaACLmax = .1498 * Y^4 - 1.7697 * Y^3 + 7.3501* Y^2 - 10.135 * Y - 2.5009;
        elseif Z > 7 && Z <= 8
            deltaACLmax = .1778 * Y^4 - 1.9718 * Y^3 + 7.6081 * Y^2 - 9.4219 * Y - 3.7593;
        elseif Z > 8 && Z <= 9
            deltaACLmax = .1362 * Y^4 - 1.5323 * Y^3 + 5.9786 * Y^2 - 6.9548 * Y - 5.0091;
        elseif Z > 9 && Z <= 30
            deltaACLmax = .1075 * Y^2 + 1.7122 * Y -8.8739;
        end

        if Y > 4.2
            if machNumber <= .2
                deltaACLmax = -.0078 * Y^3 + .2857 * Y^2 - 1.5402 * Y + 2.1;
            elseif machNumber > .2 && machNumber <= .4 
                deltaACLmax = -.0039 * Y^3 + .1879 * Y^2 - .9566 * Y + 1.0762;
            elseif machNumber > .4 
                deltaACLmax = -.0077 * Y^3 + .2844 * Y^2 - 2.1808 * Y + 4.6524;
            end
        end

        % Horizontal Sweep [rad]
        LamLEHorz_rad = (LamLEHorz*pi)/180;

        % Maximum Coefficient of Lift
        CLmax_horz = CLmax_base + deltaCLmax;
        CLmax_horz_str = num2str(CLmax_horz,'%3.3f');

        % Alpha CLmax(aCLmax)
        alphaCLmax_horz = aCLmax_base + deltaACLmax;
        alphaCLmax_horz_str = num2str(alphaCLmax_horz,'%3.3f');
        
        % Horizontal Tail Lift Curve Slope
        CLa_horz     = CLmax_horz/alphaCLmax_horz;

        % Linear CLa End
        CL_horz_end = CLa_horz*(aClmax_horz-aL_0_horz);
        if CL_horz_end > CLmax_horz
            i = .01;
            for num = 1:100
            alphaIncrement = aStarA_horz + i;
            CL_horz_end = CLa_horz*alphaIncrement;
            i = i + 1;
                if CLmax_horz - CL_horz_end <= .01
                    break
                end
            end
        end

        % 2nd line-nonlinear
        alphaArray_horz_nonlinear1 = [aStarA_horz; aClmax_horz;];
        ClaArray_horz_nonlinear1   = [CLa_horz*(aStarA_horz-aL_0_horz); CL_horz_end;];
 
        A   = aStarA_horz;
        B   = alphaCLmax_horz;
        k   = 0;
        num   = 5;
        delta = 0;
        numer = 1;
        denom = num-1;
        check = denom-1;
        alphaArray_horz_nonlinear1 = zeros(1,num);
        ClaArray_horz_nonlinear1   = zeros(1,num);

        for i = 1:num
            if k == 1
                i = num;
            end
            % Beginning of nonlinear curve
            if i == 1
                h = A;
                alphaArray_horz_nonlinear1(i) = h;
                ClaArray_horz_nonlinear1(i)   = CLa_horz*(h-aL_0_horz);
            end
            % Maximum CL value, half of nonlinear curve
            if i == num
                h = B;
                h = alphaCLmax_horz;
                alphaArray_horz_nonlinear1(i) = h;
                ClaArray_horz_nonlinear1(i)   = CLmax_horz;
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
                        value  = hh + alphaArray_horz_nonlinear1(j-1);
                    % Greater than halfway point and less than maximum CL value
                    elseif j > ceil(num/2)
                        h = (((A+B))/2);
                        hh = (h-A)/(denom/2);
                        value  = hh + alphaArray_horz_nonlinear1(j-1);
                        delta  = delta/(num/denom)-.07;
                    end
                alphaArray_horz_nonlinear1(j) = value;
                ClaArray_horz_nonlinear1(j)   = CLa_horz*(value-aL_0_horz)+(delta);
                end
                k = 1;
            end
        end

        if step > 1
            % Smoothes out beginning of nonlinear portion of curve
            if (ClaArray_horz_nonlinear1(5) - ClaArray_horz_nonlinear1(4)) / (alphaArray_horz_nonlinear1(5) - alphaArray_horz_nonlinear1(4)) > .022
                    beta = linspace(array(3),array(5),50);
                    for i = 1:30
                        ClaArray_horz_nonlinear1(4) = beta(i);
                        if (ClaArray_horz_nonlinear1(5) - ClaArray_horz_nonlinear1(4)) / (alphaArray_horz_nonlinear1(5) - alphaArray_horz_nonlinear1(4)) < .022
                            break
                        else
                        end
                    end
            end
        end
        
        % Begins calculation of trailing nonlinear portion of curve
        alpha = 5;
        num = 5;
        alphaArray_horz_nonlinear2 = zeros(1,num);
        ClaArray_horz_nonlinear2   = zeros(1,num);
        for i =1:num
            if i == 1
            alphaArray_horz_nonlinear2(i) = alphaCLmax_horz;
            end
            if i ~= 1
            alphaArray_horz_nonlinear2(i) = ceil(alphaCLmax_horz)+i-2;
            end
        end

        % Finds equation of nonlinear curve before stall
        equation = polyfit(alphaArray_horz_nonlinear2,ClaArray_horz_nonlinear1,2);

        % Calculates trailing nonlinear curve
        for i = 1:num
            if i == 1
            alphaArray_horz_nonlinear2(i) = alphaCLmax_horz;
            ClaArray_horz_nonlinear2(i) = ClaArray_horz_nonlinear1(end);
            end
            if i ~= 1
            alphaArray_horz_nonlinear2(i) = ceil(alphaCLmax_horz)+i-2;
            ClaArray_horz_nonlinear2(i) = equation(1) * alphaArray_horz_nonlinear2(i)^2 + equation(2) * alphaArray_horz_nonlinear2(i) + equation(3);
            end
        end

        % Reorganizes trailing nonlinear curve points to ensure smooth transition
        j = num;
        array = ClaArray_horz_nonlinear2;
        for i = 1:num
            if i == 1
            ClaArray_horz_nonlinear2(i) = array(i);
            end
            if i ~= 1
            ClaArray_horz_nonlinear2(i) = array(j);
            j = j - 1;
            end
        end
        
        % 1st line-linear
        alphaArray_horz_linear = [aL_0_horz; aStarA_horz;];
        ClaArray_horz_linear   = [0; CLa_horz*(aStarA_horz-aL_0_horz);];

%         alphaArray_horz_nonlinear2(end-1) = [];
%         alphaArray_horz_nonlinear2(end) = [];
%         ClaArray_horz_nonlinear2(end-1) = [];
%         ClaArray_horz_nonlinear2(end) = [];
    end
    
    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_horz_nonlinear1_end = alphaArray_horz_nonlinear1;
    alphaArray_horz_nonlinear2_end = alphaArray_horz_nonlinear2;
    alphaArray_horz_nonlinear1_end(1) = [];
    alphaArray_horz_nonlinear2_end(1) = [];
    alphaArray_horz_combined = zeros(1,9);
        for i = 1:2
            alphaArray_horz_combined(i) = alphaArray_horz_linear(i);
        end
        for j = 3:6
            alphaArray_horz_combined(j) = alphaArray_horz_nonlinear1_end(j-2);
        end
        for k = 7:9
            alphaArray_horz_combined(k) = alphaArray_horz_nonlinear2_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_horz_nonlinear1_end = ClaArray_horz_nonlinear1;
    ClaArray_horz_nonlinear2_end = ClaArray_horz_nonlinear2;
    ClaArray_horz_nonlinear1_end(1) = [];
    ClaArray_horz_nonlinear2_end(1) = [];
    ClaArray_horz_combined = zeros(1,9);
        for i = 1:2
            ClaArray_horz_combined(i) = ClaArray_horz_linear(i);
        end
        for j = 3:6
            ClaArray_horz_combined(j) = ClaArray_horz_nonlinear1_end(j-2);
        end
        for k = 7:9
            ClaArray_horz_combined(k) = ClaArray_horz_nonlinear2_end(k-6);
        end
end
 
%% Drag Analysis
% Induced Drag Coefficient(CDi)
CDiHorz = zeros(size(ClCdArray_airfoil));
for i = 1:length(ClCdArray_airfoil)
CDiHorz(i) = (ClCdArray_airfoil(i).^2.*(1+Delta))./(pi()*e0Horz*ARHorz);
end

% Airfoil Drag Coefficient(Cd)
% Can now calculate Cd at any AoA as long as Cla is linear
% Cd = Cdmin + kDoublePrime.*(Cl-Clmin)^2;

% CDmin = CDo = Cdmin = CDpmin + CDf;

% Skin Friction Drag Coefficient(CDf)
if t_c < 0.05
    SwetHorz = 2.003*SrefHorz;
elseif t_c > 0.05
    SwetHorz = SrefHorz*(1.977+0.52*(t_c));
end

% Calculate Reynolds Number at service ceiling and cruise mach number
if serviceCeil ~= 0
    
% Revert file access to master file
cd(masterFile);

% Access Data folder
cd('Data');

altitude;
else
  errordlg('Please specify the service ceiling','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

if isempty(maximumMach) == 1
  errordlg('Please specify the maximum Mach number under the Performance Tab','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

% Calculates skin friction coefficient
if Re < 5E5
    CF = 1.328/sqrt(Re);
else
    CF = 0.455/(log10(Re))^2.58;
end
CDF = CF*(SwetHorz/SrefWing);

% Profile Drag Coefficient(CD0)
CD0 = 1.2*CDF; % Approximate for thin wings and streamlined bodies

% Total Wing Drag Coefficient(CD)
CDHorz = zeros(size(ClaArray_airfoil));

% Lift Coefficient at Minimum Drag(CLminD)
CLminDHorz = min(CLHorz);

% Viscous Drag-Due-To-Lift Factor
for i = 1:length(ClCdArray_airfoil)
            kDoublePrimeHorz(i) = (CdClArray_airfoil(i) - Cdmin_horz)/...
                (ClCdArray_airfoil(i) - Clmind_horz)^2;
            if isnan(kDoublePrimeHorz(i)) == 1
                kDoublePrimeHorz(i) = 0;
            end
end

% Inviscid Drag-Due-To-Lift Factor
kPrimeWing = 1/(pi()*e_Horz*ARHorz);

maxClCd = max(ClCdArray_airfoil);
maxCL   = max(ClCdArray_airfoil);
for i = 1:length(ClCdArray_airfoil)
    if maxClCd > maxCL
        if ClCdArray_airfoil(i) > maxCL
            break
        end
    end
CDHorz(i) = CD0 + kDoublePrimeHorz(i).*(ClCdArray_airfoil(i)-CLminDHorz).^2+CDiHorz(i);
end

% Minimum Drag Coefficient(CDmin)
CDmin_horz = min(CDHorz);
CDmin_horz_str = num2str(CDmin_horz,3);
