%James Aspilcueta
%Test 1
%7/17/24
%here goes nothing!

vect = linspace(0,pi,100);

% clear %clearing for question 2

syms x y
y = 3.*sin(vect) +  4.*cos(2.*vect); %put ';' so it does not flood the command window
ymin = min(y);
fprintf('The answer to question 2 is %.4f\n',ymin)

clear %clearing for question 3

syms a b

clear %clearing for question 4

syms a b
simpleExpr = simplify([a^2 - b^2]/[a - b]);
fprintf('The answer to question 4 is %s\n',simpleExpr)

clear %clearing for question 5

syms a
sola = solve(3*a^2 + 2*a - 5 ==0,a);
fprintf('The answer to question 5 is %.4f and %.4f\n',sola(1), sola(2))

clear %clearing for question 6

syms a b
expanded = expand((2*a + 3*b)^3);
fprintf('The answer to question 6 is %s\n',expanded)

clear %clearing for question 7

syms a b
factored = factor(4*a^3 - 9*a^2*b + 6*a*b^2 - b^3);
fprintf('The answer to question 7 is [%s, %s, %s]\n',factored(1),factored(2),factored(3))

clear %clearing for question 8

syms a y
y = 3*a^3 + 2*a^2 - 7*a + 5;
ysubbed = subs(y,{a},{2});
fprintf('The answer to question 8 is %d\n',ysubbed)

clear %clearing for question 9

syms a b
q = 2*a + 3*b == 5;
w = 4*a - b == 7;
[sola,solb] = solve(q,w,a,b);
fprintf('The number that a is that satisfies the system of equations for question 9 is %f\n',sola)
fprintf('The number that b is that satisfies the system of equations for question 9 is %f\n',solb)

clear %clearing for question 10

syms a b
q = a^2 + b^2 == 25;
w = a^2 - b^2 == 9;
[sola,solb] = solve(q,w,a,b);
fprintf('The number that a is that satisfies the system of equations for question 10 is %f and %f\n',sola(1),sola(3))
fprintf('The number that b is that satisfies the system of equations for question 10 is %f and %f\n',solb(1),solb(2))

clear %clearing for question 11

a = [1,32,3;4,45,66;17,28,9] %removed the semicolon so you know what matrix we are dealing with
deta = det(a);
fprintf('Question 11: The determinant for matrix a is %d\n', deta)

% clear %clearing for question 12

fprintf('Question 12: The inverse for matrix a is')
inva = inv(a)

clear %clearing for question 13

syms x y
f = matlabFunction(x^3 - 4*x + 6);
ansf = f(2);
fprintf('Question 13: f(2) is %d\n',ansf)

clear %clearing for question 14

syms x
y = (4*x - 1)^2;
ysub = subs(y,{x},{pi/2});
fprintf('The answer to question 14 is %.4f\n',ysub)

clear %clearing for question 15

syms x y
z(x,y) = sym(x^2 + y^2);
zsub = subs(z,{x,y},{1.2,-2.1});
fprintf('The answer to question 15 is %.4f\n',zsub)

clear %clearing for question 16
syms x y z
a = [2.1, 6.2, -3.1; -3.7, 10.8, 1.1; 1, 2, -3];
b = [205; -107; 23];
sol = a\b;
fprintf('The answers to question 16: for x %.4f, for y %.4f, for z %.4f\n', sol(1),sol(2),sol(3))

clear %clearing for question 17

syms F_1 F_2
a = [1 + cosd(30), 10.3*cosd(25); 5*sin(30), -5.6*sind(25)];
b = [0;30];
sol = a\b;
fprintf('The answers to question 17: for F_1 %.4f, for F_2 %.4f\n', sol(1),sol(2))

clear %clearing for question 18

a = 5.7;
b = 8.9;
c = 6.6;
s = [a + b + c]/[2];
area = (s*(s-a)*(s-b)*(s-c))^(1/2);
fprintf('The answer to question 18 is: the area is %.4f\n',area)

clear %clearing for question 19, a long one...

syms R_1 R_2 h
R_1 = 3;
R_2 = 3.8;
h = 9.5;
v = pi/3*h*((R_2)^2 + (R_2)*(R_1) + (R_1)^2);
l = (h^2 + (R_2-R_1)^2)^(1/2); %slant height of the cone
tsa = pi*[(R_2+R_1)*l + (R_1)^2]; %total surface area (but excluding the top since its a cup)
fprintf('Question 19:The volume of the cup is %.4f and the surface area of the cup is %.4f\n',v,tsa)

clear %clearing for question 20

syms x y
xvect = [4.2:0.1:8.6];
y = 2.  *xvect.^2 + 4.*xvect + 5.*cos(xvect);
ysum = sum(y);
fprintf('Question 20: The sum of all function values is %.4f\n',ysum)
