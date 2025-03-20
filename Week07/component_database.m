% Drew Villani

close all;
clear;
clc;

function structArray = addComponent(structArray, componentStruct)
    % add a component to the array
    structArray(end + 1) = componentStruct;
end

function tableData = struct2Table(structArray)
    % convert our array into a table
    tableData = struct2table(structArray);
end

% component_database.m

% Initialize an empty structure array
componentDB = struct('ID', {}, 'Name', {}, 'Length', {}, 'Width', {}, 'Height', {}, 'Material', {}, 'Weight', {});

% add components using addComponent function
component1 = struct('ID', 1, 'Name', 'Beam', ...
    'Length', 2.5, 'Width', 0.3, 'Height', 0.5, ...
    'Material', 'Steel', 'Weight', 150.0);

component2 = struct('ID', 2, 'Name', 'Column', ...
    'Length', 3.0, 'Width', 0.4, 'Height', 0.4, ...
    'Material', 'Concrete', 'Weight', 200.0);

component3 = struct('ID', 3, 'Name', 'Bolt', ...
    'Length', 0.1, 'Width', 0.02, 'Height', 0.02, ...
    'Material', 'Alloy', 'Weight', 0.5);

% add components
componentDB = addComponent(componentDB, component1);
componentDB = addComponent(componentDB, component2);
componentDB = addComponent(componentDB, component3);

% format out array into a table
componentTable = struct2Table(componentDB);

% save the table to a CSV file
writetable(componentTable, 'componentsDatabase.csv');

% table from our saved CSV
loadedTable = readtable('componentsDatabase.csv');

% fprintf our rows and columns with info
fprintf('\nID    Name     Length (m)    Width (m)    Height (m)    Material    Weight (kg)\n');
fprintf('-------------------------------------------------------------------------------\n');

for i = 1:height(loadedTable)
    fprintf('%-5d %-8s %-12.2f %-10.2f %-10.2f %-10s %.2f\n', ...
        loadedTable.ID(i), loadedTable.Name{i}, loadedTable.Length(i), ...
        loadedTable.Width(i), loadedTable.Height(i), ...
        loadedTable.Material{i}, loadedTable.Weight(i));
end
