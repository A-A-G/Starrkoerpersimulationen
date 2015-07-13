function [ R ] = getR( ge )
%GETR get R
    Rx = [1 0 0 ; 0 cosd(str2double(get(ge.rx,'string'))) -sind(str2double(get(ge.rx,'string'))) ; 0 sind(str2double(get(ge.rx,'string'))) cosd(str2double(get(ge.rx,'string')))];
    Ry = [cosd(str2double(get(ge.ry,'string'))) 0 sind(str2double(get(ge.ry,'string'))) ; 0 1 0 ; -sind(str2double(get(ge.ry,'string'))) 0 cosd(str2double(get(ge.ry,'string')))];
    Rz = [cosd(str2double(get(ge.rz,'string'))) -sind(str2double(get(ge.rz,'string'))) 0 ; sind(str2double(get(ge.rz,'string'))) cosd(str2double(get(ge.rz,'string'))) 0 ; 0 0 1];
    R = Rx*Ry*Rz;
end

