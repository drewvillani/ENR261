% Drew Villani

% calculate_average_velocity.m
function avgVelocity = calculate_average_velocity(particle)
    % calculate the distance traveled
    totalDistance = 0;
    
    for i = 2:length(particle.Time)
        distance = norm(particle.Position(i,:) - particle.Position(i-1,:));        % calculate the Euclidean distance between positions
        totalDistance = totalDistance + distance;
    end    
    % calculate time
    totalTime = particle.Time(end) - particle.Time(1);
  
    % calculate average velocity (d/t)
    avgVelocity = totalDistance / totalTime;
end