function wingAirfoil
% Written by Mark D. Miller Jr.
% 12/27/19

global airfoilName airfoilModel rootAirfoilTab airfoilSeries...
     airfoilModelPanelRoot airfoilProfilePanelRoot airfoil_size masterFile...
     airfoilSeriesMenuRoot airfoilSeriesNum tipAirfoilTab airfoilSeriesMenuTip...
     airfoilModelPanelTip airfoilProfilePanelTip airActivated autoSelectRoot...
     autoSelectTip airfoilSeriesNumRoot airfoilSeriesNumTip

% NACA Airfoil Series
uicontrol('Parent',rootAirfoilTab,'Style','text','String','NACA Airfoil Series',...
    'Position',[10 680 120 25],'Fontsize',10);

% NACA Airfoil Series
uicontrol('Parent',tipAirfoilTab,'Style','text','String','NACA Airfoil Series',...
    'Position',[10 680 120 25],'Fontsize',10);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Handle to determine whether need to reload previous data or reset for a
% new airfoil selection
autoSelectRoot = 1;
autoSelectTip  = 1;

%% Popupmenus--------------------------------------------------------------
%% Airfoil Series Root Airfoil
airfoilSeriesMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','NACA 4&5 Digit',...
    'NACA 63 Series','NACA 64 Series','NACA 65 Series','NACA 66 Series'},'Position',...
    [10 660 120 25],'Callback',@popupmenu_nacaAirfoilSeriesRoot_Callback);

if isempty(airfoilSeriesMenuRoot) ~= 1 && isempty(airfoilSeriesNum) ~= 1 && airfoilSeriesNum >= 1
    airfoilSeriesMenuRoot.Value = airfoilSeriesNumRoot + 1;
%     airfoilSeriesNum = airfoilSeriesNumRoot;
else
    airfoilModel = 0;
end

%% Airfoil Series Tip Airfoil
airfoilSeriesMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','NACA 4&5 Digit',...
    'NACA 63 Series','NACA 64 Series','NACA 65 Series','NACA 66 Series'},'Position',...
    [10 660 120 25],'Callback',@popupmenu_nacaAirfoilSeriesTip_Callback);

if isempty(airfoilSeriesMenuTip) ~= 1 && isempty(airfoilSeriesNum) ~= 1 && airfoilSeriesNum >= 1
    airfoilSeriesMenuTip.Value = airfoilSeriesNumTip + 1;
%     airfoilSeriesNum = airfoilSeriesNumTip;
else
    airfoilModel = 0;
end
%% ------------------------------------------------------------------------

% if isempty(airfoilSeries) == 0
if isempty(airfoil_size) ~= 1
    % NACA Airfoil Series Panel
    airfoilSeries_airfoilName = [airfoilSeries ' - ' airfoilName];
    airfoilModelPanelRoot = uipanel('Parent',rootAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);
    airfoilModelPanelTip = uipanel('Parent',tipAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);
    
    % NACA Airfoil Profile Panel
    airfoilProfilePanelRoot = uipanel('Parent',rootAirfoilTab,'Title','Airfoil Profile','FontSize',10,'Position',[.47 .77 .52 .15]);
    airfoilProfilePanelTip = uipanel('Parent',tipAirfoilTab,'Title','Airfoil Profile','FontSize',10,'Position',[.47 .77 .52 .15]);
    
switch(airfoilSeries)
    case 'NACA 4&5 Digit'
        airfoilSeriesNum = 1;
        airfoilSeries    = 'NACA 4&5 Digit';
        nacaDigit_4_5_Root;
        airfoilSeriesNumRoot = airfoilSeriesNum;
        nacaDigit_4_5_Tip;
    case 'NACA 63 Series'
        airfoilSeriesNum = 2;
        airfoilSeries    = 'NACA 63 Series';
        nacaSeries_63_Root;
        airfoilSeriesNumRoot = airfoilSeriesNum;
        nacaSeries_63_Tip;
    case 'NACA 64 Series'
        airfoilSeriesNum = 3;
        airfoilSeries    = 'NACA 64 Series';
        nacaSeries_64_Root;
        airfoilSeriesNumRoot = airfoilSeriesNum;
        nacaSeries_64_Tip;
    case 'NACA 65 Series'
        airfoilSeriesNum = 4;
        airfoilSeries    = 'NACA 65 Series';
        nacaSeries_65_Root;
        airfoilSeriesNumRoot = airfoilSeriesNum;
        nacaSeries_65_Tip;
    case 'NACA 66 Series'
        airfoilSeriesNum = 5;
        airfoilSeries    = 'NACA 66 Series';
        nacaSeries_66_Root;
        airfoilSeriesNumRoot = airfoilSeriesNum;
        nacaSeries_66_Tip;
end
% airfoilData;      
% airfoilSelectionRoot;
% airfoilSelectionTip;
% airfoilModelPanelFcnRoot;
% airfoilModelPanelFcnTip;
% airfoilFigureRoot;
% airfoilFigureTip;
else
    airfoilModel = 0;
end
airActivated = 1;

% NACA Airfoil Series
function popupmenu_nacaAirfoilSeriesRoot_Callback(hObject,~)
global airfoilSeries airfoilFigRoot masterFile airfoilSeriesNum airfoilSeriesMenuRoot...
    airfoilModel airfoilSeriesNumRoot

delete(airfoilFigRoot);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case 'NACA 4&5 Digit'
        airfoilSeriesNum = 1;
        airfoilSeries = 'NACA 4&5 Digit';
        nacaDigit_4_5_Root;
    case 'NACA 63 Series'
        airfoilSeriesNum = 2;
        airfoilSeries = 'NACA 63 Series';
        nacaSeries_63_Root;
    case 'NACA 64 Series'
        airfoilSeriesNum = 3;
        airfoilSeries = 'NACA 64 Series';
        nacaSeries_64_Root;
    case 'NACA 65 Series'
        airfoilSeriesNum = 4;
        airfoilSeries = 'NACA 65 Series';
        nacaSeries_65_Root;
    case 'NACA 66 Series'
        airfoilSeriesNum = 5;
        airfoilSeries = 'NACA 66 Series';
        nacaSeries_66_Root;
end
airfoilSeriesNumRoot = airfoilSeriesNum;

if isempty(airfoilSeriesMenuRoot) ~= 1 && isempty(airfoilSeriesNum) ~= 1
    airfoilSeriesMenuRoot.Value = airfoilSeriesNum + 1;
else
    airfoilModel = 0;
end

airfoilData;      
airfoilSelectionRoot;
preAirfoilModelPanelFcnRoot;
clc;

function popupmenu_nacaAirfoilSeriesTip_Callback(hObject,~)
global airfoilSeries airfoilFigTip masterFile airfoilSeriesNum airfoilSeriesMenuTip...
    airfoilModel airfoilSeriesNumTip

