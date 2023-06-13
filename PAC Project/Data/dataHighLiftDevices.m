function dataHighLiftDevices
% Written by Mark D. Miller Jr.
% 6/15/19
% Allows modeling of 2D TE flaps and LE slats onto the wing.

flapDimensions;
aircraftWing;
flap;
aileron;
wingAirfoil;
flapAngle;
horizontalTail;
elevator;
horizontalTailAirfoil;
elevatorAngle;
verticalTail;
rudder;
verticalTailAirfoil;
rudderAngle;

function flapDimensions
global flapDimensionsPanel elevatorDimensionsPanel rudderDimensionsPanel...
    flapChord flapSpan flapSpanSpace elevatorChord elevatorSpan elevatorSpanSpace...
    rudderChord rudderHeight rudderHeightSpace aileronChord aileronSpan...
    aileronSpanSpace flapAngleDeg elevatorAngleDeg rudderAngleDeg

%% Static Text
% Flap Chord
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Flap Chord','Position',[20 316 60 20]);
% Flap Span
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Flap Span','Position',[100 316 60 20]);
% Distance from Wing Centerline
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Distance From Wing Centerline','Position',[180 316 150 20]);

% Flap Angle [deg]
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Flap Angle','Position',[25 40 80 20]);
% Deg
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','deg','Position',[80 20 30 20]);

% Aileron Chord
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Aileron Chord','Position',[360 316 70 20]);
% Aileron Span
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Aileron Span','Position',[450 316 70 20]);
% Distance from Wing Centerline
uicontrol('Parent',flapDimensionsPanel,'Style','text','String','Distance From Wing Centerline','Position',[540 316 150 20]);

% Elevator Chord
uicontrol('Parent',elevatorDimensionsPanel,'Style','text','String','Elevator Chord','Position',[5 300 80 25]);
% Elevator Span
uicontrol('Parent',elevatorDimensionsPanel,'Style','text','String','Elevator Span','Position',[100 300 80 25]);
% Distance from Horizontal Tail Centerline
uicontrol('Parent',elevatorDimensionsPanel,'Style','text','String','Distance From Horizontal Tail Centerline','Position',[200 295 150 40]);

% Elevator Angle [deg]
uicontrol('Parent',elevatorDimensionsPanel,'Style','text','String','Elevator Angle','Position',[25 35 80 20]);
% Deg
uicontrol('Parent',elevatorDimensionsPanel,'Style','text','String','deg','Position',[80 15 30 20]);

% Rudder Chord
uicontrol('Parent',rudderDimensionsPanel,'Style','text','String','Rudder Chord','Position',[5 300 80 25]);
% Rudder Span
uicontrol('Parent',rudderDimensionsPanel,'Style','text','String','Rudder Height','Position',[100 300 80 25]);
% Distance from Vertical Tail Centerline
uicontrol('Parent',rudderDimensionsPanel,'Style','text','String','Distance From Vertical Tail Centerline','Position',[180 290 150 40]);

% Rudder Angle [deg]
uicontrol('Parent',rudderDimensionsPanel,'Style','text','String','Rudder Angle','Position',[25 35 80 20]);
% Deg
uicontrol('Parent',rudderDimensionsPanel,'Style','text','String','deg','Position',[80 15 30 20]);

%% Textboxes
% Flap Chord
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',flapChord,'Position',[35 285 30 25],'Callback',@txtbox_flapChord_Callback);
% Flap Span
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',flapSpan,'Position',[115 285 30 25],'Callback',@txtbox_flapSpan_Callback);
% Distance from Wing Centerline
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',flapSpanSpace,'Position',[230 285 30 25],'Callback',@txtbox_flapSpanSpace_Callback);

% Aileron Chord
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',aileronChord,'Position',[380 285 30 25],'Callback',@txtbox_aileronChord_Callback);
% Aileron Span
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',aileronSpan,'Position',[470 285 30 25],'Callback',@txtbox_aileronSpan_Callback);
% Distance from Wing Centerline
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',aileronSpanSpace,'Position',[590 285 30 25],'Callback',@txtbox_aileronSpanSpace_Callback);

