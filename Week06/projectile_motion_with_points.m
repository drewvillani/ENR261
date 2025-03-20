% Drew Villani

close all;
clear;
clc;

function projectile_motion_with_key_points(v0, angle, g)
    % deg to rad
    theta = deg2rad(angle);
    
    % time (flight)
    t_flight = (2 * v0 * sin(theta)) / g;
    
    % time (vector)
    t = linspace(0, t_flight, 100);
    
    % x and y position equations
    x = v0 * cos(theta) * t;
    y = v0 * sin(theta) * t - (0.5 * g * t.^2);
    
    % apex (max)
    t_apex = v0 * sin(theta) / g;
    y_max = (v0^2 * sin(theta)^2) / (2 * g);
    x_apex = v0 * cos(theta) * t_apex;
    
    % max range equation
    R = (v0^2 * sin(2 * theta)) / g;
    
    % plot
    figure;
    plot(x, y, 'b', 'LineWidth', 2);
    hold on;
    plot(x_apex, y_max, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r'); % Apex
    plot(R, 0, 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g'); % Range
    xlabel('Horizontal Distance (m)');
    ylabel('Vertical Distance (m)');
    title('Projectile Motion');
    legend('Trajectory', 'Apex', 'Max Range');
    grid on;
    hold off;
    
    % mass, velocity x/y, ME and GE equations
    m = 1; % example mass = 5 kg
    vx = v0 * cos(theta);
    vy = v0 * sin(theta) - g * t;
    KE = 0.5 * m * (vx.^2 + vy.^2);
    GE = m * g * y; % mgh basically
    
    % energy graph format and plot
    figure;
    area(t, KE, 'FaceColor', 'r', 'FaceAlpha', 0.5);
    hold on;
    area(t, GE, 'FaceColor', 'b', 'FaceAlpha', 0.5);
    xlabel('Time (s)');
    ylabel('Energy (J)');
    title('Kinetic and Potential Energy over Time');
    legend('Kinetic Energy', 'Potential Energy');
    grid on;
    hold off;
end

% run projectile_motion_with_points.m with user input

% user inputs
v0 = input('Enter the initial velocity (m/s): ');
angle = input('Enter the launch angle (degrees): ');
g = input('Enter gravitational acceleration (m/s^2): ');

% call projectile_motion_with_points.m
projectile_motion_with_key_points(v0, angle, g);
