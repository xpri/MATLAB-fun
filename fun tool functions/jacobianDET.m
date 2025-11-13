function [outputArg1,outputArg2] = jacobianDET(FUN1,FUN2,u,v)
%JACOBIANDET INPROGRESS!! Takes the jacobian of the given functions
%   The formula is below. The jacobian takes two functions of two parameters
%   and transforms it into the other two parameter world. This makes the
%   integral easier to solve.
% J(FUN1,FUN2)/J(u,v) = [diff(FUN1,u),diff(FUN1,v);diff(FUN2,u),diff(FUN2,v)]
%   then take the determinant


end

