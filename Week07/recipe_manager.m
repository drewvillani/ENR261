% drew villani
% recipe_manager.m

% recipes
% ------------------------------
recipeCellArray = {
    {'Pancakes', {
        struct('Name', 'Flour', 'Quantity', 200, 'Unit', 'grams'), ...
        struct('Name', 'Eggs', 'Quantity', 2, 'Unit', 'each'), ...
        struct('Name', 'Milk', 'Quantity', 300, 'Unit', 'ml')
    }};
    {'Omelette', {
        struct('Name', 'Eggs', 'Quantity', 3, 'Unit', 'each'), ...
        struct('Name', 'Cheese', 'Quantity', 50, 'Unit', 'grams'), ...
        struct('Name', 'Salt', 'Quantity', 1, 'Unit', 'teaspoon')
    }}
};

% inv table
% ------------------------------
inventory_table = table( ...
    {'Flour'; 'Eggs'; 'Milk'; 'Cheese'; 'Salt'}, ...
    [800; 5; 700; 100; 50], ...
    {'grams'; 'each'; 'ml'; 'grams'; 'grams'}, ...
    'VariableNames', {'Name', 'Quantity', 'Unit'});


% recipes
% ------------------------------
disp('Recipes:');
for i = 1:length(recipeCellArray)
    fprintf('%d. %s\n', i, recipeCellArray{i}{1});
    ingredients = recipeCellArray{i}{2};
    for j = 1:length(ingredients)
        fprintf('   - %s: %g %s\n', ingredients{j}.Name, ...
                ingredients{j}.Quantity, ingredients{j}.Unit);
    end
end

% display current inventory
% ------------------------------
disp(' ');
disp('Current Inventory:');
disp(inventory_table);

% recipe choice for user
% ------------------------------
recipe_choice = input('Enter the recipe number to use (1 or 2): ');
if recipe_choice < 1 || recipe_choice > length(recipeCellArray)
    error('Invalid recipe number.');
end

% update Inventory
% ------------------------------
disp(['Updating inventory for "' recipeCellArray{recipe_choice}{1} '"...']);
inventory_table = update_inventory(inventory_table, recipeCellArray{recipe_choice});
disp('Inventory updated successfully.');

% Display Updated Inventory
% ------------------------------
disp('Updated Inventory:');
disp(inventory_table);

% save to CSV
% ------------------------------
writetable(inventory_table, 'ingredientInventory.csv');

