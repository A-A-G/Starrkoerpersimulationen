function [ge ger] = createGUI()
%CREATEGUI
    %create figure
    %ge.fig = figure('name','Kugel in glatter Landschaft','me','n','nu','off');
    ge.fig = figure('name','Kugel in glatter Landschaft','me','n');
    rotate3d;

    %left side
    uicontrol('sty','te','ba','w','str','Kugelradius','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 0.95 .08 .03]);
    ge.radius = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 .92 .08 .03],'str','0.1','ca',@getFunctions);

    uicontrol('sty','te','ba','w','str','Masse','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 0.87 .08 .03]);
    ge.masse = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 .84 .08 .03],'str','1','ca',@updateMasse);

    uicontrol('sty','te','ba','w','str','Schrittweite','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 0.79 .08 .03]);
    ge.schrittweite = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 .76 .08 .03],'str','0.1');

    uicontrol('sty','te','ba','w','str','Iterationen','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 0.71 .08 .03]);
    ge.noi = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0 .68 .08 .03],'str','1000');

    ge.euler = uicontrol('sty','ra','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .60 .08 .05],'str','Euler','ca',@eulerChecked);
    ge.rk4 = uicontrol('sty','ra','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .55 .08 .05],'str','RK4','ca',@rk4Checked);
    set(ge.rk4,'Value',1);
    ge.lawson = uicontrol('sty','ra','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .50 .08 .05],'str','Lawson','ca',@lawsonChecked);
    ge.rkmk = uicontrol('sty','checkbox','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .45 .08 .05],'str','RKMK');
    set(ge.rkmk,'Value',1);

    uicontrol('sty','pu','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .38 .08 .05],'str','Start','ca',@run);
    uicontrol('sty','pu','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .33 .08 .05],'str','Stop','ca',@stoprun);
    uicontrol('sty','pu','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .28 .08 .05],'str','Refresh','ca',@refresh);

    uicontrol('sty','pu','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .20 .08 .05],'str','Save','ca',@saveSettings);
    uicontrol('sty','pu','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0 .15 .08 .05],'str','Load','ca',@loadSettings);

    %right side
    uicontrol('sty','te','ba','w','str','Rotation','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.95 .08 .03]);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.93 .91 .03 .03],'str','Rx:');
    ge.rx = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.96 .91 .04 .03],'str','0','ca',@refresh);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.93 .88 .03 .03],'str','Ry:');
    ge.ry = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.96 .88 .04 .03],'str','0','ca',@refresh);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.93 .85 .03 .03],'str','Rz:');
    ge.rz = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.96 .85 .04 .03],'str','0','ca',@refresh);


    uicontrol('sty','te','ba','w','str','Geschw.','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.80 .08 .03]);
    ge.v1 = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.93 .77 .02 .03],'str','0');
    ge.v2 = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.95 .77 .02 .03],'str','0');
    ge.v3 = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.97 .77 .02 .03],'str','0');

    uicontrol('sty','te','ba','w','str','Ort','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.70 .08 .03]);
    ge.a1 = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 .67 .04 .03],'str','0.5','ca',@refresh);
    ge.a2 = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.96 .67 .04 .03],'str','-1.75','ca',@refresh);

    uicontrol('sty','te','ba','w','str','Achsen','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.60 .08 .03]);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 .56 .02 .03],'str','X');
    ge.xmin = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.94 .56 .03 .03],'str','-2','ca',@refresh);
    ge.xmax = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.97 .56 .03 .03],'str','2','ca',@refresh);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 .52 .02 .03],'str','Y');
    ge.ymin = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.94 .52 .03 .03],'str','-2','ca',@refresh);
    ge.ymax = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.97 .52 .03 .03],'str','2','ca',@refresh);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 .48 .02 .03],'str','Z');
    ge.zmin = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.94 .48 .03 .03],'str','-2','ca',@refresh);
    ge.zmax = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.97 .48 .03 .03],'str','2','ca',@refresh);
    uicontrol('sty','te','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 .44 .04 .03],'str','Grid');
    ge.grid = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.96 .44 .04 .03],'str','0.1','ca',@refresh);

    ge.ptb = uicontrol('sty','checkbox','ba','w','str','Pause','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.37 .08 .03]);
    ge.pt = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.94 .34 .04 .03],'str','0.1');

    ge.spur = uicontrol('sty','checkbox','ba','w','str','Spur','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.30 .08 .03]);
    set(ge.spur,'Value',1);

    ge.opengl = uicontrol('sty','checkbox','ba','w','str','OpenGL','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.25 .08 .03],'ca',@opengl);
    ge.zbuffer = uicontrol('sty','checkbox','ba','w','str','zbuffer','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.22 .08 .03],'ca',@zbuffer);
    set(ge.zbuffer, 'Value', 1);
    ge.painters = uicontrol('sty','checkbox','ba','w','str','painters','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.92 0.19 .08 .03],'ca',@painters);

    %function (top)
    uicontrol('sty','te','ba','w','str','Funktion:','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.30 0.925 .2 .05],'FontWeight','bold');
    %ge.fun = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.50 .925 .3 .05],'str','cos(x.*pi+pi)./10 - y./10','ca',@getFunctions);
    ge.fun = uicontrol('sty','e','ba','w','un','n','FontUnits','normalized','FontSize',0.7,'Position',[0.50 .925 .3 .05],'str','x./10 - y./10','ca',@getFunctions);
    ge.kugel = uicontrol('sty','ra','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0.419 .874 .08 .05],'str','Kugel','ca',@kugelChecked);
    set(ge.kugel, 'Value', 1);
    ge.muenze = uicontrol('sty','ra','ba','w','un','n','FontUnits','normalized','FontSize',0.5,'position',[0.50 .874 .08 .05],'str','Muenze','ca',@muenzeChecked);

    %display results (bottom)
    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Rotation','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0 0.03 .06 .03]);
    ger.r11 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.06 .05 .08 .025],'str','1');
    ger.r12 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.14 .05 .08 .025],'str','0');
    ger.r13 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.22 .05 .08 .025],'str','0');
    ger.r21 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.06 .025 .08 .025],'str','0');
    ger.r22 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.14 .025 .08 .025],'str','1');
    ger.r23 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.22 .025 .08 .025],'str','0');
    ger.r31 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.06 .00 .08 .025],'str','0');
    ger.r32 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.14 .00 .08 .025],'str','0');
    ger.r33 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.22 .00 .08 .025],'str','1');

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Geschwindigkeit','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.30 0.03 .15 .03]);
    ger.v1 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.30 .00 .05 .03],'str',get(ge.v1,'string'));
    ger.v2 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.35 .00 .05 .03],'str',get(ge.v2,'string'));
    ger.v3 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.40 .00 .05 .03],'str',get(ge.v3,'string'));

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Mittelpunktsvektor','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.45 0.03 .15 .03]);
    ger.p1 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.45 .00 .05 .03],'str',get(ge.v1,'string'));
    ger.p2 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.50 .00 .05 .03],'str',get(ge.v2,'string'));
    ger.p3 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.55 .00 .05 .03],'str',get(ge.v3,'string'));

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Ort','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.64 0.03 .08 .03]);
    ger.a1 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.60 .00 .08 .03],'str',get(ge.a1,'string'));
    ger.a2 = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.68 .00 .08 .03],'str',get(ge.a2,'string'));

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Iterationen','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.80 0.03 .1 .03]);
    ger.it = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.80 .00 .1 .03],'str','0');

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Total Time','un','n','FontUnits','normalized','FontSize',0.82,'Position',[0.90 0.11 .1 .03]);
    ger.tt = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.90 0.08 .1 .03],'str','0');

    uicontrol('sty','te','ba',get(ge.fig,'color'),'str','Time Last','un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.90 0.03 .1 .03]);
    ger.tls = uicontrol('sty','te','ba',get(ge.fig,'color'),'un','n','FontUnits','normalized','FontSize',0.8,'Position',[0.90 .00 .1 .03],'str','0');
    
    %stop
    function stoprun(varargin)
        global st;
        st=1;
    end

    %update Masse
    function updateMasse(varargin)
        global m;
        m = str2double(get(ge.masse,'string'));
    end

    %switch Renderer
    function opengl(varargin)
       if (get(ge.opengl,'Value')==1)
        set(ge.fig,'Renderer','OpenGL');
        set(ge.zbuffer, 'Value', 0);
        set(ge.painters, 'Value', 0);
       end
    end

    %switch Renderer
    function zbuffer(varargin)
       if (get(ge.zbuffer,'Value')==1)
        set(ge.fig,'Renderer','zbuffer');
        set(ge.opengl, 'Value', 0);
        set(ge.painters, 'Value', 0);
       end
    end

    %switch Renderer
    function painters(varargin)
       if (get(ge.painters,'Value')==1)
        set(ge.fig,'Renderer','painters');
        set(ge.zbuffer, 'Value', 0);
        set(ge.opengl, 'Value', 0);
       end
    end

    %RadioButton Euler
    function eulerChecked(varargin)
       if (get(ge.euler,'Value')==1)
           set(ge.lawson,'value',0);
           set(ge.rk4,'value',0);
       end
    end

    %RadioButton RK4
    function rk4Checked(varargin)
       if (get(ge.rk4,'Value')==1)
           set(ge.lawson,'value',0);
           set(ge.euler,'value',0);
       end
    end

    %RadioButton Lawson
    function lawsonChecked(varargin)
       if (get(ge.lawson,'Value')==1)
           set(ge.euler,'value',0);
           set(ge.rk4,'value',0);
       end
    end

    %RadioButton Muenze
    function muenzeChecked(varargin)
       if (get(ge.muenze,'Value')==1)
           set(ge.kugel,'value',0);
       elseif (get(ge.muenze,'Value')==0)
           set(ge.kugel,'value',1);
       end
       refresh();
    end

    %RadioButton Kugel
    function kugelChecked(varargin)
       if (get(ge.kugel,'Value')==1)
           set(ge.muenze,'value',0);
       elseif (get(ge.kugel,'Value')==0)
           set(ge.muenze,'value',1);
       end
       refresh();
    end
end