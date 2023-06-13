function fuselageParameters
% Written by Mark D. Miller Jr.
% 7/14/17

global R L nR nL fP nP tP tR tL fuselageParametersTab fuselageParametersTabgp...
    fpActivated fuselageDimensionsPanel fuselageDesignTab fuselagePlanformPanel...
    fuselageRequirementsPanel fuselageRequirementsTab initialFuselageDesignTab...
    finalFuselageDesignTab fp

% Construct the components
% Tabs
% Tabs
fuselageParametersTabgp  = uitabgroup('Parent',fuselageParametersTab,'Position',[0 0 1 1]);
fuselageRequirementsTab  = uitab('Parent',fuselageParametersTabgp,'Title','Fuselage Requirements');
initialFuselageDesignTab = uitab('Parent',fuselageParametersTabgp,'Title','Initial Fuselage Design');
finalFuselageDesignTab   = uitab('Parent',fuselageParametersTabgp,'Title','Final Fuselage Design');

% Panels
fuselageRequirementsPanel = uipanel('Parent',fuselageDesignTab,'Title','Fuselage Requirements','FontSize',12,'Position',[0 .60 .77 .4]);
fuselageDimensionsPanel   = uipanel('Parent',fuselageDesignTab,'Title','Fuselage Dimensions','FontSize',12,'Position',[.78 .6 .21 .17]);
fuselagePlanformPanel     = uipanel('Parent',fuselageDesignTab,'Title','Fuselage Planform','FontSize',12,'Position',[0 0 .99 .58]);

fuselageRequirements;

fp = uipanel('Parent',fuselageRequirementsTab,'Title','Fuselage','FontSize',12,'Position',[.01 .58 .98 .3]);
nP = uipanel('Parent',fuselageRequirementsTab,'Title','Nosecone','FontSize',12,'Position',[.01 .2 .49 .38]);
tP = uipanel('Parent',fuselageRequirementsTab,'Title','Tailcone','FontSize',12,'Position',[.51  .2 .48 .38]); 
  
% Static Texts
%------------------------------------------------------------------------
    % Fuselage length
uicontrol('Parent',fuselageParametersTab,'Style','text','String','Fuselage Length','Position',[400 715 100 25],'FontSize',10);
%         % Units
        uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[462 688 35 25]);
%     % Fuselage radius
uicontrol('Parent',fuselageParametersTab,'Style','text','String','Fuselage Radius','Position',[400 665 100 25],'FontSize',10);
%         % Units
        uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[462 645 35 20]);
    % Nosecone length
uicontrol('Parent',fuselageParametersTab,'Style','text','String','Nosecone Length','Position',[600 715 120 25],'FontSize',10);
        % Units
        uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[655 688 35 25]);
    % Tailcone length
uicontrol('Parent',fuselageParametersTab,'Style','text','String','Tailcone Length','Position',[600 665 120 25],'FontSize',10);
        % Units
        uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[655 645 35 20]);

% Textboxs
%--------------------------------------------------------------------------
    % Fuselage length
uicontrol('Parent',fuselageParametersTab,'Style','edit','String',L,'Position',[430 695 40 25],'Callback',@txtbox_fuseLength_Callback);
%     % Fuselage radius
uicontrol('Parent',fuselageParametersTab,'Style','edit','String',R,'Position',[430 645 40 25],'Callback',@txtbox_fuseRadius_Callback);
    % Nosecone length
uicontrol('Parent',fuselageParametersTab,'Style','edit','String',nL,'Position',[630 695 30 25],'Callback',@txtbox_noseLength_Callback);
    % Tailcone length
uicontrol('Parent',fuselageParametersTab,'Style','edit','String',tL,'Position',[630 645 30 25],'Callback',@txtbox_tailLength_Callback);

% Pushbuttons
% -------------------------------------------------------------------------
% Fuselage
    % Top
uicontrol('Parent',fuselageDesignTab,'Style','pushbutton','String','Top','Position',[574 419 60 20],'Callback',@pushbutton_top_Callback);
    % Front
uicontrol('Parent',fuselageDesignTab,'Style','pushbutton','String','Front','Position',[634 419 60 20],'Callback',@pushbutton_front_Callback); 
    % Side
uicontrol('Parent',fuselageDesignTab,'Style','pushbutton','String','Side','Position',[694 419 60 20],'Callback',@pushbutton_side_Callback);
    % Isometric
uicontrol('Parent',fuselageDesignTab,'Style','pushbutton','String','Isometric','Position',[754 419 60 20],'Callback',@pushbutton_iso_Callback); 