delete(airfoilFigTip);

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case 'NACA 4&5 Digit'
        airfoilSeriesNum = 1;
        airfoilSeries = 'NACA 4&5 Digit';
        nacaDigit_4_5_Tip;
    case 'NACA 63 Series'
        airfoilSeriesNum = 2;
        airfoilSeries = 'NACA 63 Series';
        nacaSeries_63_Tip;
    case 'NACA 64 Series'
        airfoilSeriesNum = 3;
        airfoilSeries = 'NACA 64 Series';
        nacaSeries_64_Tip;
    case 'NACA 65 Series'
        airfoilSeriesNum = 4;
        airfoilSeries = 'NACA 65 Series';
        nacaSeries_65_Tip;
    case 'NACA 66 Series'
        airfoilSeriesNum = 5;
        airfoilSeries = 'NACA 66 Series';
        nacaSeries_66_Tip;
end
airfoilSeriesNumTip = airfoilSeriesNum;

if isempty(airfoilSeriesMenuTip) ~= 1 && isempty(airfoilSeriesNum) ~= 1
    airfoilSeriesMenuTip.Value = airfoilSeriesNum + 1;
else
    airfoilModel = 0;
end

airfoilData;      
airfoilSelectionTip;
preAirfoilModelPanelFcnTip;
clc;

% NACA Airfoil Series Callbacks
function nacaDigit_4_5_Root
global rootAirfoilTab airfoilModelMenuRoot airfoilModelRoot airfoilModel autoSelectRoot
    
% Airfoil Model
uicontrol('Parent',rootAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 4&5 Series
airfoilModelMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','0006',...
    '0009','1408','1410','1412','2412','2415','2418','2421','2424','4412',...
    '4415','4418','4421','4424','23012','23015','23018','23021','23024'},...
    'Position',[250 660 100 25],'Callback',@popupmenu_nacaDigit_4_5_Root_Callback);

if autoSelectRoot == 1 && isempty(airfoilModelMenuRoot) ~= 1 && isempty(airfoilModelRoot) ~= 1 && airfoilModelRoot >= 1
    autoSelectRoot = 0;
    airfoilModelMenuRoot.Value = airfoilModelRoot+1;
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
else
    airfoilModelRoot = 0;
end

function nacaDigit_4_5_Tip
global tipAirfoilTab airfoilModelMenuTip airfoilModelTip airfoilModel autoSelectTip
% Airfoil Model
uicontrol('Parent',tipAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 4&5 Series
airfoilModelMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','0006',...
    '0009','1408','1410','1412','2412','2415','2418','2421','2424','4412',...
    '4415','4418','4421','4424','23012','23015','23018','23021','23024'},...
    'Position',[250 660 100 25],'Callback',@popupmenu_nacaDigit_4_5_Tip_Callback);

if autoSelectTip == 1 && isempty(airfoilModelMenuTip) ~= 1 && isempty(airfoilModelTip) ~= 1 && airfoilModelTip >= 1
    autoSelectTip = 0;
    airfoilModelMenuTip.Value = airfoilModelTip+1;
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
else
    airfoilModelTip = 0;
end

% NACA 63 Series
function nacaSeries_63_Root
global rootAirfoilTab airfoilModelMenuRoot airfoilModelRoot airfoilModel autoSelectRoot
% Airfoil Model
uicontrol('Parent',rootAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 63 Series
airfoilModelMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','63-006',...
    '63-206','63-209','63-210','63(1)-012','63(1)-212','63(1)-412','63(2)-015',...
    '63(2)-215','63(2)-415','63(2)-615','63(3)-018','63(3)-218','63(3)-418',...
    '63(3)-618','63(4)-221','63(4)-421','63A010','63A210'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_63_Root_Callback);

if autoSelectRoot == 1 && isempty(airfoilModelMenuRoot) ~= 1 && isempty(airfoilModelRoot) ~= 1 && airfoilModelRoot >= 1
    autoSelectRoot = 0;
    airfoilModelMenuRoot.Value = airfoilModelRoot+1;
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
else
    airfoilModelRoot = 0;
end

function nacaSeries_63_Tip
global tipAirfoilTab airfoilModelMenuTip airfoilModelTip airfoilModel autoSelectTip
% Airfoil Model
uicontrol('Parent',tipAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 63 Series
airfoilModelMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','63-006',...
    '63-206','63-209','63-210','63(1)-012','63(1)-212','63(1)-412','63(2)-015',...
    '63(2)-215','63(2)-415','63(2)-615','63(3)-018','63(3)-218','63(3)-418',...
    '63(3)-618','63(4)-221','63(4)-421','63A010','63A210'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_63_Tip_Callback);

if autoSelectTip == 1 && isempty(airfoilModelMenuTip) ~= 1 && isempty(airfoilModelTip) ~= 1 && airfoilModelTip >= 1
    autoSelectTip = 0;
    airfoilModelMenuTip.Value = airfoilModelTip+1;
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
else
    airfoilModelTip = 0;
end

% NACA 64 Series
function nacaSeries_64_Root
global rootAirfoilTab airfoilModelMenuRoot airfoilModelRoot airfoilModel autoSelectRoot
% Airfoil Model
uicontrol('Parent',rootAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 64 Series
airfoilModelMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','64-108',...
    '64-110','64-206','64-208','64-209','64-210','64(1)-012','64(1)-112',...
    '64(1)-212','64(2)-015','64(2)-215','64(2)-415','64(3)-218','64(3)-418',...
    '64(3)-618','64(4)-221','64(4)-421','64A010','64A210','64A410'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_64_Root_Callback);

if autoSelectRoot == 1 && isempty(airfoilModelMenuRoot) ~= 1 && isempty(airfoilModelRoot) ~= 1 && airfoilModelRoot >= 1
    autoSelectRoot = 0;
    airfoilModelMenuRoot.Value = airfoilModelRoot+1;
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
else
    airfoilModelRoot = 0;
end

function nacaSeries_64_Tip
global tipAirfoilTab airfoilModelMenuTip airfoilModelTip airfoilModel autoSelectTip
% Airfoil Model
uicontrol('Parent',tipAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 64 Series
airfoilModelMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','64-108',...
    '64-110','64-206','64-208','64-209','64-210','64(1)-012','64(1)-112',...
    '64(1)-212','64(2)-015','64(2)-215','64(2)-415','64(3)-218','64(3)-418',...
    '64(3)-618','64(4)-221','64(4)-421','64A010','64A210','64A410'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_64_Tip_Callback);

if autoSelectTip == 1 && isempty(airfoilModelMenuTip) ~= 1 && isempty(airfoilModelTip) ~= 1 && airfoilModelTip >= 1
    autoSelectTip = 0;
    airfoilModelMenuTip.Value = airfoilModelTip+1;
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
else
    airfoilModelTip = 0;
end

