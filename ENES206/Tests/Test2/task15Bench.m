syms x
%we have to use ring method to solve this
r = (x)^(1/2);
q = pi*int(r^2,x,0,2);
fprintf('Task 15: the answer is %s\n',q)