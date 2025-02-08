% Student : Drew Villani

clear
clc

% user input
initial_height = input('Enter the height of the ball: '); % meters

% constants
g = 9.8; % m/s^2
t_step = 0.1; % seconds
time = 0; % seconds
height = initial_height; % meters

% loop
fprintf('Time = %.1f s, Height = %.2f m\n', time, height );
while height > 0
        time = time + t_step;

        height = initial_height - 0.5 * g * (time)^2; % h = hi - 1/2(a)(t)^2

        if height <= 0 % making the ball's height stop when it hits the ground (0 m)
                height = 0;     
        end

        fprintf('Time = %.1f s, Height = %.2f m\n', time, height );
      
end

