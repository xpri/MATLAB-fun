syms x
f = 3*x^4 - 4*x^3 + x^2 - 6*x + 2;
Df = diff(f,x);
D2f(x) = diff(f,x,2);
q = D2f(2);
% D2fsubbed = sub(D2f,{x},{2}); %failed
fprintf('Task 6: f''(x) is %s\n',Df)
fprintf('Task 6: f''''(2) is %d',q)