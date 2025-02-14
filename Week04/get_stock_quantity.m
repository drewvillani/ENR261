% Drew Villani

clear
clc

function qty = getStockQty(filename, upc)

    % check if file exists
    if ~isfile(filename)
        fprintf('Error: Inventory file does not exist.\n');
        return;
    end

    % inventory
    inventory = readtable(filename, 'PreserveVariableNames', true);

    % find UPC
    findupc = find(strcmp(inventory.upc, upc), 1);

    if ~isempty(findupc)
        qty = inventory.qty(findupc);
    end
end
