%Student- Drew Villani

clc
clear

gravity = 9.81; % in m/s^2
initial_v = 50; % in m/s
time = 0:0.1:10; % from 0 to 10 seconds with 0.1 step

height = initial_v .* time - (1/2) * gravity .* time.^2;  % equation for height
disp(height) % display the result for height

plot(time,height); % plot with time (x) and height (y)
xlabel('Time (s)') % label x axis
ylabel('Height (m)') % label y axis
title('Projectile Motion Under Gravity') % label our graph
