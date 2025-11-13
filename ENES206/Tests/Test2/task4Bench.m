%x^2 + y^2 = r^2
%x = rcos(theta)
%y = r*sin(theta)

thetaStep = linspace(0,2*pi,100);
r = 2 + 2.*sin(thetaStep);
x = r.*cos(thetaStep);
y = r.*sin(thetaStep)
figure;
plot(x,y);