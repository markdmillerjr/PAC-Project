function aircraftParameters
% Written by Mark D. Miller Jr.
% 8/31/2017
% Major modifications done in 1/19-2/19

global airfoil_sizeHorz R L nL tL airfoil_sizeVert airfoil_size...
    wP wingPos_zDir wingPos_xDir enginePos_xDirFunc enginePos_yDirJet eP...
    distanceBetweenEnginesFunc enginePos_zDirJet completedAircraftDrawing...
    diameterMax distanceBetweenEnginesJet enginePos_xDirJet enginePos_xDirProp sign...
    enginePos_yDirFunc enginePos_zDirFunc aircraftParametersPanel apParameters...
    engineLengthJet diameterMaxAircraft engineLengthJetAircraft aircraftParametersTab...
    aP

apParameters = 1;

wP = uipanel('Parent',aircraftParametersTab,'Title','Wing','FontSize',12,'Position',[.01 .85 .25 .15]);
eP = uipanel('Parent',aircraftParametersTab,'Title','Engine(s)','FontSize',12,'Position',[.27 .85 .72 .15]);
aP = uipanel('Parent',aircraftParametersTab,'Title','Aircraft','FontSize',12,'Position',[.01 .16 .98 .69]);

%% Static Texts------------------------------------------------------------
    % Wing
    % x distance from tip of nose
uicontrol('Parent',wP,'Style','text','String','X-Distance from tail','Position',[-25 60 200 25]);
        % Units
     uicontrol('Parent',wP,'Style','text','String','ft','Position',[153 60 35 25]);
    % High wing placement
uicontrol('Parent',wP,'Style','text','String','High','Position',[5 40 35 25]);
    % Mid wing placement
uicontrol('Parent',wP,'Style','text','String','Mid','Position',[4 20 35 25]);
    % Low wing placement
uicontrol('Parent',wP,'Style','text','String','Low','Position',[5 0 35 25]);
    % Type of engine
uicontrol('Parent',eP,'Style','text','String','Type of Engine','Position',[1 60 90 25]);
    % Number of engines
uicontrol('Parent',eP,'Style','text','String','Number of Engines','Position',[95 60 90 25]);
    % Engine Distance along wing span
uicontrol('Parent',eP,'Style','text','String','Engine Distance From Wing Leading Edge','Position',[185 60 110 25]);
            % Units
     uicontrol('Parent',eP,'Style','text','String','ft','Position',[238 25 35 25]);
    % Engine Distance from wing leading edge
uicontrol('Parent',eP,'Style','text','String','Engine Distance Along Wing Span','Position',[280 60 100 25]);
            % Units
     uicontrol('Parent',eP,'Style','text','String','ft','Position',[333 25 35 25]);
    % Engine Distance from bottom of wing
% uicontrol('Parent',eP,'Style','text','String','Engine Distance From Bottom Of Wing','Position',[365 60 100 25]);
            % Units
%      uicontrol('Parent',eP,'Style','text','String','ft','Position',[418 25 35 25]);
    % Distance between engines
uicontrol('Parent',eP,'Style','text','String','Distance Between Engines','Position',[375 60 100 25]);
            % Units
     uicontrol('Parent',eP,'Style','text','String','ft','Position',[430 25 35 25]);

%% Pulldownmenu------------------------------------------------------------
% Type of engine
uicontrol('Parent',eP,'Style','popupmenu','String',{'Select','Jet','Propeller'},'Position',[10 40 70 25],'Callback',@popupmenu_typeOfEngine_Callback);
% Number of engines
uicontrol('Parent',eP,'Style','popupmenu','String',{'Select','1','2','4','6'},'Position',[120 40 50 25],'Callback',@popupmenu_numberOfEngines_Callback);

%% Textboxes---------------------------------------------------------------
%   X Distance from tail
uicontrol('Parent',wP,'Style','edit','String',(wingPos_xDir*-1),'Position',[130 67 35 20],'Callback',@txtbox_xDistance_Callback);
    % Engine Distance along x axis
uicontrol('Parent',eP,'Style','edit','String',enginePos_xDirFunc,'Position',[215 30 35 25],'Callback',@txtbox_enginePos_xDir_Callback);
    % Engine Distance along y axis
uicontrol('Parent',eP,'Style','edit','String',enginePos_yDirFunc,'Position',[310 30 35 25],'Callback',@txtbox_enginePos_yDir_Callback);
    % Engine Distance along z axis
% uicontrol('Parent',eP,'Style','edit','String',enginePos_zDirFunc,'Position',[395 30 35 25],'Callback',@txtbox_enginePos_zDir_Callback);
    % Distance between engines
uicontrol('Parent',eP,'Style','edit','String',distanceBetweenEnginesFunc,'Position',[408 30 35 25],'Callback',@txtbox_distanceBetweenEngines_Callback);
%% Radial Buttons----------------------------------------------------------
    % High wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 48 60 20],'Callback',@radio_high_Callback);
    % Mid wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 28 60 20],'Callback',@radio_mid_Callback);
    % Low wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 8 60 20],'Callback',@radio_low_Callback);

%% Pushbuttons-------------------------------------------------------------
% Top
uicontrol('Parent',aircraftParametersTab,'Style','pushbutton','String','Top','Position',[762 95 60 20],'Callback',@pushbutton_top_Callback);    
% Front
uicontrol('Parent',aircraftParametersTab,'Style','pushbutton','String','Front','Position',[762 75 60 20],'Callback',@pushbutton_front_Callback); 
% Side
uicontrol('Parent',aircraftParametersTab,'Style','pushbutton','String','Side','Position',[762 55 60 20],'Callback',@pushbutton_side_Callback);   
% Isometric
uicontrol('Parent',aircraftParametersTab,'Style','pushbutton','String','Isometric','Position',[762 35 60 20],'Callback',@pushbutton_iso_Callback);    

% Convert from inches to feet and specify new diameter and length variables
diameterMaxAircraft = diameterMax/12;
engineLengthJetAircraft = engineLengthJet/12;

x = size(L);
y = size(nL);
z = size(tL);
w = size(R);
xx = size(airfoil_sizeHorz);
yy = size(airfoil_sizeVert);
zz = size(airfoil_size);
ww = size(wingPos_xDir);

if x(1) >= 1 && y(1) >= 1 && z(1) >= 1 && w(1) >= 1 &&...
        zz(1) > 0 && xx(1) > 0 && yy(1) > 0 && ww(1) > 0 
    
completedAircraftDrawing = axes('Parent',aP,'Position',[0.11 0.22 .8 .6]);

