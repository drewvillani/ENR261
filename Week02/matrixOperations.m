% Student name: Drew Villani

A = [1, 2, 3; 4, 5, 6; 7, 8, 9];
B = [9, 8, 7; 6, 5, 4; 3, 2, 1]; % semi colon to create new rows (3x3)

C = A + B; % add our two matrix inputs and label the sum as C
disp('Matrix C')
disp(C) % display our inputted text with the value of C below it

D = A - B; % subtract our two matrix inputs and label the difference as D
disp('Matrix D')
disp(D) % display our inputted text with the value of D below it

E = A.*B; % element-wise multiply matrix A and B
disp('Matrix E')
disp(E) % display our inputted text with the value of E below it

scalar = 2; % for organization, I made scalar into a variable with the value of 2
F = A.*scalar; % element-wise multiply our A matrix and scalar (2)
disp('MatrixF')
disp(F) % display our inputted text with the value of F below it

