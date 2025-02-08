% Student : Drew Villani

clear
clc

%buggy_script3

num = input('Enter a number: ');
if num > 0
        disp('The number is positive.')
elseif num < 0
        disp('The number is negative.')
else
        disp('The number is zero')

sum_even = 0;
i = 2;
while i <= 100
               sum_even = sum_even + i;
end

fprintf('The sum of even numbers between 1 and 100 is: %d\n', sum_even);
