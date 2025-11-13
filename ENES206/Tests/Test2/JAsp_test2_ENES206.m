%James Aspilcueta
%7/30/2024
%Test 2
%8/10 confidence on the test

%starting task 1
syms y x
y1(x) = exp(-0.1*x)*cos(2*x);
y2(x) = sin(x);

%starting to plot
figure;
grid;
hold on;
q = fplot(y1,[-5,5]);
w = fplot(y2,[-5,5]);
set(q,"color","red");
set(w,"color","blue","Linestyle",':');
legend('y1','y2');
title('Graph of task 1');
hold off;

clear %clearing for task 2

syms x y
eqn = (x - 3)^2+4*y^2 == 25;
%xrange [-5 11]
%yrange [-3 3]
%change curve color to blue
figure;
q = ezplot(eqn,[-5 11 -3 3]);
set(q,"color","blue");
title('Graph of task 2');

clear %clearing for task 3

syms x(t) y(t)
x(t) = 3*cos(t);
y(t) = 2*sin(t);
figure;
fplot(x(t),y(t),[0,2*pi])
xlabel('x-axis');
ylabel('y-axis');
title('Graph of task 3')

clear %clearing for task 4

%x^2 + y^2 = r^2
%x = rcos(theta)
%y = r*sin(theta)

thetaStep = linspace(0,2*pi,100);
r = 2 + 2.*sin(thetaStep);
x = r.*cos(thetaStep);
y = r.*sin(thetaStep);
figure;
plot(x,y);
title('Graph of task 4');

clear %clearing for task 5

figure;
fill([1,4,7,4],[2,5,2,0],'green')
title('Graph of task 5');

clear %clearing for task 6

syms x
f = 3*x^4 - 4*x^3 + x^2 - 6*x + 2;
Df = diff(f,x);
D2f(x) = diff(f,x,2);
q = D2f(2);
% D2fsubbed = sub(D2f,{x},{2}); %failed
fprintf('Task 6: f''(x) is %s\n',Df)
fprintf('Task 6: f''''(2) is %d\n',q)

clear %clearing for task 7

syms x
g = log(x^2+1);
Dg(x) = diff(g,x);
q = Dg(1);
fprintf('Task 7: g''(x) is %s\n',Dg(x))
fprintf('Task 7: g''(1) is %d\n',q)

clear %clearing for task 8

syms x
h(x) = exp(x^2)*sin(x);
Dh = diff(h,x);
D2h = diff(h,x,2);
fprintf('Task 8: h''(x) is %s\n',Dh);
fprintf('Task 8: h''''(x) is %s\n',D2h);

clear %clearing for task 9

syms x
%(f(x+h)-f(x))/h @x=2
h = 0.01;
f(x) = (x^3+4*x)^(1/2);
q = (f(2+h)-f(2))/(h);
fprintf('Task 9: f''(x) is %.4f\n',q)

clear %clearing for task 10

syms x
f(x) = tan(x^2);
Df(x) = diff(f,x);
D3f(x) = diff(f,x,3);
q = D3f(1);
fprintf('Task 10: f''(x) is %s\n',Df)
fprintf('Task 10: f''''''(1) is %.4f\n',q)

%clearing for task 11

f = @(x) 3.*x.^2 - 2.*x + 1;
q = integral(f,0,2);
fprintf('Task 11: the answer is %d\n',q);

clear %clearing for task 12

y = @(x) [1]./[x.^2+1];
q = integral(y,0,3);
fprintf('Task 12: the answer is %.4f\n',q);

clear %clearing for task 13

syms x
% f = @(x) sin(x.^2); %failed
x = linspace(1,4,1000);
f = sin(x.^2);
q = trapz(x,f);
fprintf('Task 13: the answer is %.4f \n',q)

clear %clearing for task 14

syms x
f = exp(-x^2);
q = int(f,-Inf,Inf);
fprintf('Task 14: the answer is %s\n',q)

clear %clearing for task 15

syms x
%we have to use ring method to solve this
r = (x)^(1/2);
q = pi*int(r^2,x,0,2);
fprintf('Task 15: the answer is %s\n',q)

clear %clearing for task 16

%diff eq time! :-)
syms y(x)
Dy = diff(y,x);
eqn = Dy + y == x^2;
cond = y(0) == 1;
q = dsolve(eqn,cond);
fprintf('Task 16: the solution is %s\n',q)

clear %clearing for task 17

%ode45 time... 
%:-(
%y = y1; ydot1 = y2; ydot2 = ode
conds = [1, 0]; %initial condition y(0) = 1 and ydot(0) = 0
tspan = linspace(0,10,100);
eqn = @(t,y) [y(2);
                -y(1) - 2*y(2)];
[t,y] = ode45(eqn,tspan,conds);
figure;
plot(t,y(:,1))
title('Graph of task 17')

clear %clearing for task 18

syms x(t) y(t)
Dx = diff(x,t);
Dy = diff(y,t);
[x(t),y(t)] = dsolve(Dx == y, Dy == -x, x(0) == 1, y(0) == 1);
% plot(x,y)
tStep = linspace(-10,10,100);
xvec = x(tStep);
yvec = y(tStep);
figure;
plot(xvec,yvec)
title('Graph of task 18')
xlabel('x(t)')
ylabel('y(t)')

clear %clearing for task 19

syms y(x)
Dy(x) = diff(y,x);
eqn = diff(y,x,2) - 4*Dy + 4*y == exp(x);
cond1 = y(0) == 0;
cond2 = Dy(0) == 1;
conds = [cond1 cond2];
q = dsolve(eqn,conds);
fprintf('Task 19: the solution is %s\n',q)

clear %clearing for task 20

syms y(x)
eqn = diff(y,x) == y^2 - x^2;
cond = y(0) == 1;
q = dsolve(eqn,cond);
fprintf('Task 20: the solution is %s\n',q)

%all done!
% alot of typing was done...