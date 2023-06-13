function combinedAirfoils
% Written By Mark D. Miller Jr.
% 5/31/2020

% Going to try to write a program that can plot a wing with a different
% root and tip airfoil. Let's see how this goes...

global b cr ct Gam LamLE FH XW1 XW2 XW3 XW4  ZW1 ZW2 ZW3 YWR2 XWRT YWRT ZWRT...
    XWRT3 YWRT3 ZWRT3 tp i_w c ARWing tipChord rootChord masterFile...
    airfoil_coords_xRoot airfoil_coords_yRoot airfoil_coords_xTip...
    airfoil_coords_yTip comboAirfoil_coords_xRoot comboAirfoil_coords_yRoot...
    comboAirfoil_coords_xTip comboAirfoil_coords_yTip comboAirfoilSize

% Initial Data
cr      =	1;	%	Wing Chord (root)	,	in
ct      =	1;	%	Wing Chord (tip)	,	in
% FL      =	1;	%	Fuselage Length	,	in
FH      =	1;	%	Fuselage Height	,	in
% FW      =	1;	%	Fuselage Width	,	in
i_w = 0;

% Going to start off easy with two airfoils that are the same size. For
% different sizes, it's a whole different ball game.

%% Root Airfoil

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

airfoil_sizeRoot = size(airfoil_coords_xRoot);

%% Tip Airfoil

% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

airfoil_sizeTip = size(airfoil_coords_xTip);

% So that's pretty easy with two airfoils that are the same size. Now for
% the real fun part, airfoils with different sizes.

% First I need to determine which airfoil is larger. By larger I mean
% number of airfoil coordinate points.

airfoil_sizeRoot = airfoil_sizeRoot(1);
airfoil_sizeTip  = airfoil_sizeTip(1);

combo = [airfoil_sizeRoot airfoil_sizeTip];
maxAirfoilSize = max(combo);

upperComboAirfoil_coords_yMax = zeros(maxAirfoilSize,1);
lowerComboAirfoil_coords_yMax = zeros(maxAirfoilSize,1);

%% Root
% First need some arrays of the upper and lower airfoil surfaces
%% Tip
% Upper Surface X-Coordinates
findMinXCoordPoint           = find(airfoil_coords_xTip == min(airfoil_coords_xTip));

% Upper Surface Y-Coordinates
upperAirfoilInitial_Y_Tip    = airfoil_coords_yTip(1:findMinXCoordPoint);

% Lower Surface Y-Coordinates
lowerAirfoilInitial_Y_Tip    = airfoil_coords_yTip(findMinXCoordPoint:end);

%% Root
findMinXCoordPoint = find(airfoil_coords_xRoot == min(airfoil_coords_xRoot));
upperAirfoilCoordsXRoot = airfoil_coords_xRoot(1:findMinXCoordPoint);
lowerAirfoilCoordsXRoot = airfoil_coords_xRoot(findMinXCoordPoint:end);

%% Tip
findMinXCoordPoint = find(airfoil_coords_xTip == min(airfoil_coords_xTip));
upperAirfoilCoordsXTip = airfoil_coords_xTip(1:findMinXCoordPoint);
lowerAirfoilCoordsXTip = airfoil_coords_xTip(findMinXCoordPoint:end);
upperAirfoilCoordsYTip  = airfoil_coords_yTip(1:findMinXCoordPoint);
lowerAirfoilCoordsYTip  = airfoil_coords_yTip(findMinXCoordPoint:end);

%% Upper Surface
upperComboAirfoil_coords_xRoot = [upperAirfoilCoordsXTip(:);upperAirfoilCoordsXRoot(:)];
upperComboAirfoil_coords_xRoot = sort(upperComboAirfoil_coords_xRoot,'descend');

for i = 1:length(upperComboAirfoil_coords_xRoot)
    findSame = find(upperComboAirfoil_coords_xRoot(i) == upperComboAirfoil_coords_xRoot);
    if length(findSame) > 1
        findMax = max(findSame);
        upperComboAirfoil_coords_xRoot(findMax) = 2;
    end
end
findTwos = upperComboAirfoil_coords_xRoot == 2;
upperComboAirfoil_coords_xRoot(findTwos) = [];
findZeros = upperComboAirfoil_coords_xRoot == 0;
upperComboAirfoil_coords_xRoot(findZeros) = [];

