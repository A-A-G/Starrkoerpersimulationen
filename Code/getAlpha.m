function [ alpha ] = getAlpha(ge)
%GETALPHA getAlpha
    alpha = [str2double(get(ge.a1,'string')) ; str2double(get(ge.a2,'string'))];
end