aircraftWing;
aircraftFuselage;
aircraftEmpennage;
aircraftEngines;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting gouraud
camlight('headlight')
else
wingPos_zDir = 1;
wingPos_xDir = -L/1.25;
enginePos_xDirFunc = 0;
enginePos_yDirFunc = 0;
enginePos_zDirFunc = 0;
distanceBetweenEnginesFunc = 0;
distanceBetweenEnginesJet = diameterMaxAircraft;
% distanceBetweenEnginesProp = engineOuterRadiusProp;
enginePos_xDirJet = 0;
enginePos_xDirProp = 0;
enginePos_yDirJet = diameterMaxAircraft;
% enginePos_yDirProp = engineOuterRadiusProp;
enginePos_zDirJet = -diameterMaxAircraft/2;
% enginePos_zDirProp = -engineOuterRadiusProp/2;
sign = 1;
end

%% Wing
function aircraftWing
global b c cr ct Gam LamLE FH airfoil_array airfoil_coords_x airfoil_coords_y...
     XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR XWR2 YWR2...
     ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3 ZWRT3 WRT...
     WRT3 tp i_w airfoil_size wingPos_zDir wingPos_xDir wingPlacement wP R...
     compiledAircraft masterFile comboAirfoil_coords_xRoot comboAirfoil_coords_yRoot...
     comboAirfoil_coords_xTip comboAirfoil_coords_yTip tipChord rootChord...
     xCoords yCoords zCoords engineDiameterAdjustment diameterMax
 
 % Aircraft is compiled
compiledAircraft = 1;   
 
% Wing Placement
if wingPlacement == 0
    wingPos_zDir = R;
    engineDiameterAdjustment = (diameterMax/12)/1.5;
        % Mid wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 28 60 20],'Callback',@radio_mid_Callback);
        % Low wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 8 60 20],'Callback',@radio_low_Callback);
elseif wingPlacement == 1
    wingPos_zDir = 0;
    engineDiameterAdjustment = -(diameterMax/12)/1.5;
        % High wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 48 60 20],'Callback',@radio_high_Callback);
        % Low wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 8 60 20],'Callback',@radio_low_Callback);
elseif wingPlacement == 2
    wingPos_zDir = -R;
    engineDiameterAdjustment = -(diameterMax/12)/1.5;
        % High wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 48 60 20],'Callback',@radio_high_Callback);
        % Mid wing placement
        uicontrol('Parent',wP,'Style','radiobutton','Position',[50 28 60 20],'Callback',@radio_mid_Callback);
end

%% Wing Plotting Code from pointCoordinatesMod.m
% Left Wing
leftWing = surface(-(xCoords+wingPos_xDir),yCoords,zCoords+wingPos_zDir);
leftWing.EdgeColor = 'none';

% Right Wing
rightWing = surface(-(xCoords+wingPos_xDir),-yCoords,zCoords+wingPos_zDir);
rightWing.EdgeColor = 'none';

%% Fuselage
function aircraftFuselage
global R L nL xcf ycf zcf tL iArrayFront

fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;
iArrayFront = [1 .95 .9 .85 .75 .6 .5];

  % Fuselage: 
