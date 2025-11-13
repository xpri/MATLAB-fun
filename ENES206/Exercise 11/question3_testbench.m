x = 2.41;
tol = 1e-6;
n = 100;
q = exp_1(x,tol,n);
w = exp(2.41);
fprintf('e^2.41 is')
cprintf('red','% .6f\n',w)
fprintf('Using the exp_1 function, we have a result of')
cprintf('red','% .6f\n',q)
fprintf('Althought they may look similar, the difference between exp and exp_1 is')
e = w - q;
cprintf('red',' %g\n',e)