% -----------------------------------------------------------------------------
% Nosecone
%     Top   
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Top','Position',[220 95 60 20],'Callback',@pushbutton_nosetop_Callback);
    % Front
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Front','Position',[220 75 60 20],'Callback',@pushbutton_nosefront_Callback); 
    % Side
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Side','Position',[220 55 60 20],'Callback',@pushbutton_noseside_Callback);
    % Isometric
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Isometric','Position',[220 35 60 20],'Callback',@pushbutton_noseiso_Callback);  

%----------------------------------------------------------------------------
% Tailcone
    % Top
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Top','Position',[575 95 60 20],'Callback',@pushbutton_tailtop_Callback);
    % Front
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Front','Position',[575 75 60 20],'Callback',@pushbutton_tailfront_Callback); 
    % Side
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Side','Position',[575 55 60 20],'Callback',@pushbutton_tailside_Callback);
    % Isometric
uicontrol('Parent',fuselageParametersTab,'Style','pushbutton','String','Isometric','Position',[575 35 60 20],'Callback',@pushbutton_tailiso_Callback);  

%--------------------------------------------------------------------------	
x = size(L);
y = size(nL);
z = size(tL);
w = size(R);

if x(1) >= 1 && y(1) >= 1 && z(1) >= 1 && w(1) >= 1
nR      =   1;              % Nosecone radius
tR      =   1;              % Tailcone radius

fuselageParametersDrawing;
% noseconeParametersDrawing;
% tailconeParametersDrawing;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
% view([140 30]); 
az = 90;
el = -90;
view(az,el);
lighting gouraud
else 
    L  = 1;
    nL = 1;
    tL = 1;
    R  = 1;
end

fpActivated = 1;

%% Fuselage------------------------------------
function fuselageParametersDrawing
global R L fp iso nL xcf ycf zcf tL

delete(iso);
iso = axes('Parent',fp,'Position',[0.13 0.15 .8 .80]);
fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;
iArray = [1 .95 .9 .85 .75 .6 .5];

  % Fuselage: 
