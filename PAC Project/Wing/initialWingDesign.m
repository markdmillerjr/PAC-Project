function initialWingDesign
% Written by Mark D. Miller Jr.
% 3/27/2020

global iwdActivated selected masterFile airActivated

% Revert file access to master file
cd(masterFile);

% Access Wing Folder
cd('Wing');

wingAreaEstimate;
wingDimensionComponents;

% pushbutton_top_Callback;

% if airActivated == 1
if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end
    % Deactivate handle to airfoil so won't reload initialWingDesign since
    % already loaded it
%     airActivated = 0;
% end

% Initial wing design tab is opened, tabs are initially closed
iwdActivated = 0;

function wingAreaEstimate
global wingAreaPanel WTO WTO_S initialWingArea

% Takeoff Wing Loading
uicontrol('Parent',wingAreaPanel,'Style','text','String','Takeoff Wing Loading (WTO/S):','Position',[20 85 230 25],'Fontsize',10,'Fontweight','bold');
uicontrol('Parent',wingAreaPanel,'Style','edit','String',WTO_S,'Position',[240 90 50 25],'Enable','off','Fontsize',10);
uicontrol('Parent',wingAreaPanel,'Style','text','String','lb/ft^2','Position',[290 85 40 25],'Fontsize',9);

% Estimate Wing Area from wing loading and WTO estimate
initialWingArea =  WTO/WTO_S;

% Wing Area Estimate
uicontrol('Parent',wingAreaPanel,'Style','text','String','Wing Area Estimate (Sref):','Position',[20 45 230 25],'Fontsize',10,'Fontweight','bold');
uicontrol('Parent',wingAreaPanel,'Style','edit','String',initialWingArea,'Position',[240 50 50 25],'Enable','off','Fontsize',10,'Enable','off');
uicontrol('Parent',wingAreaPanel,'Style','text','String','ft^2','Position',[290 45 30 25],'Fontsize',9);

function wingDimensionComponents
global tp c b Gam LamLE ARWing wingPlanformTab wingDimensionsPlanformPanel...
    initialWingArea initialARWing initialWingSpan initialRootChord initialTipChord

% Wing Dimension Calculations----------------------------------------------
% Wing Span
initialWingSpan  = sqrt(initialARWing*initialWingArea);
b = initialWingSpan;

if isempty(tp) == 1 || isempty(LamLE) == 1 || isempty(Gam) == 1
    tp    = 1;
    LamLE = 0;
    Gam   = 0;
end

% Root Chord
initialRootChord = initialWingArea/((initialWingSpan/2)*(1+tp));
c = initialRootChord;

% Tip Chord
initialTipChord  = tp*initialRootChord;
ARWing = initialARWing;

% Construct the components
%% Static Texts------------------------------------------------------------
% Wing Area
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Reference Area','Position',[5 100 100 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','ft^2','Position',[65 75 35 25]);
    
% Wing Aspect Ratio
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Aspect Ratio','Position',[120 100 80 25],'Fontsize',9);    

% Wing Span
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Span','Position',[233 100 35 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','ft','Position',[265 75 35 25]);    
    
% Wing Taper
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Taper Ratio','Position',[300 100 100 25],'Fontsize',9);    
    
% Wing Sweep
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Sweep','Position',[25 40 40 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','deg','Position',[65 15 35 25]);

% Wing Dihedral
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Dihedral','Position',[132 40 50 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','deg','Position',[175 15 35 25]);    

% Root Chord
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Root Chord','Position',[220 40 70 25],'Fontsize',9);
%     Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','ft','Position',[265 15 35 25]);
    
