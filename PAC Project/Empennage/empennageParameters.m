function empennageParameters
% Written by Mark D. Miller Jr.
% 8/21/17

global vertAirfoil horzAirfoil vertTail horzTail...
    horzAirfoilFile vertAirfoilFile bHorz cr ct GamHorz LamLEHorz...
    airfoil_arrayHorz airfoil_coords_x_vert airfoil_coords_x_horz...
    airfoil_coords_y_vert airfoil_coords_y_horz airfoil_sizeHorz tpHorz i_w...
    cHorz height cVert LamLEVert tpVert airfoil_arrayVert airfoil_sizeVert...
    NACA VarName2 crH iH HorzFig VertFig empennageParametersPanel tail...
    conventionalTail cruciformTail tTail empennageParametersTab empActivated...
    masterFile

empActivated = 1;

crH     =   1; %	HT Chord (root)	,	in
cr      =   1; 
ct      =   1;
i_w     =   0;  % Incidence, deg

% Panels
horzAirfoil = uipanel('Parent',empennageParametersTab,'Title','Horizontal Tail','FontSize',12,'Position',[.01 .01 .38 .2]);
vertAirfoil = uipanel('Parent',empennageParametersTab,'Title','Vertical Tail','FontSize',12,'Position',[.4 .01 .4 .2]);
horzTail    = uipanel('Parent',empennageParametersTab,'Title','Horizontal Tail','FontSize',12,'Position',[.01 .87 .63 .12],'Visible','off');
vertTail    = uipanel('Parent',empennageParametersTab,'Title','Vertical Tail','FontSize',12,'Position',[.65 .87 .34 .12],'Visible','off');

%% Airfoils
% Horizontal Tail
% Airfoil coordinates
uicontrol('Parent',horzAirfoil,'Style','text','String','Airfoil Coordinates','Position',[90 90 110 25],'FontSize',9);

% Vertical Tail
% Airfoil coordinates
uicontrol('Parent',vertAirfoil,'Style','text','String','Airfoil Coordinates','Position',[90 90 110 25],'FontSize',9);

%% Popupmenus
% Airfoils
% Horizontal Tail
uicontrol('Parent',horzAirfoil','Style','popupmenu','String',{'Select','NACA 0006','NACA 0009','NACA 1408',...
    'NACA 1410','NACA 1412','NACA 2412','NACA 2415','NACA 2418','NACA 2421','NACA 2424','NACA 4412','NACA 4415',...
    'NACA 4418','NACA 4421','NACA 4424','NACA 23012','NACA 23015','NACA 23018','NACA 23021','NACA 23024',...
    'NACA 63-006','NACA 63-206','NACA 63-209','NACA 63-210','NACA 63(1)-012','NACA 63(1)-212','NACA 63(1)-412',...
    'NACA 63(2)-015','NACA 63(2)-215','NACA 63(2)-415','NACA 63(2)-615','NACA 63(3)-018','NACA 63(3)-218',...
    'NACA 63(3)-418','NACA 63(3)-618','NACA 63(4)-221','NACA 63(4)-421','NACA 64-108','NACA 64-110',...
    'NACA 64-206','NACA 64-208','NACA 64-209','NACA 64-210','NACA 64(1)-012','NACA 64(1)-112','NACA 64(1)-212',...
    'NACA 64(2)-015','NACA 64(2)-215','NACA 64(2)-415','NACA 64(3)-218','NACA 64(3)-418','NACA 64(3)-618',...
    'NACA 64(4)-221','NACA 64(4)-421','NACA 65-006','NACA 65-206','NACA 65-209','NACA 65-210','NACA 65-410',...
    'NACA 65(1)-212','NACA 65(1)-212a=0.6','NACA 65(1)-412','NACA 65(2)-215','NACA 65(2)-415','NACA 65(2)-415a=0.5',...
    'NACA 65(3)-218','NACA 65(3)-618','NACA 65(4)-221','NACA 65(4)-421','NACA 65(4)-421a=0.5','NACA 66-006',...
    'NACA 66-018','NACA 66-206','NACA 66-209','NACA 66-210','NACA 66(1)-212','NACA 66(2)-215','NACA 66(2)-415',...
    'NACA 63A010','NACA 63A210','NACA 64A010','NACA 64A210','NACA 64A410'},'Position',[90 70 135 25],'Callback',...
    @popupmenu_horzAirfoil_Callback);

% Vertical Tail
uicontrol('Parent',vertAirfoil','Style','popupmenu','String',{'Select','NACA 0006','NACA 0009',...
    'NACA 63-006','NACA 63(1)-012','NACA 63(3)-018','NACA 64(1)-012','NACA 64(2)-015',...
    'NACA 65-006','NACA 66-006','NACA 66-018','NACA 63A010','NACA 64A010'},'Position',[90 70 135 25],'Callback',@popupmenu_vertAirfoil_Callback);

%% Pushbuttons-------------------------------------------------------------
% Pushbutton top
uicontrol('Parent',empennageParametersTab,'Style','pushbutton','String','Top',...
            'Position',[762 95 60 20],'Callback',@pushbutton_top_Callback);
% Pushbutton front
uicontrol('Parent',empennageParametersTab,'Style','pushbutton','String','Front',...
            'Position',[762 75 60 20],'Callback',@pushbutton_front_Callback); 
