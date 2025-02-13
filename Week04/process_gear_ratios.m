% Drew Villani

clear
clc

%  input and output CSV file
inputFile = 'gear_data.csv';
outputFile = 'gear_ratios_output.csv';

% error if the file doesnt exist (used ai for this)
if ~isfile(inputFile)
    error('Error: %s not found.', inputFile);
end

% read file -> table
data = readtable(inputFile);

% error if the columns dont exist in input file (used ai for this)
if ~all(ismember({'driverTeeth', 'drivenTeeth'}, data.Properties.VariableNames))
    error('Error: Input CSV file must contain "driverTeeth" and "drivenTeeth" columns.');
end

% Compute gear ratios for each row
data.gearRatio = arrayfun(@gearRatioCalc, data.driverTeeth, data.drivenTeeth);

% Write the updated data to a new CSV file
writetable(data, outputFile);

fprintf('Gear ratios successfully calculated and saved to %s\n', outputFile);
