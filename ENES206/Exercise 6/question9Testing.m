%time to attempt to do this question in impearial units

%weight is 2000pounds
w = 2000;
m = 2000/32.2;
%now we found slug mass
%1mph = 1.467
tms = [0:10:80]; %in miliseconds
vimperial = [30 29 27 24 18 12 5 1 0]; %in %vimp is v in imperial units %old units, wont use
t = tms.*1e-3; %1 ms is 1e^-3 seconds
v = vimperial.*1.467; %1mph is 1.467 feet per second
%F(lbf) = m*a
a1 = [v(5) - v(4)]/[t(5) - t(4)];
f1 = m*a1;
a2 = [v(7)-v(6)]/[t(7)-t(6)];
f2 = m*a2;
fprintf('Question 9: The instantanous force at 35ms is')
cprintf('red',' %.4f Pounds of force\n',f1)
fprintf('Question 9: The instantanous force at 55ms is')
cprintf('red',' %.4f Pounds of force\n',f2)