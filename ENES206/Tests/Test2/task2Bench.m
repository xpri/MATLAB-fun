syms x y
eqn = (x - 3)^2+4*y^2 == 25;
%xrange [-5 11]
%yrange [-3 3]
%change curve color to blue
q = ezplot(eqn,[-5 11 -3 3]);
set(q,"color","blue");