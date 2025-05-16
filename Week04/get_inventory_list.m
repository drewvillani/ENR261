function inventory = get_inventory_list(filename)
    if isfile(filename)
        inventory = readtable(filename, 'PreserveVariableNames', true);
    else
        inventory = [];
    end
end
