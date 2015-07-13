function rkmk( TAB,h,n,t0,R,alpha,v )
%RKMK Run runge kutta munthe kaas
    global st ge A N r;
    st=0;
    %get starting values
    data(1,:)= [reshape(R',1,numel(R)) v'  alpha'];
    %run RK
    if (get(ge.muenze,'Value')==1)
        global RG;
        RG = R;
        p = getP(RG,alpha);
    end
    %run RKMK
    for i=2:n+1
        t = tic;
        %RKMK
        if (get(ge.kugel,'Value')==1)
            x = [0 0 0  v' alpha'];
            rkv = x + h*RKV(@f_rkmk,x,h,TAB)';
            v = rkv(4:6)';
            u = rkv(1:3)';
            alpha = rkv(7:8)';
            if (norm(u)==0)
                expo = cos(norm(u)) * eye(3) + sin(norm(u)) * A(u) + (1-cos(norm(u)))*(u*u');
            else
                expo = cos(norm(u)) * eye(3) + sin(norm(u)) * A(u./norm(u)) + (1-cos(norm(u)))/(norm(u)^2)*(u*u');
            end
            R = (expo*R);
            data(i,:) = [reshape(R',1,numel(R)) v' rkv(7:8)];
            moveAndDisplayData(data,i,t0,t);
        elseif (get(ge.muenze,'Value')==1)
            x = [0 0 0  v' alpha'];
            rkv = x + h*RKV(@f_rkmk_coin,x,h,TAB)';
            u = rkv(1:3)';
            if (norm(u)==0)
                expo = cos(norm(u)) * eye(3) + sin(norm(u)) * A(u) + (1-cos(norm(u)))*(u*u');
            else
                expo = cos(norm(u)) * eye(3) + sin(norm(u)) * A(u./norm(u)) + (1-cos(norm(u)))/(norm(u)^2)*(u*u');
            end
            RG = (expo*RG);
            alpha = rkv(7:8)';
            v = rkv(4:6)';
            data(i,:) = [reshape(RG',1,numel(RG)) v' alpha'];
            moveAndDisplayData(data,i,t0,t,getP(RG,alpha));
        end
        if (st==1)
            break;
        end
        if (get(ge.ptb,'value')==1)
            pause(str2double(get(ge.pt,'string')));
        end
    end;
    st=1;
end

