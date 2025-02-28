% Drew Villani

clear;
clc;

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
