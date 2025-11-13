syms y(x)
eqn = diff(y,x) == y^2 - x^2;
cond = y(0) == 1;
q = dsolve(eqn,cond)
fprintf('Task 20: the solution is %s\n',q)