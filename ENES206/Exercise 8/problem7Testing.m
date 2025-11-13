%hi this is just a test for if i make a seperate file for each question since the main is getting cluttered...
%7/28/24,12:29AM, James Aspilcueta

%going to attempt to use ode45 to solve.
syms y(t) k L
k = 0.22e-3;
L = 3000;
tspan = linspace(0,10,100);
odefunc = @(t,y) k*y*(L-y);
y0 = [70];
[t,y] = ode45(odefunc,tspan,y0);
popAt10 = y(100);
fprintf('The answer to question 7 is')
cprintf('red','% .4f\n',popAt10)