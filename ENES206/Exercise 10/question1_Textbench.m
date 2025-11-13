%testbench for experiments concerning question 1
% P1 = [1 1];
% P2 = [3 7];
% P3 = [2 5];

prompt = "Please provide the coordinates to P1 in [x,y] form: ";
P1 = input(prompt);
prompt = "Please provide the coordinates to P2 in [x,y] form: ";
P2 = input(prompt);
prompt = "Please provide the coordinates to P3 in [x,y] form: ";
P3 = input(prompt);
prompt = "Please provide the rotation angle (in degrees), theta: ";
theta = input(prompt);

%dummy variables (for command window testing)
%REMOVE WHEN ACTUALLY SUBMITTING!
% P1 = [1.11 1.56];
% P2 = [3.73 7.05];
% P3 = [2.01 9.35];
% theta = 30;

newP1 = rotate(P1,theta);
newP2 = rotate(P2,theta);
newP3 = rotate(P3,theta);

cprintf('red','Rotation is %g degrees\n',theta)
cprintf('red','Coordinates of point 1: [%g,%g], after [%.4f,%.4f]\n',P1(1),P1(2),newP1(1),newP1(2))
cprintf('red','Coordinates of point 2: [%g,%g], after [%.4f,%.4f]\n',P2(1),P2(2),newP2(1),newP2(2))
cprintf('red','Coordinates of point 3: [%g,%g], after [%.4f,%.4f]\n',P3(1),P3(2),newP3(1),newP3(2))

figure;
hold on;
fill([P1(1), P2(1), P3(1)],[P1(2), P2(2), P3(2)], 'green')
fill([newP1(1), newP2(1), newP3(1)],[newP1(2), newP2(2), newP3(2)], 'red')
legend('Green is original triangle','Red is rotated triantion')
title('Graph of question 3 with triangle rotated by 30 degrees')
hold off;

