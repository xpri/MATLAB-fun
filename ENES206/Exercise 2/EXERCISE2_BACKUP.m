%James Aspilcueta
% ENES 206-12018
% EXERCISE 2
% 7/10/24

fprintf('\n')

x = linspace(0,pi,88); %This is the answer to question 1

%Starting question 2

y = 2 * cos(2 * x) + 5 * x - 7;
maxy = max(y);
fprintf('The max value of y for question 2 from a domain of x from 0 through pi with 88 points, equallaly spaced out, is')
cprintf('red', '% .4f\n', maxy)
fprintf('\n')

%starting question 3

y = (x .^2) .* (cos(x) + x);
maxy = max(y);
fprintf('The max value of y for question 3 from a domain of x from 0 through pi with 88 points, equallaly spaced out, is')
cprintf('red', '% .4f\n', maxy)
fprintf('\n')

clear %clearing to start question 4

x = [4.2:0.1:8.6];
y = [x .^2 - 4 * x - 5]/[exp(-x) + cos(x)]; %starting question 5
sumy = sum(y);
fprintf('Question 5: The sum of all the elements in the vector defined in problem 4 is')
cprintf('red', '% .4f\n', sumy)
fprintf('\n')

clear %starting question 6

syms x y

%starting question 7

y = 1 - [1]/[1 + 1/x];
simpley = simplifyFraction(y);
fprintf('The simplified expression for question 7 is')
cprintf('red', ' %s\n', simpley)
fprintf('\n')

clear %clearing for question 8

syms x y %declaring variables again
y = -2*x^6 - 15*x^5 - 30*x^4 - 29*x^3 - 72*x^2 + 48*x;
facty = factor(y);
fprintf('The factored polynomial mentioned in question 8 is ')
cprintf('red', '%s', facty)
fprintf('\n')
fprintf('\n')

clear %starting question 9

syms x y %once again declaring variables
y = (4*x - 1)^4 - (x + 2)^2;
xpandy = expand(y);
fprintf('The expanded y(x) function in question 9 is ')
cprintf('red', '%s', xpandy)
fprintf('\n')
fprintf('\n')

x = pi/2; %initializing variables
y = (4*x - 1)^4 - (x + 2)^2; %redefining y to update existing x variable within the function
fprintf('Question 10: The value of y(pi/2) is')
cprintf('red','% .4f', y)
fprintf('\n')

clear %clearing all variables to start question 11

syms x y z %declaring variables
z(x,y) = [(cos(x))^2 + sin(y^2)]/[x^2 + y^2] %note, no use of semi colon
x = 1.2;
y = -2.1;
z = ((cos(x))^2 + sin(y^2))/(x^2 + y^2);
fprintf('Question 12: z(1.2,-2.1) is ')
cprintf('red', '%.4f\n', z)

