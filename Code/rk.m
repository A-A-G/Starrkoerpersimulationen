function rk(TAB,h,n,t0,R,alpha,v)
%RK Run normal runge kutta
global st ge;
    st=0;
    %get starting values
    data(1,:)= [reshape(R',1,numel(R)) v'  alpha'];
    %run RK
    for i=2:n+1
        t = tic;
        %RKV
        if (get(ge.muenze,'Value')==1)
            data(i,:)= data(i-1,:) + h*RKV(@f_coin,data(i-1,:),h,TAB)';
            moveAndDisplayData(data,i,t0,t,getP([data(i-1,1:3) ; data(i-1,4:6) ; data(i-1,7:9)],data(i-1,13:14)));
        else
            data(i,:)= data(i-1,:) + h*RKV(@f,data(i-1,:),h,TAB)';
            moveAndDisplayData(data,i,t0,t);
        end
        %break?
        if (st==1)
            break;
        end
        %pause
        if (get(ge.ptb,'value')==1)
            pause(str2double(get(ge.pt,'string')));
        end
    end
    st=1;
end