% NACA 65 Series
function nacaSeries_65_Root
global rootAirfoilTab airfoilModelMenuRoot airfoilModelRoot airfoilModel autoSelectRoot
% Airfoil Model
uicontrol('Parent',rootAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 65 Series
airfoilModelMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','65-006',...
    '65-206','65-209','65-210','65-410','65(1)-212','65(1)-212 a=.6','65(1)-412',...
    '65(2)-215','65(2)-415','65(2)-415 a=.5','65(3)-218','65(3)-618','65(4)-221',...
    '65(4)-421','65(4)-421 a=.5'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_65_Root_Callback);

if autoSelectRoot == 1 && isempty(airfoilModelMenuRoot) ~= 1 && isempty(airfoilModelRoot) ~= 1 && airfoilModelRoot >= 1
    autoSelectRoot = 0;
    airfoilModelMenuRoot.Value = airfoilModelRoot+1;
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
else
    airfoilModelRoot = 0;
end

function nacaSeries_65_Tip
global tipAirfoilTab airfoilModelMenuTip airfoilModelTip airfoilModel autoSelectTip
% Airfoil Model
uicontrol('Parent',tipAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 65 Series
airfoilModelMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','65-006',...
    '65-206','65-209','65-210','65-410','65(1)-212','65(1)-212 a=.6','65(1)-412',...
    '65(2)-215','65(2)-415','65(2)-415 a=.5','65(3)-218','65(3)-618','65(4)-221',...
    '65(4)-421','65(4)-421 a=.5'},'Position',[250 660 100 25],'Callback',@popupmenu_nacaSeries_65_Tip_Callback);

if autoSelectTip == 1 && isempty(airfoilModelMenuTip) ~= 1 && isempty(airfoilModelTip) ~= 1 && airfoilModelTip >= 1
    autoSelectTip = 0;
    airfoilModelMenuTip.Value = airfoilModelTip+1;
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
else
    airfoilModelTip = 0;
end

% NACA 66 Series
function nacaSeries_66_Root
global rootAirfoilTab airfoilModelMenuRoot airfoilModelRoot airfoilModel autoSelectRoot
% Airfoil Model
uicontrol('Parent',rootAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 66 Series
airfoilModelMenuRoot = uicontrol('Parent',rootAirfoilTab','Style','popupmenu','String',{'Select','66-006',...
    '66-206','66-209','66-210','66(1)-212','66(2)-215','66(2)-415'},'Position',...
    [250 660 100 25],'Callback',@popupmenu_nacaSeries_66_Root_Callback);

if autoSelectRoot == 1 && isempty(airfoilModelMenuRoot) ~= 1 && isempty(airfoilModelRoot) ~= 1 &&...
        airfoilModelRoot >= 1 && airfoilModelRoot < length(airfoilModelMenuRoot.String)
    autoSelectRoot = 0;
    airfoilModelMenuRoot.Value = airfoilModelRoot+1;
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
elseif airfoilModelRoot >= length(airfoilModelMenuRoot.String)
    autoSelectRoot = 0;
    airfoilModelRoot = length(airfoilModelMenuRoot.String);
    airfoilModel = airfoilModelRoot;
    airfoilData;
    airfoilModelPanelFcnRoot;
    airfoilFigureRoot;
    airfoilSelectionRoot;
else
    airfoilModelRoot = 0;
end

function nacaSeries_66_Tip
global tipAirfoilTab airfoilModelMenuTip airfoilModelTip airfoilModel autoSelectTip
% Airfoil Model
uicontrol('Parent',tipAirfoilTab,'Style','text','String','Airfoil Model','Position',[240 680 120 25],'Fontsize',9);

%% Airfoil Model
% NACA 66 Series
airfoilModelMenuTip = uicontrol('Parent',tipAirfoilTab','Style','popupmenu','String',{'Select','66-006',...
    '66-206','66-209','66-210','66(1)-212','66(2)-215','66(2)-415'},'Position',...
    [250 660 100 25],'Callback',@popupmenu_nacaSeries_66_Tip_Callback);

if autoSelectTip == 1 && isempty(airfoilModelMenuTip) ~= 1 && isempty(airfoilModelTip) ~= 1 &&...
        airfoilModelTip >= 1 && airfoilModelTip < length(airfoilModelMenuTip.String)
    autoSelectTip = 0;
    airfoilModelMenuTip.Value = airfoilModelTip+1;
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
elseif airfoilModelTip >= length(airfoilModelMenuTip.String)
    autoSelectTip = 0;
    airfoilModelTip = length(airfoilModelMenuTip.String);
    airfoilModel = airfoilModelTip;
    airfoilData;
    airfoilModelPanelFcnTip;
    airfoilFigureTip;
    airfoilSelectionTip;
else
    airfoilModelTip = 0;
end

%% Airfoil Model Popupmenus
% NACA 4&5 Digit
function popupmenu_nacaDigit_4_5_Root_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileRoot c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelRoot...
    airActivated

airfoilSeries = 'NACA 4&5 Digit';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '0006'
        airfoilModel = 1;
        wingAirfoilFileRoot = 'naca0006.dat';
    case '0009'
        airfoilModel = 2;
        wingAirfoilFileRoot = 'naca0009.dat';
    case '1408'
        airfoilModel = 3;
        wingAirfoilFileRoot = 'naca1408.dat';
    case '1410'
        airfoilModel = 4;
        wingAirfoilFileRoot = 'naca1410.dat';
    case '1412'
        airfoilModel = 5;
        wingAirfoilFileRoot = 'naca1412.dat';
    case '2412'
        airfoilModel = 6;
        wingAirfoilFileRoot = 'naca2412.dat';
    case '2415'
        airfoilModel = 7;
        wingAirfoilFileRoot = 'naca2415.dat';
    case '2418'
        airfoilModel = 8;
        wingAirfoilFileRoot = 'naca2418.dat';
    case '2421'
        airfoilModel = 9;
        wingAirfoilFileRoot = 'naca2421.dat';
    case '2424'
        airfoilModel = 10;
        wingAirfoilFileRoot = 'naca2424.dat';
    case '4412'
        airfoilModel = 11;
        wingAirfoilFileRoot = 'naca4412.dat';
    case '4415'
        airfoilModel = 12;
        wingAirfoilFileRoot = 'naca4415.dat';
    case '4418'
        airfoilModel = 13;
        wingAirfoilFileRoot = 'naca4418.dat';
    case '4421'
        airfoilModel = 14;
        wingAirfoilFileRoot = 'naca4421.dat';
    case '4424'
        airfoilModel = 15;
        wingAirfoilFileRoot = 'naca4424.dat';
    case '23012'
        airfoilModel = 16;
        wingAirfoilFileRoot = 'naca23012.dat';
    case '23015'
        airfoilModel = 17;
        wingAirfoilFileRoot = 'naca23015.dat';
    case '23018'
        airfoilModel = 18;
        wingAirfoilFileRoot = 'naca23018.dat';
    case '23021'
        airfoilModel = 19;
        wingAirfoilFileRoot = 'naca23021.dat';
    case '23024'
        airfoilModel = 20;
        wingAirfoilFileRoot = 'naca23024.dat';
