function dataAircraftAnalysis
% Written by Mark D. Miller Jr.
% 2/28/19
% Calculates the total aircraft lift and drag
% Probably going to also do all of the performance and s&c calcs idk yet
% dataWingAnalysis

global ARWing LamLE t_c SrefWing tp c airfoil_coords_x airfoil_coords_y...
    cruiseMach nL tL SrefVert SrefHorz engineOuterRadiusJet engineOuterRadiusProp...
    engineLengthJet engineLengthProp height type kDoublePrimeWing LamMaxThickness...
    kPrimeWing CDAircraft CDAircraft_str CLaAircraft_str CF SwetWing CL Clmind_wing...
    x50PercentChord CD0Aircraft_str R L CLa_wing SpeedOfSound aL_0_wing...
    LiftAircraft_str rho comboAirfoil_coords_xRoot comboAirfoil_coords_yRoot

%% Wing-Body Aerodynamics
for i=1:length(comboAirfoil_coords_yRoot)
    if comboAirfoil_coords_yRoot(i) == max(comboAirfoil_coords_yRoot)
        x = comboAirfoil_coords_xRoot(i);
    end
end
if x >= .3
    Lwb = 1.2;
elseif x < .3
    Lwb = 2;
end

if cruiseMach <= .25
    Rwb = 76.923*cosd(LamMaxThickness)^5-261.07*cosd(LamMaxThickness)^4+...
        348.41*cosd(LamMaxThickness)^3-229.03*cosd(LamMaxThickness)^2+75.08*cosd(LamMaxThickness)-9.1204;
elseif cruiseMach > .25 && cruiseMach <= .6
    Rwb = -2.1279*cosd(LamMaxThickness)^3+3.9509*cosd(LamMaxThickness)^2-1.6191*cosd(LamMaxThickness)+.9648;
elseif cruiseMach > .6 && cruiseMach <= .8
    Rwb = -.474*cosd(LamMaxThickness)^2+1.3186*cosd(LamMaxThickness)+.4588;
elseif cruiseMach > .8 && cruiseMach < 1
    Rwb = -71.795*cosd(LamMaxThickness)^5+241.49*cosd(LamMaxThickness)^4-...
        320.22*cosd(LamMaxThickness)^3+208.74*cosd(LamMaxThickness)^2-66.079*cosd(LamMaxThickness)+9.1314;
end

% Subsonic Wing CD0    
CD0W = CF*(1+Lwb*(t_c)+100*(t_c)^4)*Rwb*(SwetWing/SrefWing);

% Nosecone Outer Surface
SBnose = 2*pi()*R^2*nL;
% Fuselage Outer Surface
SBfuse = 2*pi()*R*height;
% Tailcone Outer Surface
SBtail = (pi()*R*tL)-(1/2*R*tL);
% Total Wetted Area of Fuselage
SB     = SBnose+SBfuse+SBtail;

% Subsonic Body CD0
lB_d = L/(2*R);

% Subsonic Body Skin friction coefficient(CDfB)
CDfB = CF*(1+(60/lB_d^3)+.0025*(lB_d))*(SB/SrefWing);

% Subsonic Body CD0
CD0B = CDfB;

% Miscellaneous Drag Items CD0
deltaCD0 = .001; % Approximate

% % Nacelle Wetted Area(Snacelle)
% if type == 0
%     Snacelle = engineOuterRadiusJet*engineLengthJet;
% elseif type == 1
%     Snacelle = engineOuterRadiusProp*engineLengthProp;
% end
% 
% % Subsonic Wing-Body CD0
% CD0WB = CD0B*(SB/SrefWing)+CD0W+deltaCD0;
% 
% % Subsonic Total Aircraft CD0
% CD0Aircraft = CD0WB + CD0W*(SrefVert+SrefHorz)/SrefWing + CD0B*(Snacelle/SrefWing);
% CD0Aircraft_str = num2str(CD0Aircraft,'%3.4f');
% 
% % Subsonic Total Aircraft Drag
% CDAircraft = CD0Aircraft + kDoublePrimeWing.*(CL-Clmind_wing).^2+kPrimeWing*CL.^2;
% CDAircraft_str = num2str(CDAircraft,'%3.4f');
% 
% % Total Aircraft Lift at Cruise
% alphaCruise = 0; %[deg]
% LiftAircraft = 1/2 * rho * (cruiseMach * SpeedOfSound)^2 * (CLa_wing * (alphaCruise - aL_0_wing)) * SrefWing;
% LiftAircraft_str = num2str(LiftAircraft,'%3.2f');
% 
% % Mean Aerodynamic Chord(mac)
% mac = (2/3)*c*((1+tp+tp^2)/(1+tp));



% Polhamus Formula
% ARWing = 3;
% cruiseMach = 0.7;
% LamLE = 40;
% tp = .25;
% Lam50Percent = atand(tand(LamLE)-((4*(x50PercentChord)*(1-tp))/(ARWing*(1+tp))));
% k = 1+(((8.2 - 2.3*(LamLE*pi())/180) - ARWing*(.22 - .153*(LamLE*pi())/180))/100);
% CLa_wing = (2*pi()*ARWing)/(2+sqrt((((ARWing^2*(1-cruiseMach^2))/k^2)*(1+...
%     (tand(Lam50Percent)^2/(1-cruiseMach^2))))+4));
% fprintf('CLa_wing =  %3.3f\n',CLa_wing);









