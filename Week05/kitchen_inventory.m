% Drew Villani

clear;
clc;

% kitchenInventory.m

options = [
    "1. Add an ingredient",...
    "2. Print inventory list",...
    "3. Check ingredient quantity by UPC",...
    "4. Check for low-stock items",...
    "0. Exit"
];


disp('Script is running...')


% interaction organization
fprintf('----------------------------------\n');
fprintf('| Welcome to the Kitchen Inventory Manager!\n');
fprintf('|\n');
fprintf('| Please select an option:\n');
fprintf('%s\n', options{:}); % used chat gpt lines 21-35
choice = input('> ');
choiceActions = {
    @() addIngredient(); 
    @() printInventory();
    @() checkQuantity(); 
    @() checkLowStock(); 
    @() exitManager();
};

validChoices = [1, 2, 3, 4, 0];
executeAction = choiceActions{validChoices == choice};
executeAction();

% functions
function addIngredient()
    upc = input('Enter the UPC: ');
    ingredient = input('Enter the ingredient name: ', 's');
    qty = input('Enter the quantity: ');
    newIngredient = table(upc, {ingredient}, qty, 'VariableNames', {'upc', 'ingredient', 'qty'});
    writetable(newIngredient, 'inventory.csv', 'WriteMode', 'append');
    fprintf('Ingredient added successfully.\n');
end

function printInventory()
    inventory = readtable('inventory.csv');
    disp(inventory);
end

function checkQuantity()
    upcCheck = input('Enter the UPC to check quantity: ');
    inventory = readtable('inventory.csv');
    itemIdx = inventory.upc == upcCheck;
    qtyMessage = arrayfun(@(idx) sprintf('Quantity of %s: %d\n', inventory.ingredient{idx}, inventory.qty(idx)), find(itemIdx), 'UniformOutput', false);
    fprintf('%s', qtyMessage{:});
end

function checkLowStock()
    threshold = input('Enter the low-stock threshold: ');
    lowStockItems = getLowStockItems('inventory.csv', threshold);
    stockMessage = sprintf('%s', repmat('Items low on stock:\n', 1, height(lowStockItems) > 0) + ...
                        repmat('No items are low on stock.\n', 1, height(lowStockItems) == 0)); % used chatgpt for repmat (kept getting errors)
    fprintf(stockMessage);
    disp(lowStockItems);
end

function exitManager()
    fprintf('Exiting Kitchen Inventory Manager. Goodbye!\n');
end

% get_low_stock_items.m
function lowStockItems = getLowStockItems(filename, threshold)
    inventoryTable = readtable(filename);
    lowStockItems = inventoryTable(inventoryTable.qty <= threshold, :);
end

% test
disp('Running tests..');

testInventory = table([123654; 789012], {'Wheat Bread'; 'Milk'}, [1; 3], 'VariableNames', {'upc', 'ingredient', 'qty'});
writetable(testInventory, 'test_inventory.csv');

assert(height(getLowStockItems('test_inventory.csv', 2)) == 1, 'Failed (1)');
assert(height(getLowStockItems('test_inventory.csv', 5)) == 2, 'Failed (2)');
assert(isempty(getLowStockItems('test_inventory.csv', 0)), 'Failed (3)');

disp('Passed!');