[xcf,zcf,ycf] = cylinder(R); 
surface((y-ycf*L)+L+tL,xcf+x,z+zcf*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

  % Nosecone: 
[xcn,zcn,ycn] = cylinder(R.*(iArrayFront).*(cos(linspace(0,pi/2,length(iArrayFront))).^.2)); 
zcn(6:end,:) = zcn(6:end,:)-R/100; 
ycn = -ycn.*.7; 
surface((y-ycn*nL)+L+tL,xcn+x,z+zcn*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Tailcone
x1 = xcf(1,:); 
x2 = .8*x1;
y1 = L*ones(size(x1)); 
y2 = y1+tL; 
z1 = zcf(1,:); 
z2 = R*ones(size(z1)); 
surface((y-[y1;y2])+L+tL,x+[x1;x2],z+[z1;z2]*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

%% Empennage
function aircraftEmpennage
global cr ct FH airfoil_sizeHorz XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3...
    ZW4 i_w airfoil_coords_x_vert airfoil_coords_x_horz airfoil_coords_y_vert...
    airfoil_coords_y_horz XWRHorz YWRHorz ZWRHorz XWR2Horz YWR2Horz ZWR2Horz...
    XWRTHorz YWRTHorz ZWRTHorz XWRLHorz YWRLHorz ZWRLHorz XWR3Horz YWR3Horz...
    ZWR3Horz XWRT3Horz YWRT3Horz ZWRT3Horz XWRVert YWRVert ZWRVert XWR2Vert...
    YWR2Vert ZWR2Vert XWRTVert YWRTVert ZWRTVert WR2Vert height cVert LamLEVert...
    tpVert GamHorz LamLEHorz bHorz cHorz tpHorz R tL airfoil_sizeVert...
    airfoil_arrayHorz airfoil_arrayVert tail wingPos_zDirHorz wingPos_xDirHorz

% Horizontal Tail----------------------------------------------------------
    % Wing Position
    wingPos_xDirHorz = -tL;
    if tail == 0
            wingPos_zDirHorz = (.5036*cHorz + 1.031)+(R-1);
    elseif tail == 1
            wingPos_zDirHorz = ((.5036*cHorz + 1.031)+(R-1))+height/2;
            if height <= 4 && height > 3
            wingPos_xDirHorz = ((.0046*LamLEVert^2+.2265*LamLEVert+.2715)/height)-.3;
            elseif height <= 3 && height > 2
                wingPos_xDirHorz = ((.0046*LamLEVert^2+.2265*LamLEVert+.2715)/height)-.6;
            elseif height <= 2 && height > 1
                wingPos_xDirHorz = ((.0046*LamLEVert^2+.2265*LamLEVert+.2715)/height)-1.2;
            elseif height <= 1
                wingPos_xDirHorz = ((.0046*LamLEVert^2+.2265*LamLEVert+.2715)/height)-2.8;
            else
            end
            if LamLEVert <= 30
            wingPos_xDirHorz = (.0012*LamLEVert^2+.1136*LamLEVert+.0024)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz = (.0071*LamLEVert^2-.3381*LamLEVert+8.6879)-tL;
            else
                  wingPos_xDirHorz = (LamLEVert-47.5)-tL;
            end   
    elseif tail == 2
            wingPos_zDirHorz = ((.5036*cHorz + 1.031)+(R-1))+height;
        % All of this crap is for various heights and angles sweep of the
        % vertical tail
        % Currently only compute up to 60 degrees of sweep
        if height >= 1 && height <= 1.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (1E-16*LamLEVert^2+.02*LamLEVert-4E-15)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (-3E-18*LamLEVert^3+5E-16*LamLEVert^2+.02*LamLEVert+4E-13)-tL;
                wingPos_xDirHorz2 = (3E-18*LamLEVert^3+1E-16*LamLEVert^2+.02*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 1.5 && height <= 2.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (-4E-6*LamLEVert^3+.0003*LamLEVert^2+.0327*LamLEVert-.0021)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (5E-5*LamLEVert^3-.0051*LamLEVert^2+.2393*LamLEVert-2.743)-tL;
                wingPos_xDirHorz2 = (2E-5*LamLEVert^3-.0013*LamLEVert^2+.0605*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 2.5 && height <= 3.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (9E-6*LamLEVert^3-1E-4*LamLEVert^2+.0527*LamLEVert-.0043)-tL;
            elseif LamLEVert > 30 && LamLEVert < 60
                wingPos_xDirHorz1 = (7E-5*LamLEVert^3-.0078*LamLEVert^2+.3755*LamLEVert-4.5329)-tL;
                wingPos_xDirHorz2 = (3E-5*LamLEVert^3-.0015*LamLEVert^2+.08*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 3.5 && height <= 4.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (9E-6*LamLEVert^3-4E-5*LamLEVert^2+.0707*LamLEVert-.0017)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (9E-5*LamLEVert^3-.0096*LamLEVert^2+.4619*LamLEVert-5.4226)-tL;
                wingPos_xDirHorz2 = (4E-5*LamLEVert^3-.0021*LamLEVert^2+.1084*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 4.5 && height <= 5.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (-17E-18*LamLEVert^3-.0005*LamLEVert^2+.0793*LamLEVert-.0024)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (1E-4*LamLEVert^3-.0102*LamLEVert^2+.4857*LamLEVert-5.2786)-tL;
                wingPos_xDirHorz2 = (5E-5*LamLEVert^3-.0029*LamLEVert^2+.1416*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 5.5 && height <= 6.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (3E-5*LamLEVert^3-.0006*LamLEVert^2+.1116*LamLEVert-.0057)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0002*LamLEVert^3-.0177*LamLEVert^2+.8246*LamLEVert-9.8127)-tL;
                wingPos_xDirHorz2 = (6E-5*LamLEVert^3-.0042*LamLEVert^2+.1849*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 6.5 && height <= 7.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (1E-5*LamLEVert^3+.0001*LamLEVert^2+.1223*LamLEVert-.0048)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0001*LamLEVert^3-.0133*LamLEVert^2+.6288*LamLEVert-6.5071)-tL;
                wingPos_xDirHorz2 = (7E-5*LamLEVert^3-.0042*LamLEVert^2+.2046*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 7.5 && height <= 8.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (3E-5*LamLEVert^3-.0008*LamLEVert^2+.1502*LamLEVert-.0095)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0001*LamLEVert^3-.0126*LamLEVert^2+.6077*LamLEVert-5.8536)-tL;
                wingPos_xDirHorz2 = (8E-5*LamLEVert^3-.0045*LamLEVert^2+.2261*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 8.5 && height <= 9.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (3E-5*LamLEVert^3-.0009*LamLEVert^2+.1692*LamLEVert-.0071)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0002*LamLEVert^3-.0234*LamLEVert^2+1.111*LamLEVert-13.139)-tL;
                wingPos_xDirHorz2 = (9E-5*LamLEVert^3-.0051*LamLEVert^2+.2544*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 9.5 && height <= 10.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (4E-5*LamLEVert^3-.0008*LamLEVert^2+.185*LamLEVert-.0007)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz  = 1E-4*LamLEVert^3-.0088*LamLEVert^2+.3533*LamLEVert-tL;
            else
            end
        elseif height > 10.5 && height <= 11.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 4E-5*LamLEVert^3-.001*LamLEVert^2+.204*LamLEVert+.0012;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0002*LamLEVert^3-.0237*LamLEVert^2+1.1127*LamLEVert-12.028)-tL;
                wingPos_xDirHorz2 = (.0001*LamLEVert^3-.0069*LamLEVert^2+.3286*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 11.5 && height <= 12.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (7E-5*LamLEVert^3-.002*LamLEVert^2+.2319*LamLEVert-.0048)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0003*LamLEVert^3-.0267*LamLEVert^2+1.2596*LamLEVert-13.887)-tL;
                wingPos_xDirHorz2 = (.0001*LamLEVert^3-.0074*LamLEVert^2+.3543*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 12.5 && height <= 13.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (3E-5*LamLEVert^3-.0003*LamLEVert^2+.2295*LamLEVert+.0012)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (7E-6*LamLEVert^4-.001*LamLEVert^3+.0618*LamLEVert^2-1.465*LamLEVert+17.6)-tL;
                wingPos_xDirHorz2 = (3E-6*LamLEVert^4-.0003*LamLEVert^3+.0123*LamLEVert^2+.0705*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 13.5 && height <= 14.5
            if LamLEVert <= 30
                wingPos_xDirHorz = (6E-5*LamLEVert^3-.0012*LamLEVert^2+.2574*LamLEVert-.0048)-tL;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = (.0003*LamLEVert^3-.0258*LamLEVert^2+1.209*LamLEVert-12.088)-tL;
                wingPos_xDirHorz2 = (.0001*LamLEVert^3-.009*LamLEVert^2+.4209*LamLEVert)-tL;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 14.5 && height <=15.5
            if LamLEVert <= 30
            wingPos_xDirHorz = .2807*LamLEVert-.1786;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz = (.012*LamLEVert^2-.5403*LamLEVert+14.82)-tL;
            else
                wingPos_xDirHorz = (.0155*LamLEVert^2-.8533*LamLEVert+21.736)-tL;
            end
        end
    end

% Horizontal Tail==========================================================

% X-Coordinates
XW1=cr;
XW2=XW1+(bHorz/cHorz)*tand(LamLEHorz);
XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=R;
YW2=bHorz/2;
YW3=bHorz/2;
YW4=R;

% Z-Coordinates
ZW1=FH/2+cr*sind(i_w);
ZW2=FH/2+(XW4-XW2)*sind(i_w)+(bHorz/cHorz)*tand(GamHorz);
ZW3=FH/2+(XW4-XW3)*sind(i_w)+(bHorz/cHorz)*tand(GamHorz);
ZW4=FH/2;

XWRRoot = (((airfoil_coords_x_horz+XW1).*cHorz)-cHorz)+wingPos_xDirHorz;
XWRTip  = (((airfoil_coords_x_horz.*tpHorz+XW2).*cHorz)-cHorz)+wingPos_xDirHorz;

YWRT = airfoil_arrayHorz;

ZWRRoot = (((airfoil_coords_y_horz+ZW1).*cHorz)-cHorz)+wingPos_zDirHorz;
ZWRTip = (((((airfoil_coords_y_horz).*tpHorz)+ZW3).*cHorz)-cHorz)+wingPos_zDirHorz;

YWRT(:,1) = 0;
YWRT(:,2) = bHorz/2-((bHorz/2)-(bHorz/2)*cosd(GamHorz));
XWRT = [XWRRoot,XWRTip];
ZWRT = [ZWRRoot,ZWRTip];

% Plot Right Wing
surface(-XWRT,YWRT,ZWRT);

% Plot Left Wing
surface(-XWRT,-YWRT,ZWRT);

hold on

hold on

% Vertical Tail------------------------------------------------------------

wingPos_xDirVert = -tL;
wingPos_yDirVert = cVert/2;
wingPos_zDirVert = R;
    
% X-Coordinates
XW1=cr;
XW2=XW1+(height/cVert)*tand(LamLEVert);
XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=0;
YW2=height/2;
YW3=height/2;
YW4=0;

% Z-Coordinates
ZW1=FH/2+cr*sind(i_w);
ZW2=FH/2+(XW4-XW2)*sind(i_w);
ZW3=FH/2+(XW4-XW3)*sind(i_w);
ZW4=FH/2;

XWRRoot = (((airfoil_coords_x_vert+XW1).*cVert)-cVert)+wingPos_xDirVert;
XWRTip  = (((airfoil_coords_x_vert.*tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert;

YWRT = (airfoil_arrayVert)+wingPos_zDirVert;

ZWRRoot = (((airfoil_coords_y_vert+ZW1).*cVert)-cVert)+wingPos_yDirVert;
ZWRTip = (((airfoil_coords_y_vert.*tpVert+ZW3)*cVert)-cVert)+wingPos_yDirVert;

YWRT(:,1) = R;
YWRT(:,2) = (airfoil_arrayVert + height)+wingPos_zDirVert;
XWRT = [XWRRoot,XWRTip];
ZWRT = [ZWRRoot,ZWRTip];

% Plot Vertical Tail
surface(-XWRT,ZWRT,YWRT);
        
%% Propeller Engine(s)
function engineProp
 global cr ct Gam FH airfoil_array airfoil_coords_x airfoil_coords_y...
airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR...
XWR2 YWR2 ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3...
ZWRT3 WR WR2 WR3 WRT WRT3 WRL i_w blades engineLengthProp engineOuterRadiusProp...
bladeLength bladeChord sign enginePos_xDirProp enginePos_yDirProp enginePos_zDirProp...
distanceBetweenEnginesProp wingPos_xDir R fuseRadiusAdjustment numberOfEngines...
enginePos_yDirAdjustment enginePos_zDirAdjustment enginePos_xDirAdjustment...
wingPos_xDirAdjustment L nL tL

    if isempty(engineOuterRadiusProp) == 1
          errordlg('You must specify the wing parameters','Invalid Input','modal');
          uicontrol(hObject);
          return;
    end

tp = 1;
tpend1 = .8;
tpend2 = .2;
LamLE = 0;
LamLEend1 = 0;
LamLEend2 = 0;
nRP = bladeChord*.8;
nLP = 1.25;
casingLocation = bladeChord*.5;
fuseRadiusAdjustment = R;

% enginePos_xDirProp = enginePos_xDirFunc;
% enginePos_yDirProp = enginePos_yDirFunc;
% enginePos_zDirProp = enginePos_zDirFunc;
fuseRadiusAdjustment = R;
enginePos_xDirAdjustment = enginePos_xDirProp;
enginePos_yDirAdjustment = enginePos_yDirProp;
enginePos_zDirAdjustment = enginePos_zDirProp;

if numberOfEngines == 1
    fuseRadiusAdjustment = 0;
    enginePos_yDirAdjustment = 0;
    enginePos_zDirAdjustment = 0;
    enginePos_xDirAdjustment = -(L + nL/1.7 + tL);
    wingPos_xDirAdjustment   = 0;
else
    fuseRadiusAdjustment = R;
    enginePos_xDirAdjustment = enginePos_xDirProp;
    enginePos_yDirAdjustment = enginePos_yDirProp;
    enginePos_zDirAdjustment = enginePos_zDirProp;
    wingPos_xDirAdjustment   = wingPos_xDir;
end

   % X-Coordinates
    XW1=cr;
    XW2=XW1+(bladeLength/2)*tand(LamLE);
    XW2end1 = XW1+(bladeLength/2)*tand(LamLEend1);
    XW2end2 = XW1+(bladeLength/2)*tand(LamLEend2);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW1=0;
    YW2=bladeLength/2;
    YW3=bladeLength/2;
    YW4=0;
  
    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(bladeLength/2)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(bladeLength/2)*tand(Gam);
    ZW4=FH/2;

    % Right Wing Root
    XWR = ((airfoil_coords_x+XW1)*bladeChord)-bladeChord;
    YWR = (airfoil_array);
    ZWR = ((airfoil_coords_y+ZW1)*bladeChord)-bladeChord;
    
    % Right Wing Tip
    XWR2 = ((airfoil_coords_x.*tp+XW2)*bladeChord)-bladeChord;
    YWR2 = (airfoil_array+bladeLength);
    ZWR2 = ((airfoil_coords_y.*tp+ZW3)*bladeChord)-bladeChord;
    
    % Left Wing Root   
    XWRL = ((airfoil_coords_x+XW1)*bladeChord)-bladeChord;
    YWRL = (-airfoil_array);
    ZWRL = ((airfoil_coords_y+ZW1)*bladeChord)-bladeChord;

    % Left Wing Tip
    XWR3 = ((airfoil_coords_x.*tp+XW2)*bladeChord)-bladeChord;
    YWR3 = (-(airfoil_array+bladeLength));
    ZWR3 = ((airfoil_coords_y.*tp+ZW3)*bladeChord)-bladeChord;

        importfile;
        hold on
        WR  = fill3(ZWR+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,YWR-bladeChord/2+...
            sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
            -XWR+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[.5 .5 .5]);
        hold on
        WR2 = fill3(ZWR2+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,YWR2+bladeChord/2+...
            sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
            XWR2-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[.5 .5 .5]);
        hold on
        WRL = fill3(ZWRL+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,YWRL+bladeChord/2+...
            sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
            XWRL-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[.5 .5 .5]);
        hold on
        WR3  = fill3(ZWR3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,YWR3-bladeChord/2+...
            sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
            -XWR3+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[.5 .5 .5]);
hold on
     % Left Blade
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT = [((airfoil_coords_x(t)+XW1)*bladeChord)-bladeChord,((airfoil_coords_x(t).*tp+XW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tp+XW2)*bladeChord)-bladeChord,((airfoil_coords_x(t+1)+XW1)*bladeChord)-bladeChord];
                YWRT = [(airfoil_array(1)),(airfoil_array(1)+bladeLength),(airfoil_array(1)+bladeLength),...
                    (airfoil_array(1))];
                ZWRT = [((airfoil_coords_y(t)+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tp+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tp+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1)+ZW4)*bladeChord)-bladeChord];
                WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    XWRT-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        -XWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
        end
     % Left Tip of Blade Section 1
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT = [((airfoil_coords_x(t).*tp+XW1)*bladeChord)-bladeChord,((airfoil_coords_x(t).*tpend1+XW2end1)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tpend1+XW2end1)*bladeChord)-bladeChord,((airfoil_coords_x(t+1).*tp+XW1)*bladeChord)-bladeChord];
                YWRT = [(airfoil_array(1)+bladeLength),(airfoil_array(1)+bladeLength+.5),(airfoil_array(1)+bladeLength+.5),...
                    (airfoil_array(1)+bladeLength)];
                ZWRT = [((airfoil_coords_y(t).*tp+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tpend1+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tpend1+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1).*tp+ZW4)*bladeChord)-bladeChord];
                WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    XWRT-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        -XWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
        end
     % Left Tip of Blade Section 2
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT = [((airfoil_coords_x(t).*tpend1+XW2end1)*bladeChord)-bladeChord,((airfoil_coords_x(t).*tpend2+XW2end2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tpend2+XW2end2)*bladeChord)-bladeChord,((airfoil_coords_x(t+1).*tpend1+XW2end1)*bladeChord)-bladeChord];
                YWRT = [(airfoil_array(1)+bladeLength+.5),(airfoil_array(1)+bladeLength+1),(airfoil_array(1)+bladeLength+1),...
                    (airfoil_array(1)+bladeLength+.5)];
                ZWRT = [((airfoil_coords_y(t).*tpend1+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tpend2+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tpend2+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1).*tpend1+ZW4)*bladeChord)-bladeChord];
                WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    XWRT-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT  = fill3(ZWRT+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        -XWRT+bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
        end
hold on
    % Right Blade
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT3 = [((airfoil_coords_x(t)+XW1)*bladeChord)-bladeChord,((airfoil_coords_x(t).*tp+XW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tp+XW2)*bladeChord)-bladeChord,((airfoil_coords_x(t+1)+XW1)*bladeChord)-bladeChord];
                YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1)+bladeLength)),(-(airfoil_array(1)+bladeLength)),...
                    (airfoil_array(1))];
                ZWRT3 = [((airfoil_coords_y(t)+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tp+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tp+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1)+ZW4)*bladeChord)-bladeChord];
                WRT3  = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    -XWRT3+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT3 = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        XWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT3-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
        end   
    % Right Tip of Blade Section 1
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT3 = [((airfoil_coords_x(t).*tp+XW1)*bladeChord)-bladeChord,((airfoil_coords_x(t).*tpend1+XW2end1)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tpend1+XW2end1)*bladeChord)-bladeChord,((airfoil_coords_x(t+1).*tp+XW1)*bladeChord)-bladeChord];
                YWRT3 = [(airfoil_array(1)-bladeLength),(-(airfoil_array(1)+bladeLength+.5)),(-(airfoil_array(1)+bladeLength+.5)),...
                    (airfoil_array(1)-bladeLength)];
                ZWRT3 = [((airfoil_coords_y(t).*tp+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tpend1+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tpend1+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1).*tp+ZW4)*bladeChord)-bladeChord];
                WRT3  = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    -XWRT3+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT3 = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        XWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT3-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
         end    
    % Right Tip of Blade Section 2
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT3 = [((airfoil_coords_x(t).*tpend1+XW2end1)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t).*tpend2+XW2end2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_x(t+1).*tpend2+XW2end2)*bladeChord)-bladeChord,((airfoil_coords_x(t+1).*tpend1+XW2end1)*bladeChord)-bladeChord];
                YWRT3 = [(airfoil_array(1)-bladeLength-.5),(-(airfoil_array(1)+bladeLength+1)),...
                    (-(airfoil_array(1)+bladeLength+1)),(airfoil_array(1)-bladeLength-.5)];
                ZWRT3 = [((airfoil_coords_y(t).*tpend1+ZW1)*bladeChord)-bladeChord,((airfoil_coords_y(t).*tpend2+ZW2)*bladeChord)-bladeChord,...
                    ((airfoil_coords_y(t+1).*tpend2+ZW3)*bladeChord)-bladeChord,((airfoil_coords_y(t+1).*tpend1+ZW4)*bladeChord)-bladeChord];
                WRT3  = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                    YWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                    -XWRT3+bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                if blades == 4
                    hold on
                    WRT3 = fill3(ZWRT3+bladeChord/2-enginePos_xDirAdjustment-wingPos_xDirAdjustment,...
                        XWRT3-bladeChord/2+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
                        YWRT3-bladeChord/2+enginePos_zDirAdjustment+fuseRadiusAdjustment,[0.5 0.5 0.5]);
                end
                t = t + 1;
            end
         end   

fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;
iArray = [1 .95 .9 .85 .75 .6 .5];

  % Nosecone: 
[xcn,zcn,ycn] = cylinder(nRP.*(iArray).*(cos(linspace(0,pi/2,length(iArray))).^.2)); 
zcn(6:end,:) = zcn(6:end,:)-nRP/100; 
ycn = -ycn.*.7*bladeChord; 
surface(y-ycn*nLP-enginePos_xDirAdjustment-wingPos_xDirAdjustment,xcn+x+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
    z+zcn*1+enginePos_zDirAdjustment+fuseRadiusAdjustment,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

iArrayFront = [1 .65];
iArrayRear = [1 .95 .8 .7 0];
engineInnerRadius = engineOuterRadiusProp*.7;

% Engine Outer Casing 
[xcf,zcf,ycf] = cylinder(engineOuterRadiusProp); 
surface((y-ycf*engineLengthProp)-enginePos_xDirAdjustment-casingLocation-wingPos_xDirAdjustment,(xcf+x)+sign*...
    (enginePos_yDirAdjustment+distanceBetweenEnginesProp),(z+zcf*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Front
[xcn,zcn,ycn] = cylinder(engineOuterRadiusProp.*(iArrayFront)); 
zcn(6:end,:) = zcn(6:end,:)-engineOuterRadiusProp/100; 
ycn = -ycn.*engineOuterRadiusProp; 
surface((y-ycn)*.8-enginePos_xDirAdjustment-casingLocation-wingPos_xDirAdjustment,(xcn+x)+sign*...
    (enginePos_yDirAdjustment+distanceBetweenEnginesProp),(z+zcn*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,'facecolor'...
    ,fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Rear
[xcn,zcn,ycn] = cylinder(engineOuterRadiusProp.*(iArrayRear)); 
zcn(6:end,:) = zcn(6:end,:)-engineOuterRadiusProp/100; 
ycn = -ycn.*.7*engineOuterRadiusProp; 
surface((-(y-ycn)-engineLengthProp)-enginePos_xDirAdjustment-casingLocation-wingPos_xDirAdjustment,...
    (-xcn+x)+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesProp),(z+zcn*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

%% Jet Engine(s)
function engineJet
 global R xcf ycf zcf wingPos_xDir iArrayFront iArrayRear...
     enginePos_xDirJet enginePos_yDirJet enginePos_zDirJet  sign...
     distanceBetweenEnginesJet fuseRadiusAdjustment numberOfEngines enginePos_yDirAdjustment...
     enginePos_zDirAdjustment enginePos_xDirAdjustment L nL tL wingPos_xDirAdjustment...
     diameterMaxAircraft engineLengthJetAircraft diameterMax engineLengthJet...
     wingPos_zDir zCoords engineDiameterAdjustment
 
fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;

fuseRadiusAdjustment = R;
enginePos_xDirAdjustment = enginePos_xDirJet;
enginePos_yDirAdjustment = enginePos_yDirJet;
enginePos_zDirJet = -diameterMaxAircraft/2;
enginePos_zDirAdjustment = enginePos_zDirJet;

if numberOfEngines == 1
    fuseRadiusAdjustment = 0;
    enginePos_xDirAdjustment = -(L + nL/3 + tL);
    enginePos_yDirAdjustment = 0;
    enginePos_zDirAdjustment = 0;
    wingPos_xDirAdjustment   = 0;
else
    fuseRadiusAdjustment = R;
    enginePos_xDirAdjustment = enginePos_xDirJet;
    enginePos_yDirAdjustment = enginePos_yDirJet;
    enginePos_zDirAdjustment = -(wingPos_zDir+min(min(zCoords)));
    wingPos_xDirAdjustment   = wingPos_xDir;
end

if isempty(enginePos_xDirJet) == 1 || isempty(enginePos_yDirJet) == 1 || isempty(distanceBetweenEnginesJet) == 1
    enginePos_xDirJet = 0;
    enginePos_yDirJet = 0;
    enginePos_xDirAdjustment = enginePos_xDirJet;
    enginePos_yDirAdjustment = enginePos_yDirJet;
    distanceBetweenEnginesJet = 0;
end

iArrayFront = [1 .95 .88 .78 .6];
iArrayRear = [1 .95 .8 .7 .6];
engineInnerRadiusJet = (diameterMax/12)*.7;

% Convert from inches to feet and specify new diameter and length variables
diameterMaxAircraft = diameterMax/12;
engineLengthJetAircraft = engineLengthJet/12;
az = 180;
el = 360;
view(az,el);
axis tight equal
lighting gouraud
camlight;
shading interp

%% Engine
% Engine Outer Casing 
[xcf,zcf,ycf] = cylinder(diameterMax/12); 
surface((y-ycf*(engineLengthJet/12))-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcf+x)+...
    sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),(z+zcf*1)+...
    enginePos_zDirAdjustment+wingPos_zDir+engineDiameterAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Front
[xcn,zcn,ycn] = cylinder(diameterMax/12.*(iArrayFront)); 
zcn(6:end,:) = zcn(6:end,:)-(diameterMax/12); 
ycn = -ycn.*.7*diameterMaxAircraft; 
surface((y-ycn)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcn+x)+sign*(enginePos_yDirAdjustment+...
    distanceBetweenEnginesJet),(z+zcn*1)+enginePos_zDirAdjustment+wingPos_zDir+engineDiameterAdjustment,'facecolor'...
    ,fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMax/12*.6); 
surface((y-ycf*engineLengthJetAircraft+engineInnerRadiusJet)-(enginePos_xDirAdjustment)...
    -wingPos_xDirAdjustment,(xcf+x)+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),...
    (z+zcf*1)+enginePos_zDirAdjustment+wingPos_zDir+engineDiameterAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Rear
[xcn,zcn,ycn] = cylinder(diameterMax/12.*(iArrayRear)); 
zcn(6:end,:) = zcn(6:end,:)-diameterMax/12; 
ycn = -ycn.*.7*diameterMaxAircraft; 
surface((-(y-ycn)-engineLengthJetAircraft)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(-xcn+x)+...
    sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),(z+zcn*1)+...
    enginePos_zDirAdjustment+wingPos_zDir+engineDiameterAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMax/12*.6); 
surface(((y-ycf*engineLengthJetAircraft-engineInnerRadiusJet))-(enginePos_xDirAdjustment)...
    -wingPos_xDirAdjustment,(xcf+x)+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),...
    (z+zcf*1)+enginePos_zDirAdjustment+wingPos_zDir+engineDiameterAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

%% Aircraft Engine(s)
function aircraftEngines
global type numberOfEngines sign distanceBetweenEnginesJet distanceBetweenEnginesFunc...
     enginePos_xDirJet enginePos_xDirProp distanceBetweenEnginesProp LamLE enginePos_xDirFunc...
     enginePos_yDirJet enginePos_yDirFunc enginePos_zDirJet enginePos_zDirFunc...
     enginePos_yDirProp enginePos_zDirProp L wingPlacement...
     b c
if type == 0
            for x = 1:numberOfEngines
                if numberOfEngines < 4
                    distanceBetweenEnginesJet = 0;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                    end
                end
                if x == 1
                    sign = 1; 
                    distanceBetweenEnginesJet = 0;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                        enginePos_yDirJet = enginePos_yDirFunc;
                        enginePos_zDirJet = enginePos_zDirFunc;
                    end
                    if LamLE ~= 0 && numberOfEngines > 2
                    enginePos_xDirJet = enginePos_xDirFunc*tand(LamLE)*(b/c);
                    else 
                        enginePos_xDirJet = enginePos_xDirFunc;
                    end
                    engineJet;
                elseif x == 2
                    sign = -1; 
                    distanceBetweenEnginesJet = 0;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                        enginePos_yDirJet = enginePos_yDirFunc;
%                         enginePos_zDirJet = enginePos_zDirFunc;
                    end
                    engineJet;
                elseif x == 3
                    sign = 1;
                    distanceBetweenEnginesJet = distanceBetweenEnginesFunc;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                        enginePos_yDirJet = enginePos_yDirFunc;
                        enginePos_zDirJet = enginePos_zDirFunc;
                    elseif wingPlacement == 2
                        numberOfEngines = 2;
                    end
%                     enginePos_yDirJet = enginePos_yDirFunc;
%                     enginePos_zDirJet = enginePos_zDirFunc;
%                     enginePos_zDirJet = -engineOuterRadiusJet;
%                     if LamLE ~= 0
%                     enginePos_xDirJet = (enginePos_xDirFunc*4)*tand(LamLE);
%                     else 
%                         enginePos_xDirJet = enginePos_xDirFunc;
%                     end
                    engineJet;
                elseif x == 4
                    sign = -1;
%                     engineJet;
                    distanceBetweenEnginesJet = distanceBetweenEnginesFunc;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                        enginePos_yDirJet = enginePos_yDirFunc;
                        enginePos_zDirJet = enginePos_zDirFunc;
                    elseif wingPlacement == 2
                        numberOfEngines = 2;
                    end
                    engineJet;
                elseif x == 5
                    sign = 1;
                    distanceBetweenEnginesJet = distanceBetweenEnginesFunc*2;
                    if wingPlacement == 0 || wingPlacement == 1
                        enginePos_xDirJet = enginePos_xDirFunc;
                        enginePos_yDirJet = enginePos_yDirFunc;
%                         enginePos_zDirJet = enginePos_zDirFunc;
                    end
%                     enginePos_yDirJet = enginePos_yDirFunc;
%                     enginePos_zDirJet = enginePos_zDirFunc;
%                     enginePos_zDirJet = -engineOuterRadiusJet;
%                     if LamLE ~= 0
%                     enginePos_xDirJet = (enginePos_xDirFunc*6)*tand(LamLE);
%                     else 
%                         enginePos_xDirJet = enginePos_xDirFunc;
%                     end
                    engineJet;
                elseif x == 6
                    sign = -1;
                    engineJet;
                end
            end
elseif type == 1
            for x = 1:numberOfEngines
                if numberOfEngines < 4
                    distanceBetweenEnginesProp = 0;
                    enginePos_yDirProp = enginePos_yDirFunc;
                    enginePos_zDirProp = enginePos_zDirFunc;
                    enginePos_xDirProp = enginePos_xDirFunc;
                end
                if x == 1
                    sign = 1; 
                    distanceBetweenEnginesProp = 0;
                    if LamLE ~= 0 && numberOfEngines ~= 2
                    enginePos_xDirProp = enginePos_xDirFunc*tand(LamLE);
                    else 
                        enginePos_xDirProp = enginePos_xDirFunc;
                    end
                    engineProp;
                elseif x == 2
                    sign = -1; 
                    distanceBetweenEnginesProp = 0;
                    engineProp;
                elseif x == 3
                    sign = 1;
                    distanceBetweenEnginesProp = distanceBetweenEnginesFunc;
                    enginePos_yDirProp = enginePos_yDirFunc;
                    enginePos_zDirProp = enginePos_zDirFunc;
                    if LamLE ~= 0
                    enginePos_xDirProp = (enginePos_xDirFunc*4)*tand(LamLE);
                    else 
                        enginePos_xDirProp = enginePos_xDirFunc;
                    end
                    engineProp;
                elseif x == 4
                    sign = -1;
                    engineProp;
                elseif x == 5
                    sign = 1;
                    distanceBetweenEnginesProp = distanceBetweenEnginesFunc*2;
                    enginePos_yDirProp = enginePos_yDirFunc;
                    enginePos_zDirProp = enginePos_zDirFunc;
                    if LamLE ~= 0
                    enginePos_xDirProp = (enginePos_xDirFunc*6)*tand(LamLE);
                    else 
                        enginePos_xDirProp = enginePos_xDirFunc;
                    end
                    engineProp;
                elseif x == 6
                    sign = -1;
                    engineProp;
                end
            end
end

axis tight equal
lighting gouraud
camlight;
shading interp

%% Completed Aircraft
function compileAircraftDrawing
global completedAircraftDrawing aP
delete(completedAircraftDrawing);
completedAircraftDrawing = axes('Parent',aP,'Position',[0.11 0.22 .8 .6]);
aircraftWing;
aircraftFuselage;
aircraftEmpennage;
aircraftEngines;
set(aP, 'ButtonDownFcn', {@selectedAircraftPanel, aP});

%% Aircraft Parameter Views
function pushbutton_top_Callback(~, ~)
global selected comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize tipChord b LamLE Gam wingPos_xDir

compileAircraftDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid off
set(gca,'visible','off');
az = -90;
el = 90;
view(az,el);
lighting gouraud
camlight;
selected = 1;

shading interp

function pushbutton_front_Callback(~,~)
global selected
compileAircraftDrawing;       
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid off
set(gca,'visible','off');
az = 90;
el = 0;
view(az,el);
lighting gouraud
% camlight('headlight')
selected = 2;

function pushbutton_side_Callback(~,~)
global selected
compileAircraftDrawing;            
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid off
set(gca,'visible','off');
az = 180;
el = 360;
view(az,el);
lighting gouraud
camlight;
selected = 3;

function pushbutton_iso_Callback(~,~)
global selected
compileAircraftDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid off
set(gca,'visible','off');
view([140 30]); 
lighting gouraud
camlight('headlight')
selected = 4;

% High wing placement------------------------------------------------------
function radio_high_Callback(hObject,~)
global wP c wingPos_zDir R wingPlacement selected enginePos_zDirJet...
    engineOuterRadiusJet enginePos_xDirJet enginePos_xDirFunc changeNumOfEng...
    enginePos_yDirFunc enginePos_yDirJet enginePos_zDirFunc numberOfEngines

high = (get(hObject));
wingPos_zDir = c/2+R;
% High wing placement
wingPlacement = 0;
if changeNumOfEng == 1
    numberOfEngines = 4;
    aircraftEngines
elseif changeNumOfEng == 2
    numberOfEngines = 6;
    aircraftEngines
end
enginePos_xDirJet = enginePos_xDirFunc;
enginePos_yDirJet = enginePos_yDirFunc;
enginePos_zDirFunc = -engineOuterRadiusJet;
% enginePos_zDirJet = -engineOuterRadiusJet;
    % Mid wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 28 60 20],'Callback',@radio_mid_Callback);
    % Low wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 8 60 20],'Callback',@radio_low_Callback);

    if selected == 1
        pushbutton_top_Callback;
    elseif selected == 2
        pushbutton_front_Callback;
    elseif selected == 3
        pushbutton_side_Callback;
    elseif selected == 4
        pushbutton_iso_Callback;
    end

