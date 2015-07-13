function saveSettings(varargin)
global ge;
%SAVESETTINGS 
    %write data to var
    var.r = get(ge.radius,'string');
    var.m = get(ge.masse,'string');
    var.h = get(ge.schrittweite,'string');
    var.n = get(ge.noi,'string');
    var.fun = get(ge.fun,'string');
    var.euler = get(ge.euler,'Value');
    var.rk4 = get(ge.rk4,'Value');
    var.lawson = get(ge.lawson,'Value');
    var.rkmk = get(ge.rkmk,'Value');
    var.muenze = get(ge.muenze,'Value');
    var.kugel = get(ge.kugel,'Value');
    var.rx = get(ge.rx,'string');
    var.ry = get(ge.ry,'string');
    var.rz = get(ge.rz,'string');
    var.v1 = get(ge.v1,'string');
    var.v2 = get(ge.v2,'string');
    var.v3 = get(ge.v3,'string');
    var.a1 = get(ge.a1,'string');
    var.a2 = get(ge.a2,'string');
    var.ptb = get(ge.ptb,'Value');
    var.pt = get(ge.pt,'string');
    var.spur = get(ge.spur,'Value');
    var.opengl = get(ge.opengl,'Value');
    var.zbuffer = get(ge.zbuffer,'Value');
    var.painters = get(ge.painters,'Value');
    var.xmin = get(ge.xmin,'string');
    var.xmax = get(ge.xmax,'string');
    var.ymin = get(ge.ymin,'string');
    var.ymax = get(ge.ymax,'string');
    var.zmin = get(ge.zmin,'string');
    var.zmax = get(ge.zmax,'string');
    var.grid = get(ge.grid,'string');
    %save var to file
    uisave('var','examples/settings');
end

