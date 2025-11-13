function force = CForce(q_1,q_2,r)
%CFORCE Takes the coulumb force of 2 charges seperated by a distance 'r'
%   Detailed explanation goes here
%   f = kq*q/r^2
ep = 8.854187817e-12;
force = (q_1*q_2)/(4*pi*ep*r^2);

end

