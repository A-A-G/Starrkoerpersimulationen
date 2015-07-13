function moveAndDisplayData( data,i,t0,t,varargin )
%MOVEANDDISPLAYDATA
    global ge ger C r landscape PHI;
    if (get(ge.muenze,'Value')==1)
        if (length(varargin) ~= 1)
            return;
        else
            p = varargin{1};
        end
    end
    %move
    R = [data(i,1:3) ; data(i,4:6) ; data(i,7:9)];
    if (get(ge.kugel,'Value')==1)
        mid = C(data(i,13),data(i,14));
    elseif (get(ge.muenze,'Value')==1)
        mid = PHI(data(i,13),data(i,14)) + r*p';
    end
    set(ge.ball,'Vertices',(r*R*ge.refvertices)'+repmat(mid,size(ge.refvertices,2),1));        
    %spur
    if (get(ge.spur,'Value')==1)
        plot3([data(i-1,13);data(i,13)],[data(i-1,14);data(i,14)],[landscape(data(i-1,13),data(i-1,14));landscape(data(i,13),data(i,14))]);
    end
    %repaint
    drawnow;
    %display data
    set(ger.r11,'string',sprintf('%3.2f',R(1,1)));
    set(ger.r12,'string',sprintf('%3.2f',R(1,2)));
    set(ger.r13,'string',sprintf('%3.2f',R(1,3)));
    set(ger.r21,'string',sprintf('%3.2f',R(2,1)));
    set(ger.r22,'string',sprintf('%3.2f',R(2,2)));
    set(ger.r23,'string',sprintf('%3.2f',R(2,3)));
    set(ger.r31,'string',sprintf('%3.2f',R(3,1)));
    set(ger.r32,'string',sprintf('%3.2f',R(3,2)));
    set(ger.r33,'string',sprintf('%3.2f',R(3,3)));
    set(ger.v1,'string',sprintf('%3.2f',data(i,10)));
    set(ger.v2,'string',sprintf('%3.2f',data(i,11)));
    set(ger.v3,'string',sprintf('%3.2f',data(i,12)));
    if (get(ge.muenze,'Value')==1)
        set(ger.p1,'string',sprintf('%3.2f',p(1)));
        set(ger.p2,'string',sprintf('%3.2f',p(2)));
        set(ger.p3,'string',sprintf('%3.2f',p(3)));
    end
    set(ger.a1,'string',sprintf('%3.2f',data(i,13)));
    set(ger.a2,'string',sprintf('%3.2f',data(i,14)));
    set(ger.it,'string',i-1);
    set(ger.tt,'string',toc(t0));
    set(ger.tls,'string',toc(t));
end