[xcf,zcf,ycf] = cylinder(R); 
surface(xcf+x,y-ycf*L,z+zcf*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

  % Nosecone: 
[xcn,zcn,ycn] = cylinder(R.*(iArray).*(cos(linspace(0,pi/2,length(iArray))).^.2)); 
zcn(6:end,:) = zcn(6:end,:)-R/100; 
ycn = -ycn.*.7*1; 
surface(xcn+x,y-ycn*(.15*L),z+zcn*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% Tail
x1 = xcf(1,:); 
x2 = .8*x1;
y1 = L*ones(size(x1)); 
y2 = y1+(.2*L); 
z1 = zcf(1,:); 
z2 = R*ones(size(z1)); 
surface(x+[x1;x2],y-[y1;y2],z+[z1;z2]*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

colormap(bone)
shading interp

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
% view([140 30]); 
az = 90;
el = -90;
view(az,el);
lighting gouraud
camlight

%% Fuselage Shape
function pushbutton_top_Callback(~,~)
fuselageParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = -90;
view(az,el);
lighting gouraud
camlight

function pushbutton_front_Callback(~,~)   
fuselageParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 180;
el = 0;
view(az,el);
lighting gouraud 

function pushbutton_side_Callback(~,~)
fuselageParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 0;
view(az,el);
lighting gouraud

function pushbutton_iso_Callback(~,~)
fuselageParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting gouraud

            
%% Nosecone----------------------------------- 
function noseconeParametersDrawing
global R nL nP noseiso
            
delete(noseiso);
noseiso = axes('Parent',nP,'Position',[0.15 0.17 .8 .78]);
 
fusColor      = [.5 .5 .5];
edgeColor     = 'g';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;
iArray = [1 .95 .9 .85 .75 .6 .5];

  % Nosecone: 
[xcn,zcn,ycn] = cylinder(R.*(iArray).*(cos(linspace(0,pi/2,length(iArray))).^.2)); 
zcn(6:end,:) = zcn(6:end,:)-R/100; 
ycn = -ycn.*.7*1; 
% surface(xcn+x,y-ycn*nL,z+zcn*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
surface(xcn+x,y-ycn*nL,z+zcn*1,'facecolor',[.5 .5 .5]);

colormap(bone)
shading interp

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting none
% lightangle([180 180]);
camlight right
camlight headlight
material metal

function pushbutton_nosetop_Callback(~,~)
noseconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = -90;
view(az,el);
lighting gouraud
camlight

function pushbutton_nosefront_Callback(~,~)
noseconeParametersDrawing;
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
        
function pushbutton_noseside_Callback(~,~) 
noseconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 0;
view(az,el);
lighting gouraud
camlight
            
function pushbutton_noseiso_Callback(~,~)
noseconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting gouraud


%% Tailcone---------------------------------------
function tailconeParametersDrawing
global tL tP tailiso L R xcf zcf
            
delete(tailiso);
tailiso = axes('Parent',tP,'Position',[0.15 0.17 .8 .78]);
 
fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;

% Tail
x1 = xcf(1,:); 
x2 = .8*x1;% zeros(size(x1)); 
y1 = L*ones(size(x1)); 
y2 = y1+tL; 
z1 = zcf(1,:); 
z2 = R*ones(size(z1)); 
surface(x+[x1;x2],y-[y1;y2],z+[z1;z2]*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

colormap(bone)
shading interp

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting none
camlight right
camlight headlight
material metal

function pushbutton_tailtop_Callback(~,~)
tailconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 270;
el = -90;
view(az,el);
lighting gouraud
camlight

function pushbutton_tailfront_Callback(~,~)
tailconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 0;
el = 360;
view(az,el);
lighting gouraud
camlight

function pushbutton_tailside_Callback(~,~)
tailconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 0;
view(az,el);
lighting gouraud
camlight
          
function pushbutton_tailiso_Callback(~,~)
tailconeParametersDrawing;
axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
lighting gouraud
camlight


% Fuselage Length---------------------------------
    function txtbox_fuseLength_Callback(hObject,~)
    global L LUsed RUsed nLUsed tLUsed sizeLUsed sizeRUsed sizenLUsed sizetLUsed
    L = str2double(get(hObject,'String'));
    LUsed = 1;
    sizeLUsed = size(LUsed);
    sizeRUsed = size(RUsed);
    sizenLUsed = size(nLUsed);
    sizetLUsed = size(tLUsed);
    if sizeLUsed(1) ~= 0 && sizeRUsed(1) ~= 0 && sizenLUsed(1) ~= 0 && sizetLUsed(1) ~= 0
    pushbutton_top_Callback;
    pushbutton_noseiso_Callback;
    pushbutton_tailiso_Callback;
    end
% Fuselage Radius---------------------------------
    function txtbox_fuseRadius_Callback(hObject,~)
    global R LUsed RUsed nLUsed tLUsed sizeLUsed sizeRUsed sizenLUsed sizetLUsed
    R = str2double(get(hObject,'String'));
    RUsed = 1;
    sizeRUsed = size(RUsed);
    sizeLUsed = size(LUsed);
    sizenLUsed = size(nLUsed);
    sizetLUsed = size(tLUsed);
    if sizeLUsed(1) ~= 0 && sizeRUsed(1) ~= 0 && sizenLUsed(1) ~= 0 && sizetLUsed(1) ~= 0
    pushbutton_top_Callback;
    pushbutton_noseiso_Callback;
    pushbutton_tailiso_Callback;
    end
% Nosecone Length---------------------------------
    function txtbox_noseLength_Callback(hObject,~)
    global nL LUsed RUsed nLUsed tLUsed sizeLUsed sizeRUsed sizenLUsed sizetLUsed
    nL = str2double(get(hObject,'String')); 
    nLUsed = 1;
    sizenLUsed = size(nLUsed);
    sizeLUsed = size(LUsed);
    sizeRUsed = size(RUsed);
    sizetLUsed = size(tLUsed);
    if sizeLUsed(1) ~= 0 && sizeRUsed(1) ~= 0 && sizenLUsed(1) ~= 0 && sizetLUsed(1) ~= 0
    pushbutton_top_Callback;
    pushbutton_noseiso_Callback;
    end
% Tailcone Length---------------------------------
    function txtbox_tailLength_Callback(hObject,~)
    global tL LUsed RUsed nLUsed tLUsed sizeLUsed sizeRUsed sizenLUsed sizetLUsed
    tL = str2double(get(hObject,'String'));
    tLUsed = 1;
    sizetLUsed = size(tLUsed);
    sizeLUsed = size(LUsed);
    sizeRUsed = size(RUsed);
    sizenLUsed = size(nLUsed);
    if sizeLUsed(1) ~= 0 && sizeRUsed(1) ~= 0 && sizenLUsed(1) ~= 0 && sizetLUsed(1) ~= 0
    pushbutton_top_Callback;
    pushbutton_tailiso_Callback;
    pushbutton_noseiso_Callback;
    end
    
    
    
    
    