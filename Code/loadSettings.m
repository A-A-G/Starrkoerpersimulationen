function loadSettings(varargin)
global ge;
%LOADSETTINGS
    %load var
    [FileName,PathName] = uigetfile('examples/*.mat','Choose settings');
    file=[PathName FileName];
    load(file, 'var');
    %get data from var
    if isfield(var,'r')
        set(ge.radius,'string',var.r);
    end
    if isfield(var,'m')
        set(ge.masse,'string',var.m);
    end
    if isfield(var,'h')
    set(ge.schrittweite,'string',var.h);
        end
    if isfield(var,'n')
    set(ge.noi,'string',var.n);
        end
    if isfield(var,'fun')
        set(ge.fun,'string',var.fun);
    end
    if isfield(var,'euler')
        set(ge.euler,'Value',var.euler);
    end
    if isfield(var,'rk4')
        set(ge.rk4,'Value',var.rk4);
    end
    if isfield(var,'lawson')
        set(ge.lawson,'Value',var.lawson);
    end
    if isfield(var,'rkmk')
        set(ge.rkmk,'Value',var.rkmk);
    end
    if isfield(var,'muenze')
        set(ge.muenze,'Value',var.muenze);
    end
    if isfield(var,'kugel')
        set(ge.kugel,'Value',var.kugel);
    end
    if isfield(var,'rx')
        set(ge.rx,'string',var.rx);
    end
    if isfield(var,'ry')
        set(ge.ry,'string',var.ry);
    end
    if isfield(var,'rz')
        set(ge.rz,'string',var.rz);
    end
    if isfield(var,'v1')
        set(ge.v1,'string',var.v1);
    end
    if isfield(var,'v2')
        set(ge.v2,'string',var.v2);
    end
    if isfield(var,'v3')
        set(ge.v3,'string',var.v3);
    end
    if isfield(var,'a1')
        set(ge.a1,'string',var.a1);
    end
    if isfield(var,'a2')
        set(ge.a2,'string',var.a2);
    end
    if isfield(var,'ptb')
        set(ge.ptb,'Value',var.ptb);
    end
    if isfield(var,'pt')
        set(ge.pt,'string',var.pt);
    end
    if isfield(var,'spur')
        set(ge.spur,'Value',var.spur);
    end
    if isfield(var,'opengl')
        set(ge.opengl,'Value',var.opengl);
    end
    if isfield(var,'zbuffer')
        set(ge.zbuffer,'Value',var.zbuffer);
    end
    if isfield(var,'painters')
        set(ge.painters,'Value',var.painters);
    end
    if isfield(var,'xmin')
        set(ge.xmin,'string', var.xmin);
    end
    if isfield(var,'xmax')
        set(ge.xmax,'string', var.xmax);
    end
    if isfield(var,'ymin')
        set(ge.ymin,'string', var.ymin);
    end
    if isfield(var,'ymax')
        set(ge.ymax,'string', var.ymax);
    end
    if isfield(var,'zmin')
        set(ge.zmin,'string', var.zmin);
    end
    if isfield(var,'zmax')
        set(ge.zmax,'string', var.zmax);
    end
    if isfield(var,'grid')
        set(ge.grid,'string',var.grid);
    end
    %update Functions and Plot
    %switch Renderer
   if (get(ge.opengl,'Value')==1)
        set(ge.fig,'Renderer','OpenGL');
   elseif (get(ge.zbuffer,'Value')==1)
        set(ge.fig,'Renderer','zbuffer');
   elseif (get(ge.painters,'Value')==1)
        set(ge.fig,'Renderer','painters');
   end
    getFunctions(ge);
end

