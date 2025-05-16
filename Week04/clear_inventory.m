function clear_inventory(filename)
    % Create an empty table with the same variable names and types
    emptyInventory = table(string.empty(0,1), string.empty(0,1), zeros(0,1), ...
        'VariableNames', {'upc', 'ingredient', 'qty'});

    % Overwrite the CSV file with empty table
    writetable(emptyInventory, filename);

    fprintf('Inventory has been cleared.\n');
end
