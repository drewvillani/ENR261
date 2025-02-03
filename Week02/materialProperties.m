%Student - Drew Villani

clc
clear

forces = [100, 200, 300, 400, 500]; % forces in Newtons
cross_section_area = 50; % in mm^2
displacements = [0.1, 0.2, 0.3, 0.4, 0.5]; % in mm
original_length = 100; % in mm

% calculation for stress [ forces / area ]
stress = forces ./ cross_section_area; % element-wise division

% calculation for strain [ displacements / original_length ]
strain = displacements ./ original_length; % element-wise division

figure;
plot(stress,strain) % plot with stress on x axis and strain on y axis [(x,y) notation]
xlabel('Strain') % label x axis
ylabel('Stress (N/mm^2)') % label y axis
title('Stress-Strain Curve') % title of graph
grid on;
