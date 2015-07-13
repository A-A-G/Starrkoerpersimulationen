function [ dx ] = f_coin(x)
%differential equations for "Coin"
global r m g A EM L l DPHI;
R = [x(1:3)' ; x(4:6)' ; x(7:9)'];
v = x(10:12);
alpha = x(13:14);
p = getP(R,alpha);
T_a = R*(m*r^2/4*[1 0 0; 0 2 0; 0 0 1])*R'-m*r^2*A(p)^2;
w = T_a\v;
theta = R*[0 ; 1 ; 0];
dR = (A(w)*R);
dtheta = dR*[0 ; 1 ; 0];
dalpha = EM(alpha(1),alpha(2),theta(1),theta(2),theta(3) )\( L(alpha(1),alpha(2),theta(1),theta(2),theta(3))' * (r*A(w)*p - l(alpha(1),alpha(2),theta(1),theta(2),theta(3)) *dtheta) );
dv = m*r*A(p)*g-m*r^2*A(A(w)*p-1/r*DPHI(alpha(1),alpha(2))*dalpha)*A(p)*w;
dx = [reshape(dR',1,numel(dR)) dv' dalpha']';
end