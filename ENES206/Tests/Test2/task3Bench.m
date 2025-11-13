syms x(t) y(t)
x(t) = 3*cos(t);
y(t) = 2*sin(t);
fplot(x(t),y(t),[0,2*pi])
xlabel('x-axis');
ylabel('y-axis');