upperComboAirfoil_coords_yMax(ceil(maxAirfoilSize/2):end)     = [];
upperAirfoilCoordsYTip(length(upperAirfoilInitial_Y_Tip):end) = [];

[~,findMaxUpper1Tip] = max(upperComboAirfoil_coords_yMax);
[~,findMaxUpper2Tip] = max(upperAirfoilCoordsYTip);

% 1
beforeMax1 = upperComboAirfoil_coords_yMax(1:findMaxUpper1Tip);
afterMax1  = upperComboAirfoil_coords_yMax(findMaxUpper1Tip+1:end);

% 2
beforeMax2 = upperAirfoilCoordsYTip(1:findMaxUpper2Tip);
afterMax2  = upperAirfoilCoordsYTip(findMaxUpper2Tip+1:end);

% 1-2
beforeMax1_2 = [beforeMax1(:);beforeMax2(:)];
afterMax1_2  = [afterMax1(:);afterMax2(:)];

beforeMax1_2 = sort(beforeMax1_2);
afterMax1_2  = sort(afterMax1_2,'descend');

beforeMax1_2(1:2) = [];

upperComboAirfoil_coords_yTip = [beforeMax1_2(:);afterMax1_2(:)];
upperComboAirfoil_coords_xTip = [upperAirfoilCoordsXRoot(:);upperAirfoilCoordsXTip(:)];
upperComboAirfoil_coords_xTip = sort(upperComboAirfoil_coords_xTip,'descend');

for i = 1:length(upperComboAirfoil_coords_xTip)
    findSame = find(upperComboAirfoil_coords_xTip(i) == upperComboAirfoil_coords_xTip);
    if length(findSame) > 1
        findMax = max(findSame);
        upperComboAirfoil_coords_xTip(findMax) = 2;
    end
end
findTwos = upperComboAirfoil_coords_xTip == 2;
upperComboAirfoil_coords_xTip(findTwos) = [];
findZeros = upperComboAirfoil_coords_xTip == 0;
upperComboAirfoil_coords_xTip(findZeros) = [];

%% Lower Surface
lowerComboAirfoil_coords_xRoot = [lowerAirfoilCoordsXTip(:);lowerAirfoilCoordsXRoot(:)];
lowerComboAirfoil_coords_xRoot = sort(lowerComboAirfoil_coords_xRoot,'ascend');

for i = 1:length(lowerComboAirfoil_coords_xRoot)
    findSame = find(lowerComboAirfoil_coords_xRoot(i) == lowerComboAirfoil_coords_xRoot);
    if length(findSame) > 1
        findMax = max(findSame);
        lowerComboAirfoil_coords_xRoot(findMax) = 2;
    end
end
findTwos = lowerComboAirfoil_coords_xRoot == 2;
lowerComboAirfoil_coords_xRoot(findTwos) = [];
findZeros = lowerComboAirfoil_coords_xRoot == 0;
lowerComboAirfoil_coords_xRoot(findZeros) = [];

comboAirfoil_coords_xRoot = [upperComboAirfoil_coords_xRoot(:);0;lowerComboAirfoil_coords_xRoot(:)];

lowerComboAirfoil_coords_yMax(ceil(maxAirfoilSize/2):end)     = [];
lowerAirfoilCoordsYTip(length(lowerAirfoilInitial_Y_Tip):end) = [];

[~,findMinLower1Tip] = min(lowerComboAirfoil_coords_yMax);
[~,findMinLower2Tip] = min(lowerAirfoilCoordsYTip);

% 1
beforeMax1 = lowerComboAirfoil_coords_yMax(1:findMinLower1Tip);
afterMax1  = lowerComboAirfoil_coords_yMax(findMinLower2Tip+1:end);

% 2
beforeMax2 = lowerAirfoilCoordsYTip(1:findMinLower2Tip);
afterMax2  = lowerAirfoilCoordsYTip(findMinLower2Tip+1:end);

% 1-2
beforeMax1_2 = [beforeMax1(:);beforeMax2(:)];
afterMax1_2  = [afterMax1(:);afterMax2(:)];

beforeMax1_2 = sort(beforeMax1_2,'descend');
afterMax1_2  = sort(afterMax1_2,'ascend');

beforeMax1_2(1:2) = [];