% Pushbutton side 
uicontrol('Parent',empennageParametersTab,'Style','pushbutton','String','Side',...
            'Position',[762 55 60 20],'Callback',@pushbutton_side_Callback);
% Pushbutton isometric
uicontrol('Parent',empennageParametersTab,'Style','pushbutton','String','Isometric',...
            'Position',[762 35 60 20],'Callback',@pushbutton_iso_Callback);  
            
x = size(airfoil_sizeHorz);
y = size(airfoil_sizeVert);
if x(1) > 0 && y(1) > 0
    
% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Access Airfoil Database
cd('Airfoil Database');
    
delete(HorzFig);
HorzFig = axes('Parent',horzAirfoil,'Position',[0.2 0.1 0.7 0.3]);

fileOpen = fopen(horzAirfoilFile);

% if fileOpen == -1
%   errordlg('You must enter the correct airfoil file name','Invalid Input','modal');
%   uicontrol(hObject);
%   return;
% end

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

importfile1;
airfoil_coords_x_horz = NACA;
airfoil_coords_y_horz = VarName2;
airfoil_sizeHorz = size(airfoil_coords_x_horz);
airfoil_arrayHorz = zeros(airfoil_sizeHorz);

% X-Coordinates
XH1=0;

% Z-Coordinates
ZH1=.5;
    
% Horizontal Tail Root Airfoil
XHR = (airfoil_coords_x_horz+XH1);
YHR = (airfoil_arrayHorz);
ZHR = (airfoil_coords_y_horz+ZH1);
fill3(XHR,YHR,ZHR,[0.5 0.5 0.5]);

az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Access Airfoil Database
cd('Airfoil Database');

delete(VertFig);
VertFig = axes('Parent',vertAirfoil,'Position',[0.2 0.1 0.7 0.3]);
fileOpen = fopen(vertAirfoilFile);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

importfile2;
airfoil_coords_x_vert = NACA;
airfoil_coords_y_vert = VarName2;
airfoil_sizeVert = size(airfoil_coords_x_vert);
airfoil_arrayVert = zeros(airfoil_sizeVert);

% X-Coordinates
XH1=0;

% Z-Coordinates
ZH1=.5;
    
% Right Horizontal Tail Root Airfoil
XHR = (airfoil_coords_x_vert+XH1);
YHR = (airfoil_arrayVert);
ZHR = (airfoil_coords_y_vert+ZH1);
fill3(XHR,YHR,ZHR,[0.5 0.5 0.5]);

az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');        
    
tailParametersDrawing;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([130 30]); 
lighting gouraud
camlight('headlight')
else
    cHorz     = 1;
    bHorz     = 1;
    GamHorz   = 0;
    LamLEHorz = 0;
    tpHorz    = 1;
    cVert     = 1;
    height    = 1;
    LamLEVert = 0;
    tpVert    = 1;
    iH        = 0;
    tail      = 0;
end

function horzTailParameters(~,~)
global empennageParametersTab horzTail cHorz bHorz GamHorz LamLEHorz tpHorz iH...
    conventionalTail cruciformTail tTail
horzTail = uipanel('Parent',empennageParametersTab,'Title','Horizontal Tail','FontSize',12,'Position',[.01 .87 .63 .12],'Visible','on');
    
% Construct the components
%% Static Texts------------------------------------------------------------
% Horizontal Tail Chord
uicontrol('Parent',horzTail,'Style','text','String','Chord','Position',[100 35 35 25]);
    % Units
    uicontrol('Parent',horzTail,'Style','text','String','ft','Position',[120 10 35 25]);
% Horizontal Tail Span
uicontrol('Parent',horzTail,'Style','text','String','Span','Position',[157 35 35 25]);
    %  Units
    uicontrol('Parent',horzTail,'Style','text','String','ft','Position',[180 10 35 25]);
% Horizontal Tail Dihedral
uicontrol('Parent',horzTail,'Style','text','String','Dihedral','Position',[212 35 50 25]);
    % Units
    uicontrol('Parent',horzTail,'Style','text','String','deg','Position',[248 10 35 25]);
% Horizontal Tail Sweep
uicontrol('Parent',horzTail,'Style','text','String','Sweep','Position',[270 35 50 25]);
    % Units
    uicontrol('Parent',horzTail,'Style','text','String','deg','Position',[307 10 35 25]);
% Horizontal Tail Taper
uicontrol('Parent',horzTail,'Style','text','String','Taper','Position',[330 35 50 25]);
% Incidence
uicontrol('Parent',horzTail,'Style','text','String','Incidence','Position',[386 35 50 25]);
    % Units
    uicontrol('Parent',horzTail,'Style','text','String','deg','Position',[419 10 35 25]);

