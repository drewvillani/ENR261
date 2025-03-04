% Drew Villani
% Assisted by ChatGPT ( 9 + 10 )

clear;
clc;

% getLowStockItems.m
function LowStockItems()
    threshold = input('Enter the low-stock threshold: ');
    lowStockItems = LowStockItems('inventory.csv', threshold);
    stockMessage = sprintf('%s', repmat('Items low on stock:\n', 1, height(lowStockItems) > 0) + ...
                        repmat('No items are low on stock.\n', 1, height(lowStockItems) == 0)); % used chatgpt for repmat (kept getting errors)
    fprintf(stockMessage);
    disp(lowStockItems);
end