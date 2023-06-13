function [NACA,VarName2] = importfile1(filename, startRow, endRow)
%IMPORTFILE3 Import numeric data from a text file as column vectors.
%   [NACA,VARNAME2] = IMPORTFILE3(FILENAME) Reads data from text file
%   FILENAME for the default selection.
%
%   [NACA,VARNAME2] = IMPORTFILE3(FILENAME, STARTROW, ENDROW) Reads data
%   from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   [NACA,VarName2] = importfile3('naca2412.dat',1, 39);
%
%    See also TEXTSCAN.
ii1 = [];
global NACA VarName2 horzAirfoilFile fileID masterFile
% file = 'm1.dat';
% Auto-generated by MATLAB on 2017/04/29 16:33:41

%% Initialize variables.
delimiter = ' ';
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%[^\n\r]';

%% Open the text file.
% Revert file access to master file
cd(masterFile);

% Access Airfoil Folder
cd('Airfoil');

% Access Airfoil Database
cd('Airfoil Database');

fileID = fopen(horzAirfoilFile,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(thousandsRegExp, ',', 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
 
NACA = cell2mat(raw(:, 1));
VarName2 = cell2mat(raw(:, 2));

% fprintf('file: \n',fileID);
% Code to fix airfoil array import from textfile
    if isinteger(NACA(1)) ~= 1
         NACA = NACA(2:end);
     else NACA = NACA(3:end);
    end
    
    if NACA(end) > 1
        NACA(end) = 1;
    end
    
    if isnan(NACA(end)) == 1
        NACA(end) = 1;
        VarName2(end) = 0;
    end
    
    if isnan(NACA(end-1)) == 1
        NACA(end-1) = 1;
        VarName2(end-1) = 0;
    end
        
    if NACA(2) == NACA(3)
        NACA(2) = 0;
    end
    
     if isinteger(VarName2(1)) ~= 1;
         VarName2 = VarName2(2:end);
     else VarName2 = VarName2(3:end);
     end

     for ii1 = 1:(length(VarName2)-1)
         if VarName2(ii1) ~= 0
             if isnan(VarName2(ii1)) == 1
                 VarName2(ii1) = 0;
             end
         end
     end
     for ii2 = 1:(length(VarName2)-2)
         if ii2 < length(VarName2)
            if VarName2(ii2) == VarName2(ii2+1)
                VarName2(ii2) = [];
            end
         end
     end
      for ii3 = 1:(length(NACA)-1)
          if ii3 < length(NACA)
            if NACA(ii3) == NACA(ii3+1)
                NACA(ii3) = [];
            end
        end
      end
      for ii4 = 1:(length(NACA)-1)
         if isnan(NACA(ii4)) == 1
             VarName2(ii4) = 0;
         end
      end
    
end
     
    