%% Textboxs----------------------------------------------------------------
% Horizontal Tail Chord
uicontrol('Parent',horzTail,'Style','edit','String',cHorz,'Position',[103 15 30 25],'Callback',@txtbox_horzChord_Callback);
% Horizontal Tail Span
uicontrol('Parent',horzTail,'Style','edit','String',bHorz,'Position',[160 15 35 25],'Callback',@txtbox_horzSpan_Callback);
% Horizontal Tail Dihedral
uicontrol('Parent',horzTail,'Style','edit','String',GamHorz,'Position',[220 15 35 25],'Callback',@txtbox_horzDihedral_Callback);
% Horizontal Tail Sweep
uicontrol('Parent',horzTail,'Style','edit','String',LamLEHorz,'Position',[280 15 35 25],'Callback',@txtbox_horzSweep_Callback);
% Horizontal Tail Taper
uicontrol('Parent',horzTail,'Style','edit','String',tpHorz,'Position',[340 15 35 25],'Callback',@txtbox_horzTaper_Callback); 
% Horizontal Tail Incidence
uicontrol('Parent',horzTail,'Style','edit','String',iH,'Position',[392 15 35 25],'Callback',@txtbox_horzIncidence_Callback);     
    
 %% Radial Buttons
% Horizontal Tail Configuration
uibuttongroup('Visible','off','Position',[0 0 .2 1],'SelectionChangedFcn',@bselection);
% Conventional
conventionalTail = uicontrol('Parent',horzTail,'Style','radiobutton','String','Conventional','Position',[10 45 90 25],'Callback',@radial_conventionalTail_Callback);
% Cruciform
cruciformTail = uicontrol('Parent',horzTail,'Style','radiobutton','String','Cruciform','Position',[10 22 90 25],'Callback',@radial_cruciformTail_Callback);
% T-Tail
tTail = uicontrol('Parent',horzTail,'Style','radiobutton','String','T-Tail','Position',[10 0 90 25],'Callback',@radial_T_Tail_Callback);   
    
function vertTailParameters(~,~)
    global empennageParametersTab vertTail cVert height LamLEVert tpVert

vertTail = uipanel('Parent',empennageParametersTab,'Title','Vertical Tail',...
    'FontSize',12,'Position',[.65 .87 .34 .12],'Visible','on');

% Vertical Tail Chord
uicontrol('Parent',vertTail,'Style','text','String','Chord','Position',[10 35 35 25]);
    % Units
    uicontrol('Parent',vertTail,'Style','text','String','ft','Position',[30 10 35 25]);
% Vertical Tail Height
uicontrol('Parent',vertTail,'Style','text','String','Height','Position',[65 35 50 25]);
    % Units
    uicontrol('Parent',vertTail,'Style','text','String','ft','Position',[95 10 35 25]);
% Vertical Tail Sweep
uicontrol('Parent',vertTail,'Style','text','String','Sweep','Position',[130 35 50 25]);
    % Units
    uicontrol('Parent',vertTail,'Style','text','String','deg','Position',[165 10 35 25]);
% Vertical Tail Taper
uicontrol('Parent',vertTail,'Style','text','String','Taper','Position',[188 35 50 25]);

% Vertical Tail Chord
uicontrol('Parent',vertTail,'Style','edit','String',cVert,'Position',[13 15 30 25],'Callback',@txtbox_vertChord_Callback);
% Vertical Tail Height
uicontrol('Parent',vertTail,'Style','edit','String',height,'Position',[73 15 35 25],'Callback',@txtbox_vertSpan_Callback);
% Vertical Tail Sweep
uicontrol('Parent',vertTail,'Style','edit','String',LamLEVert,'Position',[138 15 35 25],'Callback',@txtbox_vertSweep_Callback);
% Vertical Tail Taper
uicontrol('Parent',vertTail,'Style','edit','String',tpVert,'Position',[197 15 35 25],'Callback',@txtbox_vertTaper_Callback); 

function tailParametersDrawing
global bHorz cr ct GamHorz LamLEHorz FH airfoil_arrayHorz airfoil_coords_x_vert airfoil_coords_x_horz...
    airfoil_coords_y_vert airfoil_coords_y_horz airfoil_sizeHorz XW1 XW2 XW3...
    XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWRHorz YWRHorz ZWRHorz XWR2Horz YWR2Horz ZWR2Horz XWRTHorz YWRTHorz...
    ZWRTHorz XWRLHorz YWRLHorz ZWRLHorz XWR3Horz YWR3Horz ZWR3Horz XWRT3Horz YWRT3Horz ZWRT3Horz...
    XWRVert YWRVert ZWRVert XWR2Vert YWR2Vert ZWR2Vert XWRTVert YWRTVert ZWRTVert...
    WR2Vert tpHorz i_w cHorz tL L R xcf ycf zcf height cVert LamLEVert...
    tpVert airfoil_arrayVert airfoil_sizeVert wingPos_zDirHorz tail horzTail...
    wingPos_xDirHorz empennage empennageParametersPanel empennageParametersTab...
    masterFile

delete(empennage);
empennage = axes('Parent',empennageParametersTab,'Position',[0.05,0.28,0.9,0.53]);
 
fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;

xR = size(R);

% Horizontal Tail----------------------------------------------------------

    % Wing Position
    wingPos_xDirHorz = 0;
if tail == 0
% Conventional Tail
    wingPos_zDirHorz = (.5036*cHorz + 1.031)+(R-1);

    % T-Tail
% uicontrol('Parent',horzTail,'Style','radiobutton','String','T-Tail','Position',[10 0 90 25],'Callback',@radial_T_Tail_Callback);
%     % Cruciform
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Cruciform','Position',[10 22 90 25],'Callback',@radial_cruciformTail_Callback);
elseif tail == 1
        
