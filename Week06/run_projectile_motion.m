% Drew Villani

close all;
clear;
clc;


% inputs
v0 = input('Enter the initial velocity (m/s): ');
angle = input('Enter the launch angle (degrees): ');
g = input('Enter gravitational acceleration (m/s^2): ');

% call, with inputs
projectileMotionWithKeyPoints(v0, angle, g);
