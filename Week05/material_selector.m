% Drew Villani

clear;
clc;

% inputs
filename = input('Enter the file name (CSV format): ');
maxDensity = input('Enter the maximum acceptable density (kg/m^3): ');
minTensileStrength = input('Enter the minimum required tensile strength (MPa): ');
maxCost = input('Enter the maximum acceptable cost per kg (USD): ');

% call filter_materials
filteredMaterials = filterMaterials(filename, maxDensity, minTensileStrength, maxCost);

% disp
if isempty(filteredMaterials)
    fprintf('No materials meet your criteria.\n');
else
    fprintf('Materials that meet your criteria:\n');
    fprintf('  Material      Density    TensileStrength    CostPerKg\n');
    fprintf(' __________     _______    _______________    _________\n');
    for i = 1:height(filteredMaterials)
        fprintf('%-12s   %-7d    %-15d    %-9d\n', filteredMaterials.Material{i}, ...
                filteredMaterials.Density(i), ...
                filteredMaterials.TensileStrength(i), ...
                filteredMaterials.CostPerKg(i));
    end
end


% filter_materials
function filteredMaterials = filterMaterials(filename, maxDensity, minTensileStrength, maxCost)
    % turns CSV into a table
    materialsTable = readtable(filename);
    % filters
    withinDensity = materialsTable.Density <= maxDensity;
    withinStrength = materialsTable.TensileStrength >= minTensileStrength;
    withinCost = materialsTable.CostPerKg <= maxCost;

    % combine
    validMaterials = withinDensity & withinStrength & withinCost;

    % pull the filtered results
    filteredMaterials = materialsTable(validMaterials, :);
end

% test_filter_materials.m
disp('Running tests...');

% asserts
assert(isempty(filterMaterials('materials.csv', 2000, 400, 15)), 'Failed');
assert(~isempty(filterMaterials('materials.csv', 5000, 400, 15)), 'Failed');
assert(height(filterMaterials('materials.csv', 8000, 300, 10)) == 2, 'Failed');

disp('Passed!');
