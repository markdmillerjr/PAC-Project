function aircraft3View
% Creates a 3-View drawing of the created aircraft
% Written by Mark D. Miller Jr.
% 1/30/19
side;
front;
top;

%% Wing
function aircraftWing
global b c cr ct Gam LamLE FH airfoil_array airfoil_coords_x airfoil_coords_y...
     XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR XWR2 YWR2...
     ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3 ZWRT3 WRT...
     WRT3 tp i_w airfoil_size wingPos_zDir wingPos_xDir wingPlacement R...
     compiledAircraft
    
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

    % Right Wing Root
    XWR = (((airfoil_coords_x+XW1)*c)-c)+wingPos_xDir;
    YWR = (airfoil_array);
    ZWR = (((airfoil_coords_y+ZW1)*c)-c)+wingPos_zDir;
    
    % Right Wing Tip
    XWR2 = (((airfoil_coords_x.*tp+XW2)*c)-c)+wingPos_xDir;
    YWR2 = (airfoil_array + b/2);
    ZWR2 = (((airfoil_coords_y.*tp+ZW3)*c)-c)+wingPos_zDir;
    
    %     Left Wing Root   
    XWRL = (((airfoil_coords_x+XW1)*c)-c)+wingPos_xDir;
    YWRL = (-airfoil_array);
    ZWRL = (((airfoil_coords_y+ZW1)*c)-c)+wingPos_zDir;

    % Left Wing Tip
    XWR3 = (((airfoil_coords_x.*tp+XW2)*c)-c)+wingPos_xDir;
    YWR3 = (-(airfoil_array + b/2));
    ZWR3 = (((airfoil_coords_y.*tp+ZW3)*c)-c)+wingPos_zDir;

        importfile3;
        hold off
        fill3(-XWR,YWR,ZWR,[.5 .5 .5]);
        hold on
        fill3(-XWR2,YWR2,ZWR2,[.5 .5 .5]);
        hold on
        fill3(-XWRL,YWRL,ZWRL,[.5 .5 .5]);
        hold on
        fill3(-XWR3,YWR3,ZWR3,[.5 .5 .5]);
hold on
        for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT = [(((airfoil_coords_x(t)+XW1)*c)-c)+wingPos_xDir,...
                    (((airfoil_coords_x(t).*tp+XW2)*c)-c)+wingPos_xDir,...
                    (((airfoil_coords_x(t+1).*tp+XW2)*c)-c)+wingPos_xDir,(((airfoil_coords_x(t+1)+XW1)*c)-c)+wingPos_xDir];
                YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
                ZWRT = [(((airfoil_coords_y(t)+ZW1)*c)-c)+wingPos_zDir,...
                    (((airfoil_coords_y(t).*tp+ZW2)*c)-c)+wingPos_zDir,...
                    (((airfoil_coords_y(t+1).*tp+ZW3)*c)-c)+wingPos_zDir,(((airfoil_coords_y(t+1)+ZW4)*c)-c)+wingPos_zDir];
                WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
                t = t + 1;
            end
        end