lowerComboAirfoil_coords_yTip = [beforeMax1_2(:);afterMax1_2(:)];
    
comboAirfoil_coords_yTip = [upperComboAirfoil_coords_yTip(:);0;lowerComboAirfoil_coords_yTip(:)];
        
lowerComboAirfoil_coords_xTip = [lowerAirfoilCoordsXRoot(:);lowerAirfoilCoordsXTip(:)];
lowerComboAirfoil_coords_xTip = sort(lowerComboAirfoil_coords_xTip,'ascend');

for i = 1:length(lowerComboAirfoil_coords_xTip)
    findSame = find(lowerComboAirfoil_coords_xTip(i) == lowerComboAirfoil_coords_xTip);
    if length(findSame) > 1
        findMax = max(findSame);
        lowerComboAirfoil_coords_xTip(findMax) = 2;
    end
end
findTwos = lowerComboAirfoil_coords_xTip == 2;
lowerComboAirfoil_coords_xTip(findTwos) = [];
findZeros = lowerComboAirfoil_coords_xTip == 0;
lowerComboAirfoil_coords_xTip(findZeros) = [];

comboAirfoil_coords_xTip = [upperComboAirfoil_coords_xTip(:);0;lowerComboAirfoil_coords_xTip(:)];

%% ROOT AIRFOIL
%% ------------------------------------------------------------------------     
        % Following code places all of the original airfoil Y-Axis points
        % on the new combined airfoil X-Axis points. The location of each
        % Y-Axis point is the same as that of the original airfoil,
        % ensuring that the new combined airfoil is the same geometrically
        % as the original just a larger array
        
        % Initialize necessary arrays
        comboAirfoilSize       = length(comboAirfoil_coords_xRoot);
        findYLocationArrayRoot = zeros(airfoil_sizeRoot,1);
%         findYSortedRoot        = zeros(comboAirfoilSize*2,1);
        rearrangedYArray       = zeros(comboAirfoilSize,1);
%         midpointRoot           = find(airfoil_coords_xRoot == 0);
        midpointRoot           = find(airfoil_coords_xRoot == min(airfoil_coords_xRoot));
%         midpointCombo          = find(comboAirfoil_coords_xRoot == 0);
        midpointCombo          = find(comboAirfoil_coords_xRoot == min(comboAirfoil_coords_xRoot));
        
        % Arrange the Y-cordinate points according to the order that they
        % were on the original airfoil
        for iRoot = 1:airfoil_sizeRoot(end)
            intermediateArrayRoot = find(comboAirfoil_coords_xRoot == airfoil_coords_xRoot(iRoot));
            if length(intermediateArrayRoot) > 1
%                 findFirstValueRoot = intermediateArrayRoot == iRoot;
                if intermediateArrayRoot(1) == iRoot == false && iRoot < midpointRoot == true ||...
                        intermediateArrayRoot(end) == iRoot == false && iRoot < midpointRoot == true
                    intermediateArrayRoot(end) = [];
                    findYLocationArrayRoot(iRoot) = intermediateArrayRoot;
                elseif intermediateArrayRoot(1) == iRoot == false && iRoot > midpointRoot == true ||...
                        intermediateArrayRoot(end) == iRoot == false && iRoot > midpointRoot == true
                    intermediateArrayRoot(1) = [];
                    findYLocationArrayRoot(iRoot) = intermediateArrayRoot;
                else
                    intermediateArrayRoot(end) = [];
