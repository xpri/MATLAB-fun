x=linspace(0,10); y=macaulay(x,5,2); figure; plot(x,y);
title('Graph of question 1 part a')
%u_y(x) = -5/6*[<x-0>^4 - <x-5>^4] + 15/6*<x-8>^3 + 75*<x-7>^2 + 57/6*x^3 - 238.25*x
%the <x-a>^n is the macaulay function
q = [5 7 8 10];
u_y = (-5/6).*(macaulay(q,0,4) - macaulay(q,5,4)) + (15/6).*macaulay(q,8,3) + 75.*macaulay(q,7,2) + (57/6).*q.^3 - 238.25.*q;
figure;
plot(q,u_y);
title('Graph of question 1 part b')