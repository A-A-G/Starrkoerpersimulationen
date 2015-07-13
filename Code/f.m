function [ dx ] = f(x)
%f 
global A r N E m g DC DN;
R = [x(1:3)' ; x(4:6)' ; x(7:9)'];
v = x(10:12);
alpha = x(13:14);
T = R*(2/5*m*r^2*eye(3))*R'-m*r^2*A(N(alpha(1),alpha(2)))^2;
w = T\v;
dR = (A(w)*R);
dalpha = r*(E(alpha(1),alpha(2))\(DC(alpha(1),alpha(2))'*A(w)*N(alpha(1),alpha(2))'));
dv = m*r*A(N(alpha(1),alpha(2)))*g-m*r^2*A(DN(alpha(1),alpha(2))*dalpha)*A(N(alpha(1),alpha(2)))*w;
dx = [reshape(dR',1,numel(dR)) dv' dalpha']';
end