%                     findSecondValue = findFirstValueRoot == 0;
%                     intermediateArrayRoot(findSecondValue) = [];
                    findYLocationArrayRoot(iRoot) = intermediateArrayRoot;
                end                
            else
                findYLocationArrayRoot(iRoot) = intermediateArrayRoot;
            end
            
                if length(find(findYLocationArrayRoot == intermediateArrayRoot)) > 1      
                    tempFind = find(findYLocationArrayRoot == intermediateArrayRoot);
                    findYLocationArrayRoot(iRoot) = tempFind(end);
                else
                    findYLocationArrayRoot(iRoot) = find(findYLocationArrayRoot == intermediateArrayRoot);
                end
                
                if iRoot ~= 1 && iRoot < midpointRoot && length(find(comboAirfoil_coords_xRoot == airfoil_coords_xRoot(findYLocationArrayRoot(iRoot)) == 1)) > 1
                    findYSortedRoot = comboAirfoil_coords_xRoot(1:midpointCombo) == airfoil_coords_xRoot(findYLocationArrayRoot(iRoot));
                    extraZeros  = false(comboAirfoilSize-length(findYSortedRoot),1);
                    if isempty(extraZeros) == 1
                        extraZeros = 0;
                    end
                    findYSortedRoot = [findYSortedRoot;extraZeros];
                elseif iRoot ~= 1 && iRoot > midpointRoot && length(find(comboAirfoil_coords_xRoot == airfoil_coords_xRoot(findYLocationArrayRoot(iRoot)) == 1)) > 1
                    
                    findYSortedRoot = comboAirfoil_coords_xRoot(midpointCombo:end) == airfoil_coords_xRoot(findYLocationArrayRoot(iRoot));
                    extraZeros  = false(comboAirfoilSize-length(findYSortedRoot),1);
                    findYSortedRoot = [extraZeros;findYSortedRoot];
                else
                    findYSortedRoot = comboAirfoil_coords_xRoot == airfoil_coords_xRoot(findYLocationArrayRoot(iRoot));
                end
                
            if length(find(comboAirfoil_coords_xRoot == 0)) > 1
                for j = 1:airfoil_sizeRoot(end)
                     if findYSortedRoot(j) ~= 1
                         findYSortedRoot(j) = 0;
                     else
                         findYSortedRoot(j) = 1;
                     end
                end
            end
            % Final array that includes all of the original Y-Axis points
            % on the correct X-Axis points (includes empty spots)
            rearrangedYArray(findYSortedRoot) = airfoil_coords_yRoot(findYLocationArrayRoot(iRoot));
        end
%--------------------------------------------------------------------------
% Next we need to determine the slope of each segment of the airfoil. This
% is accomplished by finding all of the empty spots on the rearrangedYArray
% array. The empty spots are for all of the points that are added in to
% increase the size of the array so that each array (root and tip) are the
% same size.

% Once all of the empty spots are found then need to increment above and
% below that empty spot to find the two X-Axis and Y-Axis points to input
% into the slope formula: m = (y2-y1)/(x2-x1).

% Initialize values
findEmptySpots      = find(rearrangedYArray == 0);
emptySpotsSlopeRoot = zeros(length(findEmptySpots),1);
incBack             = 1;
incFront            = 1;

% Determine if start incrementing at the first or second value. If the
% first value in the array is a zero then start incrementing at 2 otherwise
% start at 1
iTestStart = findEmptySpots(1)-incBack;
if iTestStart == 0
    iStart = 2;
else
    iStart = 1;
end

% Determine if end incrementing at the last or second to last value. If the
% end value in the array is a zero then end incrementing at 1 otherwise end
% at 0
iTestEnd = findEmptySpots(end)+incFront;
if iTestEnd > length(rearrangedYArray)
    iEnd = 1;
else
    iEnd = 0;
end

% Grab the first and last values of the Y-Axis array
checkOriginRootStart = airfoil_coords_yRoot(1);
checkOriginRootEnd   = airfoil_coords_yRoot(end);
    
