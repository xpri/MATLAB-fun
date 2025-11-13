prompt = "Please provide two radii of the cup in form of [R1,R2] and please range it from smallest to biggest: ";
r = input(prompt);
prompt = "Please provide the height of the cup: ";
h = input(prompt);

%for testing purposes
%REMOVE BEFORE SUBMITTING
% r = [3.0,3.8];
% h = 9.5;

%volume formula
v = (1/3)*pi*h*[r(1)^2 + (r(1))*(r(2)) + r(2)^2];
%surface area formula
s = pi*(r(1) + r(2))*[(r(2)-r(1))^2 + h^2]^(1/2) + pi*(r(1))^2;

prompt = "Do you want to calculate volume(1) or surface area of the cup(2)? ";
op = input(prompt);
if op == 1
    v = (1/3)*pi*h*[r(1)^2 + (r(1))*(r(2)) + r(2)^2];
    cprintf('red','Bottom radius: %g cm, top radius: %g cm, and height: %g\n',r(1),r(2),h)
    cprintf('red','Volume is: %.4f cm^3\n',v)
elseif op == 2
    s = pi*(r(1) + r(2))*[(r(2)-r(1))^2 + h^2]^(1/2) + pi*(r(1))^2;
    cprintf('red','Bottom radius: %g cm, top radius: %g cm, and height: %g\n',r(1),r(2),h)
    cprintf('red','Surface area is: %.4f cm^2\n',s)
else
    fprintf('Innocrect input! Please respond in only ''1'' or ''2''\n')
end

clear %clearing to clear var for next run