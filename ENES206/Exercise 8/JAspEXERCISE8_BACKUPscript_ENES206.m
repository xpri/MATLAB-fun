%James Aspilcueta
% ENES 206-12018
% EXERCISE 7
% 7/25/24

%starting question 1
syms t y(t)
%part a
q = diff(y,t) == 2*y + 3*t^2;
w = dsolve(q);
%part b
f = diff(y,t,2) + diff(y,t) == t^2 + 3*t;
e = dsolve(f);
fprintf('The answer to question 1 a is')
cprintf('red',' %s\n',w)
fprintf('The answer to question 1 b is')
cprintf('red',' %s\n',e)

clear %clearing for question 2

syms x y(x)
%part a
q = diff(y,x) + [y]/[x] == x^2;
cond = y(2) == 5;
w = dsolve(q,cond);
fprintf('The answer to question 2 is')
cprintf('red',' %s\n',w)

clear %clearing for question 3

syms u(x)
Du = diff(u);
ode = 4*diff(u,x,2) + 0.5*u == 0;
cond1 = u(0) == 3;
cond2 = Du(0) == -1;
conds = [cond1 cond2];
uSol(x) = dsolve(ode,conds);
fprintf('The answer to question 3 is')
cprintf('red',' %s\n',uSol)

clear %clearing for question 4

syms y(t) t
% Dy = diff(y,x);
% ode = @(x,y) Dy == 2*y - x^2;
ode = @(t,y) 2*y - t^2;
% cond1 = y(1) == 2;
y0 = 1;
tspan = linspace(1,2.8,100);
% domain of x [1 2.8]
[t,y] = ode45(ode,tspan,y0);
% y = x(:,1);
% ydot = x(:,2);
% xdot = {x;}
figure;
plot(t,y);
xlabel('x-axis')
ylabel('y-axis')
title('Solution to question 4')

clear %clearing for question 5

syms y(x)
Dy = diff(y,x);
ode = diff(y,x,2) + y^2 - y == 0;
cond1 = Dy(0) == 1;
cond2 = y(0) == 1;
conds = [cond1,cond2];
ySol(x) = dsolve(ode,conds);
% figure;
% fplot(ySol,[0,5])
% title('Graph of question 5')
% xlabel('x-axis')
% ylabel('y-axis')
fprintf('Question 5: MatLab is unable to provide a symbolic solution.\n')
% cprintf('red',' %s',ySol)

clear %clearing for question 6

syms y(t)
tspan = linspace(0,5,100);
odefunc = @(t,y) [y(2); %first order ode, ydot_1 = y_2
    -y(1)^2+y(1)]; %second order ode, ydot_2 = -y_1^2 + y_1, where y_1 is just y, no derivative whatso ever
y0 = [1,1]; %assumes first condition corresponds to first ode in odefunc, the first 1 is for y(0) = 1 and second 1 is y'(0) = 1
[t,y] = ode45(odefunc,tspan,y0); %using ode45 to numerically solve IVP
figure;
plot(t,y)
xlabel('x-axis')
ylabel('y-axis')
title('Solution of question 6')

clear %clearing for question 7

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

clear %clearing for question 8