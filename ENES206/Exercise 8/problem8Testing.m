%ooo question 8 is a fun one
% 7/28/24,1:02AM,James Aspilcueta

%this question reminds me of diff eq...

%m*xdotdot + c*xdot + k*xdot = f
%or also known as
%m*xdotdot + \beta*xdot + k*xdot = f(x)
%m is mass, beta is damping force, k is spring constant, and f(x) is driving force
syms x(t) m c k f
m = 1;
% c = whatever
k = 4;
f = 1;
Dx(t) = diff(x,t);
cond1 = x(0) == 0;
cond2 = Dx(0) == 0;
conds = [cond1,cond2];
%starting with the first scnario of c
c = 0;
ode = m*diff(x,t,2) + c*Dx + k*x == f;
% domain for t to live on is [0,8]
xSol(t) = dsolve(ode,conds);

%starting to plot for seperate scenarios
figure;
hold on;
fplot(xSol,[0,8])

%for second scenario
c = (m*k)^(1/2);
ode = m*diff(x,t,2) + c*Dx + k*x == f;
xSol(t) = dsolve(ode,conds);
fplot(xSol,[0,8])

%for third scenario
c = 2*(m*k)^(1/2);
ode = m*diff(x,t,2) + c*Dx + k*x == f;
xSol(t) = dsolve(ode,conds);
fplot(xSol,[0,8])

%for fourth scenario
c = 4*(m*k)^(1/2);
ode = m*diff(x,t,2) + c*Dx + k*x == f;
xSol(t) = dsolve(ode,conds);
fplot(xSol,[0,8])

xlabel('Time')
ylabel('Displacement')
title('Solution to question 8')
legend('c = 0','c = (m*k)^{1/2}','c = 2*(m*k)^{1/2}','c = 4*(m*k)^{1/2}')