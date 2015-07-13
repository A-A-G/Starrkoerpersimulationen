function [ v ] = getV( ge )
%GETV get v
    v = [str2double(get(ge.v1,'string')) ; str2double(get(ge.v2,'string')) ; str2double(get(ge.v3,'string'))];
end

