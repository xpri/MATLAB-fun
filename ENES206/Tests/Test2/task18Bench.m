syms x(t) y(t)
Dx = diff(x,t);
Dy = diff(y,t);
[x(t),y(t)] = dsolve(Dx == y, Dy == -x, x(0) == 1, y(0) == 1);
% plot(x,y)
tStep = linspace(-10,10,100);
xvec = x(tStep);
yvec = y(tStep);
figure;
plot(xvec,yvec)
title('Graph of task 18')
xlabel('x(t)')
ylabel('y(t)')