end
airfoilModelRoot = airfoilModel;
airfoilData;
airfoilModelPanelFcnRoot;
airfoilSelectionRoot;
airfoilFigureRoot;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

function popupmenu_nacaDigit_4_5_Tip_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileTip c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelTip...
    airActivated

airfoilSeries = 'NACA 4&5 Digit';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '0006'
        airfoilModel = 1;
        wingAirfoilFileTip = 'naca0006.dat';
    case '0009'
        airfoilModel = 2;
        wingAirfoilFileTip = 'naca0009.dat';
    case '1408'
        airfoilModel = 3;
        wingAirfoilFileTip = 'naca1408.dat';
    case '1410'
        airfoilModel = 4;
        wingAirfoilFileTip = 'naca1410.dat';
    case '1412'
        airfoilModel = 5;
        wingAirfoilFileTip = 'naca1412.dat';
    case '2412'
        airfoilModel = 6;
        wingAirfoilFileTip = 'naca2412.dat';
    case '2415'
        airfoilModel = 7;
        wingAirfoilFileTip = 'naca2415.dat';
    case '2418'
        airfoilModel = 8;
        wingAirfoilFileTip = 'naca2418.dat';
    case '2421'
        airfoilModel = 9;
        wingAirfoilFileTip = 'naca2421.dat';
    case '2424'
        airfoilModel = 10;
        wingAirfoilFileTip = 'naca2424.dat';
    case '4412'
        airfoilModel = 11;
        wingAirfoilFileTip = 'naca4412.dat';
    case '4415'
        airfoilModel = 12;
        wingAirfoilFileTip = 'naca4415.dat';
    case '4418'
        airfoilModel = 13;
        wingAirfoilFileTip = 'naca4418.dat';
    case '4421'
        airfoilModel = 14;
        wingAirfoilFileTip = 'naca4421.dat';
    case '4424'
        airfoilModel = 15;
        wingAirfoilFileTip = 'naca4424.dat';
    case '23012'
        airfoilModel = 16;
        wingAirfoilFileTip = 'naca23012.dat';
    case '23015'
        airfoilModel = 17;
        wingAirfoilFileTip = 'naca23015.dat';
    case '23018'
        airfoilModel = 18;
        wingAirfoilFileTip = 'naca23018.dat';
    case '23021'
        airfoilModel = 19;
        wingAirfoilFileTip = 'naca23021.dat';
    case '23024'
        airfoilModel = 20;
        wingAirfoilFileTip = 'naca23024.dat';
end
airfoilModelTip = airfoilModel;
airfoilData;
airfoilModelPanelFcnTip;
airfoilSelectionTip;
airfoilFigureTip;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

% NACA 63 Series
function popupmenu_nacaSeries_63_Root_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileRoot c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelRoot...
    airActivated

airfoilSeries = 'NACA 63 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '63-006'
        airfoilModel = 1;
        wingAirfoilFileRoot = 'naca63-006.dat';
    case '63-206'
        airfoilModel = 2;
        wingAirfoilFileRoot = 'naca63-206.dat';
    case '63-209'
        airfoilModel = 3;
        wingAirfoilFileRoot = 'naca63-209.dat';
    case '63-210'
        airfoilModel = 4;
        wingAirfoilFileRoot = 'naca63-210.dat';
    case '63(1)-012'
        airfoilModel = 5;
        wingAirfoilFileRoot = 'naca63(1)-012.dat';
    case '63(1)-212'
        airfoilModel = 6;
        wingAirfoilFileRoot = 'naca63(1)-212.dat';
    case '63(1)-412'
        airfoilModel = 7;
        wingAirfoilFileRoot = 'naca63(1)-412.dat';
    case '63(2)-015'
        airfoilModel = 8;
        wingAirfoilFileRoot = 'naca63(2)-015.dat';
    case '63(2)-215'
        airfoilModel = 9;
        wingAirfoilFileRoot = 'naca63(2)-215.dat';
    case '63(2)-415'
        airfoilModel = 10;
        wingAirfoilFileRoot = 'naca63(2)-415.dat';
    case '63(2)-615'
        airfoilModel = 11;
        wingAirfoilFileRoot = 'naca63(2)-615.dat';
    case '63(3)-018'
        airfoilModel = 12;
        wingAirfoilFileRoot = 'naca63(3)-018.dat';
    case '63(3)-218'
        airfoilModel = 13;
        wingAirfoilFileRoot = 'naca63(3)-218.dat';
    case '63(3)-418'
        airfoilModel = 14;
        wingAirfoilFileRoot = 'naca63(3)-418.dat';
    case '63(3)-618'
        airfoilModel = 15;
        wingAirfoilFileRoot = 'naca63(3)-618.dat';
    case '63(4)-221'
        airfoilModel = 16;
        wingAirfoilFileRoot = 'naca63(4)-221.dat';
    case '63(4)-421'
        airfoilModel = 17;
        wingAirfoilFileRoot = 'naca63(4)-421.dat';
    case '63A010'
        airfoilModel = 18;
        wingAirfoilFileRoot = 'naca63A010.dat';
    case '63A210'
        airfoilModel = 19;
        wingAirfoilFileRoot = 'naca63A210.dat';
end
airfoilModelRoot = airfoilModel;
airfoilData;
airfoilModelPanelFcnRoot;
airfoilSelectionRoot;
airfoilFigureRoot;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

function popupmenu_nacaSeries_63_Tip_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileTip c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelTip...
    airActivated

airfoilSeries = 'NACA 63 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '63-006'
        airfoilModel = 1;
        wingAirfoilFileTip = 'naca63-006.dat';
    case '63-206'
        airfoilModel = 2;
        wingAirfoilFileTip = 'naca63-206.dat';
    case '63-209'
        airfoilModel = 3;
        wingAirfoilFileTip = 'naca63-209.dat';
    case '63-210'
        airfoilModel = 4;
        wingAirfoilFileTip = 'naca63-210.dat';
    case '63(1)-012'
        airfoilModel = 5;
        wingAirfoilFileTip = 'naca63(1)-012.dat';
    case '63(1)-212'
        airfoilModel = 6;
        wingAirfoilFileTip = 'naca63(1)-212.dat';
    case '63(1)-412'
        airfoilModel = 7;
        wingAirfoilFileTip = 'naca63(1)-412.dat';
    case '63(2)-015'
        airfoilModel = 8;
        wingAirfoilFileTip = 'naca63(2)-015.dat';
    case '63(2)-215'
        airfoilModel = 9;
        wingAirfoilFileTip = 'naca63(2)-215.dat';
    case '63(2)-415'
        airfoilModel = 10;
        wingAirfoilFileTip = 'naca63(2)-415.dat';
    case '63(2)-615'
        airfoilModel = 11;
        wingAirfoilFileTip = 'naca63(2)-615.dat';
    case '63(3)-018'
        airfoilModel = 12;
        wingAirfoilFileTip = 'naca63(3)-018.dat';
    case '63(3)-218'
        airfoilModel = 13;
        wingAirfoilFileTip = 'naca63(3)-218.dat';
    case '63(3)-418'
        airfoilModel = 14;
        wingAirfoilFileTip = 'naca63(3)-418.dat';
    case '63(3)-618'
        airfoilModel = 15;
        wingAirfoilFileTip = 'naca63(3)-618.dat';
    case '63(4)-221'
        airfoilModel = 16;
        wingAirfoilFileTip = 'naca63(4)-221.dat';
    case '63(4)-421'
        airfoilModel = 17;
        wingAirfoilFileTip = 'naca63(4)-421.dat';
    case '63A010'
        airfoilModel = 18;
        wingAirfoilFileTip = 'naca63A010.dat';
    case '63A210'
        airfoilModel = 19;
        wingAirfoilFileTip = 'naca63A210.dat';
