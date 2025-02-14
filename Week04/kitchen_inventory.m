% Drew Villani

clear
clc

filename = 'inventory.csv';

while true
    % Display menu
    fprintf('----------------------------------\n');
    fprintf('| Welcome to the Kitchen Inventory Manager!\n');
    fprintf('| \n');
    fprintf('| Please select an option:\n');
    fprintf('| 1. Add an ingredient\n');
    fprintf('| 2. Print inventory list\n');
    fprintf('| 3. Check ingredient quantity by UPC\n');
    fprintf('| 0. Exit\n');
    fprintf('> ');
    
    choice = input('', 's');

    switch choice
        case '1'  % add an ingredient
            upc = input('Enter the UPC: ', 's');
            ingredient = input('Enter the ingredient name: ', 's');
            qty = input('Enter the quantity: ');

            addItemToStock(filename, upc, ingredient, qty);
            fprintf('Ingredient added successfully.\n');

        case '2'  % print inv list
            disp('Inventory List:');
            inventory = getInventoryList(filename);
            disp(inventory);

        case '3'  % check via UPC
            upc = input('Enter the UPC: ', 's');
            quantity = getStockQty(filename, upc);

            if quantity == -1
                fprintf('UPC %s not found in inventory.\n', upc);
            else
                fprintf('UPC %s - Quantity: %.2f\n', upc, quantity);
            end

        case '0'  % end
            fprintf('Goodbye!\n');
            break;

        otherwise
            fprintf('Invalid choice. Please try again.\n');
    end
end
