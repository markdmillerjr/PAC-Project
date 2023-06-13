function initialFuselageDesign
% Written by Mark D. Miller Jr.
% 5/19/20

global initialFuselageDesignTab fuselageDimensionsPanel fuselagePlanformPanel L R

fuselageDimensionsPanel   = uipanel('Parent',initialFuselageDesignTab,'Title','Fuselage Dimensions','FontSize',12,'Position',[.78 .6 .21 .17]);
fuselagePlanformPanel     = uipanel('Parent',initialFuselageDesignTab,'Title','Fuselage Planform','FontSize',12,'Position',[0 0 .99 .58]);

% Static Texts
%------------------------------------------------------------------------
    % Fuselage length
uicontrol('Parent',fuselageDimensionsPanel,'Style','text','String','Fuselage Length','Position',[35 75 100 25],'FontSize',10);
        % Units
        uicontrol('Parent',fuselageDimensionsPanel,'Style','text','String','ft','Position',[90 48 35 25]);
    % Fuselage radius
uicontrol('Parent',fuselageDimensionsPanel,'Style','text','String','Fuselage Radius','Position',[35 25 100 25],'FontSize',10);
        % Units
        uicontrol('Parent',fuselageDimensionsPanel,'Style','text','String','ft','Position',[90 5 35 20]);
    % Nosecone length
% uicontrol('Parent',fuselageParametersTab,'Style','text','String','-Length','Position',[40 85 40 25]);
        % Units
%         uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[70 65 35 25]);
    % Tailcone length
% uicontrol('Parent',fuselageParametersTab,'Style','text','String','-Length','Position',[440 85 40 25]);
        % Units
%         uicontrol('Parent',fuselageParametersTab,'Style','text','String','ft','Position',[470 65 35 25]);

% Textboxs
%--------------------------------------------------------------------------
    % Fuselage length
uicontrol('Parent',fuselageDimensionsPanel,'Style','edit','String',L,'Position',[60 52 40 25],'Callback',@txtbox_fuseLength_Callback);
    % Fuselage radius
uicontrol('Parent',fuselageDimensionsPanel,'Style','edit','String',R,'Position',[60 6 40 25],'Callback',@txtbox_fuseRadius_Callback);
    % Nosecone length
% uicontrol('Parent',fuselageParametersTab,'Style','edit','String',nL,'Position',[50 70 30 25],'Callback',@txtbox_noseLength_Callback);
    % Tailcone length
% uicontrol('Parent',fuselageParametersTab,'Style','edit','String',tL,'Position',[450 70 30 25],'Callback',@txtbox_tailLength_Callback);

% Pushbuttons
% -------------------------------------------------------------------------
% Fuselage
    % Top
uicontrol('Parent',initialFuselageDesignTab,'Style','pushbutton','String','Top','Position',[574 419 60 20],'Callback',@pushbutton_top_Callback);
    % Front
uicontrol('Parent',initialFuselageDesignTab,'Style','pushbutton','String','Front','Position',[634 419 60 20],'Callback',@pushbutton_front_Callback); 
    % Side
uicontrol('Parent',initialFuselageDesignTab,'Style','pushbutton','String','Side','Position',[694 419 60 20],'Callback',@pushbutton_side_Callback);
    % Isometric
uicontrol('Parent',initialFuselageDesignTab,'Style','pushbutton','String','Isometric','Position',[754 419 60 20],'Callback',@pushbutton_iso_Callback);

%% Fuselage------------------------------------
function fuselageParametersDrawing
global R L fuselagePlanform iso nL xcf ycf zcf tL

delete(iso);
iso = axes('Parent',fuselagePlanform,'Position',[0.13 0.15 .8 .80]);
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

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view([140 30]); 
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
    pushbutton_iso_Callback;
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
    pushbutton_iso_Callback;
    pushbutton_noseiso_Callback;
    pushbutton_tailiso_Callback;
    end

