% Drew Villani

clear
clc

function inventory = getInventoryList(filename)
    % check if file exists
    if isfile(filename)
        inventory = readtable(filename, 'PreserveVariableNames', true);
    else
        fprintf('Error: Inventory file not found.\n');
   
    end
end
