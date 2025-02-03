% Drew Villani
clc
clear

itemPrices = [2.5, 3.0, 4.5, 5.0]; % price of each item
itemQuantities = [2, 1, 3, 4]; % quantity of each item


% calculate totalCost with element-wise multiplication
totalCost = itemPrices .* itemQuantities;

% fprintf, round our result to two decimal places
fprintf('The total cost of the grocery items is: %.2f\n', sum(totalCost));