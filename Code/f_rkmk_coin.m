function [ dx ] = f_rkmk_coin( x )
%F_RKMK_COIN Runge-Kutta Munte-Kaas differential equations for "Coin"
global m r g A EM L l DPHI RG;
u = x(1:3);
v = x(4:6);
alpha = x(7:8);
p = getP(RG,alpha);
T_a = RG*(m*r^2/4*[1 0 0; 0 2 0; 0 0 1])*RG'-m*r^2*A(p)^2;
w = T_a\v;
theta = RG*[0 ; 1 ; 0];
dtheta = A(w)*RG*[0 ; 1 ; 0];
du = (eye(3)-1/12*A(u)*(6*eye(3)+A(u)))*w;
dalpha = EM(alpha(1),alpha(2),theta(1),theta(2),theta(3) )\( L(alpha(1),alpha(2),theta(1),theta(2),theta(3))' * (r*A(w)*p - l(alpha(1),alpha(2),theta(1),theta(2),theta(3)) *dtheta) );
dv = m*r*A(p)*g-m*r^2*A(A(w)*p-1/r*DPHI(alpha(1),alpha(2))*dalpha)*A(p)*w;
dx = [du' dv' dalpha'];
end