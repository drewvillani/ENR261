function edit_inventory_item(filename, upc, newQty)
    if ~isfile(filename)
        fprintf('Error: Inventory file does not exist.\n');
        return;
    end

    inventory = readtable(filename, 'PreserveVariableNames', true);
    idx = find(strcmp(string(inventory.upc), upc), 1);

    if isempty(idx)
        fprintf('UPC %s not found. No changes made.\n', upc);
    else
        inventory.qty(idx) = newQty;
        writetable(inventory, filename);
        fprintf('Quantity for UPC %s updated to %.2f.\n', upc, newQty);
    end
end
