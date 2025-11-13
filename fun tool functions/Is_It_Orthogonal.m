function [output] = Is_It_Orthogonal(A)
%IS_IT_ORTHOGONAL FUNCTION NOT WORKING!
%   Detailed explanation goes here
if(inv(A) == transpose(A))
    fprintf("Matrix is orthogonal\n");
    % fprintf(inv(A));
else
    fprintf("Matrix is not orthogonal");
end

