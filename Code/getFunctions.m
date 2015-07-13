function getFunctions(varargin)
%GETFUNCTIONS build functions
%intit/update main function and calculate addicted functions
    global ge landscape PHI DPHI C N E DN DC ETA EM L l r m;
    syms symx symy sym1x sym1y sym1z;
    r = str2double(get(ge.radius,'string'));
    m = str2double(get(ge.masse,'string'));
    landscape = eval(['@(x,y)',get(ge.fun,'string')]);
    PHI = eval(['@(x,y)','[x y landscape(x,y)]']);
    fx = diff(landscape(symx, symy), symx);
    FX = makefun(fx);
    fy = diff(landscape(symx, symy), symy);
    FY = makefun(fy);
    N = eval(['@(x,y)','[-FX(x,y) -FY(x,y) 1]./sqrt((-FX(x,y))^2+(-FY(x,y))^2+1)']);
    %not needed for "Coin"
    C = eval(['@(x,y)','PHI(x,y)+r*N(x,y)']);
    dc = jacobian(C(symx, symy)+0*symx,[symx symy]);
    DC = makefun(dc);
    E = eval(['@(x,y)','DC(x,y)''*DC(x,y)']);
    dn = jacobian(N(symx, symy)+0*symx,[symx symy]);
    DN = makefun(dn);
    %additional functions for "Coin"
    dphi = jacobian(PHI(symx,symy), [symx symy]);
    DPHI = makefun(dphi);
    q = eval(['@(x,y)','(eye(3)-y*y'')*N(x(1),x(2))''']);
    %ETA = eval(['@(x,y)','q(x,y)./sqrt(sum(q(x,y).^2))']);
    eta = eval(['@(x,y)','q(x,y)./norm(q(x,y))']);
    ETA = eta;
    %ETA = makefun(eta);
    deta_alpha = jacobian(eta([symx symy], [sym1x sym1y sym1z]),[symx symy]);
    DETA_ALPHA = makefun3(deta_alpha);
    deta_teta = jacobian(eta([symx symy], [sym1x sym1y sym1z]),[sym1x sym1y sym1z]);
    DETA_TETA = makefun3(deta_teta);
    L = eval(['@(x,y,u1,u2,u3)','DPHI(x,y)+r*DETA_ALPHA(x,y,u1,u2,u3)']);
    EM = eval(['@(x,y,u1,u2,u3)','L(x,y,u1,u2,u3)''*L(x,y,u1,u2,u3)']);
    l = eval(['@(x,y,u1,u2,u3)','r*DETA_TETA(x,y,u1,u2,u3)']);
    refresh();
end