% Cruciform Tail
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
        if LamLEVert <= 30
            wingPos_xDirHorz = .0012*LamLEVert^2+.1136*LamLEVert+.0024;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz = .0071*LamLEVert^2-.3381*LamLEVert+8.6879;
            else
                  wingPos_xDirHorz = LamLEVert-47.5;
        end
    end
    
    % Conventional
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Conventional','Position',[10 45 90 25],'Callback',@radial_conventionalTail_Callback);
%     % T-Tail
% uicontrol('Parent',horzTail,'Style','radiobutton','String','T-Tail','Position',[10 0 90 25],'Callback',@radial_T_Tail_Callback); 
elseif tail == 2
        
% T-Tail
        wingPos_zDirHorz = ((.5036*cHorz + 1.031)+(R-1))+height;
        % All of this crap is for various heights and sweep angles of the
        % vertical tail
        % Currently only compute up to 60 degrees of sweep
        if height >= 1 && height <= 1.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 1E-16*LamLEVert^2+.02*LamLEVert-4E-15;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = -3E-18*LamLEVert^3+5E-16*LamLEVert^2+.02*LamLEVert+4E-13;
                wingPos_xDirHorz2 = 3E-18*LamLEVert^3+1E-16*LamLEVert^2+.02*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 1.5 && height <= 2.5
            if LamLEVert <= 30
                wingPos_xDirHorz = -4E-6*LamLEVert^3+.0003*LamLEVert^2+.0327*LamLEVert-.0021;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = 5E-5*LamLEVert^3-.0051*LamLEVert^2+.2393*LamLEVert-2.743;
                wingPos_xDirHorz2 = 2E-5*LamLEVert^3-.0013*LamLEVert^2+.0605*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 2.5 && height <= 3.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 9E-6*LamLEVert^3-1E-4*LamLEVert^2+.0527*LamLEVert-.0043;
            elseif LamLEVert > 30 && LamLEVert < 60
                wingPos_xDirHorz1 = 7E-5*LamLEVert^3-.0078*LamLEVert^2+.3755*LamLEVert-4.5329;
                wingPos_xDirHorz2 = 3E-5*LamLEVert^3-.0015*LamLEVert^2+.08*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 3.5 && height <= 4.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 9E-6*LamLEVert^3-4E-5*LamLEVert^2+.0707*LamLEVert-.0017;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = 9E-5*LamLEVert^3-.0096*LamLEVert^2+.4619*LamLEVert-5.4226;
                wingPos_xDirHorz2 = 4E-5*LamLEVert^3-.0021*LamLEVert^2+.1084*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 4.5 && height <= 5.5
            if LamLEVert <= 30
                wingPos_xDirHorz = -17E-18*LamLEVert^3-.0005*LamLEVert^2+.0793*LamLEVert-.0024;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = 1E-4*LamLEVert^3-.0102*LamLEVert^2+.4857*LamLEVert-5.2786;
                wingPos_xDirHorz2 = 5E-5*LamLEVert^3-.0029*LamLEVert^2+.1416*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 5.5 && height <= 6.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 3E-5*LamLEVert^3-.0006*LamLEVert^2+.1116*LamLEVert-.0057;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0002*LamLEVert^3-.0177*LamLEVert^2+.8246*LamLEVert-9.8127;
                wingPos_xDirHorz2 = 6E-5*LamLEVert^3-.0042*LamLEVert^2+.1849*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 6.5 && height <= 7.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 1E-5*LamLEVert^3+.0001*LamLEVert^2+.1223*LamLEVert-.0048;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0001*LamLEVert^3-.0133*LamLEVert^2+.6288*LamLEVert-6.5071;
                wingPos_xDirHorz2 = 7E-5*LamLEVert^3-.0042*LamLEVert^2+.2046*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 7.5 && height <= 8.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 3E-5*LamLEVert^3-.0008*LamLEVert^2+.1502*LamLEVert-.0095;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0001*LamLEVert^3-.0126*LamLEVert^2+.6077*LamLEVert-5.8536;
                wingPos_xDirHorz2 = 8E-5*LamLEVert^3-.0045*LamLEVert^2+.2261*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 8.5 && height <= 9.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 3E-5*LamLEVert^3-.0009*LamLEVert^2+.1692*LamLEVert-.0071;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0002*LamLEVert^3-.0234*LamLEVert^2+1.111*LamLEVert-13.139;
                wingPos_xDirHorz2 = 9E-5*LamLEVert^3-.0051*LamLEVert^2+.2544*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 9.5 && height <= 10.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 4E-5*LamLEVert^3-.0008*LamLEVert^2+.185*LamLEVert-.0007;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0002*LamLEVert^3-.0162*LamLEVert^2+.7738*LamLEVert-7.4937;
                wingPos_xDirHorz2 = 1E-4*LamLEVert^3-.0058*LamLEVert^2+.2852*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 10.5 && height <= 11.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 4E-5*LamLEVert^3-.001*LamLEVert^2+.204*LamLEVert+.0012;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0002*LamLEVert^3-.0237*LamLEVert^2+1.1127*LamLEVert-12.028;
                wingPos_xDirHorz2 = .0001*LamLEVert^3-.0069*LamLEVert^2+.3286*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 11.5 && height <= 12.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 7E-5*LamLEVert^3-.002*LamLEVert^2+.2319*LamLEVert-.0048;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0003*LamLEVert^3-.0267*LamLEVert^2+1.2596*LamLEVert-13.887;
                wingPos_xDirHorz2 = .0001*LamLEVert^3-.0074*LamLEVert^2+.3543*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 12.5 && height <= 13.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 3E-5*LamLEVert^3-.0003*LamLEVert^2+.2295*LamLEVert+.0012;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = 7E-6*LamLEVert^4-.001*LamLEVert^3+.0618*LamLEVert^2-1.465*LamLEVert+17.6;
                wingPos_xDirHorz2 = 3E-6*LamLEVert^4-.0003*LamLEVert^3+.0123*LamLEVert^2+.0705*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 13.5 && height <= 14.5
            if LamLEVert <= 30
                wingPos_xDirHorz = 6E-5*LamLEVert^3-.0012*LamLEVert^2+.2574*LamLEVert-.0048;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz1 = .0003*LamLEVert^3-.0258*LamLEVert^2+1.209*LamLEVert-12.088;
                wingPos_xDirHorz2 = .0001*LamLEVert^3-.009*LamLEVert^2+.4209*LamLEVert;
                wingPos_xDirHorz  = (wingPos_xDirHorz1+wingPos_xDirHorz2)/2;
            else
            end
        elseif height > 14.5 && height <=15.5
            if LamLEVert <= 30
            wingPos_xDirHorz = .2807*LamLEVert-.1786;
            elseif LamLEVert > 30 && LamLEVert <= 60
                wingPos_xDirHorz = .012*LamLEVert^2-.5403*LamLEVert+14.82;
            else
                wingPos_xDirHorz = .0155*LamLEVert^2-.8533*LamLEVert+21.736;
            end
        end
    
    % Cruciform
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Cruciform','Position',[10 22 90 25],'Callback',@radial_cruciformTail_Callback);
%     % Conventional
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Conventional','Position',[10 45 90 25],'Callback',@radial_conventionalTail_Callback);
end

