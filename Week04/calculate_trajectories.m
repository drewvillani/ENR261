% Drew Villani
%calculate_trajectories
clear;
clc;

function [x, y, time] = calculate_trajectory(v0, angle, g, y0, numValues)
    % This function calculates the trajectory of a projectile.
    
    % velocities : x = horizontal , y = vertical
    vx = v0 * cosd(angle); 
    vy = v0 * sind(angle);

    % total time
    time_f = (vy + sqrt(vy^2 + 2 * g * y0)) / g;
    time = linspace(0, time_f, numValues);

    % positions
    x = vx * time;
    y = y0 + vy * time - 0.5 * g * time.^2;
end