% Determine if need to adjust increment values along the empty spots. If
% the gap between an empty spot is greater than 2, in other words if the
% above and below value of an empty spot is zero then need to adjust the
% increment to find a value that is closet to the empty spot and is
% nonzero.
for i = iStart:length(findEmptySpots)-iEnd
        incBack  = 1;
        incFront = 1;
        backValue  = rearrangedYArray(findEmptySpots(i)-incBack);
        frontValue = rearrangedYArray(findEmptySpots(i)+incFront);
        
        % Find nonzero values above the empty spot
        if backValue == 0
            for incBack = 1:20
                if findEmptySpots(i)-incBack <= 0
                    incBack = incBack - 1;
                    break
                end
                backValue = rearrangedYArray(findEmptySpots(i)-incBack);
                if backValue ~= 0
                    break
                elseif findEmptySpots(i)-incBack == midpointCombo
                    break
                elseif rearrangedYArray(findEmptySpots(i)-incBack) == checkOriginRootStart && i == iStart
                    break
                else
                    continue
                end
            end
        end
        
        % Find nonzero values below the empty spot
        if frontValue == 0
            for incFront = 1:20
                if findEmptySpots(i)+incFront == length(rearrangedYArray)
                    break
                elseif findEmptySpots(i)+incFront > length(rearrangedYArray)
                    frontValue = frontValue - 1;
                    break
                end
                frontValue = rearrangedYArray(findEmptySpots(i)+incFront);
                if frontValue ~= 0
                    break
                elseif findEmptySpots(i)+incFront == midpointCombo
                    break
                elseif rearrangedYArray(findEmptySpots(i)+incFront) == checkOriginRootEnd && i == length(findEmptySpots)-iEnd
                    break
                else
                    continue
                end
            end
        end
        
    % Calculates slope across the empty spot
    if findEmptySpots(i) == midpointCombo
        emptySpotsSlopeRoot(i) = 0;
    else
        emptySpotsSlopeRoot(i) = (rearrangedYArray(findEmptySpots(i) + incFront)...
            - rearrangedYArray(findEmptySpots(i) - incBack)) / (comboAirfoil_coords_xRoot(findEmptySpots(i)...
            + incFront) - comboAirfoil_coords_xRoot(findEmptySpots(i) - incBack));
    end
end

% Calculates the empty spot value based on the slope across the empty spot
% and the nearest nonzero value.
for i = iStart:length(findEmptySpots)-iEnd
        rearrangedYArray(findEmptySpots(i)) = rearrangedYArray(findEmptySpots(i)-1) +...
            emptySpotsSlopeRoot(i) .* (comboAirfoil_coords_xRoot(findEmptySpots(i)) - comboAirfoil_coords_xRoot(findEmptySpots(i)-1));
        
        if findEmptySpots(i) == midpointCombo
            rearrangedYArray(findEmptySpots(i)) = 0;
        end
end

% Sets the final combined airfoil Y-Axis array to the final
% rearrangedYArray array (empty spots are filled in)
comboAirfoil_coords_yRoot = rearrangedYArray;
%% ------------------------------------------------------------------------

%% TIP AIRFOIL
%% ------------------------------------------------------------------------
        % Following code places all of the original airfoil Y-Axis points
        % on the new combined airfoil X-Axis points. The location of each
        % Y-Axis point is the same as that of the original airfoil,
        % ensuring that the new combined airfoil is the same geometrically
        % as the original just a larger array
        
        % Initialize needed arrays
        comboAirfoilSize       = length(comboAirfoil_coords_xTip);
        findYLocationArrayTip  = zeros(airfoil_sizeTip,1);
        rearrangedYArray       = zeros(comboAirfoilSize,1);
%         midpointTip            = find(airfoil_coords_xTip == 0);
        midpointTip            = find(airfoil_coords_xTip == min(airfoil_coords_xTip));
%         midpointCombo          = find(comboAirfoil_coords_xTip == 0);
        midpointCombo          = find(comboAirfoil_coords_xTip == min(comboAirfoil_coords_xTip));
        
        % Arrange the Y-cordinate points according to the order that they
        % were on the original airfoil
        for iTip = 1:airfoil_sizeTip(end)
            intermediateArrayTip = find(comboAirfoil_coords_xTip == airfoil_coords_xTip(iTip));
            if length(intermediateArrayTip) > 1
%                 findFirstValueTip = intermediateArrayTip == iTip;
                if intermediateArrayTip(1) == iTip == false && iTip < midpointTip == true ||...
                        intermediateArrayTip(end) == iTip == false && iTip < midpointTip == true
                    intermediateArrayTip(end) = [];
                    findYLocationArrayTip(iTip) = intermediateArrayTip;
                elseif intermediateArrayTip(1) == iTip == false && iTip > midpointTip == true ||...
                        intermediateArrayTip(end) == iTip == false && iTip > midpointTip == true
                    intermediateArrayTip(1) = [];
                    findYLocationArrayTip(iTip) = intermediateArrayTip;
                else
                    intermediateArrayTip(end) = [];