% Flap Angle [deg]
uicontrol('Parent',flapDimensionsPanel,'Style','edit','String',flapAngleDeg,'Position',[50 20 30 25],'Callback',@txtbox_flapAngle_Callback);

% Elevator Chord
uicontrol('Parent',elevatorDimensionsPanel,'Style','edit','String',elevatorChord,'Position',[30 280 30 25],'Callback',@txtbox_elevatorChord_Callback);
% Elevator Span
uicontrol('Parent',elevatorDimensionsPanel,'Style','edit','String',elevatorSpan,'Position',[130 280 30 25],'Callback',@txtbox_elevatorSpan_Callback);
% Distance from Horizontal Tail Centerline
uicontrol('Parent',elevatorDimensionsPanel,'Style','edit','String',elevatorSpanSpace,'Position',[260 280 30 25],'Callback',@txtbox_elevatorSpanSpace_Callback);

% Elevator Angle [deg]
uicontrol('Parent',elevatorDimensionsPanel,'Style','edit','String',elevatorAngleDeg,'Position',[50 15 30 25],'Callback',@txtbox_elevatorAngle_Callback);

% Rudder Chord
uicontrol('Parent',rudderDimensionsPanel,'Style','edit','String',rudderChord,'Position',[30 280 30 25],'Callback',@txtbox_rudderChord_Callback);
% Rudder Height
uicontrol('Parent',rudderDimensionsPanel,'Style','edit','String',rudderHeight,'Position',[130 280 30 25],'Callback',@txtbox_rudderHeight_Callback);
% Distance from Horizontal Tail Centerline
uicontrol('Parent',rudderDimensionsPanel,'Style','edit','String',rudderHeightSpace,'Position',[245 275 30 25],'Callback',@txtbox_rudderHeightSpace_Callback);

% Rudder Angle [deg]
uicontrol('Parent',rudderDimensionsPanel,'Style','edit','String',rudderAngleDeg,'Position',[50 15 30 25],'Callback',@txtbox_rudderAngle_Callback);

if isempty(flapChord) == 1 || isempty(flapSpan) == 1 || isempty(flapSpanSpace) == 1 ||...
        isempty(elevatorChord) == 1 || isempty(elevatorSpan) == 1 || isempty(elevatorSpanSpace) == 1 ||...
            isempty(aileronChord) == 1 || isempty(aileronSpan) == 1 || isempty(aileronSpanSpace) == 1
        
    flapChord         = 1;
    flapSpan          = 1;
    flapSpanSpace     = 0;
    flapAngleDeg      = 0;
    aileronChord      = 1;
    aileronSpan       = 1;
    aileronSpanSpace  = flapSpan + flapSpanSpace;
    elevatorChord     = 1;
    elevatorSpan      = 1;
    elevatorSpanSpace = 0;
    rudderChord       = 1;
    rudderHeight      = 1;
    rudderHeightSpace = 0;
end

