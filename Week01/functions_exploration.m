% fprintf
a = 241.0042;

fprintf ('I am %d years old\n', a) % "%d" is a placeholder for an integer and "a" is the variable that's plugged in
% I am 241.0042 years old


% plot
x = 0:1:10; % x values from 0-10 with the step of 1
y = cos(x); % y value is the cosine of x
plot(x,y); % plot our x and y onto a 2D graph
grid on; % turn the visual grid on so we can better visualize our data
title('cos(x)'); % title adds formatted text to our graph labeling it as 'cos(x)'


% disp
z = 3.14; % z is the value of pi
disp(z) % display the value of z (pi)
% 3.14


