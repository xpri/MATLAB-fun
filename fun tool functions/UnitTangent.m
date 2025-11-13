function [uTs] = UnitTangent(r)
%UNITTANGENT Calculates the unit tangent of the given position vector.
%   r is the position vector.
%   the formula is rprime/magnitude of rprime
%   'mag' FUNC IS NEEDED FOR THIS TO EXECUTE CORRECTLY!
rprime = diff(r);
magrprime = mag(rprime);
uT = rprime./magrprime;
% uTs = simplify(uT);

end

