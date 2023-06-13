function wingPlanform
% Written by Mark D. Miller Jr.
% 12/30/19

global wingPlanformTab wingPlanformPanel

% Panels
% Wing Planform
wingPlanformPanel = uipanel('Parent',wingPlanformTab,'Title','Wing Planform','FontSize',12,'Position',[.01 .3 .98 .5]);

wingPlanformDrawing;

function wingPlanformDrawing
global b cr ct Gam LamLE FH XW1 XW2 XW3 XW4 ZW1 ZW2 ZW3 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp i_w c wingFig wingPlanformPanel ARWing tipChord rootChord...
    comboAirfoil_coords_xRoot comboAirfoil_coords_yRoot comboAirfoil_coords_xTip...
    comboAirfoil_coords_yTip masterFile fpActivated

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% delete(wingFig);
wingFig = axes('Parent',wingPlanformPanel','Position',[0.06 0.22 .92 .7]);

% Run Combined Airfoils Code to ensure root and tip arrays are same size
combinedAirfoils;

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Wing');

% Initial Data	 
cr      =	1;	%	Wing Chord (root)	,	in
ct      =	1;	%	Wing Chord (tip)	,	in
FH      =	1;	%	Fuselage Height	,	in
i_w = 0;

wingArea = (b/2)*c*(1+tp);
ARWing = b^2/wingArea;

if isempty(rootChord) == 1 || isempty(tipChord) == 1
    rootChord = c;
    tipChord  = c*tp;
end

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW3=XW2+tipChord;
XW4=XW1+rootChord;

% Z-Coordinates
ZW1=rootChord*sind(i_w);
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
ZW3=(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);

XWRRoot = ((comboAirfoil_coords_xRoot).*rootChord)+XW1;
XWRTip  = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

YWRT = zeros(length(XWRRoot),2);

ZWRRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
ZWRTip = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

YWRT(:,1) = 0;
YWRT(:,2) = b/2-((b/2)-(b/2)*cosd(Gam));
XWRT = [XWRRoot,XWRTip];
ZWRT = [ZWRRoot,ZWRTip];

% Plot Right Wing
WRT = surface(XWRT,YWRT,ZWRT);

XWRLRoot = ((comboAirfoil_coords_xRoot).*rootChord)+XW1;
XWRLTip = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

YWRT3 = zeros(length(XWRRoot),2);

ZWRLRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
ZWRLTip = ((comboAirfoil_coords_yTip).*tipChord)+ZW2;

YWRT3(:,1) = 0;
YWRT3(:,2) = -b/2+((b/2)-(b/2)*cosd(Gam));
XWRT3 = [XWRLRoot,XWRLTip];
ZWRT3 = [ZWRLRoot,ZWRLTip];

% Plot Left Wing
WRT3 = surface(XWRT3,YWRT3,ZWRT3);

set(wingPlanformPanel, 'ButtonDownFcn', {@selectedWingPlanform, wingPlanformPanel});

axis tight equal
    
% Activate Fuselage Parameters
fpActivated = 0;

% colormap(bone)
% shading interp
% material metal
% lighting gouraud;
% camlight;

% light('Position',[1 2 2]);
% light('Position',[-3 -1 3]);
% light('Position',[15 40 -4]);

function selectedWingPlanform(~, ~, ~)
    global combinedWindowsFig wingFig mmObjectWingPlanformMod mmObjectWingPlanform...
        masterFile
    
% Revert file access to master file
cd(masterFile);

% Access MouseManager Folder
cd('MouseManager');

if isempty(mmObjectWingPlanform) ~= 1 && mmObjectWingPlanform.enabled == 1
    % Disable Mousemanager
    mmObjectWingPlanform.remove_item(wingFig);
    mmObjectWingPlanform.enable(false);
else
    % Create MouseManager and intialize:
    mmObjectWingPlanform = MouseManager(combinedWindowsFig);
    mmObjectWingPlanform.add_item(wingFig, {'click', 'drag'}, 'normal', @orbit_camera, ...
                           {'click', 'drag'}, 'alt', @dolly_camera, ...
                           'click', 'open', @reset_camera, ...
                           'scroll', @zoom_camera); 
    if isempty(mmObjectWingPlanformMod) ~= 1                  
        mmObjectWingPlanformMod.enable(false);
    end
    mmObjectWingPlanform.enable(true);
end


% % WRT.SpecularStrength = 1.0;
% % WRT.DiffuseStrength = .5;
% % WRT.AmbientStrength = .25;
% % WRT.SpecularExponent = 15;
% % % WRT.BackFaceLighting = 'lit';
% % 
% % WRT3.SpecularStrength = 1.0;
% % WRT3.DiffuseStrength = .5;
% % WRT3.AmbientStrength = .25;
% % WRT3.SpecularExponent = 15;
% % 
% % lightangle(-2,14);
% % lightangle(180,8);
% % lightangle(-179,-2);
% % lightangle(-4,-4);
% 
% % WRT3.BackFaceLighting = 'lit';
% 
% % hold on
% % fill3(XWR2,YWR2,ZWR2,[.5 .5 .5]);
% % fill3(XWR2,-YWR2,ZWR2,[.5 .5 .5]);

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


    
