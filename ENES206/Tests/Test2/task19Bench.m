syms y(x)
Dy(x) = diff(y,x);
eqn = diff(y,x,2) - 4*Dy + 4*y == exp(x);
cond1 = y(0) == 0;
cond2 = Dy(0) == 1;
conds = [cond1 cond2];
q = dsolve(eqn,conds);
fprintf('Task 19: the solution is %s\n',q)