function dataWeightandBalanceAnalysis
% Written by Mark D. Miller Jr.
% 11/14/19
top;
flaps;
aileron;
elevator;
wingFuelTanks;
tailFuelTanks;

%% Wing
function aircraftWing
 
 global b c cr ct Gam LamLE FH XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4...
     XWRT YWRT ZWRT XWRT3 YWRT3 ZWRT3 WRT WRT3 tp i_w wingPos_zDir wingPos_xDir...
     wingPlacement R compiledAircraft
    
    if compiledAircraft == 1
    else
  errordlg('You must first compile the aircraft','Invalid Input','modal');
  uicontrol(hObject);
  return;
    end
    
    % Wing Placement
    if wingPlacement == 0
        wingPos_zDir = c/2+R;
    elseif wingPlacement == 1
        wingPos_zDir = c/2;
    elseif wingPlacement == 2
        wingPos_zDir = c/2-R;
    end
    
    % X-Coordinates
    XW1=cr;
    XW2=XW1+(b/c)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW1=0;
    YW2=b/2;
    YW3=b/2;
    YW4=0;
  
    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/c)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/c)*tand(Gam);
    ZW4=FH/2;

    XWRT = [(((XW1)*c)-c)+wingPos_xDir,(((XW2)*c)-c)+wingPos_xDir,(((tp+XW2)*c)-c)+wingPos_xDir,(((1+XW1)*c)-c)+wingPos_xDir];
    YWRT = [0,(YW2),(YW2),0];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.01)
hold on
    XWRT3 = [(((XW1)*c)-c)+wingPos_xDir,(((XW2)*c)-c)+wingPos_xDir,(((tp+XW2)*c)-c)+wingPos_xDir,(((1+XW1)*c)-c)+wingPos_xDir];
    YWRT3 = [0,(-(YW2)),(-(YW2)),0];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]); 
    alpha(WRT3,.01)
     
%% Fuselage
function aircraftFuselage
global R L nL tL

iArrayFront = [1 .95 .9 .85 .75 .6 .5];

  % Nosecone: 
[xcn,~,ycn] = cylinder(R.*(iArrayFront).*(cos(linspace(0,pi/2,length(iArrayFront))).^.2)); 
line((ycn*nL(:,end))+L+tL,xcn(:,end),'color','k');
line((ycn*nL(:,end))+L+tL,-xcn(:,end),'color','k');

% Fuselage
XWRF = [-tL,-tL,-(L+tL),-(L+tL)];
YWRF = [-R,(R),(R),-R];
ZWRF = [0,0,0,0];
WRF  = fill3(-XWRF,YWRF,ZWRF,[0.5 0.5 0.5]);
alpha(WRF,.01);

% Tailcone
XWRT = [0,0,-(tL),-(tL)];
YWRT = [-R,(R),(R),-R];
ZWRT = [0,0,0,0];
WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
alpha(WRT,.01);

