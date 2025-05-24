% Drew Villani
% optimal trajectory angle function

clear
clc

function [optimal_angle, max_range] = getOptimalTrajectoryAngle(v0, y0, gravity)
    max_range = 0;
    optimal_angle = 0;
    
    for angle = 0:90
        
        theta = deg2rad(angle);
        
        % calculate velocities
        vx = v0 * cos(theta);
        vy = v0 * sin(theta);        
        % calculate range
        range = (vx / gravity) * (vy + sqrt(vy^2 + 2 * gravity * y0));     
        % update the max and optimal
        if range > max_range
            max_range = range;
            optimal_angle = angle;
               
        end
    end
end