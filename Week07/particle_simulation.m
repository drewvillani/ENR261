% Drew Villani

clc;
clear;
close all;

numParticles = 10; % simulate 10 particles
numTimeSteps = 100; % sim 100 time steps

% sim particle motion (data)
particles = simulate_particle_motion(numParticles, numTimeSteps);

% v avg for the particles
avgVelocities = zeros(numParticles, 2); 
for i = 1:numParticles
    avgVelocities(i, 1) = particles(i).ID; 
    avgVelocities(i, 2) = calculate_average_velocity(particles(i));
end

% store average velocities array to a table, then display the table
velocityTable = array2table(avgVelocities, 'VariableNames', {'ID', 'AverageVelocity'});
disp('Particle Average Velocities:');
disp(velocityTable);

% plot trajectories
%----------------------------------------------------------------------------------------------------
figure;
hold on;
for i = 1:numParticles
    plot3(particles(i).Position(:,1), particles(i).Position(:,2), particles(i).Position(:,3), 'DisplayName', ['Particle ' num2str(i)]);
end
hold off;
xlabel('X Position');
ylabel('Y Position');
zlabel('Z Position');
title('3D Particle Trajectories');
legend show;
grid on;
%----------------------------------------------------------------------------------------------------

% save data to mat file
save('particleData.mat', 'particles');