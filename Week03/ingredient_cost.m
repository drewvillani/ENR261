% Student : Drew Villani

clear
clc

totalCost = 0; 
addMore = 'y'; % variable for loop

% == will end loop if you dont put in an optional input
while lower(addMore) == 'y' 
    
    cost = input('Enter the cost of the ingredient: '); % Get ingredient cost
  
    quantity = input('Enter the quantity required: '); % Get quantity
   
    totalCost = totalCost + (cost * quantity); % calculate total cost with given inputs
   
    addMore = input('Would you like to add another ingredient? (y/n): ', 's'); % ask
end

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% uses %.2f to round our dollar amount to two decimal places
fprintf('The total cost of all ingredients is: $%.2f\n', totalCost);
