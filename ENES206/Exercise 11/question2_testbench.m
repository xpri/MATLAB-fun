prompt = "Please enter a set of numbers in vector form, [], : ";
[q] = input(prompt);

%testing purposes
% q = [1 2 -3 4 -5];
% q = [8.43, -5.23, 0.28, 9.67, -10.64];

tot = 0;
for i = 1:length(q)
    if q(i) > 0
        tot = tot + q(i);
    else
    end
end
fprintf('The sum of the inputted vector is:')
cprintf('red',' %.4g\n',tot)