%                     findSecondValue = findFirstValueTip == 0;
%                     intermediateArrayTip(findSecondValue) = [];
                    findYLocationArrayTip(iTip) = intermediateArrayTip;
                end
            else
                findYLocationArrayTip(iTip) = intermediateArrayTip;
            end
            
                if length(find(findYLocationArrayTip == intermediateArrayTip)) > 1      
                    tempFind = find(findYLocationArrayTip == intermediateArrayTip);
                    findYLocationArrayTip(iTip) = tempFind(end);
                else
                    findYLocationArrayTip(iTip) = find(findYLocationArrayTip == intermediateArrayTip);
                end
                
                if iTip ~= 1 && iTip < midpointTip && length(find(comboAirfoil_coords_xTip == airfoil_coords_xTip(findYLocationArrayTip(iTip)) == 1)) > 1
                    findYSortedTip = comboAirfoil_coords_xTip(1:midpointCombo) == airfoil_coords_xTip(findYLocationArrayTip(iTip));
                    extraZeros  = false(comboAirfoilSize-length(findYSortedTip),1);
                    findYSortedTip = [findYSortedTip;extraZeros];
                elseif iTip ~= 1 && iTip > midpointTip && length(find(comboAirfoil_coords_xTip == airfoil_coords_xTip(findYLocationArrayTip(iTip)) == 1)) > 1
                    
                    findYSortedTip = comboAirfoil_coords_xTip(midpointCombo:end) == airfoil_coords_xTip(findYLocationArrayTip(iTip));
                    extraZeros  = false(comboAirfoilSize-length(findYSortedTip),1);
                    findYSortedTip = [extraZeros;findYSortedTip];
                else
                    findYSortedTip = comboAirfoil_coords_xTip == airfoil_coords_xTip(findYLocationArrayTip(iTip));
                end
                
            if length(find(comboAirfoil_coords_xTip == 0)) > 1
                for j = 1:airfoil_sizeRoot(end)
                     if findYSortedTip(j) ~= 1
                         findYSortedTip(j) = 0;
                     else
                         findYSortedTip(j) = 1;
                     end
                end
            end
            
            % Final array that includes all of the original Y-Axis points
            % on the correct X-Axis points (includes empty spots)
            rearrangedYArray(findYSortedTip) = airfoil_coords_yTip(findYLocationArrayTip(iTip));
        end
%--------------------------------------------------------------------------
% Next we need to determine the slope of each segment of the airfoil. This
% is accomplished by finding all of the empty spots on the rearrangedYArray
% array. The empty spots are for all of the points that are added in to
% increase the size of the array so that each array (root and tip) are the
% same size.

% Once all of the empty spots are found then need to increament above and
% below that empty spot to find the two X-Axis and Y-Axis points to input
% into the slope formula: m = (y2-y1)/(x2-x1).

% Initialize values
findEmptySpots      = find(rearrangedYArray == 0);
emptySpotsSlopeTip  = zeros(length(findEmptySpots),1);
incBack             = 1;
incFront            = 1;

% Determine if start incrementing at the first or second value. If the
% first value in the array is a zero then start incrementing at 2 otherwise
% start at 1
iTestStart = findEmptySpots(1)-incBack;
if iTestStart == 0
    iStart = 2;
else
    iStart = 1;
end

% Determine if end incrementing at the last or second to last value. If the
% end value in the array is a zero then end incrementing at 1 otherwise end
% at 0
iTestEnd = findEmptySpots(end)+incFront;
if iTestEnd > length(rearrangedYArray)
    iEnd = 1;
else
    iEnd = 0;
end

% Grab the first and last values of the Y-Axis array
checkOriginTipStart = airfoil_coords_yTip(1);
checkOriginTipEnd   = airfoil_coords_yTip(end);

