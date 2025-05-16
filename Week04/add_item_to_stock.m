function add_item_to_stock(filename, upc, ingredient, qty)
    % If file exists, read it
    if isfile(filename)
        inventory = readtable(filename, 'PreserveVariableNames', true);
    else
        inventory = table("","",[],'VariableNames',{'upc','ingredient','qty'});
    end

    % Check if UPC already exists
    idx = find(strcmp(string(inventory.upc), upc), 1);

    if isempty(idx)
        % Add new row
        newRow = {string(upc), ingredient, qty};
        inventory = [inventory; newRow];
    else
        % Update quantity
        inventory.qty(idx) = inventory.qty(idx) + qty;
    end

    % Save updated table
    writetable(inventory, filename);
end
