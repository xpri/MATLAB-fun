%Eulers Method 

%here is the initial point stuff
x(1) = 0;               %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS
y(1) = -2;              %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS

%dy/dx = f(x,y)
f(1) = x(1)^2 + y(1)^2;  %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS

%h = step size, aka, delta x
h = 0.2;                %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS

%iterations of eulers method, this is why the for loop is called until it reaches the end point. 
%it will be repeated (51 - 2) + 1 = 50 . You add 1 because matlab does not index with zero. aka it does not start at zero, but starts at 1.


for i = 2:51        %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS

    %time to compute for x, x_n = x_n-1 + h
    x(i) = x(i - 1) + h;

    %ahora for y!, y_n = y_n-1 + f(x_{n-1},y_{n-1}) * h
    y(i) = y(i - 1) + f(i-1)*h;

    %now to compute the new x and y into f
    f(i) = (x(i))^2 + (y(i))^2;  %CHANGE THIS WHEN APPLYING THIS TO OTHER PROBLEMS
end

%output results as a plot, there is now a new final x and final y
fplot{x,y}