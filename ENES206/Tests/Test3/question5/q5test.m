prompt = "Please enter number of students to be calculated: ";
n = input(prompt);

%testing 
% n = 6;

for k = 1:n

    prompt = "Please enter 3 test scores in vector form, [], : ";
    score = input(prompt);

    %testing
    % score = [100 -90 80];

    if min(score) < 0
        warning('score cannot be negative')
    end

    best2 = [sum(score) - min(score)]/[2];
    fprintf('Test scores %g, %g, %g; Average of best two = %g\n',score(1),score(2),score(3),best2)
end
