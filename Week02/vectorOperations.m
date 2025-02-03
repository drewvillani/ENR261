x = [1, 3, 5, 7, 9]; % commas to list numbers in a row, seperated
y = [2; 4; 6; 8; 10]; % semi colons to go to the next line
xy = x.*y; % .* to multiply our vectors element-wise
xT = transpose(x); % change our x row into a column
sumx = sum(x); % self explanatory
disp('The sum of x is:') % disp our text on one line
disp(sumx) % disp our value below our inputted text