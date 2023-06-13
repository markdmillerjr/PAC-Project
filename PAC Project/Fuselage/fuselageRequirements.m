function fuselageRequirements
% Written by Mark D. Miller Jr.
% 5/19/20

global fuselageRequirementsTab aircraftType aircraftTypeStringText...
    passengers numRows

% Static Texts
%------------------------------------------------------------------------
% Aircraft Type
% uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Aircraft Type:','Position',[15 700 100 25],'FontSize',10,'Fontweight','Bold');

% fig = figure('FileName','fuselage','Visible','on','Position',[10 100 850 800],...
%     'Toolbar','none','Menubar','none','NumberTitle','off','Name','PAC','Resize','off','Dockcontrols','off',...
%     'WindowStyle','normal');

uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Aircraft Type:',...
    'Position',[15 700 100 25],'FontSize',10,'Fontweight','Bold');

aircraftTypeArray = {'Fighter (Air-Air)';'Fighter (Multipurpose)';'Fighter (Air-Ground)';...
    'Military Trainer';'Military Bomber and Transport';'Military Patrol and Reconnaissance';'Passenger Jet';'Business Jet'};

if aircraftType == 1
       aircraftTypeString = aircraftTypeArray(1);
       aircraftTypeStringLength = 120;
elseif aircraftType == 2
       aircraftTypeString = aircraftTypeArray(2);
       aircraftTypeStringLength = 150;
elseif aircraftType == 3
       aircraftTypeString = aircraftTypeArray(3);
       aircraftTypeStringLength = 120;
elseif aircraftType == 4
       aircraftTypeString = aircraftTypeArray(4);
       aircraftTypeStringLength = 100;
elseif aircraftType == 5
       aircraftTypeString = aircraftTypeArray(5);
       aircraftTypeStringLength = 100;
elseif aircraftType == 6
       aircraftTypeString = aircraftTypeArray(6);
       aircraftTypeStringLength = 240;
elseif aircraftType == 7
       aircraftTypeString = aircraftTypeArray(7);
       aircraftTypeStringLength = 150;
elseif aircraftType == 8
       aircraftTypeString = aircraftTypeArray(8);
       aircraftTypeStringLength = 100;
end
delete(aircraftTypeStringText);
% aircraftTypeStringText = uicontrol('Parent',fuselageRequirementsTab,'Style','text','String',aircraftTypeString,'Position',[115 700 aircraftTypeStringLength 25],'FontSize',10,'Fontweight','Bold');
aircraftTypeStringText = uicontrol('Parent',fuselageRequirementsTab,'Style',...
    'text','String',aircraftTypeString,'Position',[115 700 aircraftTypeStringLength 25],...
    'FontSize',10,'Fontweight','Bold');

% uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Number of Passengers:','Position',[20 680 150 20],'FontSize',10,'Fontweight','Bold');
% uicontrol('Parent',fuselageRequirementsTab,'Style','edit','String',passengers,'Position',[180 680 30 20],'FontSize',10,'Fontweight','Bold','Callback',@txtbox_numPassengers_Callback);
% uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Number of Seat Rows:','Position',[20 620 150 20],'FontSize',10,'Fontweight','Bold');
% uicontrol('Parent',fuselageRequirementsTab,'Style','edit','String','4','Position',[180 620 30 20],'FontSize',10,'Fontweight','Bold','Callback',@txtbox_numRows_Callback);

uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Number of Passengers:','Position',[20 680 150 20],'FontSize',10,'Fontweight','Bold');
uicontrol('Parent',fuselageRequirementsTab,'Style','edit','String',passengers,'Position',[180 680 30 20],'FontSize',10,'Fontweight','Bold','Callback',@txtbox_numPassengers_Callback);
uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Number of Seat Rows:','Position',[20 650 150 20],'FontSize',10,'Fontweight','Bold');
uicontrol('Parent',fuselageRequirementsTab,'Style','edit','String','4','Position',[180 650 30 20],'FontSize',10,'Fontweight','Bold','Callback',@txtbox_numRows_Callback);
fuselageParametersDrawing;

% Number of passengers
function txtbox_numPassengers_Callback(~,~)
fuselageParametersDrawing;

% Number of seat rows
function txtbox_numRows_Callback(~,~)
fuselageParametersDrawing;

