syms x
g = log(x^2+1);
Dg(x) = diff(g,x);
q = Dg(1);
fprintf('Task 7: g''(x) is %s\n',Dg(x))
fprintf('Task 7: g''(1) is %d\n',q)