end
airfoilModelTip = airfoilModel;
airfoilData;
airfoilModelPanelFcnTip;
airfoilSelectionTip;
airfoilFigureTip;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

% NACA 64 Series
function popupmenu_nacaSeries_64_Root_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileRoot c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelRoot...
    airActivated

airfoilSeries = 'NACA 64 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '64-108'
        airfoilModel = 1;
        wingAirfoilFileRoot = 'naca64-108.dat';
    case '64-110'
        airfoilModel = 2;
        wingAirfoilFileRoot = 'naca64-110.dat';
    case '64-206'
        airfoilModel = 3;
        wingAirfoilFileRoot = 'naca64-206.dat';
    case '64-208'
        airfoilModel = 4;
        wingAirfoilFileRoot = 'naca64-208.dat';
    case '64-209'
        airfoilModel = 5;
        wingAirfoilFileRoot = 'naca64-209.dat';
    case '64-210'
        airfoilModel = 6;
        wingAirfoilFileRoot = 'naca64-210.dat';
    case '64(1)-012'
        airfoilModel = 7;
        wingAirfoilFileRoot = 'naca64(1)-012.dat';
    case '64(1)-112'
        airfoilModel = 8;
        wingAirfoilFileRoot = 'naca64(1)-112.dat';
    case '64(1)-212'
        airfoilModel = 9;
        wingAirfoilFileRoot = 'naca64(1)-212.dat';
    case '64(2)-015'
        airfoilModel = 10;
        wingAirfoilFileRoot = 'naca64(2)-015.dat';
    case '64(2)-215'
        airfoilModel = 11;
        wingAirfoilFileRoot = 'naca64(2)-215.dat';
    case '64(2)-415'
        airfoilModel = 12;
        wingAirfoilFileRoot = 'naca64(2)-415.dat';
    case '64(3)-218'
        airfoilModel = 13;
        wingAirfoilFileRoot = 'naca64(3)-218.dat';
    case '64(3)-418'
        airfoilModel = 14;
        wingAirfoilFileRoot = 'naca64(3)-418.dat';
    case '64(3)-618'
        airfoilModel = 15;
        wingAirfoilFileRoot = 'naca64(3)-618.dat';
    case '64(4)-221'
        airfoilModel = 16;
        wingAirfoilFileRoot = 'naca64(4)-221.dat';
    case '64(4)-421'
        airfoilModel = 17;
        wingAirfoilFileRoot = 'naca64(4)-421.dat';
    case '64A010'
        airfoilModel = 18;
        wingAirfoilFileRoot = 'naca64A010.dat';
    case '64A210'
        airfoilModel = 19;
        wingAirfoilFileRoot = 'naca64A210.dat';
    case '64A410'
        airfoilModel = 20;
        wingAirfoilFileRoot = 'naca64A410.dat';
end
airfoilModelRoot = airfoilModel;
airfoilData;
airfoilModelPanelFcnRoot;
airfoilSelectionRoot;
airfoilFigureRoot;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

function popupmenu_nacaSeries_64_Tip_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileTip c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelTip...
    airActivated

airfoilSeries = 'NACA 64 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '64-108'
        airfoilModel = 1;
        wingAirfoilFileTip = 'naca64-108.dat';
    case '64-110'
        airfoilModel = 2;
        wingAirfoilFileTip = 'naca64-110.dat';
    case '64-206'
        airfoilModel = 3;
        wingAirfoilFileTip = 'naca64-206.dat';
    case '64-208'
        airfoilModel = 4;
        wingAirfoilFileTip = 'naca64-208.dat';
    case '64-209'
        airfoilModel = 5;
        wingAirfoilFileTip = 'naca64-209.dat';
    case '64-210'
        airfoilModel = 6;
        wingAirfoilFileTip = 'naca64-210.dat';
    case '64(1)-012'
        airfoilModel = 7;
        wingAirfoilFileTip = 'naca64(1)-012.dat';
    case '64(1)-112'
        airfoilModel = 8;
        wingAirfoilFileTip = 'naca64(1)-112.dat';
    case '64(1)-212'
        airfoilModel = 9;
        wingAirfoilFileTip = 'naca64(1)-212.dat';
    case '64(2)-015'
        airfoilModel = 10;
        wingAirfoilFileTip = 'naca64(2)-015.dat';
    case '64(2)-215'
        airfoilModel = 11;
        wingAirfoilFileTip = 'naca64(2)-215.dat';
    case '64(2)-415'
        airfoilModel = 12;
        wingAirfoilFileTip = 'naca64(2)-415.dat';
    case '64(3)-218'
        airfoilModel = 13;
        wingAirfoilFileTip = 'naca64(3)-218.dat';
    case '64(3)-418'
        airfoilModel = 14;
        wingAirfoilFileTip = 'naca64(3)-418.dat';
    case '64(3)-618'
        airfoilModel = 15;
        wingAirfoilFileTip = 'naca64(3)-618.dat';
    case '64(4)-221'
        airfoilModel = 16;
        wingAirfoilFileTip = 'naca64(4)-221.dat';
    case '64(4)-421'
        airfoilModel = 17;
        wingAirfoilFileTip = 'naca64(4)-421.dat';
    case '64A010'
        airfoilModel = 18;
        wingAirfoilFileTip = 'naca64A010.dat';
    case '64A210'
        airfoilModel = 19;
        wingAirfoilFileTip = 'naca64A210.dat';
    case '64A410'
        airfoilModel = 20;
        wingAirfoilFileTip = 'naca64A410.dat';
end
airfoilModelTip = airfoilModel;
airfoilData;
airfoilModelPanelFcnTip;
airfoilSelectionTip;
airfoilFigureTip;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

% NACA 65 Series
function popupmenu_nacaSeries_65_Root_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileRoot c b ARWing Gam LamLE tp...
    wadActivated masterFile airfoilModelRoot iwdActivated wpmActivated...
    airActivated

