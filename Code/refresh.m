function refresh( varargin )
%REFRESH Redraw initial/changed Ball
    global st r ge ger landscape C PHI;
    if (st==1)
        hold off;
        grid = str2double(get(ge.grid,'string'));
        x = str2double(get(ge.xmin,'string')):grid:str2double(get(ge.xmax,'string'));
        y = str2double(get(ge.ymin,'string')):grid:str2double(get(ge.ymax,'string'));
        [X,Y] = meshgrid(x,y);
        Z = landscape(X, Y);
        mesh(X, Y, Z);
        hold on;
        r = str2double(get(ge.radius,'string'));
        R = getR(ge);
        if (get(ge.kugel,'Value')==1)
            NoV=26; %gerade!
            [Xs Ys Zs]=sphere(NoV);
            ge.ball=patch(surf2patch(Xs, Ys, Zs, Zs));
            ge.refvertices=get(ge.ball,'Vertices')';
            mid = C(str2double(get(ge.a1,'string')), str2double(get(ge.a2,'string')));
            set(ge.ball,'Vertices',(r*R*ge.refvertices)'+repmat(mid,size(ge.refvertices,2),1));
            %set(ge.ball,'FaceColor',[1 0 0],'FaceAlpha',1);
            %set(ge.ball,'FaceVertexCData',[repmat([repmat([1 1 0],NoV+1,1) ; repmat([0 0 0],NoV+1,1)],NoV/2,1);repmat([1 1 0],NoV+1,1)]);
        elseif (get(ge.muenze,'Value')==1)
            width=0.1;
            NoV=100;
            [Xs Ys Zs]=cylinder(1,NoV);
            ge.ball=patch(surf2patch(Xs, Ys, Zs, Zs));
            vert=get(ge.ball,'Vertices');
            set(ge.ball, 'Vertices', [vert(:,1) vert(:,3)*width-repmat(0.5*width,size(vert,1),1) vert(:,2)]);
            faces=get(ge.ball,'Faces');
            set(ge.ball, 'Faces', [faces repmat(NaN(1,NoV-size(faces,2)),size(faces,1),1);1:2:2*NoV-1;2:2:2*NoV]);
            ge.refvertices=get(ge.ball,'Vertices')';
            p = getP(R,getAlpha(ge));
            mid = PHI(str2double(get(ge.a1,'string')), str2double(get(ge.a2,'string'))) + r*p';
            set(ge.ball,'Vertices',(r*R*ge.refvertices)'+repmat(mid,size(ge.refvertices,2),1));
            set(ger.p1,'string',sprintf('%3.2f',p(1)));
            set(ger.p2,'string',sprintf('%3.2f',p(2)));
            set(ger.p3,'string',sprintf('%3.2f',p(3)));
        else
            msgbox('Kein Typ definiert!','Fatal Error','error');
            error('Kein Typ definiert!');              
        end
        shading faceted; %Kugel mit Gitterlinien
        %shading interp; %Kugel mit interpolierten Farbübergang
        %shading flat; %Kugel mit abgegrenzten Farbübergang
        axis([str2double(get(ge.xmin,'string')) str2double(get(ge.xmax,'string')) str2double(get(ge.ymin,'string')) str2double(get(ge.ymax,'string')) str2double(get(ge.zmin,'string')) str2double(get(ge.zmax,'string'))]);        
        axis vis3d;
        xlabel('x'); ylabel('y'); zlabel('z');
        view([-0.1 1 0.5]);
        resetDisplayData(ge,ger);
    else
        msgbox('Kann Daten nicht zurücksetzen.Berechnung läuft!','Berechnung aktiv!','error');
        uiwait;
    end
end