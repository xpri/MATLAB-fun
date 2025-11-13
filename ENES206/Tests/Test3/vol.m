function V = vol(h)
%Finds volume of h or vector h
%   R is the radius in feet
%   V is volume in ft^3
%   h is depth of water in ft

R = 10;
for k = 1:length(h)
    V(k) = pi.*h(k).^2 .* [(3*R - h(k))]./[3];
end
% V = pi.*h.^2 .* [(3*R - h)]./[3];
end

