%James Aspilcueta
% ENES 206-12018
% EXERCISE 4
% 7/20/24

syms x %starting question 1
% f = matlabFunction(x.^4 + 2.*x.^3 - 8.*x.^2 - 9.*x + 18); %testing purposes
f = @(x) x.^4 + 2.*x.^3 - 8.*x.^2 - 9.*x + 18; 
sol = (f(1.2))^2 + f(-3.5) * cos(pi/6);
fprintf('The answer to question 1 is')
cprintf('red','% .4f\n',sol)

% clear %clearing for question 2 %no need to clear

zerof = fzero(f,-2);
fprintf('The answer to question 2 is')
cprintf('red',' %.4f\n',zerof)

clear %clearing for question 3

syms x
g = @(x) 4.*x.^2 + 5.*(x - 1.5).^2; h = @(x) 3.*x + 23; %finished question 3
[solx] = solve(g(x) == h(x),x);          %starting question 4
[soly] = h(solx);
fprintf('Question 4: the intersections are')
cprintf('red','(%.4f,%.4f) and (%.4f,%.4f)\n',solx(1),soly(1),solx(2),soly(2))

% clear %clearing for question 5 %no need to clear 

k = @(x) 2.*(g(x)) - (h(x)).^2;
zerok = fzero(k,0);
fprintf('Question 5: the answer to the question is')
cprintf('red',' %.4f\n',zerok)

clear %clearing for question 6

syms x
f = @(x) x.^3 - 2.4.*x.^2 + 5.3.*x == 9.8.*cos(x) + 3.1.*sin(x.^2) %note the missing semicolon
[solx] = vpasolve(x^3 - 2.4*x^2 + 5.3*x == 9.8*cos(x) + 3.1*sin(x^2));  %finding x near 0 is just using the solve function
fprintf('Question 6: the answer to the question is')
cprintf('red','% .4f\n',solx)

clear %clearing for question 7
%                                               
% syms x vectx
% vectx = linspace(0,2*pi,1000);        %failed attempt
% % x = [0 2pi]
% % f = @(x) sin(x) == cos(2.*x) - 0.1
% f = @(x) cos(2.*x) - 0.1 - sin(x)
% vectfz = fzero(f,vectx)

syms x
[sol1] = vpasolve(sin(x) == cos(2*x) - 0.1,x,[0 3]);
[sol2] = vpasolve(sin(x) == cos(2*x) - 0.1,x,[0.48 3]);
[sol3] = vpasolve(sin(x) == cos(2*x) - 0.1,x,[3.1 4.5]);
[sol4] = vpasolve(sin(x) == cos(2*x) - 0.1,x,[4.51 2*pi]);
fprintf('There are 4 solutions to question 7 and they are')
cprintf('red',' %.4f, %.4f, %.4f, %.4f\n',sol1,sol2,sol3,sol4)

clear %clearing for question 8

syms x y z
A = [2.1, 6.2, -3.1; -3.7, 10.8, 1.1; 1, 2, -3];
B = [205; -107; 23];
[sol] = A\B;
fprintf('The solution for x in question 8 is')
cprintf('red','% .4f\n', sol(1))
fprintf('The solution for y in question 8 is')
cprintf('red','% .4f\n', sol(2))
fprintf('The solution for z in question 8 is')
cprintf('red','% .4f\n', sol(3))

clear %clearing for question 9

syms F_1 F_2
A = [(1 + cosd(30)), 10.3*cosd(25);5*sind(30), -5.6*sind(25)];
B = [0; 30];
iA = inv(A);
[sol] = iA * B;
fprintf('The answer for F_1 in question 9 is')
cprintf('red',' %.4f\n',sol(1))
fprintf('The answer for F_2 in question 9 is')
cprintf('red',' %.4f\n',sol(2))

clear %clearing for question 10

syms w x y z
A = [9.5, 3.1, 5.1, -4.2; 1.2, -3.2, 6.5, -2.2; 7.3, 4.4, 8.1, 3.3; 5.1, 2.2, -9.2, 6.7];
B = [3.4; 0; -2.1; 7.5];
[sol] = A\B;
fprintf('The solution for w in question 10 is')
cprintf('red','% .4f\n', sol(1))
fprintf('The solution for x in question 10 is')
cprintf('red',' %.4f\n', sol(2))
fprintf('The solution for y in question 10 is')
cprintf('red',' %.4f\n', sol(3))
fprintf('The solution for z in question 10 is')
cprintf('red',' %.4f\n', sol(4))

clear %clearing for question 11

syms x y z
A = [4.1, 5.2, -10.1; 3.2, -4.2, 1.2; 12.1, -5.3, -7.1];
B = [3.1; 1.2; 4.3];
inv(A)*B;
fprintf('There are no answers for question 11 because that system of equations is unsolvable\n')

clear %clearing for question 12

syms x y z
% pennies = x; nickles = y; quarters = z
% x = 0.01
% y = 0.1
% % z = 0.25
%  x + y + z = 42
%  0.01x + 0.05y + 0.25z = 2.30
%  y = x + z + 4
%  -4 = x - y + z
A = [1, 1, 1; 0.01, 0.05, 0.25; 1, -1, 1];
B = [42; 2.30; -4];
[sol] = A\B;
fprintf('In question 12 there would be')
cprintf('red',' %d pennies\n', sol(1))
fprintf('In question 12 there would be')
cprintf('red',' %d nickles\n', sol(2))
fprintf('In question 12 there would be')
cprintf('red',' %.0f quarters\n', sol(3))
% solve(0.01*x + 0.1*y + 0.25*z == 2.30, y == x + z + 4, x + y + z == 42)