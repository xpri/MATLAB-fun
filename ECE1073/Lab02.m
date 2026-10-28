% Kepler's Time Equation
% By: James Aspilcueta
% M = E - e*sin(E)
% M is the mean anomaly
% E is the eccentric anomaly
% e is eccentricity

% Finding E given e & M

clear
clc

M = 0.01-011;   % Make sure it is in RAD
e = 0.3725;
tolerance = 1e-9;
E = NewtSolve(M,e,tolerance)

function eccentricAnomaly = NewtSolve(MeanAnomaly, eccentricity, chosenTolerance)  % Starting the function  
    if (MeanAnomaly < pi) % First condition
        eccentricAnomaly = MeanAnomaly + eccentricity/2;
    elseif (MeanAnomaly > pi) % Second condition
        eccentricAnomaly = MeanAnomaly - eccentricity/2;
    end

    for i = 1:1000  % Making forloop to conduct newton's method
        y = eccentricAnomaly - eccentricity*sin(eccentricAnomaly) - MeanAnomaly;     % This is f(E_i)
        y_prime = 1 - eccentricity*cos(eccentricAnomaly);            % This is f'(E_i)
        % fprintf('This is round: %d. With y of %d\n', i, y);
        % Above line is testing purposes
        if (y > chosenTolerance)
            eccentricAnomaly = eccentricAnomaly - y/y_prime;
        else
            return;
        end
    end
end