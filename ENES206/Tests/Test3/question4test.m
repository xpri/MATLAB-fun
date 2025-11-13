h = linspace(0,20);
V = vol(h);


figure;
plot(h,V);
title('Graph of question 4')
xlabel('h'); ylabel('V');
grid;

%starting part c
prompt = "Please input the height: ";
h = input(prompt);
if h < 0
    error('Height cannot be negative. Please rerun script and try again.')
    return;
elseif h > 20
    error('Height cannot be over 20. Please rerun script and try again.')
end
V = vol(h);
fprintf('Radius = 30.00 ft, height = %d ft, and volume = %.4f\n',h,V)