%diff eq time! :-)
syms y(x)
Dy = diff(y,x);
eqn = Dy + y == x^2;
cond = y(0) == 1;
q = dsolve(eqn,cond);
fprintf('Task 16: the solution is %s\n',q)