% Fuselage Drawing
function fuselageParametersDrawing
global R L fuselageRequirementsTab iso nL xcf ycf zcf tL passengers numRows fig

fuselageRadius = 7;
fuselageLength = 100;

delete(iso);
% iso = axes('Parent',fuselageRequirementsTab,'Position',[0.13 0.35 .8 .80]);
iso = axes('Parent',fuselageRequirementsTab,'Position',[0.13 0.35 .8 .80]);

fusColor      = .5*[1 1 1];
edgeColor     = 'k';
linestyle     = '-'; 
x = 0;
y = 0;
z = 0;
iArray = [1 .95 .9 .85 .75 .6 .5];
xcf = 1;
ycf = 1;
zcf = 1;

  % Fuselage: 
[xcf,zcf,ycf] = cylinder(fuselageRadius); 
% surface(xcf+x,y-ycf*fuselageLength,z+zcf*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% line(xcf+x,y-ycf*fuselageLength,z+zcf*1,'linestyle',linestyle);
% line(-xcf+x,y-ycf*fuselageLength,z+zcf*1,'linestyle',linestyle);

lineArrayX = [7 7];
lineArrayY = [-100 0];

line(lineArrayX,lineArrayY,'linestyle','-','color','black');
line(-lineArrayX,lineArrayY,'linestyle','-','color','black');

lineArrayX = [5 7];
lineArrayY = [-120 -100];

line(lineArrayX,lineArrayY,'linestyle','-','color','black');
line(-lineArrayX,lineArrayY,'linestyle','-','color','black');

lineArrayX = [-5 5];
lineArrayY = [-120 -120];
line(lineArrayX,lineArrayY,'linestyle','-','color','black');

lineArrayX = [7 6.5 5.2 3.1 0 -3.1 -5.2 -6.5 -7];
lineArrayY = [0 2 5 8 10 8 5 2 0];
line(lineArrayX,lineArrayY,'linestyle','-','color','black');

% Need to loop over number of passengers so have one seat per passenger

% Standard size of an airline seat: 31" x 18"
% Standard size of a wooden pallet: 48" x 40"
% Standard size of milirary cargo pallet: 88" x 108"

% First let's list the number of passengers
% uicontrol('Parent',fuselageRequirementsTab,'Style','text','String','Number of Passengers:','Position',[20 680 150 20],'FontSize',10,'Fontweight','Bold');
% uicontrol('Parent',fuselageRequirementsTab,'Style','text','String',passengers,'Position',[180 680 30 20],'FontSize',10,'Fontweight','Bold');

seatX1 = 5;
seatX2 = 3;
seatY1 = 100;
seatY2 = 98;

numRows = 3;
for ii = 1:numRows
    for i = 1:passengers/numRows
        seatArrayX = [seatX1 seatX1 seatX2 seatX2 seatX1];
        seatArrayY = [-seatY1 -seatY2 -seatY2 -seatY1 -seatY1];
        line(seatArrayX,seatArrayY,'linestyle','-','color','black');
        seatY1 = seatY1 - 4;
        seatY2 = seatY2 - 4;
    end
    seatX1 = seatX1 - 4;
    seatX2 = seatX2 - 4;
    seatY1 = 100;
    seatY2 = 98;
end


  % Nosecone: 
[xcn,zcn,ycn] = cylinder(fuselageRadius.*(iArray).*(cos(linspace(0,pi/2,length(iArray))).^.2));
zcn(6:end,:) = zcn(6:end,:)-fuselageRadius/100;
ycn = -ycn.*.7*1;
% surface(xcn+x,y-ycn*(.15*fuselageLength),z+zcn*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% line(xcn+x,y-ycn*(.15*fuselageLength),'linestyle',linestyle);

% Tail
x1 = xcf(1,:); 
x2 = .8*x1;
y1 = fuselageLength*ones(size(x1)); 
y2 = y1+(.2*fuselageLength); 
z1 = zcf(1,:); 
z2 = fuselageRadius*ones(size(z1)); 
% surface(x+[x1;x2],y-[y1;y2],z+[z1;z2]*1,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% line(x+[x1;x2],y-[y1;y2],z+[z1;z2]*1,'linestyle',linestyle);

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