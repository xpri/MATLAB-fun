%James Aspilcueta
% ENES 206-12018
% EXERCISE 5
% 7/21/24

syms x  %starting question 1
f = @(x) x.^3 - 8.*x + 3;
figure;
p = ezplot(f,[-4,3]);       %plotting
set(p,'Color','red','Linestyle', '--')      %changing the format of the graph
title('Graph for question 1')

clear %clearing for question 2

syms x y
f = (x-2).^2 + 5.*y.^2 == 10;
g = 3.*x + 7.*y == 6;
figure;
hold on;
q = ezplot(f,[-3,8]);
set(q,'color','red');
w = ezplot(g,[-3,8]);
set(w,'color','blue');
title('Graph for question 2 with question 3 coordinates')
hold on;
grid on;

% clear %clearing for question 3

[solx,soly] = solve(f,g);
plot(solx(1),soly(1),"o")
plot(solx(2),soly(2),"o")
xlabel('x-axis')
ylabel('y-axis')
legend('y1','y2','First intersection','Second intersection')
hold off;

clear %clearing for question 4

syms x
y = 2*sin(x) + cos(2*x);
figure;
fplot(y,[0,10])
axis([0 10 -4 2])
title('Graph for question 4')

clear %clearing for question 5

syms x
figure;
y1 = matlabFunction(exp(-0.2.*x).*cos(x).*(x.^2 - 2.*x - 1));
% y1 = exp(-0.2.*x).*cos(x).*(x.^2 - 2.*x - 1);     %has to be a function handle, not a symbolic function
xvect = linspace(-2,10,1200);
y1tbl = y1(xvect);

y2 = matlabFunction((x.^2 - 2.*x - 1)./(x + 3));
y2tbl = y2(xvect);

hold on;
q = plot(xvect,y1tbl);
set(q,'Color','red')
w = plot(xvect,y2tbl);
set(w,'Color','blue')

%plotting format
grid;
title('Graph of question 5')
xlabel("x-axis")
ylabel("y1 and y2 values")
legend('y1','y2')

clear %clearing to start question 6

syms x y
yeartbl = [1900 1920 1940 1960 1980 2000];
popultbl = [1650 1860 2300 3040 4450 6080];
figure;
plot(yeartbl,popultbl,'o')
title('Graph of question 6')
xlabel("Year")
ylabel("Population (millions)")

clear %clearing for question 7

syms r theta
r = @(theta) 4 - 3.*cosd(theta);
thetaStep = [0:0.1:360]; %in degrees
rtbl = r(thetaStep);
ycoord = rtbl.*sind(thetaStep);
xcoord = rtbl.*cosd(thetaStep);
ycoords = r;
%starting to plot
figure;
plot(xcoord,ycoord)
% plot(ycoord,xcoord);   %testing purposes
title('Graph of question 7')

clear %clearing for question 8

xcoord = [0 5 1 2.5 5];
ycoord = [2 2 5 0 5];
figure;
fill(xcoord,ycoord,'red')
title('Graph of question 8')

clear %clearing for question 9

syms V_0 g theta
V_0 = 15; %m/s
g = 9.81; %m/s^2
theta = 30; %degrees
t = linspace(0,1.52,100);

% x = @(t) V_0*t*cosd(theta)
length = V_0.*t.*cosd(theta);
height = V_0.*t.*sind(theta) - (1/2).*g.*t.^2;
%starting to plot part a
figure;
hold on;
plot(t,length)
plot(t,height)
legend('Length','Height');
title('Graph of question 9 part a')
xlabel("Time")
ylabel("Length (blue) and Height (red)")
hold off;
%plotting part b
figure;
plot(length,height)
title('Graph of question 9 part b')
xlabel("length")
ylabel("height")
