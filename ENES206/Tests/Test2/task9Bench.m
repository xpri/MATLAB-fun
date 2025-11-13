syms x
%(f(x+h)-f(x))/h @x=2
h = 0.01;
f(x) = (x^3+4*x)^(1/2);
q = (f(2+h)-f(2))/(h);
fprintf('Task 9: f''(x) is %.4f\n',q)