%% Horizontal Tail Code adapted from wingPlanform.m
%==========================================================================
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

% Vertical Tail------------------------------------------------------------

wingPos_xDirVert = 0;
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

% Fuselage================================================================= 
[xcf,zcf,ycf] = cylinder(R); 

% Tail
x1 = xcf(1,:); 
x2 = .8*x1;% zeros(size(x1)); 
y1 = L*ones(size(x1)); 
y2 = y1+tL; 
z1 = zcf(1,:); 
z2 = R*ones(size(z1)); 
surface(y-[y1;y2]+L,x+[x1;x2],z+[z1;z2]*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Circle closing tailcone
th = 0:pi/50:2*pi;
xunit = zeros(size(th));
yunit = R * cos(th);
zunit = R * sin(th);

fill3(xunit,yunit,zunit,[0.5 0.5 0.5]);

%% Empennage Planform Views - Open Aircraft Parameters              
function pushbutton_top_Callback(~,~)
global selected apParameters
tailParametersDrawing;    
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = 90;
view(az,el);
lighting gouraud
camlight
selected = 1;

%Open Aircraft Parameters
apParameters = 0;

function pushbutton_front_Callback(~,~)
global selected apParameters
tailParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 360;
view(az,el);
lighting gouraud
camlight
selected = 2;

%Open Aircraft Parameters
apParameters = 0;

function pushbutton_side_Callback(~,~)
global selected apParameters
tailParametersDrawing
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 180;
el = 0;
view(az,el);
lighting gouraud
camlight
selected = 3;

%Open Aircraft Parameters
apParameters = 0;

function pushbutton_iso_Callback(~,~)
global selected apParameters
tailParametersDrawing
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([130 30]); 
lighting gouraud
camlight('headlight')
selected = 4;

%Open Aircraft Parameters
apParameters = 0;
        
%% Airfoil Plot
function popupmenu_horzAirfoil_Callback(hObject,~)
global horzAirfoilFile

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
  case 'NACA 0006'
      horzAirfoilFile = 'naca0006.dat';
    case 'NACA 0009'
        horzAirfoilFile = 'naca0009.dat';
    case 'NACA 1408'
        horzAirfoilFile = 'naca1408.dat';
    case 'NACA 1410'
        horzAirfoilFile = 'naca1410.dat';
    case 'NACA 1412'
        horzAirfoilFile = 'naca1412.dat';
    case 'NACA 2412'
        horzAirfoilFile = 'naca2412.dat';
    case 'NACA 2415'
        horzAirfoilFile = 'naca2415.dat';
    case 'NACA 2418'
        horzAirfoilFile = 'naca2418.dat';
    case 'NACA 2421'
        horzAirfoilFile = 'naca2421.dat';
    case 'NACA 2424'
        horzAirfoilFile = 'naca2424.dat';
    case 'NACA 4412'
        horzAirfoilFile = 'naca4412.dat';
    case 'NACA 4415'
        horzAirfoilFile = 'naca4415.dat';
    case 'NACA 4418'
        horzAirfoilFile = 'naca4418.dat';
    case 'NACA 4421'
        horzAirfoilFile = 'naca4421.dat';
    case 'NACA 4424'
        horzAirfoilFile = 'naca4424.dat';
    case 'NACA 23012'
        horzAirfoilFile = 'naca23012.dat';
    case 'NACA 23015'
        horzAirfoilFile = 'naca23015.dat';
    case 'NACA 23018'
        horzAirfoilFile = 'naca23018.dat';
    case 'NACA 23021'
        horzAirfoilFile = 'naca23021.dat';
    case 'NACA 23024'
        horzAirfoilFile = 'naca23024.dat';
    case 'NACA 63-006'
        horzAirfoilFile = 'naca63-006.dat';
    case 'NACA 63-206'
        horzAirfoilFile = 'naca63-206.dat';
    case 'NACA 63-209'
        horzAirfoilFile = 'naca63-209.dat';
    case 'NACA 63-210'
        horzAirfoilFile = 'naca63-210.dat';
    case 'NACA 63(1)-012'
        horzAirfoilFile = 'naca63(1)-012.dat';
    case 'NACA 63(1)-212'
        horzAirfoilFile = 'naca63(1)-212.dat';
    case 'NACA 63(1)-412'
        horzAirfoilFile = 'naca63(1)-412.dat';
    case 'NACA 63(2)-015'
        horzAirfoilFile = 'naca63(2)-015.dat';
    case 'NACA 63(2)-215'
        horzAirfoilFile = 'naca63(2)-215.dat';
    case 'NACA 63(2)-415'
        horzAirfoilFile = 'naca63(2)-415.dat';
    case 'NACA 63(2)-615'
        horzAirfoilFile = 'naca63(2)-615.dat';
    case 'NACA 63(3)-018'
        horzAirfoilFile = 'naca63(3)-018.dat';
    case 'NACA 63(3)-218'
        horzAirfoilFile = 'naca63(3)-218.dat';
    case 'NACA 63(3)-418'
        horzAirfoilFile = 'naca63(3)-418.dat';
    case 'NACA 63(3)-618'
        horzAirfoilFile = 'naca63(3)-618.dat';
    case 'NACA 63(4)-221'
        horzAirfoilFile = 'naca63(4)-221.dat';
    case 'NACA 63(4)-421'
        horzAirfoilFile = 'naca63(4)-421.dat';
    case 'NACA 64-108'
        horzAirfoilFile = 'naca64-108.dat';
    case 'NACA 64-110'
        horzAirfoilFile = 'naca64-110.dat';
    case 'NACA 64-206'
        horzAirfoilFile = 'naca64-206.dat';
    case 'NACA 64-208'
        horzAirfoilFile = 'naca64-208.dat';
    case 'NACA 64-209'
        horzAirfoilFile = 'naca64-209.dat';
    case 'NACA 64-210'
        horzAirfoilFile = 'naca64-210.dat';
    case 'NACA 64(1)-012'
        horzAirfoilFile = 'naca64(1)-012.dat';
    case 'NACA 64(1)-112'
        horzAirfoilFile = 'naca64(1)-112.dat';
    case 'NACA 64(1)-212'
        horzAirfoilFile = 'naca64(1)-212.dat';
    case 'NACA 64(2)-015'
        horzAirfoilFile = 'naca64(2)-015.dat';
    case 'NACA 64(2)-215'
        horzAirfoilFile = 'naca64(2)-215.dat';
    case 'NACA 64(2)-415'
        horzAirfoilFile = 'naca64(2)-415.dat';
    case 'NACA 64(3)-218'
        horzAirfoilFile = 'naca64(3)-218.dat';
    case 'NACA 64(3)-418'
        horzAirfoilFile = 'naca64(3)-418.dat';
    case 'NACA 64(3)-618'
        horzAirfoilFile = 'naca64(3)-618.dat';
    case 'NACA 64(4)-221'
        horzAirfoilFile = 'naca64(4)-221.dat';
    case 'NACA 64(4)-421'
        horzAirfoilFile = 'naca64(4)-421.dat';
    case 'NACA 65-006'
        horzAirfoilFile = 'naca65-006.dat';
    case 'NACA 65-206'
        horzAirfoilFile = 'naca65-206.dat';
    case 'NACA 65-209'
        horzAirfoilFile = 'naca65-209.dat';
    case 'NACA 65-210'
        horzAirfoilFile = 'naca65-210.dat';
    case 'NACA 65-410'
        horzAirfoilFile = 'naca65-410.dat';
    case 'NACA 65(1)-212'
        horzAirfoilFile = 'naca65(1)-212.dat';
    case 'NACA 65(1)-212a=0.6'
        horzAirfoilFile = 'naca65(1)-212a=.6.dat';
    case 'NACA 65(1)-412'
        horzAirfoilFile = 'naca65(1)-412.dat';
    case 'NACA 65(2)-215'
        horzAirfoilFile = 'naca65(2)-215.dat';
    case 'NACA 65(2)-415'
        horzAirfoilFile = 'naca65(2)-415.dat';
    case 'NACA 65(2)-415a=0.5'
        horzAirfoilFile = 'naca65(2)-415a=.5.dat';
    case 'NACA 65(3)-218'
        horzAirfoilFile = 'naca65(3)-218.dat';
    case 'NACA 65(3)-618'
        horzAirfoilFile = 'naca65(3)-618.dat';
    case 'NACA 65(4)-221'
        horzAirfoilFile = 'naca65(4)-221.dat';
    case 'NACA 65(4)-421'
        horzAirfoilFile = 'naca65(4)-421.dat';
    case 'NACA 65(4)-421a=0.5'
        horzAirfoilFile = 'naca65(4)-421a=.5.dat';
    case 'NACA 66-006'
        horzAirfoilFile = 'naca66-006.dat';
    case 'NACA 66-018'
        horzAirfoilFile = 'naca66-018.dat';
    case 'NACA 66-206'
        horzAirfoilFile = 'naca66-206.dat';
    case 'NACA 66-209'
        horzAirfoilFile = 'naca66-209.dat';
    case 'NACA 66-210'
        horzAirfoilFile = 'naca66-210.dat';
    case 'NACA 66(1)-212'
        horzAirfoilFile = 'naca66(1)-212.dat';
    case 'NACA 66(2)-215'
        horzAirfoilFile = 'naca66(2)-215.dat';
    case 'NACA 66(2)-415'
        horzAirfoilFile = 'naca66(2)-415.dat';
    case 'NACA 63A010'
        horzAirfoilFile = 'naca63A010.dat';
    case 'NACA 63A210'
        horzAirfoilFile = 'naca63A210.dat';
    case 'NACA 64A010'
        horzAirfoilFile = 'naca64A010.dat';
    case 'NACA 64A210'
        horzAirfoilFile = 'naca64A210.dat';
    case 'NACA 64A410'
        horzAirfoilFile = 'naca64A410.dat';
end
horzAirfoilPlot;

function popupmenu_vertAirfoil_Callback(hObject,~)
global vertAirfoilFile

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case 'NACA 0006'
      vertAirfoilFile = 'naca0006.dat';
    case 'NACA 0009'
        vertAirfoilFile = 'naca0009.dat';
    case 'NACA 63-006'
        vertAirfoilFile = 'naca63-006.dat';
    case 'NACA 63(1)-012'
        vertAirfoilFile = 'naca63(1)-012.dat';
    case 'NACA 63(3)-018'
        vertAirfoilFile = 'naca63(3)-018.dat';
    case 'NACA 64(1)-012'
        vertAirfoilFile = 'naca64(1)-012.dat';
    case 'NACA 64(2)-015'
        vertAirfoilFile = 'naca64(2)-015.dat';
    case 'NACA 65-006'
        vertAirfoilFile = 'naca65-006.dat';
    case 'NACA 66-006'
        vertAirfoilFile = 'naca66-006.dat';
    case 'NACA 66-018'
        vertAirfoilFile = 'naca66-018.dat';
    case 'NACA 63A010'
        vertAirfoilFile = 'naca63A010.dat';
    case 'NACA 64A010'
        vertAirfoilFile = 'naca64A010.dat';
end
vertAirfoilPlot;

 function horzAirfoilPlot
    global airfoil_arrayHorz airfoil_coords_x_horz airfoil_coords_y_horz...
        airfoil_sizeHorz NACA VarName2 horzAirfoil HorzFig horzAirfoilFile...
        selected cHorz bHorz airfoil_sizeVert masterFile horzTail empennageParametersTab

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Access Airfoil Database
cd('Airfoil Database');
    
delete(HorzFig);
HorzFig = axes('Parent',horzAirfoil,'Position',[0.2 0.1 0.7 0.3]);
fileOpen = fopen(horzAirfoilFile);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

importfile1;
airfoil_coords_x_horz = NACA;
airfoil_coords_y_horz = VarName2;
airfoil_sizeHorz = size(airfoil_coords_x_horz);
airfoil_arrayHorz = zeros(airfoil_sizeHorz);

% X-Coordinates
XH1=0;

% Z-Coordinates
ZH1=.5;
    
% Horizontal Tail Root Airfoil
    XHR = (airfoil_coords_x_horz+XH1);
    YHR = (airfoil_arrayHorz);
    ZHR = (airfoil_coords_y_horz+ZH1);
    fill3(XHR,YHR,ZHR,[0.5 0.5 0.5]);

axis tight equal
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
y = size(airfoil_sizeVert);

if cHorz ~= 0 && bHorz ~= 0 && y(1) ~= 0
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

% Display horizontal tail dimensions
horzTailParameters;

 function vertAirfoilPlot
    global airfoil_arrayVert airfoil_coords_x_vert airfoil_coords_y_vert...
        airfoil_sizeVert NACA VarName2 vertAirfoil VertFig vertAirfoilFile...
        selected cVert height airfoil_sizeHorz masterFile vertTail...
        empennageParametersTab

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Access Airfoil Database
cd('Airfoil Database');    
    
delete(VertFig);
VertFig = axes('Parent',vertAirfoil,'Position',[0.2 0.15 0.7 0.25]);
fileOpen = fopen(vertAirfoilFile);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

importfile2;
airfoil_coords_x_vert = NACA;
airfoil_coords_y_vert = VarName2;
airfoil_sizeVert = size(airfoil_coords_x_vert);
airfoil_arrayVert = zeros(airfoil_sizeVert);

% X-Coordinates
XH1=0;

% Z-Coordinates
ZH1=.5;
    
% Right Horizontal Tail Root Airfoil
    XHR = (airfoil_coords_x_vert+XH1);
    YHR = (airfoil_arrayVert);
    ZHR = (airfoil_coords_y_vert+ZH1);
    fill3(XHR,YHR,ZHR,[0.5 0.5 0.5]);

axis tight equal
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
x = size(airfoil_sizeHorz);

if cVert ~= 0 && height ~= 0 && x(1) ~= 0
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

% Display vertical tail dimensions
vertTailParameters;

% Horizontal Tail      
    % Chord---------------------------------------------------- 
        function txtbox_horzChord_Callback(hObject,~)
                global cHorz bHorz cVert height selected
                cHorz = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Wing Span------------------------------------------------
        function txtbox_horzSpan_Callback(hObject,~)
                global cHorz bHorz cVert height selected            
            bHorz = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Dihedral-------------------------------------------------
        function txtbox_horzDihedral_Callback(hObject,~)
                global cHorz bHorz cVert height GamHorz selected            
            GamHorz = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Sweep----------------------------------------------------
        function txtbox_horzSweep_Callback(hObject,~)
                global cHorz bHorz cVert height LamLEHorz selected          
            LamLEHorz = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Taper----------------------------------------------------
        function txtbox_horzTaper_Callback(hObject,~)
            global cHorz bHorz cVert height tpHorz selected          
         tpHorz = str2double(get(hObject,'String'));
         if tpHorz < 0
                errordlg('Taper ratio must be greater than 0','Invalid Input','modal');
         end
            if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Incidence------------------------------------------------
        function txtbox_horzIncidence_Callback(hObject,~)
            global iH
            iH = str2double(get(hObject,'String'));
            uiwait(msgbox('Program currently doesn''t plot incidence on model, but is used in calculations','Horizontal Tail Incidence','help'))
            
% Vertical Tail
    % Chord---------------------------------------------------- 
        function txtbox_vertChord_Callback(hObject,~)
                global cHorz bHorz cVert height selected                
                cVert = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Height----------------------------------------------------
        function txtbox_vertSpan_Callback(hObject,~)
                global cHorz bHorz cVert height selected            
            height = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Sweep----------------------------------------------------
        function txtbox_vertSweep_Callback(hObject,~)
            global cHorz bHorz cVert height LamLEVert selected           
          
            LamLEVert = str2double(get(hObject,'String'));
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
    % Taper----------------------------------------------------
        function txtbox_vertTaper_Callback(hObject,~)
                global cHorz bHorz cVert height tpVert selected        
             tpVert = str2double(get(hObject,'String'));
             if tpVert < 0
                    errordlg('Taper ratio must be greater than 0','Invalid Input','modal');
             end
                if cHorz ~= 0 && bHorz ~= 0 && cVert ~= 0 && height ~= 0
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
             
% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';

% function bselection(~,event)
%    display(['Previous: ' event.OldValue.String]);
%    display(['Current: ' event.NewValue.String]);
%    display('------------------');
               
% Conventional Tail Configuration
function radial_conventionalTail_Callback(~,~)
    global wingPos_zDirHorz cHorz R tail cruciformTail tTail
    % Conventional Tail
    wingPos_zDirHorz = (.5036*cHorz + 1.031)+(R-1);
    % Conventional Tail
    tail = 0;
    pushbutton_iso_Callback;
    cruciformTail.Value = 0;
    tTail.Value = 0;
    % T-Tail
% uicontrol('Parent',horzTail,'Style','radiobutton','String','T-Tail','Position',[10 0 90 25],'Callback',@radial_T_Tail_Callback);
    % Cruciform
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Cruciform','Position',[10 22 90 25],'Callback',@radial_cruciformTail_Callback);

% Cruciform Tail Configuration
function radial_cruciformTail_Callback(~,~)
    global wingPos_zDirHorz cHorz R height tail conventionalTail tTail
    % Cruciform Tail
    wingPos_zDirHorz = ((.5036*cHorz + 1.031)+(R-1))+height/2;
    % Cruciform Tail
    tail = 1;
    pushbutton_iso_Callback;
    conventionalTail.Value = 0;
    tTail.Value = 0;
    % Conventional
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Conventional','Position',[10 45 90 25],'Callback',@radial_conventionalTail_Callback);
    % T-Tail
% uicontrol('Parent',horzTail,'Style','radiobutton','String','T-Tail','Position',[10 0 90 25],'Callback',@radial_T_Tail_Callback);

% T-Tail Configuration
function radial_T_Tail_Callback(~,~)
    global wingPos_zDirHorz cHorz R height tail conventionalTail cruciformTail
    wingPos_zDirHorz = ((.5036*cHorz + 1.031)+(R-1))+height;
    % T-Tail
    tail = 2;
    pushbutton_iso_Callback;
    conventionalTail.Value = 0;
    cruciformTail.Value = 0;
    % Cruciform
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Cruciform','Position',[10 22 90 25],'Callback',@radial_cruciformTail_Callback);
    % Conventional
% uicontrol('Parent',horzTail,'Style','radiobutton','String','Conventional','Position',[10 45 90 25],'Callback',@radial_conventionalTail_Callback);
            












             