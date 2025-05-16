% Drew Villani 
% Kitchen Inventory Manager aka kitchen god tool

clear
clc

filename = 'inventory.csv';

while true
    fprintf('----------------------------------\n');
    fprintf('| Welcome to the Kitchen Inventory Manager!\n');
    fprintf('| \n');
    fprintf('| Please select an option:\n');
    fprintf('| 1. Add an ingredient\n');
    fprintf('| 2. Print inventory list\n');
    fprintf('| 3. Check ingredient quantity by UPC\n');
    fprintf('| 4. Edit ingredient quantity by UPC\n');
    fprintf('| 5. Clear entire inventory\n');
    fprintf('| 0. Exit\n');
    fprintf('> ');
    
    choice = input('', 's');


    switch choice

%%% CASE 1 %%%

        case '1'  % Add an ingredient
            upc = input('Enter the UPC: ', 's');  % disp as strings
            ingredient = input('Enter the ingredient name: ', 's');
            qty = input('Enter the quantity: ');

            add_item_to_stock(filename, upc, ingredient, qty);
            fprintf('Ingredient added successfully.\n');

%%% CASE 2 %%%

        case '2'  % Print inventory list
            inventory = get_inventory_list(filename);
            if isempty(inventory)
                disp('Inventory is empty.');
            else
                inventory.upc = string(inventory.upc);  % disp as strings (no scientific notation / ugly UPC)
                fprintf('Inventory List:\n');
                for i = 1:height(inventory)
                    fprintf('UPC: %s | Ingredient: %s | Qty: %.2f\n', ...
                        inventory.upc(i), inventory.ingredient{i}, inventory.qty(i));
                end
            end

%%% CASE 3 %%%            

        case '3'  % Check ingredient quantity by UPC
            upc = input('Enter the UPC: ', 's');
            quantity = get_stock_quantity(filename, upc);

            if quantity == -1
                fprintf('UPC %s not found in inventory.\n', upc);
            else
                fprintf('UPC %s - Quantity: %.2f\n', upc, quantity);
            end

%%% CASE 4 %%%

        case '4'  % Edit ingredient quantity by UPC
             upc = input('Enter the UPC to edit: ', 's');
            newQty = input('Enter the new quantity: ');
            edit_inventory_item(filename, upc, newQty);

%%% CASE 5 %%%            

        case '5'  % Clear entire inventory - replaces csv with a blank one
            confirm = input('Are you sure you want to clear the inventory? (y/n): ', 's');
            if strcmpi(confirm, 'y')
            clear_inventory(filename);
            else
                fprintf('Inventory not cleared.\n');
            end

%%% CASE 0 %%%

        case '0'
            fprintf('Seeya!!\n');
            break;


        otherwise
            fprintf('Invalid input. Try again dude.\n');
    end
end


% functions below %

%%% CASE 1 %%%

function add_item_to_stock(filename, upc, ingredient, qty)
    % read the file (if its real & is found)
    if isfile(filename)
        inventory = readtable(filename, 'PreserveVariableNames', true);
    else
        inventory = table("","",[],'VariableNames',{'upc','ingredient','qty'});
    end

    % Check if UPC already exists
    idx = find(strcmp(string(inventory.upc), upc), 1);

    if isempty(idx)
        % add anotha row
        newRow = {string(upc), ingredient, qty};
        inventory = [inventory; newRow];
    else
        % update da quantity
        inventory.qty(idx) = inventory.qty(idx) + qty;
    end

    % save da table
    writetable(inventory, filename);
end


%%% CASE 2 %%%

function inventory = get_inventory_list(filename)
    if isfile(filename)
        inventory = readtable(filename, 'PreserveVariableNames', true);
    else
        inventory = [];
    end
end

%%% CASE 3 %%%

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

%%% CASE 4 %%%

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

%%% CASE 5 %%%

function clear_inventory(filename)
    % create anotha table with the same column setup
    emptyInventory = table(string.empty(0,1), string.empty(0,1), zeros(0,1), ...
        'VariableNames', {'upc', 'ingredient', 'qty'});

    % overwrite inventory.csv with our newly generated table
    writetable(emptyInventory, filename);

    fprintf('Inventory has been cleared.\n');
end