% Tip Chord
uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','Tip Chord','Position',[300 40 100 25],'Fontsize',9);
    % Units
    uicontrol('Parent',wingDimensionsPlanformPanel','Style','text','String','ft','Position',[365 15 35 25]);


%% Textboxes---------------------------------------------------------------
% Wing Area
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',initialWingArea,'Position',[25 80 45 25],'Callback',@txtbox_wingArea_Callback);

% Aspect Ratio
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',initialARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

% Wing Span
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',initialWingSpan,'Position',[230 80 45 25],'Callback',@txtbox_span_Callback);

% Wing Taper
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',tp,'Position',[330 80 45 25],'Callback',@txtbox_taper_Callback);

% Wing Sweep
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',LamLE,'Position',[25 20 45 25],'Callback',@txtbox_sweep_Callback);

% Wing Dihedral
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',Gam,'Position',[135 20 45 25],'Callback',@txtbox_dihedral_Callback);

% Root Chord
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',initialRootChord,'Position',[230 20 45 25],'Callback',@txtbox_rootChord_Callback);

% Tip Chord
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',initialTipChord,'Position',[330 20 45 25],'Callback',@txtbox_tipChord_Callback);

% if isempty(tp) ~= 1
%     wingPlanform;
% end

%% Pushbuttons-------------------------------------------------------------
% Top
uicontrol('Parent',wingPlanformTab','Style','pushbutton','String','Top','Position',[755 190 60 20],'Callback',@pushbutton_top_Callback);    
% Front
uicontrol('Parent',wingPlanformTab','Style','pushbutton','String','Front','Position',[755 170 60 20],'Callback',@pushbutton_front_Callback); 
% Side
uicontrol('Parent',wingPlanformTab','Style','pushbutton','String','Side','Position',[755 150 60 20],'Callback',@pushbutton_side_Callback);   
% Isometric
uicontrol('Parent',wingPlanformTab','Style','pushbutton','String','Isometric','Position',[755 130 60 20],'Callback',@pushbutton_iso_Callback);    

%% Wing Planform Views
function pushbutton_top_Callback(~, ~)
global selected masterFile comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize b tipChord LamLE Gam wingFig

% Revert file access to master file
cd(masterFile);

% Access Wing Folder
cd('Wing');

% Load Wing Planform file
wingPlanform;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 90;
el = 90;
view(az,el);

shading(wingFig, 'interp');
lighting gouraud;
camlight;

hold on

% Left Wing Tip
XWLT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWLT = zeros(comboAirfoilSize,1)-b/2;
ZWLT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWLT,YWLT,ZWLT,[.5 .5 .5]); 

% Right Wing Tip
XWRT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWRT = zeros(comboAirfoilSize,1)+b/2;
ZWRT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWRT,YWRT,ZWRT,[.5 .5 .5]);

selected = 1;
            
function pushbutton_front_Callback(~,~)
global selected masterFile b comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize tipChord LamLE Gam

% Revert file access to master file
cd(masterFile);

% Access Wing Folder
cd('Wing');

% Load Wing Planform file
wingPlanform;

% axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = -90;
el = 0;
view(az,el);

shading interp
lighting gouraud;
camlight;

hold on

% Left Wing Tip
XWLT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWLT = zeros(comboAirfoilSize,1)-b/2;
ZWLT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWLT,YWLT,ZWLT,[.5 .5 .5]); 

% Right Wing Tip
XWRT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWRT = zeros(comboAirfoilSize,1)+b/2;
ZWRT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWRT,YWRT,ZWRT,[.5 .5 .5]);

selected = 2;
            
function pushbutton_side_Callback(~,~)
global selected masterFile comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize tipChord b LamLE Gam

% Revert file access to master file
cd(masterFile);

% Access Wing Folder
cd('Wing');

% Load Wing Planform file
wingPlanform;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
az = 0;
el = 360;
view(az,el);

shading interp
lighting gouraud;
camlight;

hold on

% Left Wing Tip
XWLT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWLT = zeros(comboAirfoilSize,1)-b/2;
ZWLT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWLT,YWLT,ZWLT,[.5 .5 .5]); 

% Right Wing Tip
XWRT = comboAirfoil_coords_xTip.*tipChord+(b/2*tand(LamLE));
YWRT = zeros(comboAirfoilSize,1)+b/2;
ZWRT = comboAirfoil_coords_yTip.*tipChord+(b/2*tand(Gam));
fill3(XWRT,YWRT,ZWRT,[.5 .5 .5]);

selected = 3;
             
function pushbutton_iso_Callback(~,~)
global selected masterFile comboAirfoil_coords_xTip comboAirfoil_coords_yTip...
    comboAirfoilSize tipChord b LamLE Gam

% Revert file access to master file
cd(masterFile);

% Access Wing Folder
cd('Wing');

% Load Wing Planform file
wingPlanform;

axis tight equal
xlabel('X (ft)')
ylabel('Y (ft)')
zlabel('Z (ft)')
grid on
view(3);

shading interp
lighting gouraud;
camlight;

% alpha(wingFig,.5);

hold on

% Left Wing Tip
XWLT = comboAirfoil_coords_xTip.*(tipChord)+(b/2*tand(LamLE));
YWLT = zeros(comboAirfoilSize,1)-b/2;
ZWLT = comboAirfoil_coords_yTip.*(tipChord)+(b/2*tand(Gam));
fill3(XWLT,YWLT,ZWLT,[.5 .5 .5]); 

% Right Wing Tip
XWRT = comboAirfoil_coords_xTip.*(tipChord)+(b/2*tand(LamLE));
YWRT = zeros(comboAirfoilSize,1)+b/2;
ZWRT = comboAirfoil_coords_yTip.*(tipChord)+(b/2*tand(Gam));
fill3(XWRT,YWRT,ZWRT,[.5 .5 .5]);

selected = 4;

% Wing Area
function txtbox_wingArea_Callback(hObject,~)
global wingArea wingDimensionsPlanformPanel ARWing wingSpan selected...
    wpmActivated wadActivated

wingArea = str2double(get(hObject,'String'));

% Update Wing Span
wingSpan = sqrt(ARWing*wingArea);
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',wingSpan,'Position',[230 80 45 25],'Callback',@txtbox_span_Callback);

