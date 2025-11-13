%ode45 time... 
%:-(
%y = y1; ydot1 = y2; ydot2 = ode
conds = [1, 0]; %initial condition y(0) = 1 and ydot(0) = 0
tspan = linspace(0,10,100);
eqn = @(t,y) [y(2);
                -y(1) - 2*y(2)];
[t,y] = ode45(eqn,tspan,conds)
figure;
plot(t,y(:,1))
