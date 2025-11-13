%James Aspilcueta
%8/3/24
%Exercise 9

%starting question 1
x = 4.0;
y = 4.0;
[Magnitude] = mag(3.0,4.0);
fprintf('Question 1: The magnitude of [%g %g] is',x,y)
cprintf('red','% .4f\n',Magnitude)

x = 89.4;
y = 45.7;
[Magnitude] = mag(89.4,45.7);
fprintf('Question 1: The magnitude of [%g %g] is',x,y)
cprintf('red','% .4f\n',Magnitude)

clear %clearing for question 2

V1 = [-7.3,12.5];
[magnitude,theta] = polar(V1);
fprintf('Question 2: The magnitude and angle (in degrees) of V1 is')
cprintf('red','% .4f and %.4f respectively\n',magnitude,theta)

V2 = [0,45];
[magnitude,theta] = polar(V2);
fprintf('Question 2: The magnitude and angle (in degrees) of V2 is')
cprintf('red','% g and %g respectively\n',magnitude,theta)

clear %clearing for question 3

P1 = [1 1];
P2 = [3 7];
P3 = [2 5];
newP1 = rotate(P1,30);
newP2 = rotate(P2,30);
newP3 = rotate(P3,30);
figure;
hold on;
% plot(P1(1),P1(2),"LineStyle","-.")   %failed experiments
% plot(P1(1))
% plot(newP1(1),newP1(2))
fill([P1(1), P2(1), P3(1)],[P1(2), P2(2), P3(2)], 'green')
fill([newP1(1), newP2(1), newP3(1)],[newP1(2), newP2(2), newP3(2)], 'red')
legend('Green is original triangle','Red is rotated triantion')
title('Graph of question 3 with triangle rotated by 30 degrees')