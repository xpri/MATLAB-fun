 function [y_p] = VariationOfParameters(y_1,y_2,FUN)
%VARIATION OF PARAMETER we take the three inputs (y_1,y_2,FUN) and plug it into the variation of parameter formula
%   so we take the variation of parameter equation and plug in numebrs y_1 and y_2 and f(x) and formulate a function.
%   in the form of y'' + p(x)y' + q(x)y = f(x), f(x) is FUN. y_c (complementary function), usually it is in some form of 
%   y_c = c1*e^m1x + c2*e^m2x
%   y1 would be e^m1x and y2 would be e^m2x
%   then we apply the formula for variation of paramter
%
%   ALSO MAKE SURE TO USE THE SIMPLIFY() FUNCTION TO SIMPLIFY ANSWERS
%   I don't know if i will implement 'simplify' into this function but we'll see.
%
% ONLY WORKS WITH SYMBOLIC FUNCTIONS!
q = [y_1 y_2];
w = [q; diff(q)];
y_p = -(y_1)*int([(y_2)*(FUN)]/[det(w)]) + y_2*int([y_1*FUN]/[det(w)]);
end

