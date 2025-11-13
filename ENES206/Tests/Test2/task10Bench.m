syms x
f(x) = tan(x^2);
Df(x) = diff(f,x);
D3f(x) = diff(f,x,3);
q = D3f(1);
fprintf('Task 10: f''(x) is %s\n',Df)
fprintf('Task 10: f''''''(1) is %.4f\n',q)