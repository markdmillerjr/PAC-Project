function wingParametersMod
% Written by Mark D. Miller Jr.
% 4/24/17
% Adapted from a program written by Kenneth Bordignon

global FL FW airfoil_size XW1 ZW1 XWR YWR ZWR WR tp i_w c b cr ct Gam LamLE...
    FH airfoil_array airfoil_coords_x airfoil_coords_y NACA VarName2...
    airfoilFig ARWing  selected tab1 tab2 combinedWindowsFig wingParametersPanel...
    wingPanel wingStructPanel wingStructuresPanel

% Tabs
tabgp = uitabgroup('Parent',combinedWindowsFig,'Position',[.27 .01 .72 .99]);
wingParametersPanel = uitab('Parent',tabgp,'Title','Wing Parameters');
wingStructuresPanel = uitab('Parent',tabgp,'Title','Wing Structure');

% % Initial Data	 
% cr      =	1;	%	Wing Chord (root)	,	in
% ct      =	1;	%	Wing Chord (tip)	,	in
% FL      =	1;	%	Fuselage Length	,	in
% FH      =	1;	%	Fuselage Height	,	in
% FW      =	1;	%	Fuselage Width	,	in

% Panels
% Wing
wingPanel = uipanel('Parent',wingParametersPanel,'Title','Wing stuff','FontSize',12,'Position',[.01 .23 .98 .69]);
wingStructPanel = uipanel('Parent',wingStructuresPanel,'Title','Wing','FontSize',12,'Position',[.01 .23 .98 .69]);

% Temporary pushbutton for building the wing structure code
uicontrol('Parent',wingStructuresPanel,'Style','pushbutton','String','Wing Structure','FontSize',9,'Position',[50 670 120 25],'Callback',@pushbutton_wingStructure_Callback);

