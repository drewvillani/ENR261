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
    catch % catch ; error code if there's an issue with the csv
        error('Error loading the file. Ensure the file exists and has correct columns (Strain, Stress).');
    end

    if ~isnumeric(degree) || degree < 1
        error('Degree must be a positive integer.');
    end

    p = polyfit(strain, stress, degree); % polynomial coefficient
    fittedStress = polyval(p, strain);

   ss_res = sum((stress - fittedStress).^2); % residual sum
   ss_tot = sum((stress - mean(stress)).^2); % total sum
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
