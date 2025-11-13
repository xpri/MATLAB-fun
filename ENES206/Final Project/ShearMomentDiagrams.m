L = input('Enter the length of the beam L: ');
a = input('Enter the length of the uniformly distributed force W, a: ');
b = input('Enter the distance from left origin to the point load b: ');
W = input('Enter the uniformly distributed load W: ');
P = input('Enter the point load P: ');

% Testing purposes
% L = 4; %meters
% a = 2; %meters
% b = 3; %meters
% W = 2; %kN/m
% P = 6; %kN

x = linspace(0,L,100);

V_values = vOfx(x,L,a,b,W,P);
M_values = mOfx(x,L,a,b,W,P);

%plotting shear force diagram
figure;
plot(x,V_values)
title('Graph of Shear Force')
xlabel('position (m)')
ylabel('Shear Force V(x)')
grid;

%plotting bend moment diagram
figure;
plot(x,M_values)
title('Graph of bend moment function')
xlabel('position (m)')
ylabel('Bending Moment M(x)')
grid;