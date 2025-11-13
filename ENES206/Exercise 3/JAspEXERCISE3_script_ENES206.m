%James Aspilcueta
% ENES 206-12018
% EXERCISE 3
% 7/10/24

% sympref('FloatingPointOutput',true); %did this to prevent any fraction outputs since only decimals are wanted. 
%shoutout Walter Roberson on MATLAB Answers!


syms x y z %question 1

syms solx %making new variable for upcoming question
solx = solve(x^4 + 2*x^3 - 8*x^2 - 9*x + 18 == 0); %question 2
fprintf('The solutions for x in question 2 is')
cprintf('red', ' %.4f, %.4f, %.4f, %.4f \n', solx(1), solx(2), solx(3), solx(4))

clear %clearing for question 3

syms x solx
solx = solve(x^3 - 5*x^2 == -x - 15);
fprintf('The solutions for x in question 3 is')
cprintf('red', '% .4f, %.4f, %.4f', solx(1), solx(2), solx(3))
fprintf('\n')

clear %clearing for question 4

syms x y L_1 R_1 intx inty
% L_1 = 4*x^2 + 5*(y - 1.5)^2 == 40;    %testing purposes
% R_1 = y - 3*x + 1 ==0;7
[intx, inty] = solve(4*x^2 + 5*(y - 1.5)^2 == 40, y - 3*x + 1 ==0);
doublex = double(intx);
doubley = double(inty);
x1 = doublex(1, 1);
x2 = doublex(2, 1);
y1 = doubley(1, 1);
y2 = doubley(2, 1);
fprintf('The first coordinate pair where an intercept occurs in question 4 is')
cprintf('red','(% .4f, %.4f)\n', x1, y1)
fprintf('The second coordinate pair where an intercept occurs in question 4 is')
cprintf('red','(% .4f, %.4f)\n', x2, y2)
% fprintf('The x coordinate of the intercept for question 4 is')        %old printing to terminal code
% cprintf('red', '% .4f', x1); cprintf('black', ' and', x2); cprintf('red', '% .4f\n', x2); 
% fprintf('The y coordinate of the intercept for question 4 is')
% cprintf('red', '% .4f\n', x2)

clear %clearing for question 5

syms x y z
[solx,soly,solz] = vpasolve(2.1*x + 6.2*y - 3.1*z == 205, -3.7*x + 10.8*y + 1.1*z == -10, x + 2*y - 3*z ==23);
fprintf('The solution for x in question 5 is')
cprintf('red','% .4f\n', solx)
fprintf('The solution for y in question 5 is')
cprintf('red','% .4f\n', soly)
fprintf('The solution for z in question 5 is')
cprintf('red','% .4f\n', solz)

clear %clearing for question 6

syms F_1 F_2
[solF_1, solF_2] = solve((1 + cosd(30))*F_1 + 10.3*cosd(25)*F_2 == 0, 5*sind(30)*F_1 - 5.6*sind(25)*F_2 == 30);
fprintf('The values that solve the system of equations in question 6 are')
cprintf('red', ' F_1 = %.4f and F_2 = %.4f\n', solF_1, solF_2)

clear %clearing for question 7

syms x y
y(x) = tan(4 - 3*x) - (3)^(1/2) %note, the absence of a semicolon
solx = vpasolve(y + 2*x == 7,x);
fprintf('The solution to the equation in question 7 is')
cprintf('red',' %.4f\n', solx)

clear %clearing for question 8

syms x y z_1 z_2
z_1(x,y) = 4*x^2 + 5*(y - 1.5)^2 - 40;
z_2(x,y) = y - 3*x + 1;
[solz_1,solz_2] = vpasolve(z_1,z_2);
fprintf('The first coordinate pair where an intercept occurs in question 8 is')
cprintf('red','(% .4f, %.4f)\n', solz_1(1), solz_2(1))
fprintf('The second coordinate pair where an intercept occurs in question 8 is')
cprintf('red','(%.4f, %.4f)\n', solz_1(2), solz_2(2))

clear %clearing for question 9

syms x y
%number is xy
%xy == 10x + y
% yx == 10y + x
eq1 = x + y == 11;
% yx - xy = 27;
% -xy = 27 - yx
% xy = yx - 27  %showing steps
eq2 = 10*x + y == 10*y + x - 27;

% eq2 = x == y - 2;  %testing purposes
% eq3 = y == x - 7;
[solx, soly] = solve(eq1, eq2);
fprintf('The two digit number that satisfies all the conditions in question 9 is')
cprintf('red', ' %d%d', solx, soly)
fprintf('\n')

clear %clearing for question 10

syms x y A B t
% B + A == 250;
%starting with train A, assuming towards B is postive
A = 60*t;
B = 250 - (1/2)*20*t^2;
[solt] = solve(A == B);
nA = 60*(solt(2));
fprintf('Question 10: The time it takes for the two trains to meet is')
cprintf('red','% .4f\n',solt(2))
fprintf('Question 10: The time it takes for the two trains to meet is')
cprintf('red','% .4f\n',nA)
