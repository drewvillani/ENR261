% Drew Villani
% projectile comparison function

clear
clc

function [x, y, time] = calculateTrajectory(v0, angle, g, y0, numValues)
    % Convert angle to radians
    theta = deg2rad(angle);
    
    % Compute initial velocity components
    vx = v0 * cos(theta);
    vy = v0 * sin(theta);
    
    % Compute total flight time using quadratic equation
    total_time = (vy + sqrt(vy^2 + 2 * g * y0)) / g;
    
    % Create time array from 0 to total_time with numValues points
    time = linspace(0, total_time, numValues);
    
    % Compute x and y positions over time
    x = vx * time;
    y = y0 + vy * time - 0.5 * g * time.^2;

    % asserts - time
    assert(all(time >= 0), 'Error: Time values must be non-negative');
    assert(issorted(time), 'Error: Time values must be increasing');

    % asserts - horizontal position
    assert(all(x >= 0), 'Error: Horizontal position values must be non-negative');

    % asserts - initial vertical position
    assert(y(1) >= 0, 'Error: Initial vertical position must be greater or equal to 0');
    assert(all(y > 0), 'Error: Vertical position values must be non-negative');

    % asserts - final y
    assert(abs(y(end)) < 1e-6, 'Error: Final y value must be close to 0');


   
end