% Mid wing placement-------------------------------------------------------
function radio_mid_Callback(hObject,~)
global wP c wingPos_zDir wingPlacement selected enginePos_zDirJet...
    engineOuterRadiusJet enginePos_xDirJet enginePos_xDirFunc...
    enginePos_yDirFunc enginePos_yDirJet changeNumOfEng numberOfEngines

mid = (get(hObject));
wingPos_zDir = c/2;
% Mid wing placement
wingPlacement = 1;
if changeNumOfEng == 1
    numberOfEngines = 4;
    aircraftEngines
elseif changeNumOfEng == 2
    numberOfEngines = 6;
    aircraftEngines
end
enginePos_xDirJet = enginePos_xDirFunc;
enginePos_yDirJet = enginePos_yDirFunc;
enginePos_zDirJet = -engineOuterRadiusJet/2;
    % High wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 48 60 20],'Callback',@radio_high_Callback);
    % Low wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 8 60 20],'Callback',@radio_low_Callback);

    if selected == 1
        pushbutton_top_Callback;
    elseif selected == 2
        pushbutton_front_Callback;
    elseif selected == 3
        pushbutton_side_Callback;
    elseif selected == 4
        pushbutton_iso_Callback;
    end

% Low wing placement-------------------------------------------------------
function radio_low_Callback(hObject,~)
global wP c wingPos_zDir R wingPlacement selected L enginePos_xDirJet...
    enginePos_zDirJet engineOuterRadiusJet enginePos_yDirJet numberOfEngines...
    changeNumOfEng

