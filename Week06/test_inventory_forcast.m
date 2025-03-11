% Drew Villani

clear;
close all;
clc;

% inventory_forcast.m
function [inventoryOverTime, y_future] = inventor_forecast(upc, totalDays, futureDays, inventoryFile, usageFile)
    try
        % check if the file exists first
        if ~isfile(inventoryFile) || ~isfile(usageFile)
            error('One or both files do not exist. Check the file paths.');
        end
        
        % inv and usage tables
        inventoryData = readtable(inventoryFile);
        usageData = readtable(usageFile);
    catch ME
        error('Error loading files: %s', ME.message);
    end

    % upc validation / existence
    item = inventoryData(strcmp(string(inventoryData.upc), string(upc)), :);
    if isempty(item)
        error('UPC not found in inventory data.');
    end

    initialQty = item.qty;
    usageLog = usageData(strcmp(string(usageData.upc), string(upc)), :);

    % inventory tracking
    inventoryOverTime = zeros(totalDays, 1);
    inventoryOverTime(1) = initialQty;

    % inventory over an amount of time (days)
    for day = 2:totalDays
        dailyUsage = sum(usageLog.qty(usageLog.day == day));
        inventoryOverTime(day) = inventoryOverTime(day-1) + dailyUsage;
    end

    % forecasting
    days = (1:totalDays)';
    p = polyfit(days, inventoryOverTime, 1);
    futureDaysVec = (totalDays+1:totalDays+futureDays)';
    y_future = polyval(p, futureDaysVec);

    % plot our results, include axis titles, grid, and legend
    figure;
    hold on;
    plot(days, inventoryOverTime, 'b', 'LineWidth', 2, 'DisplayName', 'Historical Inventory');
    plot(futureDaysVec, y_future, 'r--', 'LineWidth', 2, 'DisplayName', 'Forecasted Inventory');
    xlabel('Days'); ylabel('Inventory Level');
    title(['Inventory Forecast for ', item.ingredient{1}]);
    legend;
    grid on;
end

%% testInventoryForecast.m
clc;
clear;

inventoryFile = 'Inventory.csv';
usageFile = 'UsageLog.csv';

totalDays = 90; % total

% display the ingredients
if isfile(inventoryFile)
    inventoryData = readtable(inventoryFile);

    % used ChatGPT to help convert UPC to string and display without using scientific notation
    inventoryData.upc = arrayfun(@(x) sprintf('%.0f', x), inventoryData.upc, 'UniformOutput', false);

    disp('Available ingredients for analysis:');
    disp(inventoryData(:, {'upc', 'ingredient'}));
else
    error('Inventory file not found. Please check the file path.');
end

upc = input('Enter the UPC of the ingredient you want to analyze: ', 's');
futureDays = input('How many days would you like to forecast? ');

try
    [inventoryOverTime, y_future] = inventor_forecast(upc, totalDays, futureDays, inventoryFile, usageFile);
catch oops
    fprintf('Error: %s\n', oops.message);
end
