syms x
f = exp(-x^2);
q = int(f,-Inf,Inf);
fprintf('Task 14: the answer is %s\n',q)