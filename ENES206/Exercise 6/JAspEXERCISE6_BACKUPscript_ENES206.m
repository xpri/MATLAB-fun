%James Aspilcueta
% ENES 206-12018
% EXERCISE 6
% 7/24/24

syms x      %starting question 1
d2f = diff(sin([x^2 - 1]/[2*x - 3]),2);
d2fsubs = subs(d2f,{x},{2});
fprintf('The answer to question 1 is')
cprintf('red',' %.4f\n',d2fsubs)

clear %clearing for question 2

syms x
%part a
da = diff([x + 2]/[x - 4]);
%part b
db = diff(log10(4*x^2 + 1),2);
%part c
dc = diff([sin(x) + tan(x)]^(1/5));
fprintf('Question 2: the answers part a is')
cprintf('red',' %s\n',da)
fprintf('Question 2: the answers part b is')
cprintf('red',' %s\n',db)
fprintf('Question 2: the answers part c is')
cprintf('red',' %s\n',dc)

clear %clearing for question 3

syms x
%part a
f = sym(4.*x.^3 + 5.*(x-1.5).^2) %Notice missing semicolon
% min(f,[-1 4])     %testing functions
%part b
%i am going to attempt to find the minimum of f using calculus
df = diff(f);
[dfZero] = solve(df == 0,x); %2 unique solutions come out
finalform = [subs(f,{x},{-1}); subs(f,{x},{dfZero(1)}); subs(f,{x},{4}); subs(f,{x},{dfZero(2)})];
minf = min(finalform); %success!
fprintf('The answer to question 3 is')
cprintf('red','% .4f\n',minf)

clear %clearing for question 4

syms x
%part a
g = cos(x)*sin(x)
%part c
dg = diff(g);
d2g = diff(g,2);
figure;
hold on;
fplot(g, [-2 5])
fplot(dg, [-2 5])
fplot(d2g, [-2 5])
title('Graph of question 4')
xlabel('x-axis')
ylabel('y-axis')
hold off;

clear %clearing for question 5

syms x y
g = cos(x^2*y)*exp(-x*y);
pargx = diff(g,x);
pargy = diff(g,y);
pargxsubbed = subs(pargx,{x,y},{2,3});
pargysubbed = subs(pargy,{x,y},{2,3});
fprintf('Question 5: the partial derivative of g with respect to x at (2,3) is')
cprintf('red','% .4f\n',pargxsubbed)
fprintf('Question 5: the partial derivative of g with respect to y at (2,3) is')
cprintf('red','% .4f\n',pargysubbed)

clear %clearing for question 6

syms x
%part a
y = @(x) [x^3 + 1]^(1/2)
%part b
h = 0.001;
dysubbed = [y(3.4 + h) - y(3.4)]/[h];
fprintf('The answer to question 6 is')
cprintf('red','% .4f\n',dysubbed)

clear %clearing for question 7

syms x
%part a
f = @(x) [x^2 - 1]/[x^3*tan(x)]
%part b
h = 0.001;
df = @(x) [f(x + h) - f(x)]/[h];
% df = [f(x + h) - f(x)]/[h]
% d2fsubbed = [df(3.4 + h) - df(3.4)]/[h]
d2f = @(x) [df(x + h) - df(x)]/[h];
d2f(2);
finalAnswer = d2f(3.4);
fprintf('The answer to question 7 is')
cprintf('red','% .4f\n',finalAnswer)

clear %clearing for question 8

syms x
L = 10; %uniform beam, meters
w = 800; %uniform distributed force, N/m
EI = 1.2e7; %flextual rigidity N-m^2
% y(x) = [-w]/[24*EI]*(x^4 - 2*L*x^3 + L^3*x) %deflection formula
%y''(x) = M(x)/EI
%M(x) = y''(x)*EI
y = [-w]/[24*EI]*(x^4 - 2*L*x^3 + L^3*x);
M = diff(y,2)*EI;
%starting part b
dM = diff(M);
dMzero = solve(dM == 0,x); %only one zero, and it happenes that the concavity at this point is down, therefore, it must be a maximum
Msubbed = subs(M,{x},{dMzero});
fprintf('Question 8: The location and maximum moment is')
cprintf('red',' (%d, %d)\n',dMzero,Msubbed)
%starting part a
figure;
fplot(M)
title('Graph of question 8')

clear %clearing for question 9

% syms x
g = 9.81; %m/s^2, gravity
tms = [0:10:80]; %in miliseconds
t = [tms]./[1000]; %getting time in seconds
vimperial = [30 29 27 24 18 12 5 1 0]; %in %vimp — v in imperial units %old units, wont use
vmetric = [vimperial.*1.60934.*1000]./[60.*60]; %in meters per second
w = 2000; %lbs, pounds
%we have to find F, recall F = ma at t=35 and 55 ms
%1 kilogram is equal to 2.205 pounds, so,
m = w/2.205;
%to find the acceleration, we must find the derivative of velocity using the alternative formula
% [v(a)-v(b)]/[a-v]
a1 = [vmetric(5) - vmetric(4)]/[t(5) - t(4)]; %acceleration at 35ms
f1 = m*a1; %in newtons, N
a2 = [vmetric(7) - vmetric(6)]/[t(7) - t(6)];
f2 = m*a2; %in newtons, N
%now to convert fron N to lbf
f1lb = (f1*2.20462)/g;
f2lb = (f2*2.20462)/g;
fprintf('Question 9: The instantanous force at 35ms is')
cprintf('red',' %.4f Pounds of force\n',f1lb)
fprintf('Question 9: The instantanous force at 55ms is')
cprintf('red',' %.4f Pounds of force\n',f2lb)