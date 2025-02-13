% Drew Villani

clear
clc

% user inputs
v0 = input('Enter initial velocity (in m/s): ');
y0 = input('Enter initial height (in m): ');
guess_angle = input('Enter your guess for the optimal angle (in degrees): ');

% gravity constant
g = 9.81;

% optimal angle and maximum range
[optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, g);

% trajectories for guessed and optimal angles
numValues = 100;
[x_guess, y_guess, ~] = calculateTrajectory(v0, guess_angle, g, y0, numValues);
[x_optimal, y_optimal, ~] = calculateTrajectory(v0, optimal_angle, g, y0, numValues);

% plot traj
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
        
        % Compute horizontal velocity component
        vx = v0 * cos(theta);
        vy = v0 * sin(theta);
        
        % Compute range using projectile motion equation
        range = (vx / gravity) * (vy + sqrt(vy^2 + 2 * gravity * y0));
        
        % Update maximum range and optimal angle if a new max is found
        if range > max_range
            max_range = range;
            optimal_angle = angle;
               
        end
    end
end

function [x, y, time] = calculateTrajectory(v0, angle, g, y0, numValues)
    % Convert angle to radians
    theta = deg2rad(angle);
    
    % Compute initial velocity components
    vx = v0 * cos(theta);
    vy = v0 * sin(theta);
    
    % computing total flight time
    total_time = (vy + sqrt(vy^2 + 2 * g * y0)) / g;
    
    % time array
    time = linspace(0, total_time, numValues);
     
    % x and y positions overtime
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
