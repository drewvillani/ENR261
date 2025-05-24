% Drew Villani

clc;
clear;

% userinput
v0 = input('Enter the initial velocity (in m/s): ');
y0 = input('Enter the initial height (in meters): ');
guess = input('Enter your guess for the optimal angle (in degrees): ');

g = 9.81;  % m/s^2

%  optimal angle calculation using v0 y0 and g
[optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, g);
fprintf('Optimal launch angle: %.2f degrees\n', optimal_angle);
fprintf('Maximum range: %.2f meters\n', max_range);

% trajectory for optimal and guessed angles
numValues = 100; 
[x_optimal, y_optimal, time_optimal] = calculate_trajectory(v0, optimal_angle, g, y0, numValues);
[x_guess, y_guess, time_guess] = calculate_trajectory(v0, guess, g, y0, numValues);

% plot. green = optimal, red = guessed
%---------------------------------------------------------
figure;
plot(x_optimal, y_optimal, 'g', 'DisplayName', 'Optimal Angle');  
hold on;
plot(x_guess, y_guess, 'r', 'DisplayName', 'Guessed Angle');  
xlabel('Distance (m)');
ylabel('Height (m)');
title('Projectile Trajectories');
legend;
grid on;
%---------------------------------------------------------

% display the difference
fprintf('Assumed angle was off by %.2f degrees.\n', abs(guess - optimal_angle));