%y'' + 4y' + 4y = (7+x)*e^-2x, y(0) = 4 y'(0) = 8

syms y(x)
Dy = diff(y,x);
eqn = diff(y,x,2) + 4*Dy + 4*y == (7+x)*exp(-2*x);
cond1 = y(0) == 4;
cond2 = Dy(0) == 8;
conds = [cond1 cond2];
q = dsolve(eqn,conds);
qsimple = simplify(q);
fprintf('The solution to problem 1 is %s\n',qsimple)

clear %clearing for problem 2

%this example is for Dy = y*(1-1/4*y)
figure;
hold on;

[x,y] = meshgrid(0:.5:8.0, -3:0.5:9.0);
slope = y.*(1-.25.*y);
Length = (1^2 + slope.^2).^(1/2);
UnitVectorx = 1./Length;
UnitVectory = slope ./ Length;
quiver(x,y,UnitVectorx,UnitVectory)

syms y(x)
Dy(x) = diff(y,x);
eqn = Dy == y*(1 - (1/4)*y);
cond = [y(0) == 8];
ivp1 = dsolve(eqn,cond);
q = fplot(ivp1,[0,10.0]);
set(q,'color','black')

clear cond %clearing initial value

syms y(x)
Dy(x) = diff(y,x);
eqn = Dy == y*(1 - (1/4)*y);
cond = [y(0) == 0.1];
ivp2 = dsolve(eqn,cond);
w = fplot(ivp2,[0,10.0]);
set(w,'color','red')

clear cond %clearing initial value

syms y(x)
Dy(x) = diff(y,x);
eqn = Dy == y*(1 - (1/4)*y);
cond = [y(0) == -0.1];
ivp3 = dsolve(eqn,cond);
e = ezplot(ivp3,[0,8.5,-3.0,9]);

title('Graph of question 2')
legend('General solution to DE (slopefield)','Initial condition of 8','Initial condition of 0.1','Initial condition of -0.1')


%going to use ode45 to find and plot the initial values