% Drew Villani

% simulate_particle_motion.m
function particles = simulate_particle_motion(numParticles, numTimeSteps)
    % sim the motion of particles in space
    particles(numParticles) = struct('ID', [], 'Position', [], 'Time', []);
    
    % loop through every particle
    for i = 1:numParticles
        particles(i).ID = i; % particle ID
        particles(i).Time = linspace(0, 10, numTimeSteps)'; % time from 0:10
        
        % generate positions (random) for each time steps from 0:100
        particles(i).Position = rand(numTimeSteps, 3) * 100; 
    end
end