if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end
wpmActivated = 0;
wadActivated = 0;

% Aspect Ratio-------------------------------------------------
function txtbox_AR_Callback(hObject,~)
global ARWing b tp selected wingDimensionsPlanformPanel rootChord c...
    wpmActivated wingArea tipChord wadActivated
    
ARWing = str2double(get(hObject,'String'));

if isempty(tp) == 1
    tp = 1;
end

% Update Wing Area
wingArea = b^2/ARWing;

% Update Root Chord
rootChord = (2*wingArea)/(b*(1+tp));
c = rootChord;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',rootChord,'Position',[230 20 45 25],'Callback',@txtbox_rootChord_Callback);

% Update Tip Chord
tipChord = tp*rootChord;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',tipChord,'Position',[330 20 45 25],'Callback',@txtbox_tipChord_Callback);
    
if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end
wpmActivated = 0;
wadActivated = 0;

% Wing Span----------------------------------------------------
function txtbox_span_Callback(hObject,~)
global b ARWing c wingArea tp selected wingDimensionsPlanformPanel...
    wpmActivated wingSpan wadActivated

wingSpan = str2double(get(hObject,'String'));
b = wingSpan; 

% Update Wing Area
wingArea = (b/2)*c*(1+tp);
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',wingArea,'Position',[25 80 45 25],'Callback',@txtbox_wingArea_Callback);

% Update Aspect Ratio
ARWing = b^2/wingArea;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',ARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end                              
wpmActivated = 0;
wadActivated = 0;

% Taper--------------------------------------------------------
function txtbox_taper_Callback(hObject,~)
global tp selected ARWing b c wingArea wingDimensionsPlanformPanel tipChord...
    rootChord initialRootChord wpmActivated wadActivated

tp = str2double(get(hObject,'String'));

if tp < 0
    errordlg('Taper ratio must be greater than 0','Invalid Input','modal');
end

% Update Wing Area
wingArea = (b/2)*c*(1+tp);
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',wingArea,'Position',[25 80 45 25],'Callback',@txtbox_wingArea_Callback);

% Update Aspect Ratio
ARWing = b^2/wingArea;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',ARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

% Update Tip Chord
if isempty(rootChord) == 1
    tipChord = tp*initialRootChord;
else
    tipChord = tp*rootChord;
end
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',tipChord,'Position',[330 20 45 25],'Callback',@txtbox_tipChord_Callback);

if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end    
wpmActivated = 0;
wadActivated = 0;

% Sweep--------------------------------------------------------
function txtbox_sweep_Callback(hObject,~)
global LamLE selected wpmActivated wadActivated

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
wpmActivated = 0;
wadActivated = 0;

% Dihedral-----------------------------------------------------
function txtbox_dihedral_Callback(hObject,~)
global Gam selected wpmActivated wadActivated

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
wpmActivated = 0;
wadActivated = 0;

% Root Chord----------------------------------------------------
function txtbox_rootChord_Callback(hObject,~)
global c b ARWing wingArea tp selected wingDimensionsPlanformPanel rootChord...
     wpmActivated tipChord wadActivated
rootChord = str2double(get(hObject,'String'));
c = rootChord;

% Update Wing Area
wingArea = (b/2)*c*(1+tp);
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',wingArea,'Position',[25 80 45 25],'Callback',@txtbox_wingArea_Callback);

% Update Aspect Ratio
ARWing = b^2/wingArea;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',ARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

% Update Tip Chord
tipChord = tp*rootChord;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',tipChord,'Position',[330 20 45 25],'Callback',@txtbox_tipChord_Callback);

if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end
wpmActivated = 0;
wadActivated = 0;

% Tip Chord-----------------------------------------------------
function txtbox_tipChord_Callback(hObject,~)
global tipChord wingDimensionsPlanformPanel tp rootChord selected ARWing...
    wingArea b c wpmActivated wadActivated
    
tipChord = str2double(get(hObject,'String'));
if isempty(tipChord) == 1
    tipChord = tp*rootChord;
end

% Update Taper Ratio
tp = tipChord/rootChord;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',tp,'Position',[330 80 45 25],'Callback',@txtbox_taper_Callback);

% Update Wing Area
wingArea = (b/2)*c*(1+tp);
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',wingArea,'Position',[25 80 45 25],'Callback',@txtbox_wingArea_Callback);

% Update Aspect Ratio
ARWing = b^2/wingArea;
uicontrol('Parent',wingDimensionsPlanformPanel','Style','edit','String',ARWing,'Position',[135 80 45 25],'Callback',@txtbox_AR_Callback);

if selected == 1
    pushbutton_top_Callback;
elseif selected == 2
    pushbutton_front_Callback;
elseif selected == 3
    pushbutton_side_Callback;
elseif selected == 4
    pushbutton_iso_Callback;
end
wpmActivated = 0;    
wadActivated = 0;
    
    
