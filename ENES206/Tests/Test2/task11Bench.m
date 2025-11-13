f = @(x) 3.*x.^2 - 2.*x + 1;
q = integral(f,0,2);
fprintf('Task 11: the answer is %d\n',q);