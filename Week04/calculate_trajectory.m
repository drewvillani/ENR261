% Drew Villani

clear
clc

% inputs
v0 = input('Enter initial velocity (in m/s): ');
y0 = input('Enter initial height (in m): ');
guess_angle = input('Enter your guess for the optimal angle (in degrees): ');

% gravity
g = 9.81;

% optimal angle, max range
[optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, g);

% trajectories
numValues = 100;
[x_guess, y_guess, ~] = calculateTrajectory(v0, guess_angle, g, y0, numValues);
[x_optimal, y_optimal, ~] = calculateTrajectory(v0, optimal_angle, g, y0, numValues);

% plot - trajectories
figure;
plot(x_guess, y_guess, 'r', x_optimal, y_optimal, 'b');
xlabel('Distance (m)');
ylabel('Height (m)');
title('Projectile Motion Comparison');
legend('Guessed Angle', 'Optimal Angle');
grid on;

% disp results
fprintf('Optimal launch angle: %.2f degrees\n', optimal_angle);
fprintf('Maximum range: %.2f meters\n', max_range);
fprintf('Your guess was off by %.2f degrees.\n', abs(optimal_angle - guess_angle));

function [optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, gravity)
    max_range = 0;
    optimal_angle = 0;
    
    for angle = 0:90
        
        theta = deg2rad(angle);
        
        % horizontal v
        vx = v0 * cos(theta);
        vy = v0 * sin(theta);
        
        % calculate range using projectile motion eq
        range = (vx / gravity) * (vy + sqrt(vy^2 + 2 * gravity * y0));
        
        % change maximum range and optimal angle if a new max is found
        if range > max_range
            max_range = range;
            optimal_angle = angle;
               
        end
    end
end

function [x, y, time] = calculateTrajectory(v0, angle, g, y0, numValues)
    % Convert angle to radians
    theta = deg2rad(angle);
    
    % compute vi
    vx = v0 * cos(theta);
    vy = v0 * sin(theta);
    
    % compute total flight time
    total_time = (vy + sqrt(vy^2 + 2 * g * y0)) / g;
    
    % time array from 0 to total_time with numValues as points
    time = linspace(0, total_time, numValues);
    
    % x and y pos over time
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

% issue with graph ; couldn't figure out how to make my plotted line dotted