%% Empennage
function aircraftEmpennage
global cr ct FH XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 i_w airfoil_coords_y_vert...
    XWRHorz YWRHorz ZWRHorz XWR2Horz YWR2Horz ZWR2Horz XWRTHorz YWRTHorz...
    ZWRTHorz XWRLHorz YWRLHorz ZWRLHorz XWR3Horz YWR3Horz ZWR3Horz XWRT3Horz...
    YWRT3Horz ZWRT3Horz XWRVert YWRVert ZWRVert XWR2Vert YWR2Vert ZWR2Vert...
    XWRTVert YWRTVert ZWRTVert WR2Vert height cVert LamLEVert tpVert GamHorz...
    LamLEHorz bHorz cHorz tpHorz R tL airfoil_sizeVert tail wingPos_zDirHorz...
    wingPos_xDirHorz

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
    
    % X-Coordinates
    XW1=cr;
    XW2=XW1+(bHorz/cHorz)*tand(LamLEHorz);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW2=bHorz/2;
  
    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(bHorz/cHorz)*tand(GamHorz);

    % Right Wing Root
    XWRHorz = (((XW1)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWRHorz = 0;
    ZWRHorz = (((ZW1)*cHorz)-cHorz)+wingPos_zDirHorz;
    
    % Right Wing Tip
    XWR2Horz = (((tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWR2Horz = YW2;
    ZWR2Horz = (((tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz;
    
    % Left Wing Root   
    XWRLHorz = (((XW1)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWRLHorz = 0;
    ZWRLHorz = (((ZW1)*cHorz)-cHorz)+wingPos_zDirHorz;

    % Left Wing Tip
    XWR3Horz = (((tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWR3Horz = -YW2;
    ZWR3Horz = (((tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz;

    importfile2;
    hold on
    fill3(-XWRHorz,YWRHorz,ZWRHorz,[.5 .5 .5]);
    hold on
    fill3(-XWR2Horz,YWR2Horz,ZWR2Horz,[.5 .5 .5]);
    hold on
    fill3(-XWRLHorz,YWRLHorz,ZWRLHorz,[.5 .5 .5]);
    hold on
    fill3(-XWR3Horz,YWR3Horz,ZWR3Horz,[.5 .5 .5]);

    XWRTHorz = [(((XW1)*cHorz)-cHorz)+wingPos_xDirHorz,(((XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
        (((tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,(((1+XW1)*cHorz)-cHorz)+wingPos_xDirHorz];
    YWRTHorz = [0,(0 + bHorz/2),(0 + bHorz/2),0];
    ZWRTHorz = [0,0,0,0];
    WRTHorz = fill3(-XWRTHorz,YWRTHorz,ZWRTHorz,[0.5 0.5 0.5]);
    alpha(WRTHorz,.001)
hold on
    XWRT3Horz = [(((XW1)*cHorz)-cHorz)+wingPos_xDirHorz,(((XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
        (((tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,(((1+XW1)*cHorz)-cHorz)+wingPos_xDirHorz];
    YWRT3Horz = [0,(-(0 + bHorz/2)),(-(0 + bHorz/2)),0];
    ZWRT3Horz = [0,0,0,0];
    WRT3Horz = fill3(-XWRT3Horz,YWRT3Horz,ZWRT3Horz,[0.5 0.5 0.5]);
    alpha(WRT3Horz,.001)
    
    % Vertical Tail----------------------------------------------------------  
    wingPos_xDirVert = -tL;
    wingPos_yDirVert = cVert/2;
    wingPos_zDirVert = 0;

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

    % Right Wing Root
    XWRVert = (((XW1)*cVert)-cVert)+wingPos_xDirVert;
    YWRVert = wingPos_zDirVert;
    ZWRVert = (((ZW1)*cVert)-cVert)+wingPos_yDirVert;

    % Right Wing Tip
    XWR2Vert = (((tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert;
    YWR2Vert = (R+height)+wingPos_zDirVert;
    ZWR2Vert = (((tpVert+ZW3)*cVert)-cVert)+wingPos_yDirVert;

    hold on
    WR2Vert = fill3(-XWR2Vert,ZWR2Vert,YWR2Vert,[.5 .5 .5]);
    hold on
    XWRTVert = [(((XW1)*cVert)-cVert)+wingPos_xDirVert,(((XW2)*cVert)-cVert)+wingPos_xDirVert,...
        (((tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert,(((1+XW1)*cVert)-cVert)+wingPos_xDirVert];
    YWRTVert = [0,(height)+wingPos_zDirVert,(height)+wingPos_zDirVert,(4)];
    ZWRTVert = [0,0,0,0];
    WRTVert = fill3(-XWRTVert,ZWRTVert,YWRTVert,[0.5 0.5 0.5]);
    alpha(WRTVert,.001);     
        
%% Propeller Engine(s)
function engineProp
 global cr ct Gam FH airfoil_array airfoil_coords_x airfoil_coords_y...
airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWRT YWRT ZWRT...
XWRT3 YWRT3 ZWRT3 WRT WRT3 i_w blades engineLengthProp engineOuterRadiusProp...
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
LamLE = 0;
nRP = bladeChord*.8;
nLP = 1.25;

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

%% Engine
XWRF = [(enginePos_xDirAdjustment+wingPos_xDirAdjustment),(enginePos_xDirAdjustment+wingPos_xDirAdjustment),...
    (engineLengthProp+enginePos_xDirAdjustment+wingPos_xDirAdjustment),(engineLengthProp+enginePos_xDirAdjustment+wingPos_xDirAdjustment)];
YWRF = [-sign*(engineOuterRadiusProp-enginePos_yDirAdjustment-distanceBetweenEnginesProp),sign*(engineOuterRadiusProp+enginePos_yDirAdjustment+distanceBetweenEnginesProp),...
    sign*(engineOuterRadiusProp+enginePos_yDirAdjustment+distanceBetweenEnginesProp),-sign*(engineOuterRadiusProp-enginePos_yDirAdjustment-distanceBetweenEnginesProp)];
ZWRF = [0,0,0,0];
WRF  = fill3(-XWRF,YWRF,ZWRF,[0.5 0.5 0.5]);
alpha(WRF,.01);

%% Jet Engine(s)
function engineJet
 global R xcf ycf zcf wingPos_xDir iArrayFront iArrayRear engineLengthJet...
     enginePos_xDirJet enginePos_yDirJet enginePos_zDirJet engineOuterRadiusJet sign...
     distanceBetweenEnginesJet fuseRadiusAdjustment numberOfEngines enginePos_yDirAdjustment...
     enginePos_zDirAdjustment enginePos_xDirAdjustment L nL tL wingPos_xDirAdjustment...

%      if isempty(engineOuterRadiusJet) == 1
%           errordlg('You must specify the engine parameters','Invalid Input','modal');
%           uicontrol(hObject);
%           return;
%     end
 
%% Engine
XWRF = [(enginePos_xDirAdjustment+wingPos_xDirAdjustment),(enginePos_xDirAdjustment+wingPos_xDirAdjustment),...
    (engineLengthJet+enginePos_xDirAdjustment+wingPos_xDirAdjustment),(engineLengthJet+enginePos_xDirAdjustment+wingPos_xDirAdjustment)];
YWRF = [-sign*(engineOuterRadiusJet-enginePos_yDirAdjustment-distanceBetweenEnginesJet),sign*(engineOuterRadiusJet+enginePos_yDirAdjustment+distanceBetweenEnginesJet),...
    sign*(engineOuterRadiusJet+enginePos_yDirAdjustment+distanceBetweenEnginesJet),-sign*(engineOuterRadiusJet-enginePos_yDirAdjustment-distanceBetweenEnginesJet)];
ZWRF = [0,0,0,0];
WRF  = fill3(-XWRF,YWRF,ZWRF,[0.5 0.5 0.5]);
alpha(WRF,.01);

%% Aircraft Engine(s)
function aircraftEngines
global type numberOfEngines sign distanceBetweenEnginesJet distanceBetweenEnginesFunc...
     enginePos_xDirJet enginePos_xDirProp distanceBetweenEnginesProp LamLE enginePos_xDirFunc...
     enginePos_yDirJet enginePos_yDirFunc enginePos_zDirJet enginePos_zDirFunc...
     enginePos_yDirProp enginePos_zDirProp
if type == 0
            for x = 1:numberOfEngines
                if numberOfEngines < 4
                    distanceBetweenEnginesJet = 0;
                    enginePos_xDirJet = enginePos_xDirFunc;
                end
                if x == 1
                    sign = 1; 
                    distanceBetweenEnginesJet = 0;
                    enginePos_yDirJet = enginePos_yDirFunc;
                    enginePos_zDirJet = enginePos_zDirFunc;
                    enginePos_xDirJet = enginePos_xDirFunc;
                    if LamLE ~= 0 && numberOfEngines ~= 2
                    enginePos_xDirJet = enginePos_xDirFunc*tand(LamLE);
                    else 
                        enginePos_xDirJet = enginePos_xDirFunc;
                    end
                    engineJet;
                elseif x == 2
                    sign = -1; 
                    distanceBetweenEnginesJet = 0;
                    engineJet;
                elseif x == 3
                    sign = 1;
                    distanceBetweenEnginesJet = distanceBetweenEnginesFunc;
                    enginePos_yDirJet = enginePos_yDirFunc;
                    enginePos_zDirJet = enginePos_zDirFunc;
                    if LamLE ~= 0
                    enginePos_xDirJet = (enginePos_xDirFunc*4)*tand(LamLE);
                    else 
                        enginePos_xDirJet = enginePos_xDirFunc;
                    end
                    engineJet;
                elseif x == 4
                    sign = -1;
                    engineJet;
                elseif x == 5
                    sign = 1;
                    distanceBetweenEnginesJet = distanceBetweenEnginesFunc*2;
                    enginePos_yDirJet = enginePos_yDirFunc;
                    enginePos_zDirJet = enginePos_zDirFunc;
                    if LamLE ~= 0
                    enginePos_xDirJet = (enginePos_xDirFunc*6)*tand(LamLE);
                    else 
                        enginePos_xDirJet = enginePos_xDirFunc;
                    end
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

%% Completed Aircraft
function compileAircraftDrawing
aircraftWing;
aircraftFuselage;
aircraftEmpennage;
aircraftEngines;

% Flaps
function flaps
global b c cr ct LamLE XW1 XW2 XW3 XW4 YW1 YW2 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp flapChord flapSpan flapSpanSpace wingPos_xDir
  
% X-Coordinates
XW1=0;
XW2=((b)/(c))*tand(LamLE);

% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
flapSpanMod = b/2;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((2*flapSpan)*TEMod)/(flapChord))*tand(LamLE*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((2*flapSpanSpace)*TEMod)/(flapChord))*tand(LamLE*TEMod);

% Distance from leading edge of flap to position if not swept
xLE = (flapSpan)*tand(LamLE);

% Distance from trailing edge of flap to position if not tapered
xTE = flapChord-(xLE+flapChord*tp);

% Sweep due to taper
LamTE = atand(xTE/(flapSpan));

flapPoint = ((XW22)*(flapChord));
wingPoint = (((tp+XW2)*c)-c);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLE >= 0
    if flapPoint - abs(wingPoint) > .001 || flapPoint - abs(wingPoint) < .001
        for i = 1:10000
            if flapPoint - abs(wingPoint) > .001 || flapPoint - abs(wingPoint) < .001
                if flapPoint < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=(((2*flapSpanMod)*TEMod)/(flapChord))*tand(LamLE*TEMod);
                  YW22=(((flapSpanSpace)*TEMod)/(flapChord))*tand(LamLE*TEMod);
                  if LamLE == 0
                      XW22=(((2*flapSpanMod)*TEMod)/(flapChord))*tand(LamTE*TEMod);
                      YW22=(((flapSpanSpace)*TEMod)/(flapChord))*tand(LamTE*TEMod);
                  end
                flapPoint = ((XW22)*(flapChord));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLE < 0
    if abs(flapPoint) - abs(wingPoint) > .001 || abs(flapPoint) - abs(wingPoint) < .001
        for i = 1:10000
                if abs(flapPoint) < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((2*flapSpanMod)*TEMod)/(flapChord))*tand(LamLE*TEMod);
                  YW22=-(((flapSpanSpace)*TEMod)/(flapChord))*tand(LamLE*TEMod);
                  flapPoint = -((XW22)*(flapChord));
            if abs(abs(flapPoint) - abs(wingPoint)) < .001
                break
            end
        end
    end   
end

 if LamLE < 0
     XW22=-(((2*(flapSpan+flapSpanSpace))*TEMod)/(flapChord))*tand(LamLE)*TEMod;
     YW22=-(((2*flapSpanSpace)*TEMod)/(flapChord))*tand(LamLE)*TEMod;      
 elseif LamLE == 0         
     XW22=(((2*(flapSpan+flapSpanSpace))*TEMod)/(flapChord))*tand(LamTE)*TEMod;
     YW22=(((2*flapSpanSpace)*TEMod)/(flapChord))*tand(LamTE)*TEMod;
 elseif LamLE > 0
    XW22=(((2*(flapSpan+flapSpanSpace))*TEMod)/(flapChord))*tand(LamLE*TEMod);
    YW22=(((2*flapSpanSpace)*TEMod)/(flapChord))*tand(LamLE*TEMod);
 end

if wingPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end    
    
XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=b;
YW2=b/2;
       
hold on

    XWRT = [(((YW22)*(flapChord))-flapChord)+wingPos_xDir+c,(((XW22)*(flapChord))-(flapChord))+wingPos_xDir+c,((XW22)*(flapChord))+wingPos_xDir+c,((YW22)*(flapChord))+wingPos_xDir+c];
    YWRT = [(flapSpanSpace),(flapSpan+flapSpanSpace),(flapSpan+flapSpanSpace),(flapSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.01)

hold on

    XWRT3 = [(((YW22)*(flapChord))-flapChord)+wingPos_xDir+c,(((XW22)*(flapChord))-(flapChord))+wingPos_xDir+c,((XW22)*(flapChord))+wingPos_xDir+c,((YW22)*(flapChord))+wingPos_xDir+c];
    YWRT3 = [-(flapSpanSpace),-(flapSpan+flapSpanSpace),-(flapSpan+flapSpanSpace),-(flapSpanSpace)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.01)
                
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);

% Aileron
function aileron
global b c cr ct LamLE XW1 XW2 XW3 XW4 YW1 YW2 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp aileronChord aileronSpan aileronSpanSpace flapSpan...
    flapSpanSpace wingPos_xDir c
  
% % X-Coordinates
XW1=0;
XW2=((b)/(c))*tand(LamLE);

% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
aileronSpanMod = b/2;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((2*((aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace)))*TEMod)/(aileronChord))*tand(LamLE*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((2*(aileronSpanSpace+flapSpan+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamLE*TEMod);

% Distance from leading edge of flap to position if not swept
xLE = (aileronSpan)*tand(LamLE);

% Distance from trailing edge of flap to position if not tapered
xTE = aileronChord-(xLE+aileronChord*tp);

% Sweep due to taper
LamTE = atand(xTE/(aileronSpan));

% XW22=(((2*aileronSpan+aileronSpanSpace+flapSpan)*TEMod)/(aileronChord))*tand(LamLE*TEMod);
% YW22=(((2*aileronSpanSpace+flapSpan)*TEMod)/(aileronChord))*tand(LamLE*TEMod);

aileronPoint = ((XW22)*(aileronChord));
wingPoint = (((tp+XW2)*c)-c);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLE >= 0
    if aileronPoint - abs(wingPoint) > .001 || aileronPoint - abs(wingPoint) < .001
        for i = 1:10000
            if aileronPoint - abs(wingPoint) > .001 || aileronPoint - abs(wingPoint) < .001
                if aileronPoint < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=(((2*aileronSpanMod)*TEMod)/(aileronChord))*tand(LamLE*TEMod);
                  YW22=(((aileronSpanSpace+flapSpan+flapSpanSpace)*TEMod)/(aileronChord))*tand(LamLE*TEMod);
                  if LamLE == 0
                      XW22=(((2*aileronSpanMod)*TEMod)/(aileronChord))*tand(LamTE*TEMod);
                      YW22=(((aileronSpanSpace+flapSpan+flapSpanSpace)*TEMod)/(aileronChord))*tand(LamTE*TEMod);
                  end
                  aileronPoint = ((XW22)*(aileronChord));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLE < 0
    if abs(aileronPoint) - abs(wingPoint) > .001 || abs(aileronPoint) - abs(wingPoint) < .001
        for i = 1:10000
                if abs(aileronPoint) < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((2*aileronSpanMod)*TEMod)/(aileronChord))*tand(LamLE*TEMod);
                  YW22=-(((aileronSpanSpace+flapSpan+flapSpanSpace)*TEMod)/(aileronChord))*tand(LamLE*TEMod);
                  aileronPoint = -((XW22)*(aileronChord));
            if abs(abs(aileronPoint) - abs(wingPoint)) < .001
                break
            end
        end
    end   
end

 if LamLE < 0
     XW22=-(((2*(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamLE*TEMod);
    YW22=-(((2*(aileronSpanSpace+flapSpan+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamLE*TEMod); 
 elseif LamLE == 0
    XW22=(((2*(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamTE)*TEMod;
    YW22=(((2*(aileronSpanSpace+flapSpan+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamTE)*TEMod;
 elseif LamLE > 0
    XW22=(((2*(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamLE*TEMod);
    YW22=(((2*(aileronSpanSpace+flapSpan+flapSpanSpace))*TEMod)/(aileronChord))*tand(LamLE*TEMod);
 end

if wingPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end    
    
XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=b;
YW2=b/2;

hold on

    XWRT = [(((YW22)*(aileronChord))-aileronChord)+wingPos_xDir+c,(((XW22)*(aileronChord))-(aileronChord))+wingPos_xDir+c,...
        ((XW22)*(aileronChord))+wingPos_xDir+c,((YW22)*(aileronChord))+wingPos_xDir+c];
    YWRT = [(aileronSpanSpace+flapSpan+flapSpanSpace),(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),...
        (aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),(aileronSpanSpace+flapSpan+flapSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.01)

hold on

    XWRT3 = [(((YW22)*(aileronChord))-aileronChord)+wingPos_xDir+c,(((XW22)*(aileronChord))-(aileronChord))+wingPos_xDir+c,...
        ((XW22)*(aileronChord))+wingPos_xDir+c,((YW22)*(aileronChord))+wingPos_xDir+c];
    YWRT3 = [-(aileronSpanSpace+flapSpan+flapSpanSpace),-(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),...
        -(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),-(aileronSpanSpace+flapSpan+flapSpanSpace)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.01)
                
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);

% Elevator
function elevator
global bHorz cr ct LamLEHorz XW1 XW2 XW3 XW4 YW1 YW2 tpHorz cHorz...
    elevatorSpan elevatorSpanMod elevatorChord elevatorSpanSpace...
    wingPos_xDirHorz

% X-Coordinates
XW1=0;
XW2=((bHorz)/(cHorz))*tand(LamLEHorz);
    
% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
elevatorSpanMod = bHorz/2;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((2*elevatorSpan)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((2*elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);

% Distance from leading edge of flap to position if not swept
xLE = (elevatorSpan)*tand(LamLEHorz);

% Distance from trailing edge of flap to position if not tapered
xTE = elevatorChord-(xLE+elevatorChord*tpHorz);

% Sweep due to taper
LamTEHorz = atand(xTE/(elevatorSpan));

XW22=(((2*elevatorSpan)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
YW22=(((2*elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);

elevatorPoint = ((XW22)*(elevatorChord));
horzPoint = (((tpHorz+XW2)*cHorz)-cHorz);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLEHorz >= 0
    if elevatorPoint - abs(horzPoint) > .001 || elevatorPoint - abs(horzPoint) < .001
        for i = 1:10000
            if elevatorPoint - abs(horzPoint) > .001 || elevatorPoint - abs(horzPoint) < .001
                if elevatorPoint < abs(horzPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=(((2*elevatorSpanMod)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
                  YW22=(((elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
                  if LamLEHorz == 0
                      XW22=(((2*elevatorSpanMod)*TEMod)/(elevatorChord))*tand(LamTEHorz*TEMod);
                      YW22=(((elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamTEHorz*TEMod);
                  end
                elevatorPoint = ((XW22)*(elevatorChord));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLEHorz < 0
    if abs(elevatorPoint) - abs(horzPoint) > .001 || abs(elevatorPoint) - abs(horzPoint) < .001
        for i = 1:10000
                if abs(elevatorPoint) < abs(horzPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((2*elevatorSpanMod)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
                  YW22=-(((elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
                  elevatorPoint = -((XW22)*(elevatorChord));
            if abs(abs(elevatorPoint) - abs(horzPoint)) < .001
                break
            end
        end
    end   
end

 if LamLEHorz < 0
     XW22=-(((2*elevatorSpan+elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz)*TEMod;
     YW22=-(((2*elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz)*TEMod;      
 elseif LamLEHorz == 0         
     XW22=(((2*elevatorSpan+elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamTEHorz)*TEMod;
     YW22=(((2*elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamTEHorz)*TEMod;
 elseif LamLEHorz > 0
    XW22=(((2*elevatorSpan+elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
    YW22=(((2*elevatorSpanSpace)*TEMod)/(elevatorChord))*tand(LamLEHorz*TEMod);
 end
    
if horzPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end   

XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=bHorz;
YW2=bHorz/2;
        
hold on

    XWRT = [(((YW22)*(elevatorChord))-elevatorChord)+wingPos_xDirHorz+cHorz,(((XW22)*(elevatorChord))-(elevatorChord))+wingPos_xDirHorz+cHorz,((XW22)*(elevatorChord))+wingPos_xDirHorz+cHorz,((YW22)*(elevatorChord))+wingPos_xDirHorz+cHorz];
    YWRT = [(elevatorSpanSpace),elevatorSpan+elevatorSpanSpace,elevatorSpan+elevatorSpanSpace,(elevatorSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.01)
    
hold on

    XWRT3 = [(((YW22)*(elevatorChord))-elevatorChord)+wingPos_xDirHorz+cHorz,(((XW22)*(elevatorChord))-(elevatorChord))+wingPos_xDirHorz+cHorz,((XW22)*(elevatorChord))+wingPos_xDirHorz+cHorz,((YW22)*(elevatorChord))+wingPos_xDirHorz+cHorz];
    YWRT3 = [-(elevatorSpanSpace),-(elevatorSpan+elevatorSpanSpace),-(elevatorSpan+elevatorSpanSpace),-(elevatorSpanSpace)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.01)    
    
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);

% Top View
function top
global tab4 aircraftTopView fuelTankPosition
delete(aircraftTopView);
% aircraftTopView = axes('Parent',fuelTankPosition,'Position',[0.15 0.01 .7 .8]);
aircraftTopView = axes('Parent',fuelTankPosition,'OuterPosition',[0 0 1 1]);
compileAircraftDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 90;
view(az,el);
lighting gouraud
camlight

%% Fuel Tanks
function wingFuelTanks
global b c cr ct LamLE XW1 XW2 XW3 XW4 YW1 YW2 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp wingPos_xDir flapChord
  
% Fuel Tank length
fuelTankLength1_2 = 20;

% Distance from wing centerline to end of fuel tank
fuelTankSpace1_2 = 5;

% Fuel Tank Width
fuelTankWidth1_2 = 15;

% Fuel Tank length
fuelTankLength3_4 = 30;

% Distance from wing centerline to end of fuel tank
fuelTankSpace3_4 = 30;

% Fuel Tank Width
fuelTankWidth3_4 = 10;

% X-Coordinates
XW1=0;
XW2=((b)/(c))*tand(LamLE);

% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
flapSpanMod = b/2;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((2*fuelTankLength1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((2*fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);

% Distance from leading edge of flap to position if not swept
xLE = (fuelTankLength1_2)*tand(LamLE);

% Distance from trailing edge of flap to position if not tapered
xTE = fuelTankWidth1_2-(xLE+fuelTankWidth1_2*tp);

% Sweep due to taper
LamTE = atand(xTE/(fuelTankLength1_2));

flapPoint = ((XW22)*(fuelTankWidth1_2));
wingPoint = (((tp+XW2)*c)-c);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLE >= 0
    if flapPoint - abs(wingPoint) > .001 || flapPoint - abs(wingPoint) < .001
        for i = 1:10000
            if flapPoint - abs(wingPoint) > .001 || flapPoint - abs(wingPoint) < .001
                if flapPoint < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=(((2*flapSpanMod)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
                  YW22=(((fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
                  if LamLE == 0
                      XW22=(((2*flapSpanMod)*TEMod)/(fuelTankWidth1_2))*tand(LamTE*TEMod);
                      YW22=(((fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamTE*TEMod);
                  end
                flapPoint = ((XW22)*(fuelTankWidth1_2));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLE < 0
    if abs(flapPoint) - abs(wingPoint) > .001 || abs(flapPoint) - abs(wingPoint) < .001
        for i = 1:10000
                if abs(flapPoint) < abs(wingPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((2*flapSpanMod)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
                  YW22=-(((fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
                  flapPoint = -((XW22)*(fuelTankWidth1_2));
            if abs(abs(flapPoint) - abs(wingPoint)) < .001
                break
            end
        end
    end   
end

 if LamLE < 0
     XW22=-(((2*(fuelTankLength1_2+fuelTankSpace1_2))*TEMod)/(fuelTankWidth1_2))*tand(LamLE)*TEMod;
     YW22=-(((2*fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE)*TEMod;      
 elseif LamLE == 0         
     XW22=(((2*(fuelTankLength1_2+fuelTankSpace1_2))*TEMod)/(fuelTankWidth1_2))*tand(LamTE)*TEMod;
     YW22=(((2*fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamTE)*TEMod;
 elseif LamLE > 0
    XW22=(((2*(fuelTankLength1_2+fuelTankSpace1_2))*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
    YW22=(((2*fuelTankSpace1_2)*TEMod)/(fuelTankWidth1_2))*tand(LamLE*TEMod);
 end

if wingPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end    
    
XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=b;
YW2=b/2;
       
% Fuel Tanks 1&2
hold on
    XWRT = [(((YW22)*(fuelTankWidth1_2))-fuelTankWidth1_2)+wingPos_xDir+c,(((XW22)*(fuelTankWidth1_2))-(fuelTankWidth1_2))+wingPos_xDir+c,((XW22)*(fuelTankWidth1_2))+wingPos_xDir+c-1.5*flapChord,((YW22)*(fuelTankWidth1_2))+wingPos_xDir+c-1.5*flapChord];
    YWRT = [(fuelTankSpace1_2),(fuelTankLength1_2+fuelTankSpace1_2),(fuelTankLength1_2+fuelTankSpace1_2),(fuelTankSpace1_2)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)

hold on
    XWRT3 = [(((YW22)*(fuelTankWidth1_2))-fuelTankWidth1_2)+wingPos_xDir+c,(((XW22)*(fuelTankWidth1_2))-(fuelTankWidth1_2))+wingPos_xDir+c,((XW22)*(fuelTankWidth1_2))+wingPos_xDir+c-1.5*flapChord,((YW22)*(fuelTankWidth1_2))+wingPos_xDir+c-1.5*flapChord];
    YWRT3 = [-(fuelTankSpace1_2),-(fuelTankLength1_2+fuelTankSpace1_2),-(fuelTankLength1_2+fuelTankSpace1_2),-(fuelTankSpace1_2)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.5)
    
% Fuel Tanks 3&4
hold on
    XWRT = [(((YW22)*(fuelTankWidth3_4))-fuelTankWidth3_4)+wingPos_xDir+c+.5*flapChord,(((XW22)*(fuelTankWidth3_4))-(fuelTankWidth3_4))+wingPos_xDir+c+.5*flapChord,((XW22)*(fuelTankWidth3_4))+wingPos_xDir+c-1.2*flapChord,((YW22)*(fuelTankWidth3_4))+wingPos_xDir+c-1.2*flapChord];
    YWRT = [(fuelTankSpace3_4),(fuelTankLength3_4+fuelTankSpace3_4),(fuelTankLength3_4+fuelTankSpace3_4),(fuelTankSpace3_4)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)

hold on
    XWRT3 = [(((YW22)*(fuelTankWidth3_4))-fuelTankWidth3_4)+wingPos_xDir+c+.5*flapChord,(((XW22)*(fuelTankWidth3_4))-(fuelTankWidth3_4))+wingPos_xDir+c+.5*flapChord,((XW22)*(fuelTankWidth3_4))+wingPos_xDir+c-1.2*flapChord,((YW22)*(fuelTankWidth3_4))+wingPos_xDir+c-1.2*flapChord];
    YWRT3 = [-(fuelTankSpace3_4),-(fuelTankLength3_4+fuelTankSpace3_4),-(fuelTankLength3_4+fuelTankSpace3_4),-(fuelTankSpace3_4)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.5) 
    
                
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);

function tailFuelTanks
global bHorz cr ct LamLEHorz XW1 XW2 XW3 XW4 YW1 YW2 tpHorz cHorz...
     elevatorSpanMod wingPos_xDirHorz elevatorChord

% Fuel Tank length
fuelTankLength = 12;

% Distance from wing centerline to end of fuel tank
fuelTankSpace = 5;

% Fuel Tank Width
fuelTankWidth = 11;

% X-Coordinates
XW1=0;
XW2=((bHorz)/(cHorz))*tand(LamLEHorz);
    
% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
elevatorSpanMod = bHorz/2;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((2*fuelTankLength)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((2*fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);

% Distance from leading edge of flap to position if not swept
xLE = (fuelTankLength)*tand(LamLEHorz);

% Distance from trailing edge of flap to position if not tapered
xTE = fuelTankWidth-(xLE+fuelTankWidth*tpHorz);

% Sweep due to taper
LamTEHorz = atand(xTE/(fuelTankLength));

XW22=(((2*fuelTankLength)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
YW22=(((2*fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);

elevatorPoint = ((XW22)*(fuelTankWidth));
horzPoint = (((tpHorz+XW2)*cHorz)-cHorz);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLEHorz >= 0
    if elevatorPoint - abs(horzPoint) > .001 || elevatorPoint - abs(horzPoint) < .001
        for i = 1:10000
            if elevatorPoint - abs(horzPoint) > .001 || elevatorPoint - abs(horzPoint) < .001
                if elevatorPoint < abs(horzPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=(((2*elevatorSpanMod)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
                  YW22=(((fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
                  if LamLEHorz == 0
                      XW22=(((2*elevatorSpanMod)*TEMod)/(fuelTankWidth))*tand(LamTEHorz*TEMod);
                      YW22=(((fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamTEHorz*TEMod);
                  end
                elevatorPoint = ((XW22)*(fuelTankWidth));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLEHorz < 0
    if abs(elevatorPoint) - abs(horzPoint) > .001 || abs(elevatorPoint) - abs(horzPoint) < .001
        for i = 1:10000
                if abs(elevatorPoint) < abs(horzPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((2*elevatorSpanMod)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
                  YW22=-(((fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
                  elevatorPoint = -((XW22)*(fuelTankWidth));
            if abs(abs(elevatorPoint) - abs(horzPoint)) < .001
                break
            end
        end
    end   
end

 if LamLEHorz < 0
     XW22=-(((2*fuelTankLength+fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz)*TEMod;
     YW22=-(((2*fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz)*TEMod;      
 elseif LamLEHorz == 0         
     XW22=(((2*fuelTankLength+fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamTEHorz)*TEMod;
     YW22=(((2*fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamTEHorz)*TEMod;
 elseif LamLEHorz > 0
    XW22=(((2*fuelTankLength+fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
    YW22=(((2*fuelTankSpace)*TEMod)/(fuelTankWidth))*tand(LamLEHorz*TEMod);
 end
    
if horzPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end   

XW3=XW2+ct;
XW4=XW1+cr;

% Y-Coordinates
YW1=bHorz;
YW2=bHorz/2;
        
hold on

    XWRT = [((YW22)*(fuelTankWidth))-fuelTankWidth-1.5*elevatorChord,(((XW22)*(fuelTankWidth))-(fuelTankWidth)),((XW22)*(fuelTankWidth))-1.5*elevatorChord,((YW22)*(fuelTankWidth))-1.5*elevatorChord];
    YWRT = [(fuelTankSpace),fuelTankLength+fuelTankSpace,fuelTankLength+fuelTankSpace,(fuelTankSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)
    
hold on

    XWRT3 = [((YW22)*(fuelTankWidth))-fuelTankWidth-1.5*elevatorChord,(((XW22)*(fuelTankWidth))-(fuelTankWidth)),((XW22)*(fuelTankWidth))-1.5*elevatorChord,((YW22)*(fuelTankWidth))-1.5*elevatorChord];
    YWRT3 = [-(fuelTankSpace),-(fuelTankLength+fuelTankSpace),-(fuelTankLength+fuelTankSpace),-(fuelTankSpace)];
    ZWRT3 = [0,0,0,0];
    WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
    alpha(WRT3,.5)    
    
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);

function popupmenu_aircraftType_Callback(source,~)
global Wempty WTO aircraftType
  % Determine the selected data set.
  str = source.String;
  val = source.Value;
  % Set current data to the selected data set.
  switch str{val}
      case 'Bomber/Transport'
          aircraftType = 1; % aircraftType 1 for Bomber/Transport
          Wempty = .911 * (WTO^.947);
      case 'Civil Aviation'
          aircraftType = 2; % aircraftType 2 for Civil Aviation
          Wempty = .911 * (WTO^.947);
      case 'Jet Trainer'
          aircraftType = 3; % aircraftType 3 for Jet Trainer
          Wempty = .747 * (WTO^.993);
      case 'ISR'
          aircraftType = 4; % aircraftType 4 for ISR
          Wempty = .75 * (WTO^.947);
      case 'UAV(Prop,E>12h)'
          aircraftType = 5; % aircraftType 5 for UAV(Prop,E>12h)
          Wempty = 1.66 * (WTO^.815);
      case 'UAV(Prop,E<12h)'
          aircraftType = 6; % aircraftType 6 for UAV(Prop,E<12h)
          Wempty = 2.18 * (WTO^.815);
      case 'UAV(Turbine)'
          aircraftType = 7; % aircraftType 7 for UAV(Turbine)
          Wempty = 2.78 * (WTO^.815);
      case 'Sailplane'
          aircraftType = 8; % aircraftType 8 for Sailplane
          Wempty = .911 * (WTO^.947);
  end