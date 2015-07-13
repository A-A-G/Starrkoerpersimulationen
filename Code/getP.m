function [ p ] = getP(R, alpha)
%GETP calculate p
    global ETA;
    p = ETA(alpha,R*[0 ; 1 ; 0]);
end

