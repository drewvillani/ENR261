% Drew Villani

clear;
clc;

% analyze_trajectories.m
function [aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges)
    % average range
    avgRange = mean(ranges);
    
    % find above-avergae angles
    aboveAverageAngles = angles(ranges > avgRange);
    
    % max range with the optimal matching angle
    [maxRange, idx] = max(ranges);
    optimalAngle = angles(idx);
end

% calculate trajectory
function ranges = calculateTrajectory(angles)
    g = 9.81; % ag (m/s^2)
    velocity = 50; % Vi (m/s)
    
    % angles to rad
    anglesRad = deg2rad(angles);
    
    % compute ranges
    ranges = (velocity.^2 .* sin(2 .* anglesRad)) / g;
end


% trajectoryAnalysis.m
angles = 0:90;

% compute the ranges
ranges = calculateTrajectory(angles);

% check is ranges exist
if isempty(ranges)
    error('Range data is empty.');
end

% analyze
[aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges);

% display average range
avgRange = mean(ranges);



fprintf('Average Range: %.2f meters\n', avgRange);
fprintf('Maximum Range: %.2f meters at an angle of %d degrees\n', maxRange, optimalAngle);

fprintf('Angles resulting in above-average ranges:\n');

disp(aboveAverageAngles);

% test data
angles = [0,30,45,60,90];
ranges = [0,220,255,220,0];

expectedAverageRange = 139;
expectedMaxRange = 255;
expectedOptimalAngle = 45;
expectedAboveAverageAngles = [30 45 60];

% call
[aboveAverageAngles, maxRange, optimalAngle] = analyzeTrajectories(angles, ranges);

% assertions
assert(abs(mean(ranges) - expectedAverageRange) < 1e-6, 'Average range calculation error.');
assert(abs(maxRange - expectedMaxRange) < 1e-6, 'Maximum range calculation error.');
assert(optimalAngle == expectedOptimalAngle, 'Optimal angle identification error.');
assert(isequal(aboveAverageAngles, expectedAboveAverageAngles), 'Above-average angles identification error.');

disp('All tests passed for analyzeTrajectories.');