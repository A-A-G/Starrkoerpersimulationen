clear;

%profile on;

%% init globals
%global functions
global A
A = eval(['@(w)','[0 -w(3) w(2) ; w(3) 0 -w(1) ; -w(2) w(1) 0]']);

%create GUI
global ge ger;
[ge ger] = createGUI();

%calculate globals:
global r g st;
st = 1;
r = str2double(get(ge.radius,'string'));
g = [0 0 1]'* -9.80665;

%% initialize functions and ball
getFunctions();