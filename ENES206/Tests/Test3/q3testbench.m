prompt = "Please input the load amount P: ";
P = input(prompt);

prompt = "Please input the loan periods in months: ";
n = input(prompt);

prompt = "Please input the annual interest rate: ";
ai = input(prompt);

%testing
% P = 10;
% n = 11;
% ai = 12;
i = ai/1200;

A = P * [i*(1 + i)^n]/[(1 + i)^n - 1];

fprintf('Loan = $%d, loan periods in month = %d, annual interest rate %.4g percent\n',P,n,ai)
fprintf('The monthly payment is $%.4f\n',A)