airfoilSeries = 'NACA 65 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '65-006'
        airfoilModel = 1;
        wingAirfoilFileRoot = 'naca65-006.dat';
    case '65-206'
        airfoilModel = 2;
        wingAirfoilFileRoot = 'naca65-206.dat';
    case '65-209'
        airfoilModel = 3;
        wingAirfoilFileRoot = 'naca65-209.dat';
    case '65-210'
        airfoilModel = 4;
        wingAirfoilFileRoot = 'naca65-210.dat';
    case '65-410'
        airfoilModel = 5;
        wingAirfoilFileRoot = 'naca65-410.dat';
    case '65(1)-212'
        airfoilModel = 6;
        wingAirfoilFileRoot = 'naca65(1)-212.dat';
    case '65(1)-212 a=.6'
        airfoilModel = 7;
        wingAirfoilFileRoot = 'naca65(1)-212a=.6.dat';
    case '65(1)-412'
        airfoilModel = 8;
        wingAirfoilFileRoot = 'naca65(1)-412.dat';
    case '65(2)-215'
        airfoilModel = 9;
        wingAirfoilFileRoot = 'naca65(2)-215.dat';
    case '65(2)-415'
        airfoilModel = 10;
        wingAirfoilFileRoot = 'naca65(2)-415.dat';
    case '65(2)-415 a=.5'
        airfoilModel = 11;
        wingAirfoilFileRoot = 'naca65(2)-415a=.5.dat';
    case '65(3)-218'
        airfoilModel = 12;
        wingAirfoilFileRoot = 'naca65(3)-218.dat';
    case '65(3)-618'
        airfoilModel = 13;
        wingAirfoilFileRoot = 'naca65(3)-618.dat';
    case '65(4)-221'
        airfoilModel = 14;
        wingAirfoilFileRoot = 'naca65(4)-221.dat';
    case '65(4)-421'
        airfoilModel = 15;
        wingAirfoilFileRoot = 'naca65(4)-421.dat';
    case '65(4)-421 a=.5'
        airfoilModel = 16;
        wingAirfoilFileRoot = 'naca65(4)-421a=.5.dat';
end
airfoilModelRoot = airfoilModel;
airfoilData;
airfoilModelPanelFcnRoot;
airfoilSelectionRoot;
airfoilFigureRoot;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

function popupmenu_nacaSeries_65_Tip_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileTip c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelTip...
    airActivated

airfoilSeries = 'NACA 65 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '65-006'
        airfoilModel = 1;
        wingAirfoilFileTip = 'naca65-006.dat';
    case '65-206'
        airfoilModel = 2;
        wingAirfoilFileTip = 'naca65-206.dat';
    case '65-209'
        airfoilModel = 3;
        wingAirfoilFileTip = 'naca65-209.dat';
    case '65-210'
        airfoilModel = 4;
        wingAirfoilFileTip = 'naca65-210.dat';
    case '65-410'
        airfoilModel = 5;
        wingAirfoilFileTip = 'naca65-410.dat';
    case '65(1)-212'
        airfoilModel = 6;
        wingAirfoilFileTip = 'naca65(1)-212.dat';
    case '65(1)-212 a=.6'
        airfoilModel = 7;
        wingAirfoilFileTip = 'naca65(1)-212a=.6.dat';
    case '65(1)-412'
        airfoilModel = 8;
        wingAirfoilFileTip = 'naca65(1)-412.dat';
    case '65(2)-215'
        airfoilModel = 9;
        wingAirfoilFileTip = 'naca65(2)-215.dat';
    case '65(2)-415'
        airfoilModel = 10;
        wingAirfoilFileTip = 'naca65(2)-415.dat';
    case '65(2)-415 a=.5'
        airfoilModel = 11;
        wingAirfoilFileTip = 'naca65(2)-415a=.5.dat';
    case '65(3)-218'
        airfoilModel = 12;
        wingAirfoilFileTip = 'naca65(3)-218.dat';
    case '65(3)-618'
        airfoilModel = 13;
        wingAirfoilFileTip = 'naca65(3)-618.dat';
    case '65(4)-221'
        airfoilModel = 14;
        wingAirfoilFileTip = 'naca65(4)-221.dat';
    case '65(4)-421'
        airfoilModel = 15;
        wingAirfoilFileTip = 'naca65(4)-421.dat';
    case '65(4)-421 a=.5'
        airfoilModel = 16;
        wingAirfoilFileTip = 'naca65(4)-421a=.5.dat';
end
airfoilModelTip = airfoilModel;
airfoilData;
airfoilModelPanelFcnTip;
airfoilSelectionTip;
airfoilFigureTip;
% initialWingDesign;

% When select a different airfoil deactivate wing aero data so have to
% reopen it to see the new airfoil data
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

% NACA 66 Series
function popupmenu_nacaSeries_66_Root_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileRoot c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelRoot...
    airActivated

airfoilSeries = 'NACA 66 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '66-006'
        airfoilModel = 1;
        wingAirfoilFileRoot = 'naca66-006.dat';
    case '66-206'
        airfoilModel = 2;
        wingAirfoilFileRoot = 'naca66-206.dat';
    case '66-209'
        airfoilModel = 3;
        wingAirfoilFileRoot = 'naca66-209.dat';
    case '66-210'
        airfoilModel = 4;
        wingAirfoilFileRoot = 'naca66-210.dat';
    case '66(1)-212'
        airfoilModel = 5;
        wingAirfoilFileRoot = 'naca66(1)-212.dat';
    case '66(2)-215'
        airfoilModel = 6;
        wingAirfoilFileRoot = 'naca66(2)-215.dat';
    case '66(2)-415'
        airfoilModel = 7;
        wingAirfoilFileRoot = 'naca66(2)-415.dat';
end
airfoilModelRoot = airfoilModel;
airfoilData;
airfoilModelPanelFcnRoot;
airfoilSelectionRoot;
airfoilFigureRoot;
% initialWingDesign;

% When select a different airfoil deactivate all Wing Parameters tab(except Wing Airfoil) so have to
% reopen them to see the new wing
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

function popupmenu_nacaSeries_66_Tip_Callback(hObject,~)
global airfoilModel airfoilSeries wingAirfoilFileTip c b ARWing Gam LamLE tp...
    wadActivated iwdActivated wpmActivated masterFile airfoilModelTip...
    airActivated

