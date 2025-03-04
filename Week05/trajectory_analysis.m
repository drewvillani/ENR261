% trajectory_analysis.m
function ranges = calculateTrajectory(angles)
    g = 9.81; % ag (m/s^2)
    velocity = 50; % Vi (m/s)
    
    % angles to rad
    anglesRad = deg2rad(angles);
    
    % compute ranges
    ranges = (velocity.^2 .* sin(2 .* anglesRad)) / g;
end

angles = 0:90;

% compute the ranges
ranges = calculateTrajectory(angles);