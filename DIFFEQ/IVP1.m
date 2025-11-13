%Dy = y*(1-(1/4)*y)
% syms y(t)
% eqn = @(t,y) y*(1 - (1/4)*y);
% conds = [8]

syms y(x)
Dy(x) = diff(y,x);
eqn = Dy == y*(1 - (1/4)*y);
cond = [y(0) == 8];
ivp1 = dsolve(eqn,cond);
fplot(ivp1)


