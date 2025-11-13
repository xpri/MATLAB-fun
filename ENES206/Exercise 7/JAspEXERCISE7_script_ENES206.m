%James Aspilcueta
% ENES 206-12018
% EXERCISE 7
% 7/25/24

syms x      %starting question 1
%part a
aint = int((x^2)*log(x));
%part b
bint = int(sin(x)*cos(x)*cos(x)*(x^2+1));
fprintf('Question 1: The answer to part a is')
cprintf('red',' %s\n',aint)
fprintf('Question 1: The answer to part b is')
cprintf('red',' %s\n',bint)

clear %clearing for question 2

syms x
%part a
f = @(x) [1]./[x.^2];
fInted = integral(f,1,Inf);
%part b
g = @(x) [x.^3.*exp(x)]./[x-1]
gInted = integral(g,2.2,4.1);
fprintf('The answer to question 2 part a is')
cprintf('red','% d\n',fInted)
fprintf('The answer to question 2 part b is')
cprintf('red','% .4f\n',gInted)

clear %clearing for question 3

syms x
%we have to use disk method for this integration
%we integrate pi*r^2,r is given as the formula
%therefore
y = exp(-2.*x);
yInted = int(pi*y^2,0,2.3);
fprintf('The answer to question 3 is')
cprintf('red','% .4f\n',yInted)

clear %clearing for question 4
syms x
f = @(x) [x+2]./[(x-5).*sin(x)]
fInted = integral(f,1,2);
fprintf('The answer to question 4 is')
cprintf('red',' %.4f\n',fInted)

clear %clearing for question 5

syms x
sol = (1)/((2*pi)^(1/2))*int(exp(-0.5*x^2),0.1,0.9);
fprintf('The solution to question 5 is')
cprintf('red','% .4f\n',sol)

clear %clearing for question 6

syms x
f = @(x) [(2.*x+3).^(1/2)]./[x];
%part a
fsubbed = f(4.1);
%part b
% df = diff(f(x));
df = @(x) diff(f(x));
dfsubbed = subs(df,{x},{4.1});
%part c
fInted = integral(f,0.1,4.1);
fprintf('The answer to question 6 part a is')
cprintf('red','% .4f\n',fsubbed)
fprintf('The answer to question 6 part b is')
cprintf('red',' %.4f\n',dfsubbed)
fprintf('The answer to question 6 part c is')
cprintf('red','% .4f\n',fInted)

clear %clearing for question 7

syms x y
g(x,y) = cos(x)*sin(y^2);
%part a
gsubbed = g(2.1,3.5);
% gsubbed = subs(g,{x,y},{2.1,3.5});
%part b
dg(x,y) = diff(g(x,y),x);
%part c
dgsubbed = dg(2.1,3.5);
gInted = int(int(g(x,y),x,0,2.1),y,0,3.5);
% gfInted = int(g(x,y),x,0,2.1      %first integral
% gsInted = int(gfInted,y,0,3.5)        %second integral
fprintf('The answer to question 7 a is')
cprintf('red','% .4f\n',gsubbed)
fprintf('The answer to question 7 b is')
cprintf('red','% .4f\n',dgsubbed)
fprintf('The answer to question 7 c is')
cprintf('red','% .4f\n',gInted)

clear %clearing for question 8

syms x
t = [0 1 2 3 4 5 7 9 11 14 16 17 35 45 50 60]; %seconds, time
v = [0 2.4 3.6 4.8 5.0 5.1 5.0 5.8 7.9 8.8 10.5 11.4 12.0 12.5 12.2 9.2]; %m/s, velocity
%going to use the 'trapz()' function
Inted = trapz(t,v);
fprintf('The answer to question 8 is')
cprintf('red','% .4f\n',Inted)

clear %clearing for question 9

syms t % T is period
%T is period, 1/T = f, f is 60hz. Therefore, T = 1/f, T = 1/60
T = 1/60;
v = 120*cos(120*pi*t);
v_avg = (1/T)*int(v,0,T);
v_rms = [(1/T)*int(v^2,0,T)]^(1/2);
fprintf('Question 9: The average voltage is')
cprintf('red','% .4f\n',v_avg)
fprintf('Question 9: The effective (RMS) voltage is')
cprintf('red','% .4f\n',v_rms)