%% Wing--------------------------------------------------------------------
function aircraftWing
global b c cr ct Gam LamLE FH XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3...
    ZW4 XWRT YWRT ZWRT XWRT3 YWRT3 ZWRT3 WRT WRT3 tp i_w wingOutline...
    flapDimensionsPanel wingTopViewPanel
 
 delete(wingOutline)
 wingOutline = axes('Parent',wingTopViewPanel,'OuterPosition',[0 0 1 1]);

    % X-Coordinates
    XW1=0;
    XW2=XW1+(b/c)*tand(LamLE);
    
    % Y-Coordinates
    YW2=b/2;
    
    XWRT = [(((XW1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((1+XW1)*c)-c)];
    YWRT = [(0),(YW2),(YW2),(0)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.01)
hold on
    XWRT3 = [(((XW1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((1+XW1)*c)-c)];
    YWRT3 = [(0),(-(YW2)),(-(YW2)),(0)];
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
                
function wingAirfoil
global airfoil_array airfoil_coords_x airfoil_coords_y XWR YWR ZWR WR ...
    flapDimensionsPanel airfoilFigWing comboAirfoil_coords_xRoot...
    comboAirfoil_coords_yRoot comboAirfoilSize
 
delete(airfoilFigWing);
airfoilFigWing = axes('Parent',flapDimensionsPanel,'Position',[0.2 0.01 0.25 0.2]);
% airfoilFigWing = axes('Parent',flapDimensionsPanel,'Position',[0.11 0.06 0.58 0.09]);
 % GOT ANOTHER PROBLEM!!!!!!!!!
 % For LamLE of 0 and less the plot gets all screwed up.

% Right Wing Root Airfoil
XWR = (comboAirfoil_coords_xRoot);
YWR = zeros(comboAirfoilSize);
ZWR = (comboAirfoil_coords_yRoot);
       
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
zlim([-.3 .3]);
xlim([0 1]);
      
function flap
global b c cr ct LamLE XW1 XW2 XW3 XW4 YW1 YW2 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp flapChord flapSpan flapSpanSpace
  
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

    XWRT = [((YW22)*(flapChord))-flapChord,(((XW22)*(flapChord))-(flapChord)),((XW22)*(flapChord)),((YW22)*(flapChord))];
    YWRT = [(flapSpanSpace),(flapSpan+flapSpanSpace),(flapSpan+flapSpanSpace),(flapSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)

hold on

    XWRT3 = [((YW22)*(flapChord))-flapChord,(((XW22)*(flapChord))-(flapChord)),((XW22)*(flapChord)),((YW22)*(flapChord))];
    YWRT3 = [-(flapSpanSpace),-(flapSpan+flapSpanSpace),-(flapSpan+flapSpanSpace),-(flapSpanSpace)];
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

function aileron
global b c cr ct LamLE XW1 XW2 XW3 XW4 YW1 YW2 XWRT YWRT ZWRT XWRT3 YWRT3...
    ZWRT3 WRT WRT3 tp aileronChord aileronSpan aileronSpanSpace flapSpan...
    flapSpanSpace
  
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

    XWRT = [((YW22)*(aileronChord))-aileronChord,(((XW22)*(aileronChord))-(aileronChord)),((XW22)*(aileronChord)),((YW22)*(aileronChord))];
    YWRT = [(aileronSpanSpace+flapSpan+flapSpanSpace),(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),(aileronSpanSpace+flapSpan+flapSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)

hold on

    XWRT3 = [((YW22)*(aileronChord))-aileronChord,(((XW22)*(aileronChord))-(aileronChord)),((XW22)*(aileronChord)),((YW22)*(aileronChord))];
    YWRT3 = [-(aileronSpanSpace+flapSpan+flapSpanSpace),-(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),-(aileronSpan+flapSpan+aileronSpanSpace+flapSpanSpace),-(aileronSpanSpace+flapSpan+flapSpanSpace)];
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

% Flap Chord 
function txtbox_flapChord_Callback(hObject,~)
global flapChord
flapChord = str2double(get(hObject,'String'));
aircraftWing;
flap;
aileron;
wingAirfoil;
flapAngle;

% Flap Span
function txtbox_flapSpan_Callback(hObject,~)
global flapSpan
flapSpan = str2double(get(hObject,'String'));
aircraftWing;
flap;
aileron;
wingAirfoil;
flapAngle;
    
% Distance from Wing Centerline
function txtbox_flapSpanSpace_Callback(hObject,~)
global flapSpanSpace
flapSpanSpace = str2double(get(hObject,'String'));
aircraftWing;
flap;    
aileron;
    
% Aileron Chord
function txtbox_aileronChord_Callback(hObject,~)
global aileronChord
aileronChord = str2double(get(hObject,'String'));
aircraftWing;
flap;
aileron;

% Aileron Span
function txtbox_aileronSpan_Callback(hObject,~)
global aileronSpan
aileronSpan = str2double(get(hObject,'String'));
aircraftWing;
flap;
aileron;

% Distance from Wing Centerline
function txtbox_aileronSpanSpace_Callback(hObject,~)
global aileronSpanSpace
aileronSpanSpace = str2double(get(hObject,'String'));
aircraftWing;
flap;    
aileron;

% Flap Angle
function txtbox_flapAngle_Callback(hObject,~)
global flapAngleDeg
flapAngleDeg = str2double(get(hObject,'String'));
wingAirfoil;
flapAngle;

function flapAngle
global flapChord flapAngleDeg c airfoil_size airfoil_coords_x...
    airfoil_coords_y comboAirfoilSize comboAirfoil_coords_xRoot...
    comboAirfoil_coords_yRoot

leadingEdgeFlapX  = (1-(flapChord/c));
leadingEdgeFlapZ  = 1;
trailingEdgeFlapZ = -(flapChord/c)*tand(flapAngleDeg)*2;
trailingEdgeFlapX = sqrt(1-trailingEdgeFlapZ^2);

storageArray = zeros(comboAirfoilSize);

for i = 1:comboAirfoilSize(1)
    if comboAirfoil_coords_xRoot(i) == 0
        storageArray(i) = i;
        break
    end
end

for j = 1:comboAirfoilSize(1)
    if j > storageArray(i)
        if abs(comboAirfoil_coords_xRoot(j) - leadingEdgeFlapX) <= .051
            storageArray(j) = j;
            leadingEdgeFlapZ = comboAirfoil_coords_yRoot(j);
        end
    end
end

line([leadingEdgeFlapX,trailingEdgeFlapX],[0,0],[leadingEdgeFlapZ,trailingEdgeFlapZ],'linewidth',2,'color','black');

%% Horizontal Tail---------------------------------------------------------
function horizontalTail
global bHorz cr LamLEHorz XW1 XW2 YW2 XWRTHorz YWRTHorz ZWRTHorz tpHorz...
    cHorz horizontalTailOutline horzTailTopViewPanel

delete(horizontalTailOutline)
horizontalTailOutline = axes('Parent',horzTailTopViewPanel,'OuterPosition',[0 0 1 1]);

    % X-Coordinates
    XW1=cr;
    XW2=XW1+(bHorz/cHorz)*tand(LamLEHorz);

    % Y-Coordinates
    YW2=bHorz/2;

    XWRTHorz = [(((0+XW1)*cHorz)-cHorz)+(-cHorz),(((0.*tpHorz+XW2)*cHorz)-cHorz)+(-cHorz),...
        (((1.*tpHorz+XW2)*cHorz)-cHorz)+(-cHorz),(((1+XW1)*cHorz)-cHorz)+(-cHorz)];
    YWRTHorz = [(0),(0 + YW2),(0 + YW2),(0)];
    ZWRTHorz = [0,0,0,0];
    WRT3 = fill3(-XWRTHorz,YWRTHorz,ZWRTHorz,[0.5 0.5 0.5]);
    alpha(WRT3,.001)
hold on
    XWRTHorz = [(((0+XW1)*cHorz)-cHorz)+(-cHorz),(((0.*tpHorz+XW2)*cHorz)-cHorz)+(-cHorz),...
        (((1.*tpHorz+XW2)*cHorz)-cHorz)+(-cHorz),(((1+XW1)*cHorz)-cHorz)+(-cHorz)];
    YWRTHorz = [(0),(0 + -YW2),(0 + -YW2),(0)];
    ZWRTHorz = [0,0,0,0];
    WRT3 = fill3(-XWRTHorz,YWRTHorz,ZWRTHorz,[0.5 0.5 0.5]);
    alpha(WRT3,.001)
        
function horizontalTailAirfoil
global airfoil_arrayHorz airfoil_coords_x_horz airfoil_coords_y_horz XWR...
    YWR ZWR WR elevatorDimensionsPanel airfoilFigHorz
 
delete(airfoilFigHorz);
% airfoilFigHorz = axes('Parent',elevatorDimensionsPanel,'Position',[0.35 0.03 0.45 0.2]);
airfoilFigHorz = axes('Parent',elevatorDimensionsPanel,'Position',[0.35 0.01 0.45 0.2]);

    % Right Wing Root
    XWR = (airfoil_coords_x_horz);
    YWR = (airfoil_arrayHorz);
    ZWR = (airfoil_coords_y_horz);
       
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
zlim([-.3 .3]);
xlim([0 1]);        

function elevator
global bHorz cr ct LamLEHorz XW1 XW2 XW3 XW4 YW1 YW2 tpHorz cHorz...
    elevatorSpan elevatorSpanMod elevatorChord elevatorSpanSpace

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

    XWRT = [((YW22)*(elevatorChord))-elevatorChord,(((XW22)*(elevatorChord))-(elevatorChord)),((XW22)*(elevatorChord)),((YW22)*(elevatorChord))];
    YWRT = [(elevatorSpanSpace),elevatorSpan+elevatorSpanSpace,elevatorSpan+elevatorSpanSpace,(elevatorSpanSpace)];
    ZWRT = [0,0,0,0];
    WRT  = fill3(-XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
    alpha(WRT,.5)
    
hold on

    XWRT3 = [((YW22)*(elevatorChord))-elevatorChord,(((XW22)*(elevatorChord))-(elevatorChord)),((XW22)*(elevatorChord)),((YW22)*(elevatorChord))];
    YWRT3 = [-(elevatorSpanSpace),-(elevatorSpan+elevatorSpanSpace),-(elevatorSpan+elevatorSpanSpace),-(elevatorSpanSpace)];
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

% Elevator Chord
function txtbox_elevatorChord_Callback(hObject,~)
global elevatorChord
elevatorChord = str2double(get(hObject,'String'));
horizontalTail;
elevator;
horizontalTailAirfoil;
elevatorAngle;

% Elevator Span
function txtbox_elevatorSpan_Callback(hObject,~)
global elevatorSpan
elevatorSpan = str2double(get(hObject,'String'));
horizontalTail;
elevator;

% Distance from Horizontal Tail Centerline
function txtbox_elevatorSpanSpace_Callback(hObject,~)
global elevatorSpanSpace
elevatorSpanSpace = str2double(get(hObject,'String'));
horizontalTail;
elevator;

% Elevator Angle
function txtbox_elevatorAngle_Callback(hObject,~)
global elevatorAngleDeg
elevatorAngleDeg = str2double(get(hObject,'String'));
horizontalTailAirfoil;
elevatorAngle;

function elevatorAngle
global elevatorChord elevatorAngleDeg cHorz airfoil_sizeHorz airfoil_coords_x_horz...
    airfoil_coords_y_horz

leadingEdgeFlapX  = (1-(elevatorChord/cHorz));
leadingEdgeFlapZ  = 1;
trailingEdgeFlapZ = -(elevatorChord/cHorz)*tand(elevatorAngleDeg)*2;
trailingEdgeFlapX = sqrt(1-trailingEdgeFlapZ^2);

storageArray = zeros(airfoil_sizeHorz);

for i = 1:airfoil_sizeHorz(1)
    if airfoil_coords_x_horz(i) == 0
        storageArray(i) = i;
        break
    end
end

for j = 1:airfoil_sizeHorz(1)
    if j > storageArray(i)
        if abs(airfoil_coords_x_horz(j) - leadingEdgeFlapX) <= .051
            storageArray(j) = j;
            leadingEdgeFlapZ = airfoil_coords_y_horz(j);
        end
    end
end

line([leadingEdgeFlapX,trailingEdgeFlapX],[0,0],[leadingEdgeFlapZ,trailingEdgeFlapZ],'linewidth',2,'color','black');

%% Vertical Tail-----------------------------------------------------------
function verticalTail 
global cr ct XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 XWRTVert YWRTVert ZWRTVert...
    height cVert LamLEVert tpVert verticalTailOutline vertTailSideViewPanel

delete(verticalTailOutline)
verticalTailOutline = axes('Parent',vertTailSideViewPanel,'OuterPosition',[00 0 1 1]);

     % X-Coordinates
    XW1=0;
    XW2=XW1+(height/cVert)*tand(LamLEVert);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Y-Coordinates
    YW1=0;
    YW2=height/2;
    YW3=height/2;
    YW4=0;
  
    XWRTVert = [(((XW1)*cVert)-cVert),(((XW2)*cVert)-cVert),(((1.*tpVert+XW2)*cVert)-cVert),(((1+XW1)*cVert)-cVert)];
    YWRTVert = [(0),(height),(height),(0)];
    ZWRTVert = [0,0,0,0];
    WRTVert = fill3(-XWRTVert,ZWRTVert,YWRTVert,[0.5 0.5 0.5]);
    alpha(WRTVert,.01);      

function verticalTailAirfoil
global airfoil_arrayVert airfoil_coords_x_vert airfoil_coords_y_vert XWR...
    YWR ZWR WR rudderDimensionsPanel airfoilFigVert
 
delete(airfoilFigVert);
airfoilFigVert = axes('Parent',rudderDimensionsPanel,'Position',[0.35 0.01 0.45 0.2]);

    % Right Wing Root
    XWR = (airfoil_coords_x_vert);
    YWR = (airfoil_arrayVert);
    ZWR = (airfoil_coords_y_vert);
       
WR = fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
zlim([-.3 .3]);
xlim([0 1]);                        
                
function rudder
global XW1 XW2 XWRTVert YWRTVert ZWRTVert height cVert LamLEVert tpVert rudderChord...
    rudderHeight rudderHeightSpace

% X-Coordinates
XW1=0;
XW2=(height/cVert)*tand(LamLEVert);

% Determines placement of TE flap line onto TE wing line
% Need to add a parameter for offsetting the placement of the TE flap end
% from the wing centerline
TEMod = 1;
rudderHeightMod = height;

% Endpoint of flap due to leading edge sweep at end of flap
XW22=(((rudderHeight)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
% XW22 = XW1+((rudderHeight*TEMod)/rudderChord)*tand(LamLEVert*TEMod);

% Endpoint of flap due to leading edge sweep at beginning of flap
YW22=(((rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
% YW22 = XW1+((rudderHeightSpace*TEMod)/rudderChord)*tand(LamLEVert*TEMod);

% Distance from leading edge of flap to position if swept
xLE = (rudderHeight)*tand(LamLEVert);

% Distance from trailing edge of flap to position if tapered
xTE = rudderChord-(xLE+rudderChord*tpVert);

% Sweep due to taper
LamTEVert = atand(xTE/(rudderHeight));

rudderPoint = ((XW22)*(rudderChord));
vertTailPoint = (((tpVert+XW2)*cVert)-cVert);

% Determines correct placement of TE edge in relation to wing for rearward
% sweep
if LamLEVert >= 0
    if rudderPoint - abs(vertTailPoint) > .001 || rudderPoint - abs(vertTailPoint) < .001
        for i = 1:10000
            if rudderPoint - abs(vertTailPoint) > .001 || rudderPoint - abs(vertTailPoint) < .001
                if rudderPoint < abs(vertTailPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=((rudderHeightMod*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
                  YW22=((rudderHeightSpace*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
                  if LamLEVert == 0
                        XW22=((rudderHeightMod*TEMod)/(rudderChord))*tand(LamTEVert*TEMod);
                        YW22=((rudderHeightSpace*TEMod)/(rudderChord))*tand(LamTEVert*TEMod);
                  end
                rudderPoint = ((XW22)*(rudderChord));
            end
        end
    end
end
     
% Determines correct placement of TE edge in relation to wing for forward
% sweep
if LamLEVert < 0
    if abs(rudderPoint) - abs(vertTailPoint) > .001 || abs(rudderPoint) - abs(vertTailPoint) < .001
        for i = 1:10000
                if abs(rudderPoint) < abs(vertTailPoint)
                    TEMod = TEMod + .001;
                else
                    TEMod = TEMod - .001;
                end
                  XW22=-(((rudderHeightMod)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
                  YW22=-(((rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
                  rudderPoint = -((XW22)*(rudderChord));
            if abs(abs(rudderPoint) - abs(vertTailPoint)) < .001
                break
            end
        end
    end   
end

 if LamLEVert < 0
     XW22=-(((rudderHeight+rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert)*TEMod;
     YW22=-(((rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert)*TEMod;      
 elseif LamLEVert == 0         
     XW22=(((rudderHeight+rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamTEVert)*TEMod;
     YW22=(((rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamTEVert)*TEMod;
 elseif LamLEVert > 0
    XW22=(((rudderHeight+rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
    YW22=(((rudderHeightSpace)*TEMod)/(rudderChord))*tand(LamLEVert*TEMod);
 end

if vertTailPoint < 0
    XW22 = XW22*-1;
    YW22 = YW22*-1;
end  
 
hold on
    XWRTVert = [(((YW22)*rudderChord))-rudderChord,(((XW22)*rudderChord))-rudderChord,((XW22)*rudderChord),((YW22*rudderChord))];
    YWRTVert = [(rudderHeightSpace),(rudderHeight+rudderHeightSpace),(rudderHeight+rudderHeightSpace),(rudderHeightSpace)];
    ZWRTVert = [0,0,0,0];
    WRTVert = fill3(-XWRTVert,ZWRTVert,YWRTVert,[0.5 0.5 0.5]);
    alpha(WRTVert,.5);   
                  
axis equal
xlabel('Y (ft)')
zlabel('X (ft)')
grid on
az = 180;
el = 0;
view(az,el);
   
% Rudder Chord
function txtbox_rudderChord_Callback(hObject,~)
global rudderChord
rudderChord = str2double(get(hObject,'String'));
verticalTail;
rudder;
verticalTailAirfoil;
rudderAngle;

% Rudder Height
function txtbox_rudderHeight_Callback(hObject,~)
global rudderHeight
rudderHeight = str2double(get(hObject,'String'));
verticalTail;
rudder;

% Distance from Rudder Centerline
function txtbox_rudderHeightSpace_Callback(hObject,~)
global rudderHeightSpace
rudderHeightSpace = str2double(get(hObject,'String'));
verticalTail;
rudder;

% Rudder Angle
function txtbox_rudderAngle_Callback(hObject,~)
global rudderAngleDeg
rudderAngleDeg = str2double(get(hObject,'String'));
verticalTailAirfoil;
rudderAngle;

function rudderAngle
global rudderChord rudderAngleDeg cVert airfoil_sizeVert airfoil_coords_x_vert...
    airfoil_coords_y_vert

leadingEdgeFlapX  = (1-(rudderChord/cVert));
leadingEdgeFlapZ  = 1;
trailingEdgeFlapZ = -(rudderChord/cVert)*tand(rudderAngleDeg)*2;
trailingEdgeFlapX = sqrt(1-trailingEdgeFlapZ^2);

storageArray = zeros(airfoil_sizeVert);

for i = 1:airfoil_sizeVert(1)
    if airfoil_coords_x_vert(i) == 0
        storageArray(i) = i;
        break
    end
end

for j = 1:airfoil_sizeVert(1)
    if j > storageArray(i)
        if abs(airfoil_coords_x_vert(j) - leadingEdgeFlapX) <= .051
            storageArray(j) = j;
            leadingEdgeFlapZ = airfoil_coords_y_vert(j);
        end
    end
end

line([leadingEdgeFlapX,trailingEdgeFlapX],[0,0],[leadingEdgeFlapZ,trailingEdgeFlapZ],'linewidth',2,'color','black');

    
    
    
    