low = (get(hObject));
wingPos_zDir = c/2-R;
% Low wing placement
wingPlacement = 2;
if numberOfEngines == 4
    changeNumOfEng = 1;
    numberOfEngines = 2;
    aircraftEngines;
    enginePos_xDirJet = L/1.8;
    enginePos_yDirJet = R/.6667;
    enginePos_zDirJet = -engineOuterRadiusJet;
    aircraftEngines;
elseif numberOfEngines == 6
    changeNumOfEng = 2;
    numberOfEngines = 2;
    aircraftEngines;
    enginePos_xDirJet = L/1.8;
    enginePos_yDirJet = R/.6667;
    enginePos_zDirJet = -engineOuterRadiusJet;
    aircraftEngines;
else
    enginePos_xDirJet = L/1.8;
    enginePos_yDirJet = R/.6667;
    enginePos_zDirJet = -engineOuterRadiusJet;
end
    % High wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 48 60 20],'Callback',@radio_high_Callback);
    % Mid wing placement
uicontrol('Parent',wP,'Style','radiobutton','Position',[50 28 60 20],'Callback',@radio_mid_Callback);

    if selected == 1
        pushbutton_top_Callback;
    elseif selected == 2
        pushbutton_front_Callback;
    elseif selected == 3
        pushbutton_side_Callback;
    elseif selected == 4
        pushbutton_iso_Callback;
    end