% Construct the components.
%% Static Texts------------------------------------------------------------
% Title
% uicontrol('Style','text','String','Wing Parameters','Position',[300 725 150 25],'FontSize',12);
% Wing Chord
uicontrol('Parent',wingParametersPanel','Style','text','String','Chord','Position',[155 690 35 25]);
    % Units
    uicontrol('Parent',wingParametersPanel','Style','text','String','ft','Position',[176 670 35 25]);
% Wing Span
uicontrol('Parent',wingParametersPanel','Style','text','String','Span','Position',[223 690 35 25]);
    % Units
    uicontrol('Parent',wingParametersPanel','Style','text','String','ft','Position',[248 670 35 25]);
% Wing AR
uicontrol('Parent',wingParametersPanel','Style','text','String','Aspect Ratio','Position',[260 690 100 25]);
% Wing Dihedral
uicontrol('Parent',wingParametersPanel','Style','text','String','Dihedral','Position',[355 690 50 25]);
    % Units
    uicontrol('Parent',wingParametersPanel','Style','text','String','deg','Position',[392 670 35 25]);
% Wing Sweep
uicontrol('Parent',wingParametersPanel','Style','text','String','Sweep','Position',[425 690 50 25]);
    % Units
    uicontrol('Parent',wingParametersPanel','Style','text','String','deg','Position',[464 670 35 25]);
% Wing Taper
uicontrol('Parent',wingParametersPanel','Style','text','String','Taper','Position',[495 690 50 25]);

% Airfoil
uicontrol('Parent',wingParametersPanel','Style','text','String','Airfoil Coordinates','Position',[185 140 110 25],'FontSize',9);

%% Textboxes---------------------------------------------------------------
% Wing Chord
uicontrol('Parent',wingParametersPanel','Style','edit','String',c,'Position',[157 675 30 25],'Callback',@txtbox_chord_Callback);
% Wing Span
uicontrol('Parent',wingParametersPanel','Style','edit','String',b,'Position',[225 675 35 25],'Callback',@txtbox_span_Callback);
% Aspect Ratio
uicontrol('Parent',wingParametersPanel','Style','edit','String',ARWing,'Position',[294 675 35 25],'Callback',@txtbox_AR_Callback);
% Wing Dihedral
uicontrol('Parent',wingParametersPanel','Style','edit','String',Gam,'Position',[362 675 35 25],'Callback',@txtbox_dihedral_Callback);
% Wing Sweep
uicontrol('Parent',wingParametersPanel','Style','edit','String',LamLE,'Position',[433 675 35 25],'Callback',@txtbox_sweep_Callback);
% Wing Taper
uicontrol('Parent',wingParametersPanel','Style','edit','String',tp,'Position',[505 675 35 25],'Callback',@txtbox_taper_Callback); 

%% Popupmenu
% Airfoils
uicontrol('Parent',wingParametersPanel','Style','popupmenu','String',{'Select','NACA 0006','NACA 0009','NACA 1408',...
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
    'NACA 63A010','NACA 63A210','NACA 64A010','NACA 64A210','NACA 64A410'},'Position',[190 120 135 25],'Callback',@popupmenu_airfoil_Callback);

% uicontrol('Parent',wingParametersPanel','Style','edit','String',wingAirfoilFile,'Position',[190 120 100 25],'Callback',@txtbox_airfoil_Callback);

%% Pushbuttons-------------------------------------------------------------
% Top
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Top','Position',[570 95 60 20],'Callback',@pushbutton_top_Callback);    
% Front
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Front','Position',[570 75 60 20],'Callback',@pushbutton_front_Callback); 
% Side
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Side','Position',[570 55 60 20],'Callback',@pushbutton_side_Callback);   
% Isometric
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Isometric','Position',[570 35 60 20],'Callback',@pushbutton_iso_Callback);    
% 3-Dimensional
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','3D View','Position',[645 95 60 20],'Callback',@pushbutton_3D_Callback);
% Zoom
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Zoom','Position',[645 75 60 20],'Callback',@pushbutton_zoom_Callback);
% Zoom reset
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Zoom reset','Position',[645 55 60 20],'Callback',@pushbutton_zoom_reset_Callback);
% Pan
uicontrol('Parent',wingParametersPanel','Style','pushbutton','String','Pan','Position',[645 35 60 20],'Callback',@pushbutton_pan_Callback);

% Change units to normalized so components resize automatically.
% wingParametersFig.Units = 'normalized';

if airfoil_size > 0

i_w = 0;        
delete(airfoilFig);
airfoilFig = axes('Parent',wingParametersPanel','Position',[0.11 0.06 0.58 0.09]);

    importfile3;
    airfoil_coords_x = NACA;
    airfoil_coords_y = VarName2;
    airfoil_size = size(airfoil_coords_x);
    airfoil_array = zeros(airfoil_size);
    
    % X-Coordinates
    XW1=0;
 
    % Z-Coordinates
    ZW1 = 0;
 
    % Right Wing Root
    XWR = (airfoil_coords_x+XW1);
    YWR = (airfoil_array);
    ZWR = (airfoil_coords_y+ZW1);
    
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
    
wingParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view(3);
lighting gouraud
camlight;

% wingStructureDrawing;
% axis equal
% xlabel('X (ft)')
% ylabel('Y (ft)')
% zlabel('Z (ft)')
% grid on
% view(3);
% lighting gouraud
% camlight;

else
    b     = 1;
    c     = 1;
    Gam   = 0;
    LamLE = 0;
    tp    = 1;
    selected = 4;
end

function wingParametersDrawing
global b cr ct Gam LamLE FH airfoil_array airfoil_coords_x airfoil_coords_y...
    airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR...
    XWR2 YWR2 ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3...
    ZWRT3 WR WR2 WR3 WRT WRT3 WRL tp i_w c wingFig wingPanel combinedWindowsFig...
    t_c airfoilFile wingAirfoilFile fig
 
delete(wingFig);
airfoilFile = wingAirfoilFile;
airfoilData;
fig = figure;
wingFig = axes('Parent',wingPanel','Position',[0.06 0.22 .92 .6]);


% wingFig = axes('Parent',wingPanel','Position',[0.06 0.22 .92 .6], 'CameraPosition', [-10 -10 10], ...
%                         'CameraTarget', [0 0 0], ...
%                         'CameraUpVector', [0 0 1], ...
%                         'CameraViewAngle', 30, ...
%                         'Color', 'k', ...
%                         'DataAspectRatio', [1 1 2], ...
%                         'NextPlot', 'add', ...
%                         'Position', [0 0 1 1], ...
%                         'Projection', 'perspective', ...
%                         'Tag', 'AXES_1', ...
%                         'XColor', 'none', ...
%                         'XLim', [-3 3], ...
%                         'YColor', 'none', ...
%                         'YLim', [-3 3], ...
%                         'ZColor', 'none', ...
%                         'ZLim', [-7 9]);


% Initial Data	 
cr      =	1;	%	Wing Chord (root)	,	in
ct      =	1;	%	Wing Chord (tip)	,	in
FL      =	1;	%	Fuselage Length	,	in
FH      =	1;	%	Fuselage Height	,	in
FW      =	1;	%	Fuselage Width	,	in

   % X-Coordinates
    XW1=cr;
    XW2=XW1+(b/c)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/c)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/c)*tand(Gam);
    ZW4=FH/2;

    % Right Wing Root
    XWR = ((airfoil_coords_x+XW1)*c)-c;
    YWR = (airfoil_array);
    ZWR = ((airfoil_coords_y+ZW1).*(t_c*c))-(t_c*c);
    
    % Right Wing Tip
    XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
    YWR2 = (airfoil_array + b/2);
    ZWR2 = ((airfoil_coords_y.*tp+ZW3).*(t_c*c))-(t_c*c);
    
    % Left Wing Root   
    XWRL = ((airfoil_coords_x+XW1)*c)-c;
    YWRL = (-airfoil_array);
    ZWRL = ((airfoil_coords_y+ZW1).*(t_c*c))-(t_c*c);

    % Left Wing Tip
    XWR3 = ((airfoil_coords_x.*tp+XW2)*c)-c;
    YWR3 = (-(airfoil_array + b/2));
    ZWR3 = ((airfoil_coords_y.*tp+ZW3).*(t_c*c))-(t_c*c);

        importfile3;
%         hold off
%         WR  = fill3(XWR,YWR,ZWR,[.5 .5 .5]);
%         hold on
%         WR2 = fill3(XWR2,YWR2,ZWR2,[.5 .5 .5]);
%         hold on
%         WRL = fill3(XWRL,YWRL,ZWRL,[.5 .5 .5]);
%         hold on
%         WR3  = fill3(XWR3,YWR3,ZWR3,[.5 .5 .5]);
        
% Right Wing
% hold on
%         for t = 1:airfoil_size(1)-1
% %             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
% %             end
%         end
% hold on
%         XWRT_1 = ((airfoil_coords_x+XW1)*c)-c;
%         XWRT_2 = ((airfoil_coords_x.*tp+XW2).*c)-c;
%         XWRT_3 = ((airfoil_coords_x.*tp+XW2).*c)-c;
%         XWRT_4 = ((airfoil_coords_x+XW1).*c)-c;
%         
%         XWRT_1(airfoil_size(1)) = [];
%         XWRT_2(airfoil_size(1)) = [];
%         XWRT_3(1) = [];
%         XWRT_4(1) = [];
% 
%         YWRT_1 = 0;
%         YWRT_2 = b/2;
%         YWRT_3 = b/2;
%         YWRT_4 = 0;
        
        
%         YWRT_1 = ((1:35)*.0286)*(b/2);
%         YWRT_1(35) = floor(YWRT_1(35));
%         YWRT_2 = ((1:35)*.0286)*(b/2);
%         YWRT_2(35) = floor(YWRT_2(35));
        
        
%         ZWRT_1 = ((airfoil_coords_y+ZW1).*c)-c;
%         ZWRT_2 = ((airfoil_coords_y.*tp+ZW2).*c)-c;
%         ZWRT_3 = ((airfoil_coords_y.*tp+ZW3).*c)-c;
%         ZWRT_4 = ((airfoil_coords_y+ZW4).*c)-c;
%         
%         ZWRT_1(airfoil_size(1)) = [];
%         ZWRT_2(airfoil_size(1)) = [];
%         ZWRT_3(1) = [];
%         ZWRT_4(1) = [];
%         
%         XWRT = [XWRT_1,XWRT_2,XWRT_3,XWRT_4];
%         YWRT = [YWRT_1,YWRT_2,YWRT_3,YWRT_4];
%         ZWRT = [ZWRT_1,ZWRT_2,ZWRT_3,ZWRT_4];
        
        
%         XWR    =  ((airfoil_coords_x+XW1)*c)-c;
%         XWR2   =  ((airfoil_coords_x.*tp+XW2)*c)-c;
% 
%         airfoil_coords_y(1) = 0;
%         airfoil_coords_y(35) = 0;
%         
%         ZWR = ((airfoil_coords_y+ZW1)*c)-c;
%         ZWR2 = ((airfoil_coords_y.*tp+ZW3)*c)-c;
% 
%         YWRT = zeros(airfoil_size(1),2);
%         
%         YWRT(:,1) = 0;
%         YWRT(:,2) = 70;
% 
%         XWRT = [XWR,XWR2];
%         ZWRT = [ZWR,ZWR2];
% 
%         WRT = surface(XWRT,YWRT,ZWRT,'facecolor',[.5 .5 .5]);
        
        
        
%         WRT  = fill3(XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
%         colormap(bone)
%         shading interp
        %   hSurf = surf(hAxes, X, Y, Z, del2(Z));

        
        %         XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
        %         YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%         ZWRT = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
        
% Left Wing
% hold on
%      for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b/2)),(-(airfoil_array(1) + b/2)),(airfoil_array(1))];
%                 ZWRT3 = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT3  = fill3(XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
%             end
%      end   

        
%         XWRT_3 = ((airfoil_coords_x.*tp+XW2).*c)-c;
%         XWRT_4 = ((airfoil_coords_x+XW1).*c)-c;
        
%         XWRT_1(airfoil_size(1)) = [];
%         XWRT_2(airfoil_size(1)) = [];
%         XWRT_3(1) = [];
%         XWRT_4(1) = [];

%         YWRT_1 = 0;
%         YWRT_2 = -b/2;
%         YWRT_3 = -b/2;
%         YWRT_4 = 0;
        
%         ZWRT_3 = ((airfoil_coords_y.*tp+ZW3).*c)-c;
%         ZWRT_4 = ((airfoil_coords_y+ZW4).*c)-c;
        
%         ZWRT_1(airfoil_size(1)) = [];
%         ZWRT_2(airfoil_size(1)) = [];
%         ZWRT_3(1) = [];
%         ZWRT_4(1) = [];
        
%         XWRT3 = [XWRT_1,XWRT_2,XWRT_3,XWRT_4];
%         YWRT3 = [YWRT_1,YWRT_2,YWRT_3,YWRT_4];
%         ZWRT3 = [ZWRT_1,ZWRT_2,ZWRT_3,ZWRT_4];

%         YWRT3 = zeros(airfoil_size(1)-1,4);
        
%         for j = 1:airfoil_size(1)-1
%             YWRT3(j,1) = 0;
%             YWRT3(j,2) = 70;
%             YWRT3(j,3) = 70;
%             YWRT3(j,4) = 0;
%         end
        
%         YWRT3(:,1) = 0;
%         YWRT3(:,2) = 70;
%         YWRT3(:,3) = 70;
%         YWRT3(:,4) = 0;

%         colorArray = zeros(airfoil_size(1)-1,2)+.5;
% %        colorArray = transpose(colorArray);
%         colorArray = [.5 .5 .5];
        
%         WRT3  = fill3(XWRT3,YWRT3,ZWRT3,colorArray);


        XWR  = ((airfoil_coords_x+XW1).*c)-c;
        XWR2 = ((airfoil_coords_x.*tp+XW2).*c)-c;

        airfoil_coords_y(1) = 0;
        airfoil_coords_y(35) = 0;
        
        ZWR = ((airfoil_coords_y+0).*(1*c/2))-(0);
        ZWR2 = ((airfoil_coords_y.*tp+0).*(1*c/2))-(0);

        YWRT = zeros(airfoil_size(1),2);
        
        YWRT(:,1) = 0;
        YWRT(:,2) = 70;

        XWRT = [XWR,XWR2];
        ZWRT = [ZWR,ZWR2];

        XWRL = ((airfoil_coords_x+XW1).*c)-c;
        XWRL2 = ((airfoil_coords_x.*tp+XW2).*c)-c;

        airfoil_coords_y(1) = 0;
        airfoil_coords_y(35) = 0;
        
        ZWRL = ((airfoil_coords_y+0).*(1*c/2))-(0);
        ZWRL2 = ((airfoil_coords_y.*tp+0).*(1*c/2))-(0);

        YWRT3 = zeros(airfoil_size(1),2);
        
        YWRT3(:,1) = 0;
        YWRT3(:,2) = -70;

        XWRT3 = [XWRL,XWRL2];
        ZWRT3 = [ZWRL,ZWRL2];
        
        WRT = surface(XWRT,YWRT,ZWRT,'facecolor',[.5 .5 .5]);
        WRT3 = surface(XWRT3,YWRT3,ZWRT3,'facecolor',[.5 .5 .5]);
        
%         colormap(gray);
%         shading interp
%         material metal
%         lighting gouraud
%         axis tight equal
        
%         WRT3.CDataMapping = 'scaled';
%         WRT3.FaceVertexCData = 'flat';
%         colormap(bone)
%         shading interp

  % Create MouseManager and intialize:
%   mmObject = MouseManager(combinedWindowsFig);
%   mmObject.add_item(wingFig, {'click', 'drag'}, 'normal', @orbit_camera, ...
%                            {'click', 'drag'}, 'alt', @dolly_camera, ...
%                            'click', 'open', @reset_camera, ...
%                            'scroll', @zoom_camera);
%   mmObject.enable(true);
%   display(mmObject);
     
function wingStructureDrawing
global b cr ct Gam LamLE FH airfoil_array airfoil_coords_x airfoil_coords_y...
    airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR...
    XWR2 YWR2 ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3...
    ZWRT3 WR WR2 WR3 WRT WRT3 WRL tp i_w c wingStructPanel wingStructFig
 
delete(wingStructFig);
wingStructFig = axes('Parent',wingStructPanel','Position',[0.06 0.22 .92 .6]);

% Initial Data	 
cr      =	1;	%	Wing Chord (root)	,	in
ct      =	1;	%	Wing Chord (tip)	,	in
FL      =	1;	%	Fuselage Length	,	in
FH      =	1;	%	Fuselage Height	,	in
FW      =	1;	%	Fuselage Width	,	in


   % X-Coordinates
    XW1=cr;
    XW2=XW1+(b/c)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/c)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/c)*tand(Gam);
    ZW4=FH/2;

    % Right Wing Root
    XWR = ((airfoil_coords_x+XW1)*c)-c;
    YWR = (airfoil_array);
    ZWR = ((airfoil_coords_y+0)*c);
    
    % Right Wing Tip
    XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
    YWR2 = (airfoil_array + b/2);
    ZWR2 = ((airfoil_coords_y.*tp+0)*c);
    
    
%     % Right Wing Root
    XWR5 = ((airfoil_coords_x+XW1)*c)-c;
    YWR5 = (airfoil_array + 30);
    ZWR5 = ((airfoil_coords_y)*c);
%     
%     % Right Wing Tip
%     XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR2 = (airfoil_array + b/2);
%     ZWR2 = ((airfoil_coords_y.*tp+ZW3)*c)-c;
    
%     %     Left Wing Root   
%     XWRL = ((airfoil_coords_x+XW1)*c)-c;
%     YWRL = (-airfoil_array);
%     ZWRL = ((airfoil_coords_y+ZW1)*c)-c;
% 
%     % Left Wing Tip
%     XWR3 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR3 = (-(airfoil_array + b/2));
%     ZWR3 = ((airfoil_coords_y.*tp+ZW3)*c)-c;

        importfile3;
        hold off
        WR  = fill3(XWR,YWR,ZWR,[.9 .9 .9]);
        alpha(WR,.5);
        hold on
        WR2 = fill3(XWR2,YWR2,ZWR2,[.9 .9 .9]);
        alpha(WR2,.5);

        
        for rib = 1:5
            XWR5 = ((airfoil_coords_x+XW1)*c)-c;
            YWR5 = (airfoil_array + rib*12);
            ZWR5 = ((airfoil_coords_y)*c);
            hold on
            WR5 = fill3(XWR5,YWR5,ZWR5,[.9 .9 .9]);
            alpha(WR5,.5); 
        end
        
%         for rib = 1:5
%             XWR5 = ((airfoil_coords_x+XW1)*c)-c;
%             YWR5 = (airfoil_array + rib*12);
%             ZWR5 = ((airfoil_coords_y)*c);
%             hold on
%             WR5 = fill3(XWR5,YWR5,ZWR5,[.9 .9 .9]);
%             alpha(WR5,.5); 
%         end
        
        
        
        
        
        
%         hold on
%         WRL = fill3(XWRL,YWRL,ZWRL,[.5 .5 .5]);
%         hold on
%         WR3  = fill3(XWR3,YWR3,ZWR3,[.5 .5 .5]);
        
% Right Wing
%         for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT = [(((0+XW1)*c)-c),(((0.*tp+XW2)*c)-c),(((1.*tp+XW2)*c)-c)*.125,(((1+XW1)*c)-c)*.125];
%                 YWRT = [(0),(0 + b/2),(0 + b/2),(0)];
%                 ZWRT = [0,0,0,0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.7 .7 .7]);
%             end
%         end
% Airfoil coordinate for leading edge spar
    middleCoordinate = ceil(airfoil_size(1)/2);
    sparCoordinateBegY = middleCoordinate - 3;
    sparCoordinateEndY = middleCoordinate + 2;
            
% Leading Edge
hold on
%         for t = 15:20
        for t = sparCoordinateBegY:sparCoordinateEndY
            if t <= airfoil_size(1)-1
                XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
                YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
                ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
                WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
                alpha(WRT,.25);
            end
        end
%          end
hold on
% Vertical Leading Edge Spar
        for t = 1:sparCoordinateEndY
%             if t <= airfoil_size(1)-1
                XWRT = [1,1,1,1];
                YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
                ZWRT = [((airfoil_coords_y(sparCoordinateEndY)+0)*c)-0,((airfoil_coords_y(sparCoordinateEndY).*tp+0)*c)-0,((airfoil_coords_y(sparCoordinateBegY).*tp+0)*c)-0,((airfoil_coords_y(sparCoordinateBegY)+0)*c)-0];
%                 ZWRT = [1.5,1.5,-.5,-.5];
                WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
                alpha(WRT,.25);
%             end
        end
% hold on
% Upper Trailing Edge
%         for t = 1:2
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
% hold on
% Lower Trailing Edge
%         for t = 33:35
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
% hold on
% Vertical Trailing Edge Spar
%         for t = 33:35
%             if t <= airfoil_size(1)-1
%                 XWRT = [18,18,18,18];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(33)+0)*c)-0,((airfoil_coords_y(33).*tp+0)*c)-0,((airfoil_coords_y(3).*tp+0)*c)-0,((airfoil_coords_y(3)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
        
%         for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[1 1 1]);
%             end
%         end
        
        
% Left Wing
% hold on
%      for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b/2)),(-(airfoil_array(1) + b/2)),(airfoil_array(1))];
%                 ZWRT3 = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT3  = fill3(XWRT3,YWRT3,ZWRT3,[1 1 1]);
%             end
%      end        
     
function popupmenu_airfoil_Callback(hObject,~)
global wingAirfoilFile airfoilFile

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
  case 'NACA 0006'
      wingAirfoilFile = 'naca0006.dat';
    case 'NACA 0009'
        wingAirfoilFile = 'naca0009.dat';
    case 'NACA 1408'
        wingAirfoilFile = 'naca1408.dat';
    case 'NACA 1410'
        wingAirfoilFile = 'naca1410.dat';
    case 'NACA 1412'
        wingAirfoilFile = 'naca1412.dat';
    case 'NACA 2412'
        wingAirfoilFile = 'naca2412.dat';
    case 'NACA 2415'
        wingAirfoilFile = 'naca2415.dat';
    case 'NACA 2418'
        wingAirfoilFile = 'naca2418.dat';
    case 'NACA 2421'
        wingAirfoilFile = 'naca2421.dat';
    case 'NACA 2424'
        wingAirfoilFile = 'naca2424.dat';
    case 'NACA 4412'
        wingAirfoilFile = 'naca4412.dat';
    case 'NACA 4415'
        wingAirfoilFile = 'naca4415.dat';
    case 'NACA 4418'
        wingAirfoilFile = 'naca4418.dat';
    case 'NACA 4421'
        wingAirfoilFile = 'naca4421.dat';
    case 'NACA 4424'
        wingAirfoilFile = 'naca4424.dat';
    case 'NACA 23012'
        wingAirfoilFile = 'naca23012.dat';
    case 'NACA 23015'
        wingAirfoilFile = 'naca23015.dat';
    case 'NACA 23018'
        wingAirfoilFile = 'naca23018.dat';
    case 'NACA 23021'
        wingAirfoilFile = 'naca23021.dat';
    case 'NACA 23024'
        wingAirfoilFile = 'naca23024.dat';
    case 'NACA 63-006'
        wingAirfoilFile = 'naca63-006.dat';
    case 'NACA 63-206'
        wingAirfoilFile = 'naca63-206.dat';
    case 'NACA 63-209'
        wingAirfoilFile = 'naca63-209.dat';
    case 'NACA 63-210'
        wingAirfoilFile = 'naca63-210.dat';
    case 'NACA 63(1)-012'
        wingAirfoilFile = 'naca63(1)-012.dat';
    case 'NACA 63(1)-212'
        wingAirfoilFile = 'naca63(1)-212.dat';
    case 'NACA 63(1)-412'
        wingAirfoilFile = 'naca63(1)-412.dat';
    case 'NACA 63(2)-015'
        wingAirfoilFile = 'naca63(2)-015.dat';
    case 'NACA 63(2)-215'
        wingAirfoilFile = 'naca63(2)-215.dat';
    case 'NACA 63(2)-415'
        wingAirfoilFile = 'naca63(2)-415.dat';
    case 'NACA 63(2)-615'
        wingAirfoilFile = 'naca63(2)-615.dat';
    case 'NACA 63(3)-018'
        wingAirfoilFile = 'naca63(3)-018.dat';
    case 'NACA 63(3)-218'
        wingAirfoilFile = 'naca63(3)-218.dat';
    case 'NACA 63(3)-418'
        wingAirfoilFile = 'naca63(3)-418.dat';
    case 'NACA 63(3)-618'
        wingAirfoilFile = 'naca63(3)-618.dat';
    case 'NACA 63(4)-221'
        wingAirfoilFile = 'naca63(4)-221.dat';
    case 'NACA 63(4)-421'
        wingAirfoilFile = 'naca63(4)-421.dat';
    case 'NACA 64-108'
        wingAirfoilFile = 'naca64-108.dat';
    case 'NACA 64-110'
        wingAirfoilFile = 'naca64-110.dat';
    case 'NACA 64-206'
        wingAirfoilFile = 'naca64-206.dat';
    case 'NACA 64-208'
        wingAirfoilFile = 'naca64-208.dat';
    case 'NACA 64-209'
        wingAirfoilFile = 'naca64-209.dat';
    case 'NACA 64-210'
        wingAirfoilFile = 'naca64-210.dat';
    case 'NACA 64(1)-012'
        wingAirfoilFile = 'naca64(1)-012.dat';
    case 'NACA 64(1)-112'
        wingAirfoilFile = 'naca64(1)-112.dat';
    case 'NACA 64(1)-212'
        wingAirfoilFile = 'naca64(1)-212.dat';
    case 'NACA 64(2)-015'
        wingAirfoilFile = 'naca64(2)-015.dat';
    case 'NACA 64(2)-215'
        wingAirfoilFile = 'naca64(2)-215.dat';
    case 'NACA 64(2)-415'
        wingAirfoilFile = 'naca64(2)-415.dat';
    case 'NACA 64(3)-218'
        wingAirfoilFile = 'naca64(3)-218.dat';
    case 'NACA 64(3)-418'
        wingAirfoilFile = 'naca64(3)-418.dat';
    case 'NACA 64(3)-618'
        wingAirfoilFile = 'naca64(3)-618.dat';
    case 'NACA 64(4)-221'
        wingAirfoilFile = 'naca64(4)-221.dat';
    case 'NACA 64(4)-421'
        wingAirfoilFile = 'naca64(4)-421.dat';
    case 'NACA 65-006'
        wingAirfoilFile = 'naca65-006.dat';
    case 'NACA 65-206'
        wingAirfoilFile = 'naca65-206.dat';
    case 'NACA 65-209'
        wingAirfoilFile = 'naca65-209.dat';
    case 'NACA 65-210'
        wingAirfoilFile = 'naca65-210.dat';
    case 'NACA 65-410'
        wingAirfoilFile = 'naca65-410.dat';
    case 'NACA 65(1)-212'
        wingAirfoilFile = 'naca65(1)-212.dat';
    case 'NACA 65(1)-212a=0.6'
        wingAirfoilFile = 'naca65(1)-212a=.6.dat';
    case 'NACA 65(1)-412'
        wingAirfoilFile = 'naca65(1)-412.dat';
    case 'NACA 65(2)-215'
        wingAirfoilFile = 'naca65(2)-215.dat';
    case 'NACA 65(2)-415'
        wingAirfoilFile = 'naca65(2)-415.dat';
    case 'NACA 65(2)-415a=0.5'
        wingAirfoilFile = 'naca65(2)-415a=.5.dat';
    case 'NACA 65(3)-218'
        wingAirfoilFile = 'naca65(3)-218.dat';
    case 'NACA 65(3)-618'
        wingAirfoilFile = 'naca65(3)-618.dat';
    case 'NACA 65(4)-221'
        wingAirfoilFile = 'naca65(4)-221.dat';
    case 'NACA 65(4)-421'
        wingAirfoilFile = 'naca65(4)-421.dat';
    case 'NACA 65(4)-421a=0.5'
        wingAirfoilFile = 'naca65(4)-421a=.5.dat';
    case 'NACA 66-006'
        wingAirfoilFile = 'naca66-006.dat';
    case 'NACA 66-018'
        wingAirfoilFile = 'naca66-018.dat';
    case 'NACA 66-206'
        wingAirfoilFile = 'naca66-206.dat';
    case 'NACA 66-209'
        wingAirfoilFile = 'naca66-209.dat';
    case 'NACA 66-210'
        wingAirfoilFile = 'naca66-210.dat';
    case 'NACA 66(1)-212'
        wingAirfoilFile = 'naca66(1)-212.dat';
    case 'NACA 66(2)-215'
        wingAirfoilFile = 'naca66(2)-215.dat';
    case 'NACA 66(2)-415'
        wingAirfoilFile = 'naca66(2)-415.dat';
    case 'NACA 63A010'
        wingAirfoilFile = 'naca63A010.dat';
    case 'NACA 63A210'
        wingAirfoilFile = 'naca63A210.dat';
    case 'NACA 64A010'
        wingAirfoilFile = 'naca64A010.dat';
    case 'NACA 64A210'
        wingAirfoilFile = 'naca64A210.dat';
    case 'NACA 64A410'
        wingAirfoilFile = 'naca64A410.dat';
end
airfoilFile = wingAirfoilFile;
airfoilData;
airfoilPlot;

function airfoilPlot
global b cr ct Gam LamLE FH airfoil_array airfoil_coords_x...
    airfoil_coords_y airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1...
    ZW2 ZW3 ZW4 XWR YWR ZWR NACA VarName2 WR wingAirfoilFile i_w...
    airfoilFig wingParametersPanel selected

i_w = 0;        
delete(airfoilFig);
airfoilFig = axes('Parent',wingParametersPanel,'Position',[0.11 0.06 0.58 0.09]);

% wingAirfoilFile = (get(hObject,'String'));
fileOpen = fopen(wingAirfoilFile);

if fileOpen == -1
  errordlg('You must enter the correct airfoil file name','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

    % Imports airfoil dat file into matlab
    importfile3;
    airfoil_coords_x = NACA;
    airfoil_coords_y = VarName2;
    airfoil_size = size(airfoil_coords_x);
    airfoil_array = zeros(airfoil_size);
    
    % X-Coordinates
    XW1=0;
    XW2=XW1+(b/2)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW1=0;
    YW2=b/2;
    YW3=b/2;
    YW4=0;
    
    % Z-Coordinates
    ZW1 = 0;
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);
    ZW4=FH/2;
 
    % Right Wing Root
    XWR = (airfoil_coords_x);
    YWR = (airfoil_array);
    ZWR = (airfoil_coords_y);
    
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
    if selected == 1
        pushbutton_top_Callback;
    elseif selected == 2
        pushbutton_front_Callback;
    elseif selected == 3
        pushbutton_side_Callback;
    elseif selected == 4
        pushbutton_iso_Callback;
    end
     
function txtbox_airfoil_Callback(hObject,~)
global b cr ct Gam LamLE FH airfoil_array airfoil_coords_x...
    airfoil_coords_y airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1...
    ZW2 ZW3 ZW4 XWR YWR ZWR NACA VarName2 WR wingAirfoilFile i_w...
    airfoilFig wingParametersPanel

i_w = 0;        
delete(airfoilFig);
airfoilFig = axes('Parent',wingParametersPanel,'Position',[0.11 0.06 0.58 0.09]);

wingAirfoilFile = (get(hObject,'String'));
fileOpen = fopen(wingAirfoilFile);

if fileOpen == -1
  errordlg('You must enter the correct airfoil file name','Invalid Input','modal');
  uicontrol(hObject);
  return;
end

    % Imports airfoil dat file into matlab
    importfile3;
    airfoil_coords_x = NACA;
    airfoil_coords_y = VarName2;
    airfoil_size = size(airfoil_coords_x);
    airfoil_array = zeros(airfoil_size);
    
    % X-Coordinates
    XW1=0;
    XW2=XW1+(b/2)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW1=0;
    YW2=b/2;
    YW3=b/2;
    YW4=0;
    
    % Z-Coordinates
    ZW1 = 0;
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);
    ZW4=FH/2;
 
    % Right Wing Root
    XWR = (airfoil_coords_x+XW1);
    YWR = (airfoil_array);
    ZWR = (airfoil_coords_y+ZW1);
    
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
pushbutton_iso_Callback

function pushbutton_top_Callback(~, ~)
global selected
wingParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 90;
view(az,el);
colormap(gray);
shading interp
material dull
lighting gouraud
selected = 1;
            
function pushbutton_front_Callback(~,~)
global selected
wingParametersDrawing;       
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 0;
view(az,el);
colormap(gray);
shading interp
material dull
lighting gouraud
axis tight equal
selected = 2;
            
function pushbutton_side_Callback(~,~)
global selected
wingParametersDrawing;            
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 0;
el = 360;
view(az,el);
colormap(gray);
shading interp
material dull
lighting gouraud
axis tight equal
selected = 3;
             
function pushbutton_iso_Callback(~,~)
global selected
wingParametersDrawing;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view(3);
colormap(gray);
shading interp
material dull
lighting gouraud
axis tight equal

% lighting gouraud;
% camlight;
selected = 4;
    
function pushbutton_3D_Callback(~,~)
global wingFig fig
% clc;
% h = rotate3d(wingFig);
% h.Enable = 'on';
% clc;


% function camera_demo

  % Sample data:
%   [X, Y, Z] = peaks();
% 
%   % Create figure and graphics objects:
%   hFigure = figure('Color', 'k', 'Name', 'Camera Demo', ...
%                    'NumberTitle', 'off');
%   hAxes = axes(hFigure, 'CameraPosition', [-10 -10 10], ...
%                         'CameraTarget', [0 0 0], ...
%                         'CameraUpVector', [0 0 1], ...
%                         'CameraViewAngle', 30, ...
%                         'Color', 'k', ...
%                         'DataAspectRatio', [1 1 2], ...
%                         'NextPlot', 'add', ...
%                         'Position', [0 0 1 1], ...
%                         'Projection', 'perspective', ...
%                         'Tag', 'AXES_1', ...
%                         'XColor', 'none', ...
%                         'XLim', [-3 3], ...
%                         'YColor', 'none', ...
%                         'YLim', [-3 3], ...
%                         'ZColor', 'none', ...
%                         'ZLim', [-7 9]);
%   hSurf = surf(hAxes, X, Y, Z, del2(Z));
%   set(hSurf, 'EdgeColor', 'none');

  % Create MouseManager and intialize:
  mmObject = MouseManager(fig);
  mmObject.add_item(wingFig, {'click', 'drag'}, 'normal', @orbit_camera, ...
                           {'click', 'drag'}, 'alt', @dolly_camera, ...
                           'click', 'open', @reset_camera, ...
                           'scroll', @zoom_camera);
%   mmObject.enable(true);
%   display(mmObject);

  % Nested functions:

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
    set(hObject, 'CameraPosition', [-10 -10 10], ...
                 'CameraTarget', [0 0 0], ...
                 'CameraUpVector', [0 0 1], ...
                 'CameraViewAngle', 30);
 
function pushbutton_zoom_Callback(~,~)
global wingFig
z = zoom;
setAxes3DPanAndZoomStyle(z,wingFig,'camera');
zoom on
           
function pushbutton_zoom_reset_Callback(~,~)
zoom out 

function pushbutton_pan_Callback(~,~)
global wingFig
p = pan;
setAxes3DPanAndZoomStyle(p,wingFig,'camera');
pan on   

% Temporary pushbutton for building wing structure code
function pushbutton_wingStructure_Callback(~,~)
wingStructureDrawing;
axis equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view(3);
lighting gouraud
camlight;

% Chord--------------------------------------------------------
        function txtbox_chord_Callback(hObject,~)
            global c b ARWing wingArea tp c_activate b_activate selected...
                wingParametersPanel
            c = str2double(get(hObject,'String'));
            c_activate = 0;
            b_activate = 1;
            wingArea = (b/2)*c*(1+tp);
            ARWing = b^2/wingArea;
            uicontrol('Parent',wingParametersPanel','Style','edit','String',ARWing,'Position',[294 675 35 25],'Callback',@txtbox_AR_Callback);
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
% Wing Span----------------------------------------------------
        function txtbox_span_Callback(hObject,~)
            global b ARWing c wingArea tp b_activate c_activate selected...
                wingParametersPanel
            b = str2double(get(hObject,'String'));
            b_activate = 0;
            c_activate = 1;
            wingArea = (b/2)*c*(1+tp);
            ARWing = b^2/wingArea;
            uicontrol('Parent',wingParametersPanel','Style','edit','String',ARWing,'Position',[294 675 35 25],'Callback',@txtbox_AR_Callback);
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end                          
% Aspect Ratio-------------------------------------------------
        function txtbox_AR_Callback(hObject,~)
            global ARWing b c tp c_activate b_activate selected...
                wingParametersPanel
            ARWing = str2double(get(hObject,'String'));
            SrefWing = b^2/ARWing;
%             SrefWing = (b/2)*c*(1+tp);
            if c_activate == 1
                c = (2*SrefWing)/(b*(1+tp));
                uicontrol('Parent',wingParametersPanel','Style','edit','String',c,'Position',[157 675 30 25],'Callback',@txtbox_chord_Callback);
            elseif b_activate == 1
                b = (2*SrefWing)/(c*(1+tp));
                uicontrol('Parent',wingParametersPanel','Style','edit','String',b,'Position',[225 675 35 25],'Callback',@txtbox_span_Callback);
            end
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
% Dihedral-----------------------------------------------------
        function txtbox_dihedral_Callback(hObject,~)
            global Gam selected
            Gam = str2double(get(hObject,'String'));
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
% Sweep--------------------------------------------------------
        function txtbox_sweep_Callback(hObject,~)
            global LamLE selected
            LamLE = str2double(get(hObject,'String'));
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end
% Taper--------------------------------------------------------
        function txtbox_taper_Callback(hObject,~)
            global tp selected ARWing wingParametersPanel b c
            tp = str2double(get(hObject,'String'));
            if tp < 0
                errordlg('Taper ratio must be greater than 0','Invalid Input','modal');
            end
            wingArea = (b/2)*c*(1+tp);
            ARWing = b^2/wingArea;
            uicontrol('Parent',wingParametersPanel','Style','edit','String',ARWing,'Position',[294 675 35 25],'Callback',@txtbox_AR_Callback);
            if selected == 1
                pushbutton_top_Callback;
            elseif selected == 2
                pushbutton_front_Callback;
            elseif selected == 3
                pushbutton_side_Callback;
            elseif selected == 4
                pushbutton_iso_Callback;
            end