% Determine if need to adjust increment values along the empty spots. If
% the gap between an empty spot is greater than 2, in other words if the
% above and below value of an empty spot is zero then need to adjust the
% increment to find a value that is closet to the empty spot and is
% nonzero.    
for i = iStart:length(findEmptySpots)-iEnd
        incBack  = 1;
        incFront = 1;
        backValue  = rearrangedYArray(findEmptySpots(i)-incBack);
        frontValue = rearrangedYArray(findEmptySpots(i)+incFront);
        
        % Find nonzero values above the empty spot
        if backValue == 0
            for incBack = 1:20
                if findEmptySpots(i)-incBack <= 0
                    incBack = incBack - 1;
                    break
                end
                backValue = rearrangedYArray(findEmptySpots(i)-incBack);
                if backValue ~= 0
                    break
                elseif findEmptySpots(i)-incBack == midpointCombo
                    break
                elseif rearrangedYArray(findEmptySpots(i)-incBack) == checkOriginTipStart && i == iStart
                    break
                else
                    continue
                end
            end
        end
        
        % Find nonzero values below the empty spot
        if frontValue == 0
            for incFront = 1:20
                if findEmptySpots(i)+incFront == length(rearrangedYArray)
                    break
                elseif findEmptySpots(i)+incFront > length(rearrangedYArray)
                    frontValue = frontValue - 1;
                    break
                end 
                frontValue = rearrangedYArray(findEmptySpots(i)+incFront);
                if frontValue ~= 0
                    break
                elseif findEmptySpots(i)+incFront == midpointCombo
                    break
                elseif rearrangedYArray(findEmptySpots(i)+incFront) == checkOriginTipEnd && i == length(findEmptySpots)-iEnd
                    break
                else
                    continue
                end
            end
        end
%         if i == 103
%             bvb = 1;
%         end
        
    % Calculates slope across the empty spot
    if findEmptySpots(i) == midpointCombo
        emptySpotsSlopeTip(i) = 0;
    else
        emptySpotsSlopeTip(i) = (rearrangedYArray(findEmptySpots(i) + incFront)...
            - rearrangedYArray(findEmptySpots(i) - incBack)) / (comboAirfoil_coords_xTip(findEmptySpots(i)...
            + incFront) - comboAirfoil_coords_xTip(findEmptySpots(i) - incBack));
    end
end

% Calculates the empty spot value based on the slope across the empty spot
% and the nearest nonzero value.
for i = iStart:length(findEmptySpots)-iEnd
        rearrangedYArray(findEmptySpots(i)) = rearrangedYArray(findEmptySpots(i)-1) +...
            emptySpotsSlopeTip(i) .* (comboAirfoil_coords_xTip(findEmptySpots(i)) - comboAirfoil_coords_xTip(findEmptySpots(i)-1));
        
        if findEmptySpots(i) == midpointCombo
            rearrangedYArray(findEmptySpots(i)) = 0;
        end
end

% Sets the final combined airfoil Y-Axis array to the final
% rearrangedYArray array (empty spots are filled in)
comboAirfoil_coords_yTip = rearrangedYArray;

wingArea = (b/2)*c*(1+tp);
ARWing = b^2/wingArea;

if isempty(rootChord) == 1 || isempty(tipChord) == 1
    rootChord = c;
    tipChord  = c*tp;
end

%    X-Coordinates
    XW1 = 0;
    XW2=XW1 + (b/2)*tand(LamLE);
    XW3=XW2+tipChord;
    XW4=XW1+rootChord;

%     Z-Coordinates
    ZW1=rootChord*sind(i_w);
    ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
    ZW3=(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);

    XWRRoot = ((comboAirfoil_coords_xRoot).*rootChord)+XW1;
    XWRTip  = ((comboAirfoil_coords_xTip.*tipChord)+XW2);

    YWRT = zeros(length(XWRRoot),2);

    ZWRRoot = ((comboAirfoil_coords_yRoot).*rootChord)+ZW1;
    ZWRTip = ((comboAirfoil_coords_yTip).*tipChord)+ZW1;

    YWRT(:,1) = 0;
    YWRT(:,2) = b/2-((b/2)-(b/2)*cosd(Gam));
    YWR2 = zeros(length(XWRRoot),1)+b/2;

    XWRT = [XWRRoot,XWRTip];
    ZWRT = [ZWRRoot,ZWRTip];

    XWRLRoot = ((comboAirfoil_coords_xRoot).*1)+XW1;

    XWRLTip = ((comboAirfoil_coords_xTip.*1)+XW2);

    YWRT3 = zeros(length(XWRRoot),2);

    ZWRLRoot = ((comboAirfoil_coords_yRoot).*1)+ZW1;

    ZWRLTip = ((comboAirfoil_coords_yTip).*1)+ZW2;

    YWRT3(:,1) = 0;
    YWRT3(:,2) = -b/2+((b/2)-(b/2)*cosd(Gam));
    YWRT3(:,2) = -1+((1)-(1)*cosd(Gam));
    XWRT3 = [XWRLRoot,XWRLTip];
    ZWRT3 = [ZWRLRoot,ZWRLTip];

