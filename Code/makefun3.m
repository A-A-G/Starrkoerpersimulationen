function f = makefun(s)

[m,n]=size(s);
str = '';
for i=1:m
    for j = 1:n
        str = [str,char(s(i,j)),','];
    end
    str(end)=';';
end
str = ['[',str,']'];
str = ['@(symx,symy,sym1x,sym1y,sym1z)',str];
f = eval(str);