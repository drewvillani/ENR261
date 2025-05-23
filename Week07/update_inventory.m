% Drew Villani
% Used AI to figure out the warning display

% updateInventory.m
function inventoryTable = update_inventory(inventoryTable, recipeCell)
    % This function updates the inventory table based on the ingredients
    % required for a specific recipe. It subtracts the quantities of 
    % ingredients in the recipe from the inventory table.
    
% extraction
    ingredients = recipeCell{2};
    
    for i = 1:length(ingredients)
        ingredient = ingredients{i};
        
                % find ingredient
        idx = strcmp(inventoryTable.Name, ingredient.Name);
        
        if any(idx)
                % check stock qty
            if inventoryTable.Quantity(idx) >= ingredient.Quantity
                % subtract from stock qty, update table
                inventoryTable.Quantity(idx) = inventoryTable.Quantity(idx) - ingredient.Quantity;
            else
                % warning if theres not enough of an ingredient
                warning('Insufficient % in inventory.', ingredient.Name); %chatgpt
            end
        else
            % displays a warning if the ingredient isnt found
            warning('% is not found in inventory.', ingredient.Name); % chatgpt
        end
    end
end