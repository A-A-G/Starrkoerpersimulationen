function resetDisplayData( ge,ger )
%RESETDISPLAYDATA 
    R = getR(ge);
    set(ger.r11,'string',num2str(R(1,1)));set(ger.r12,'string',num2str(R(1,2)));set(ger.r13,'string',num2str(R(1,3)));set(ger.r21,'string',num2str(R(2,1)));set(ger.r22,'string',num2str(R(2,2)));set(ger.r23,'string',num2str(R(2,3)));set(ger.r31,'string',num2str(R(3,1)));set(ger.r32,'string',num2str(R(3,2)));set(ger.r33,'string',num2str(R(3,3)));
    set(ger.v1,'string',get(ge.v1,'string'));set(ger.v2,'string',get(ge.v2,'string'));set(ger.v3,'string',get(ge.v3,'string'));
    % fill p
    p = getP(R,getAlpha(ge));
    set(ger.p1,'string',sprintf('%3.2f',p(1)));
    set(ger.p2,'string',sprintf('%3.2f',p(2)));
    set(ger.p3,'string',sprintf('%3.2f',p(3)));
    %
    set(ger.a1,'string',get(ge.a1,'string'));set(ger.a2,'string',get(ge.a2,'string'));
    set(ger.it,'string',0); set(ger.tt,'string',0); set(ger.tls,'string',0);
end

