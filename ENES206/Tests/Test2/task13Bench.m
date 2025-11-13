syms x
% f = @(x) sin(x.^2); %failed
x = linspace(1,4,1000);
f = sin(x.^2);
q = trapz(x,f);
fprintf('Task 13: the answer is %.4f \n',q)
