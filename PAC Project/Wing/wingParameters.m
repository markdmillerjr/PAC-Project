function wingParameters
% Written by Mark D. Miller Jr.
% 4/24/17
% Adapted from a program written by Dr. Kenneth Bordignon

global selected wingPlanformTab wingStructPanel wingStructuresTab wingAirfoilTab...
    wingPlanformModTab wingAeroDataTab wingParametersTab wingDimensionsPlanformPanel...
    wingAreaPanel wingParametersTabgp iwdActivated wpmActivated wadActivated...
    wpActivated masterFile rootAirfoilTab tipAirfoilTab comboAirfoilSize...
    airActivated

% Revert file access to master file
% cd(masterFile);

% Access Wing folder
% cd('Wing');


wingParametersTabgp = uitabgroup('Parent',wingParametersTab,'Position',[0 0 1 1],'Visible','on');
% % Tabs
% if wpActivated == 1
%     
% else
%     wingParametersTabgp = uitabgroup('Parent',wingParametersTab,'Position',[0 0 1 1],'Visible','off');
% end

wingAirfoilTab       = uitab('Parent',wingParametersTabgp,'Title','Airfoil');
% set(wingAirfoilTab, 'ButtonDownFcn', {@selectedAirfoilTab, wingAirfoilTab});

airtabgp = uitabgroup('Parent',wingAirfoilTab,'Position',[0 0 1 1]);

rootAirfoilTab     = uitab('Parent',airtabgp,'Title','Root');

tipAirfoilTab      = uitab('Parent',airtabgp,'Title','Tip');

wingPlanformTab    = uitab('Parent',wingParametersTabgp,'Title','Initial Wing Design');
set(wingPlanformTab, 'ButtonDownFcn', {@selectedPlanformTab, wingPlanformTab});

wingPlanformModTab = uitab('Parent',wingParametersTabgp,'Title','Final Wing Design');
set(wingPlanformModTab, 'ButtonDownFcn', {@selectedPlanformModTab, wingPlanformModTab});

wingAeroDataTab    = uitab('Parent',wingParametersTabgp,'Title','Wing Aerodynamic Data');
set(wingAeroDataTab, 'ButtonDownFcn', {@selectedAeroTab, wingAeroDataTab});

wingStructuresTab  = uitab('Parent',wingParametersTabgp,'Title','Wing Structure');

% Panels
% Wing Area Estimate
wingAreaPanel = uipanel('Parent',wingPlanformTab,'Title','Wing Area Estimate','FontSize',12,'Position',[.01 .8 .45 .2]);

% Wing Dimensions
wingDimensionsPlanformPanel = uipanel('Parent',wingPlanformTab,'Title','Wing Dimensions','FontSize',12,'Position',[.48 .8 .51 .2]);

% Wing Planform
% wingPlanformPanel = uipanel('Parent',wingPlanformTab,'Title','Wing','FontSize',12,'Position',[.01 .17 .98 .75]);
% wingPlanformModPanel = uipanel('Parent',wingPlanformModTab,'Title','Wing','FontSize',12,'Position',[.01 .01 .98 .5]);
wingStructPanel = uipanel('Parent',wingStructuresTab,'Title','Wing','FontSize',12,'Position',[.01 .23 .98 .69]);

% wingAreaEstimate
% wingDimensionComponents;
wingAirfoil;

cd(masterFile);
cd('Wing');

if isempty(comboAirfoilSize) ~= 1 && comboAirfoilSize(1) > 0
%     b     = 1;
%     c     = 1;
%     Gam   = 0;
%     LamLE = 0;
%     tp    = 1;
    selected = 4;
    
% Airfoil(air) Tab not activated    
airActivated = 0;

% % Root Airfoil(ra) Tab not activated
% raActivated  = 0;
% 
% % Tip Airfoil(ta) Tab not activated
% taActivated  = 0;

% Initial wing design(iwd) Tab not activated
iwdActivated = 0;

% Wing Planform Mod(wpm) Tab not activated
wpmActivated = 0;

% Wing Aerodynamic Data(wad) Tab not activated
wadActivated = 0;
end

wpActivated = 1;

% function selectedAirfoilTab(~,~,~)
% global airActivated masterFile
% if isempty(airActivated) == 0 || airActivated == 1
%     % Revert file access to master file
%     cd(masterFile);
%     
%     % Access Airfoil Folder
%     cd('Wing');
% %     wingAirfoil;
% end

function selectedPlanformTab(~,~,~)
global iwdActivated selected masterFile
if isempty(iwdActivated) == 1 || iwdActivated == 0
    if isempty(selected) == 1
        selected = 1;
    end
    % Revert file access to master file
    cd(masterFile);

    % Access Wing Folder
    cd('Wing');
    initialWingDesign;
end

function selectedPlanformModTab(~,~,~)
global wpmActivated masterFile
if isempty(wpmActivated) == 1 || wpmActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Wing Folder
    cd('Wing');
    wingPlanformMod;
end

if isempty(dir('patchline.m')) == 1
    % Revert file access to master file
    cd(masterFile);
    
    % Access Wing Folder
    cd('Wing');
end

function selectedAeroTab(~,~,~)
global wadActivated masterFile
if isempty(wadActivated) == 1 || wadActivated == 0
    % Revert file access to master file
    cd(masterFile);

    % Access Wing Folder
    cd('Wing');
    wingAerodynamicData;
end