airfoilSeries = 'NACA 66 Series';

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Determine the selected data set.
str = hObject.String;
val = hObject.Value;
% Set current data to the selected data set.
switch str{val}
    case '66-006'
        airfoilModel = 1;
        wingAirfoilFileTip = 'naca66-006.dat';
    case '66-206'
        airfoilModel = 2;
        wingAirfoilFileTip = 'naca66-206.dat';
    case '66-209'
        airfoilModel = 3;
        wingAirfoilFileTip = 'naca66-209.dat';
    case '66-210'
        airfoilModel = 4;
        wingAirfoilFileTip = 'naca66-210.dat';
    case '66(1)-212'
        airfoilModel = 5;
        wingAirfoilFileTip = 'naca66(1)-212.dat';
    case '66(2)-215'
        airfoilModel = 6;
        wingAirfoilFileTip = 'naca66(2)-215.dat';
    case '66(2)-415'
        airfoilModel = 7;
        wingAirfoilFileTip = 'naca66(2)-415.dat';
end
airfoilModelTip = airfoilModel;
airfoilData;
airfoilModelPanelFcnTip;
airfoilSelectionTip;
airfoilFigureTip;
% initialWingDesign;

% When select a different airfoil deactivate all Wing Parameters tab(except Wing Airfoil) so have to
% reopen them to see the new wing
airActivated = 1;
iwdActivated = 0;
wpmActivated = 0;
wadActivated = 0;

if isempty(c) ~= 1 && isempty(b) ~= 1 && isempty(ARWing) ~= 1 && isempty(Gam) ~= 1 &&...
        isempty(LamLE) ~= 1 && isempty(tp) ~= 1
% wingPlanform;
% wingAerodynamicData;
end

% Airfoil Table Selection
function airfoilSelectionRoot
global aL_0_airfoil Cla_airfoil aClmax_airfoil aStarA_airfoil t_c cmo_airfoil...
    ac_airfoil Clmax_airfoil Cdmin_airfoil airfoilName numberOfAirfoilModels...
    rootAirfoilTab airfoilTableRoot airfoilModel airfoilModelRoot masterFile

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

airfoilTableRoot = uitable('Parent',rootAirfoilTab,'Position',[18 130 787 400]);

airfoilTableArray = zeros(numberOfAirfoilModels,9);
for airfoilModelData = 1:numberOfAirfoilModels
    airfoilModel = airfoilModelData;
    airfoilData;
airfoilTableArray(airfoilModelData,:) = ([aL_0_airfoil Cla_airfoil Clmax_airfoil...
    aClmax_airfoil aStarA_airfoil t_c ac_airfoil cmo_airfoil Cdmin_airfoil]); 
end

airfoilTableArrayCell = num2cell(airfoilTableArray);

RowName = zeros(numberOfAirfoilModels,1);
RowNamestr = num2cell(RowName);
for airfoilModelData = 1:numberOfAirfoilModels
    airfoilModel = airfoilModelData;
    airfoilData;
    RowNamestr(airfoilModelData) = {airfoilName};
end

ColumnWidth = zeros(1,9);
ColumnWidthstr = num2cell(ColumnWidth);
for airfoilModelData = 1:9
    airfoilModel = airfoilModelData;
    airfoilData;
    ColumnWidthstr(airfoilModelData) = {'auto'};
end

airfoilModel = airfoilModelRoot;

% Root
airfoilTableRoot.Data = airfoilTableArrayCell;
airfoilTableRoot.ColumnName = {'Alpha(L=0) [deg]'; 'Cla [1/deg]'; 'Clmax'; 'Alpha Clmax[deg]';...
    'Alpha*a [deg]'; 't/c'; 'A.C.'; 'Cmo'; 'Cdmin';};
airfoilTableRoot.ColumnWidth = ColumnWidthstr;
airfoilTableRoot.RowName = RowNamestr;
airfoilTableRoot.FontSize = 9;  
airfoilTableRoot.ColumnFormat = {'bank','short','bank','bank','bank','short','short','bank','long'};

% Reynold's Number Used For Values
uicontrol('Parent',rootAirfoilTab,'Style','text','String','*Reynold''s Number: 9x10^6',...
    'Position',[5 100 170 25],'Fontsize',10,'Enable','off');

function airfoilSelectionTip
global aL_0_airfoil Cla_airfoil aClmax_airfoil aStarA_airfoil t_c cmo_airfoil...
    ac_airfoil Clmax_airfoil Cdmin_airfoil airfoilName numberOfAirfoilModels...
    tipAirfoilTab airfoilTableTip airfoilModel airfoilModelTip masterFile

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

airfoilTableTip = uitable('Parent',tipAirfoilTab,'Position',[18 130 787 400]);

airfoilTableArray = zeros(numberOfAirfoilModels,9);
for airfoilModelData = 1:numberOfAirfoilModels
    airfoilModel = airfoilModelData;
    airfoilData;
airfoilTableArray(airfoilModelData,:) = ([aL_0_airfoil Cla_airfoil Clmax_airfoil...
    aClmax_airfoil aStarA_airfoil t_c ac_airfoil cmo_airfoil Cdmin_airfoil]); 
end

airfoilTableArrayCell = num2cell(airfoilTableArray);

RowName = zeros(numberOfAirfoilModels,1);
RowNamestr = num2cell(RowName);
for airfoilModelData = 1:numberOfAirfoilModels
    airfoilModel = airfoilModelData;
    airfoilData;
    RowNamestr(airfoilModelData) = {airfoilName};
end

ColumnWidth = zeros(1,9);
ColumnWidthstr = num2cell(ColumnWidth);
for airfoilModelData = 1:9
    airfoilModel = airfoilModelData;
    airfoilData;
    ColumnWidthstr(airfoilModelData) = {'auto'};
end

airfoilModel = airfoilModelTip;

% Tip
airfoilTableTip.Data = airfoilTableArrayCell;
airfoilTableTip.ColumnName = {'Alpha(L=0) [deg]'; 'Cla [1/deg]'; 'Clmax'; 'Alpha Clmax[deg]';...
    'Alpha*a [deg]'; 't/c'; 'A.C.'; 'Cmo'; 'Cdmin';};
airfoilTableTip.ColumnWidth = ColumnWidthstr;
airfoilTableTip.RowName = RowNamestr;
airfoilTableTip.FontSize = 9;  
airfoilTableTip.ColumnFormat = {'bank','short','bank','bank','bank','short','short','bank','long'};

% Reynold's Number Used For Values
uicontrol('Parent',tipAirfoilTab,'Style','text','String','*Reynold''s Number: 9x10^6',...
    'Position',[5 100 170 25],'Fontsize',10,'Enable','off');

% Initial Airfoil Model Type Display
function preAirfoilModelPanelFcnRoot
global airfoilModelPanelRoot rootAirfoilTab airfoilSeries
airfoilSeries_airfoilName = [airfoilSeries ' - ' ' - '];
airfoilModelPanelRoot = uipanel('Parent',rootAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);

function preAirfoilModelPanelFcnTip
global  airfoilModelPanelTip tipAirfoilTab airfoilSeries
airfoilSeries_airfoilName = [airfoilSeries ' - ' ' - '];
airfoilModelPanelTip = uipanel('Parent',tipAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);

