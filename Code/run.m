function run(varargin)
%Start Calculation
global ge;
    %get params
    h = str2double(get(ge.schrittweite,'string'));
    n = str2double(get(ge.noi,'string'));
    t0 = tic;

    %get RK-Typ
    %Euler (s=1,k=1)
    %Klassisches RKV (s=4,k=4)
    %Lawson (s=6,k=5)
    if (get(ge.rk4,'Value')==1)
        TAB = [0 0 0 0 0; 0.5 0.5 0 0 0; 0.5 0 0.5 0 0; 1 0 0 1 0;0 1/6 1/3 1/3 1/6];
        dontrun=0;            
    elseif (get(ge.euler,'Value')==1)   
        TAB = [1 0 ; 0 1];
        dontrun=0;            
    elseif (get(ge.lawson,'Value')==1)
        TAB = [0 0 0 0 0 0 0; 0.5 0.5 0 0 0 0 0; 0.25 3/16 1/16 0 0 0 0; 0.5 0 0 0.5 0 0 0;0.75 0 -3/16 6/16 9/16 0 0; 1 1/7 4/7 6/7 -12/7 8/7 0; 0 7/90 0 32/90 12/90 32/90 7/90];
        dontrun=0;
    else
        msgbox('Kein Verfahren gewählt!','Verfahren?','warn');
        dontrun=1;
    end
    %choose between rk and rkmk
    if (dontrun==0)
        R = getR(ge);
        alpha = getAlpha(ge);
        v = getV(ge);
        if(get(ge.rkmk,'Value')==1)
            rkmk(TAB,h,n,t0,R,alpha,v)
        else
            rk(TAB,h,n,t0,R,alpha,v)
        end
    end
end