% Wing Distance From Tail
function txtbox_xDistance_Callback(hObject,~)
global wingPos_xDir selected
wingPos_xDir = (-str2double(get(hObject,'String')));
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end

% Engine Position Along Wing Span
function txtbox_enginePos_yDir_Callback(hObject,~)
global enginePos_yDirFunc selected
enginePos_yDirFunc = str2double(get(hObject,'string'));
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end

% Engine Distance From Wing Leading Edge
function txtbox_enginePos_xDir_Callback(hObject,~)
global enginePos_xDirFunc selected
enginePos_xDirFunc = str2double(get(hObject,'string'));
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end

% Engine Distance From Bottom Of Wing
% function txtbox_enginePos_zDir_Callback(hObject,~)
% global enginePos_zDirFunc selected
% enginePos_zDirFunc = str2double(get(hObject,'string'));
%             if selected == 1
%                 pushbutton_top_Callback;
%             elseif selected == 2
%                 pushbutton_front_Callback;
%             elseif selected == 3
%                 pushbutton_side_Callback;
%             elseif selected == 4
%                 pushbutton_iso_Callback;
%             end

% Type of Engine (Jet or Prop)
function popupmenu_typeOfEngine_Callback(source,~)
global type sign selected
sign = 1;
  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
    case 'Jet'
