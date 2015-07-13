function [ dx ] = f_rkmk( x )
%F_RKMK 
global A m r N DC DN E g;
u = x(1:3);
v = x(4:6);
alpha = x(7:8);
An = A(N(alpha(1),alpha(2)));
T_a = m*r^2*(2/5*eye(3)-An^2);
w = T_a\v;
du = (eye(3)-1/12*A(u)*(6*eye(3)+A(u)))*w;
dalpha = r*(E(alpha(1),alpha(2))\(DC(alpha(1),alpha(2))'*A(w)*N(alpha(1),alpha(2))'));
dv = m*r*An*g-m*r^2*A(DN(alpha(1),alpha(2))*dalpha)*A(N(alpha(1),alpha(2)))*w;
dx = [du' dv' dalpha'];
end