hold on
     for t = 1:airfoil_size(1)
            if t <= airfoil_size(1)-1
                XWRT3 = [(((airfoil_coords_x(t)+XW1)*c)-c)+wingPos_xDir,...
                    (((airfoil_coords_x(t).*tp+XW2)*c)-c)+wingPos_xDir,...
                    (((airfoil_coords_x(t+1).*tp+XW2)*c)-c)+wingPos_xDir,(((airfoil_coords_x(t+1)+XW1)*c)-c)+wingPos_xDir];
                YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b/2)),(-(airfoil_array(1) + b/2)),(airfoil_array(1))];
                ZWRT3 = [(((airfoil_coords_y(t)+ZW1)*c)-c)+wingPos_zDir,...
                    (((airfoil_coords_y(t).*tp+ZW2)*c)-c)+wingPos_zDir,...
                    (((airfoil_coords_y(t+1).*tp+ZW3)*c)-c)+wingPos_zDir,(((airfoil_coords_y(t+1)+ZW4)*c)-c)+wingPos_zDir];
                WRT3  = fill3(-XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
                t = t + 1;
            end
     end   
     
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

    % Right Wing Root
    XWRHorz = (((airfoil_coords_x_horz+XW1)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWRHorz = (airfoil_arrayHorz);
    ZWRHorz = (((airfoil_coords_y_horz+ZW1)*cHorz)-cHorz)+wingPos_zDirHorz;
    
    % Right Wing Tip
    XWR2Horz = (((airfoil_coords_x_horz.*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWR2Horz = (airfoil_arrayHorz + bHorz/2);
    ZWR2Horz = (((airfoil_coords_y_horz.*tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz;
    
    % Left Wing Root   
    XWRLHorz = (((airfoil_coords_x_horz+XW1)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWRLHorz = (-airfoil_arrayHorz);
    ZWRLHorz = (((airfoil_coords_y_horz+ZW1)*cHorz)-cHorz)+wingPos_zDirHorz;

    % Left Wing Tip
    XWR3Horz = (((airfoil_coords_x_horz.*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz;
    YWR3Horz = (-(airfoil_arrayHorz + bHorz/2));
    ZWR3Horz = (((airfoil_coords_y_horz.*tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz;

        importfile2;
        hold on
        fill3(-XWRHorz,YWRHorz,ZWRHorz,[.5 .5 .5]);
        hold on
        fill3(-XWR2Horz,YWR2Horz,ZWR2Horz,[.5 .5 .5]);
        hold on
        fill3(-XWRLHorz,YWRLHorz,ZWRLHorz,[.5 .5 .5]);
        hold on
        fill3(-XWR3Horz,YWR3Horz,ZWR3Horz,[.5 .5 .5]);
hold on
        for t = 1:airfoil_sizeHorz(1)
            if t <= airfoil_sizeHorz(1)-1
                XWRTHorz = [(((airfoil_coords_x_horz(t)+XW1)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t).*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t+1).*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t+1)+XW1)*cHorz)-cHorz)+wingPos_xDirHorz];
                YWRTHorz = [(airfoil_arrayHorz(1)),(airfoil_arrayHorz(1) + bHorz/2),...
                    (airfoil_arrayHorz(1) + bHorz/2),(airfoil_arrayHorz(1))];
                ZWRTHorz = [(((airfoil_coords_y_horz(t)+ZW1)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t).*tpHorz+ZW2)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t+1).*tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t+1)+ZW4)*cHorz)-cHorz)+wingPos_zDirHorz];
                fill3(-XWRTHorz,YWRTHorz,ZWRTHorz,[0.5 0.5 0.5]);
                t = t + 1;
            end
        end
hold on
     for t = 1:airfoil_sizeHorz(1)
            if t <= airfoil_sizeHorz(1)-1
                XWRT3Horz = [(((airfoil_coords_x_horz(t)+XW1)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t).*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t+1).*tpHorz+XW2)*cHorz)-cHorz)+wingPos_xDirHorz,...
                    (((airfoil_coords_x_horz(t+1)+XW1)*cHorz)-cHorz)+wingPos_xDirHorz];
                YWRT3Horz = [(airfoil_arrayHorz(1)),(-(airfoil_arrayHorz(1) + bHorz/2)),...
                    (-(airfoil_arrayHorz(1) + bHorz/2)),(airfoil_arrayHorz(1))];
                ZWRT3Horz = [(((airfoil_coords_y_horz(t)+ZW1)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t).*tpHorz+ZW2)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t+1).*tpHorz+ZW3)*cHorz)-cHorz)+wingPos_zDirHorz,...
                    (((airfoil_coords_y_horz(t+1)+ZW4)*cHorz)-cHorz)+wingPos_zDirHorz];
                fill3(-XWRT3Horz,YWRT3Horz,ZWRT3Horz,[0.5 0.5 0.5]);
                t = t + 1;
            end
     end   

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
    XWRVert = (((airfoil_coords_x_vert+XW1)*cVert)-cVert)+wingPos_xDirVert;
    YWRVert = (airfoil_arrayVert)+wingPos_zDirVert;
    ZWRVert = (((airfoil_coords_y_vert+ZW1)*cVert)-cVert)+wingPos_yDirVert;
    
    % Right Wing Tip
    XWR2Vert = (((airfoil_coords_x_vert.*tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert;
    YWR2Vert = (airfoil_arrayVert + R + height)+wingPos_zDirVert;
    ZWR2Vert = (((airfoil_coords_y_vert.*tpVert+ZW3)*cVert)-cVert)+wingPos_yDirVert;

        importfile2;
        hold on
        WR2Vert = fill3(-XWR2Vert,ZWR2Vert,YWR2Vert,[.5 .5 .5]);
hold on
        for t = 1:airfoil_sizeVert(1)
            if t <= airfoil_sizeVert(1)-1
                XWRTVert = [(((airfoil_coords_x_vert(t)+XW1)*cVert)-cVert)+wingPos_xDirVert,...
                    (((airfoil_coords_x_vert(t).*tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert,...
                    (((airfoil_coords_x_vert(t+1).*tpVert+XW2)*cVert)-cVert)+wingPos_xDirVert,...
                    (((airfoil_coords_x_vert(t+1)+XW1)*cVert)-cVert)+wingPos_xDirVert];
                YWRTVert = [(airfoil_arrayVert(1))+R,(airfoil_arrayVert(1) + R + height)+wingPos_zDirVert,...
                    (airfoil_arrayVert(1) + R + height)+wingPos_zDirVert,(airfoil_arrayVert(1))+R];
                ZWRTVert = [(((airfoil_coords_y_vert(t)+ZW1)*cVert)-cVert)+wingPos_yDirVert,...
                    (((airfoil_coords_y_vert(t).*tpVert+ZW2)*cVert)-cVert)+wingPos_yDirVert,...
                    (((airfoil_coords_y_vert(t+1).*tpVert+ZW3)*cVert)-cVert)+wingPos_yDirVert,...
                    (((airfoil_coords_y_vert(t+1)+ZW4)*cVert)-cVert)+wingPos_yDirVert];
                fill3(-XWRTVert,ZWRTVert,YWRTVert,[0.5 0.5 0.5]);
                t = t + 1;
            end
        end      
        
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

%     if isempty(engineOuterRadiusProp) == 1
%           errordlg('You must specify the wing parameters','Invalid Input','modal');
%           uicontrol(hObject);
%           return;
%     end

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
 global R xcf ycf zcf wingPos_xDir iArrayFront iArrayRear diameterMaxAircraft...
     enginePos_xDirJet enginePos_yDirJet enginePos_zDirJet engineLengthJetAircraft sign...
     distanceBetweenEnginesJet fuseRadiusAdjustment numberOfEngines enginePos_yDirAdjustment...
     enginePos_zDirAdjustment enginePos_xDirAdjustment L nL tL wingPos_xDirAdjustment...

%      if isempty(diameterMaxAircraft) == 1
%           errordlg('You must specify the engine parameters','Invalid Input','modal');
%           uicontrol(hObject);
%           return;
%     end
 
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
    enginePos_yDirAdjustment = 0;
    enginePos_zDirAdjustment = 0;
    enginePos_xDirAdjustment = -(L + nL/3 + tL);
    wingPos_xDirAdjustment   = 0;
else
    fuseRadiusAdjustment = R;
    enginePos_xDirAdjustment = enginePos_xDirJet;
    enginePos_yDirAdjustment = enginePos_yDirJet;
    enginePos_zDirAdjustment = enginePos_zDirJet;
    wingPos_xDirAdjustment   = wingPos_xDir;
end

iArrayFront = [1 .95 .88 .78 .6];
iArrayRear = [1 .95 .8 .7 .6];
engineInnerRadiusJet = diameterMaxAircraft*.7;

%% Engine
% Engine Outer Casing 
[xcf,zcf,ycf] = cylinder(diameterMaxAircraft); 
surface((y-ycf*engineLengthJetAircraft)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcf+x)+...
    sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),(z+zcf*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Front
[xcn,zcn,ycn] = cylinder(diameterMaxAircraft.*(iArrayFront)); 
zcn(6:end,:) = zcn(6:end,:)-diameterMaxAircraft/100; 
ycn = -ycn.*.7*diameterMaxAircraft; 
surface((y-ycn)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcn+x)+sign*(enginePos_yDirAdjustment+...
    distanceBetweenEnginesJet),(z+zcn*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,'facecolor'...
    ,fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMaxAircraft*.6); 
surface((y-ycf*engineLengthJetAircraft+engineInnerRadiusJet)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcf+x)+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),...
    (z+zcf*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Engine Rear
[xcn,zcn,ycn] = cylinder(diameterMaxAircraft.*(iArrayRear)); 
zcn(6:end,:) = zcn(6:end,:)-diameterMaxAircraft/100; 
ycn = -ycn.*.7*diameterMaxAircraft; 
surface((-(y-ycn)-engineLengthJetAircraft)-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(-xcn+x)+...
    sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),(z+zcn*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,...
    'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

[xcf,zcf,ycf] = cylinder(diameterMaxAircraft*.6); 
surface(((y-ycf*engineLengthJetAircraft-engineInnerRadiusJet))-(enginePos_xDirAdjustment)-wingPos_xDirAdjustment,(xcf+x)+sign*(enginePos_yDirAdjustment+distanceBetweenEnginesJet),...
    (z+zcf*1)+enginePos_zDirAdjustment+fuseRadiusAdjustment,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

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

% Side View
function side
global tab1
gca;
axes('Parent',tab1,'Position',[0.07 0 .4 .3]);
compileAircraftDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 180;
el = 360;
view(az,el);
lighting gouraud
camlight

% Front View
function front
global tab1 
hold on
gca;
axes('Parent',tab1,'Position',[0.55 0 .4 .3]);
compileAircraftDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 0;
view(az,el);
lighting gouraud
camlight

% Top View
function top
global tab1
hold on
gca;
axes('Parent',tab1,'Position',[0.03 0.3 .4 .3]);
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