% Final Airfoil Model Type Display
function airfoilModelPanelFcnRoot
global airfoilName airfoilModelPanelRoot rootAirfoilTab airfoilSeries aL_0_airfoil...
    Cla_airfoil Clmax_airfoil aClmax_airfoil aStarA_airfoil ac_airfoil cmo_airfoil...
    t_c airfoilProfilePanelRoot
    
airfoilSeries_airfoilName = [airfoilSeries ' - ' airfoilName];
airfoilModelPanelRoot = uipanel('Parent',rootAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);

% NACA Airfoil Profile Panel
airfoilProfilePanelRoot = uipanel('Parent',rootAirfoilTab,'Title','Airfoil Profile','FontSize',10,'Position',[.47 .77 .52 .15]);

% Construct the components.
%% Static Texts------------------------------------------------------------
% Zero Lift Angle of Attack, Alpha(L=0)
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Alpha(L=0):','Position',[5 60 85 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',aL_0_airfoil,'Position',[15 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','deg','Position',[55 40 25 25]);

% Lift Curve Slope, Cla
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Cla:','Position',[90 60 40 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',Cla_airfoil,'Position',[90 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','1/deg','Position',[130 40 35 25]);

% Maximum Coefficient of Lift, Clmax
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Clmax:','Position',[168 60 60 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',Clmax_airfoil,'Position',[180 50 40 20],'Enable','off');

% Angle of Attack at Max Lift, aClmax
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Alpha Clmax:','Position',[230 60 90 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',aClmax_airfoil ,'Position',[250 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','deg','Position',[290 40 25 25]);

% Thickness over Chord, t/c
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','t/c:','Position',[20 20 25 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',t_c ,'Position',[15 10 40 20],'Enable','off');

% Angle of Attack Star A, aStarA (Angle of Attack where curve is no longer linear
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Alpha*a:','Position',[75 20 70 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',aStarA_airfoil ,'Position',[90 10 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','deg','Position',[132 5 25 20]);

% Aerodynamic Center of Airfoil, A.C.
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','A.C.:','Position',[180 20 35 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',ac_airfoil,'Position',[180 10 40 20],'Enable','off');

% Pitching Moment Coefficient of Airfoil, Cmo
% Root
uicontrol('Parent',airfoilModelPanelRoot,'Style','text','String','Cmo:','Position',[250 20 35 25]);
uicontrol('Parent',airfoilModelPanelRoot,'Style','edit','String',cmo_airfoil,'Position',[250 10 40 20],'Enable','off');

function airfoilModelPanelFcnTip
global airfoilName airfoilSeries aL_0_airfoil Cla_airfoil Clmax_airfoil...
    aClmax_airfoil aStarA_airfoil ac_airfoil cmo_airfoil t_c tipAirfoilTab...
    airfoilProfilePanelTip airfoilModelPanelTip

airfoilSeries_airfoilName = [airfoilSeries ' - ' airfoilName];
airfoilModelPanelTip = uipanel('Parent',tipAirfoilTab,'Title',{airfoilSeries_airfoilName},'FontSize',10,'Position',[.01 .77 .45 .15]);

% NACA Airfoil Profile Panel
airfoilProfilePanelTip = uipanel('Parent',tipAirfoilTab,'Title','Airfoil Profile','FontSize',10,'Position',[.47 .77 .52 .15]);

% Construct the components.
%% Static Texts------------------------------------------------------------
% Zero Lift Angle of Attack, Alpha(L=0)
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Alpha(L=0):','Position',[5 60 85 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',aL_0_airfoil,'Position',[15 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','deg','Position',[55 40 25 25]);

% Lift Curve Slope, Cla
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Cla:','Position',[90 60 40 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',Cla_airfoil,'Position',[90 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','1/deg','Position',[130 40 35 25]);

% Maximum Coefficient of Lift, Clmax
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Clmax:','Position',[168 60 60 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',Clmax_airfoil,'Position',[180 50 40 20],'Enable','off');

% Angle of Attack at Max Lift, aClmax
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Alpha Clmax:','Position',[230 60 90 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',aClmax_airfoil ,'Position',[250 50 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','deg','Position',[290 40 25 25]);

% Thickness over Chord, t/c
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','t/c:','Position',[20 20 25 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',t_c ,'Position',[15 10 40 20],'Enable','off');

% Angle of Attack Star A, aStarA (Angle of Attack where curve is no longer linear
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Alpha*a:','Position',[75 20 70 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',aStarA_airfoil ,'Position',[90 10 40 20],'Enable','off');
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','deg','Position',[132 5 25 20]);

% Aerodynamic Center of Airfoil, A.C.
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','A.C.:','Position',[180 20 35 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',ac_airfoil,'Position',[180 10 40 20],'Enable','off');

% Pitching Moment Coefficient of Airfoil, Cmo
% Tip
uicontrol('Parent',airfoilModelPanelTip,'Style','text','String','Cmo:','Position',[250 20 35 25]);
uicontrol('Parent',airfoilModelPanelTip,'Style','edit','String',cmo_airfoil,'Position',[250 10 40 20],'Enable','off');

% Airfoil Profile
function airfoilFigureRoot
global airfoil_array airfoil_coords_xRoot airfoil_coords_yRoot airfoil_size...
    XWR YWR ZWR NACA VarName2 airfoilFigRoot airfoilProfilePanelRoot masterFile

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

delete(airfoilFigRoot);
airfoilFigRoot = axes('Parent',airfoilProfilePanelRoot,'Position',[0.05 0.1 0.80 0.80]);

% Imports airfoil dat file into matylab
importfileWingRoot;
airfoil_coords_xRoot = NACA;
airfoil_coords_yRoot = VarName2;
airfoil_size = size(airfoil_coords_xRoot);
airfoil_array = zeros(airfoil_size);

% Right Wing Root
XWR = (airfoil_coords_xRoot);
YWR = (airfoil_array);
ZWR = (airfoil_coords_yRoot);
    
fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
axis tight equal
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');

function airfoilFigureTip
global airfoil_array airfoil_coords_xTip airfoil_coords_yTip airfoil_size...
    XWR YWR ZWR NACA VarName2 airfoilFigTip airfoilProfilePanelTip masterFile

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

delete(airfoilFigTip);
airfoilFigTip = axes('Parent',airfoilProfilePanelTip,'Position',[0.05 0.1 0.80 0.80]);

% Imports airfoil dat file into matylab
importfileWingTip;
airfoil_coords_xTip = NACA;
airfoil_coords_yTip = VarName2;
airfoil_size = size(airfoil_coords_xTip);
airfoil_array = zeros(airfoil_size);

% Right Wing Root
XWR = (airfoil_coords_xTip);
YWR = (airfoil_array);
ZWR = (airfoil_coords_yTip);
    
fill3(XWR,YWR,ZWR,[.5 .5 .5]); 
axis tight equal
az = 0;
el = 360;
view(az,el);
set(gca,'visible','off');