type = 0; % type = 0 for jet
engineJet;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end      
  case 'Propeller'
type = 1; % type = 1 for propeller
engineProp;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
  end

% Number of Engines
function popupmenu_numberOfEngines_Callback(source,~)
global sign numberOfEngines selected changeNumOfEng
    numberOfEngines = 1;
    sign = 1;
  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
    case '1' 
        numberOfEngines = 1;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
        
  case '2'
        numberOfEngines = 2;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end

  case '4'
        numberOfEngines = 4;
        changeNumOfEng = 1;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end

  case '6'
        numberOfEngines = 6;
        changeNumOfEng = 2;
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
  end
  
% Distance Between Engines
function txtbox_distanceBetweenEngines_Callback(hObject,~)
global distanceBetweenEnginesFunc selected
% Have to differentiate between the txtbox value and the popupmenu value
% otherwise they interfere with each other
distanceBetweenEnginesFunc = str2double(get(hObject,'string'));
if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end  
  
function selectedAircraftPanel(~, ~, ~)
global masterFile combinedWindowsFig completedAircraftDrawing mmObjectAircraftPanel

% Revert file access to master file
cd(masterFile);

% Access MouseManager folder
cd('MouseManager');

if isempty(mmObjectAircraftPanel) ~= 1 && ~isvalid(mmObjectAircraftPanel) ~= 1 && mmObjectAircraftPanel.enabled == 1
    % Disable MouseManager
    mmObjectAircraftPanel.remove_item(completedAircraftDrawing)
    mmObjectAircraftPanel.enable(false)
else
    % Create MouseManager and intialize:
    mmObjectAircraftPanel = MouseManager(combinedWindowsFig);
    mmObjectAircraftPanel.add_item(completedAircraftDrawing, {'click', 'drag'}, 'normal', @orbit_camera, ...
                           {'click', 'drag'}, 'alt', @dolly_camera, ...
                           'click', 'open', @reset_camera, ...
                           'scroll', @zoom_camera); 
    mmObjectAircraftPanel.enable(true);  
end
  
function orbit_camera(hObject, eventData)
persistent orbitOrigin orbitScale
switch eventData.operation
      case 'click'
        orbitOrigin = eventData.figurePoint;
        orbitScale = [360 180]./eventData.figureRegion(3:4);
      case 'drag'
        offset = orbitScale.*(orbitOrigin-eventData.figurePoint);
        orbitOrigin = eventData.figurePoint;
        camorbit(hObject, offset(1), offset(2));
end

function dolly_camera(hObject, eventData)
persistent dollyOrigin
switch eventData.operation
  case 'click'
    dollyOrigin = eventData.figurePoint;
  case 'drag'
    offset = (dollyOrigin-eventData.figurePoint)./200;
    dollyOrigin = eventData.figurePoint;
    camdolly(hObject, offset(1), offset(2), 0);
end

function zoom_camera(hObject, eventData)
camzoom(hObject, 1-0.1*eventData.scrollEventData.VerticalScrollCount);

function reset_camera(hObject, ~)
set(hObject, 'CameraPosition', [-12 -8 12], ...
             'CameraTarget', [1 0 3], ...
             'CameraUpVector', [0 0 1], ...
             'CameraViewAngle', 90,...
             'CameraviewAngleMode','Auto');
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  