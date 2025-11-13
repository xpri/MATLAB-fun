syms x
h(x) = exp(x^2)*sin(x);
Dh = diff(h,x);
D2h = diff(h,x,2);
fprintf('Task 8: h''(x) is %s\n',Dh);
fprintf('Task 8: h''''(x) is %s\n',D2h);