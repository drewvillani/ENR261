function qty = get_stock_quantity(filename, upc)
    qty = -1;

    if ~isfile(filename)
        return;
    end

    inventory = readtable(filename, 'PreserveVariableNames', true);
    idx = find(strcmp(string(inventory.upc), upc), 1);

    if ~isempty(idx)
        qty = inventory.qty(idx);
    end
end
