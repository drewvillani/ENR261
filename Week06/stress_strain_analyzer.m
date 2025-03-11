% Drew Villani

clear;
clc;
close all;


%% fitStressStrainCurve.m
function [p, R_squared] = fitStressStrainCurve(materialName, degree, showPlot)
    if nargin < 2 % used chatgpt to figure out nargin input
        degree = 2;
    end
    if nargin < 3
        showPlot = true;
    end

    try
        data = readtable([materialName, '.csv']);
        strain = data.Strain;
        stress = data.Stress;
    catch
        error('Error loading the file. Ensure the file exists and has correct columns (Strain, Stress).');
    end

    if ~isnumeric(degree) || degree < 1
        error('Degree must be a positive integer.');
    end

    p = polyfit(strain, stress, degree); % polynomial coefficient
    fittedStress = polyval(p, strain);

   ss_res = sum((stress - fittedStress).^2);
   ss_tot = sum((stress - mean(stress)).^2);
    R_squared = 1 - (ss_res / ss_tot);

    if showPlot % plot display options
        figure;
        hold on;
        scatter(strain, stress, 'b', 'DisplayName', 'Original Data');
        plot(strain, fittedStress, 'r-', 'LineWidth', 2, 'DisplayName', 'Fitted Curve');
        xlabel('Strain'); ylabel('Stress');
        title(['Stress-Strain Curve for ', materialName]);
        legend;
        grid on;
    end
end

%% stress_strain_analyze
clc;
clear;

fprintf('Please choose a material:\n  1. Steel\n  2. Aluminum\n  3. Brass\n'); % initial options
choice = input('Enter a numeric input: ');

materials = { 'Steel', 'Aluminum', 'Brass' };

if choice < 1 || choice > numel(materials)
    error('Invalid choice. Please select a valid material.'); % if loop for our choices
end

materialName = materials{choice};
degree = input('Enter the degree of the polynomial to fit: ');
showPlot = input('Do you want to display the plot? (1 for Yes, 0 for No): ');

[p, R_squared] = fitStressStrainCurve(materialName, degree, showPlot); % fit our curve, show our plot

disp('Polynomial Coefficients:');
disp(p); % p = polynomial coefficients

fprintf('R-squared Value: %.4f\n', R_squared);

