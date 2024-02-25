%% Longitudinal Controller

%%%%% Controller Setting %%%%%

lon.R = diag([1000, 1]);
lonp  = 50;
lon.Q = lonp*lon.C'*lon.C;

[lon.K, lon.S, lon.P] = lqr(cruiseLong, lon.Q, lon.R);

%%%%% Closed Loop Response %%%%%

closedLong = ss((lon.A - lon.B*lon.K), lon.B, lon.C, lon.D,...
    'statename',  lon.State,...
    'inputname',  lon.In,...
    'outputname', lon.Out);

step(closedLong)

%% Lateral Controller

%%%%% Controller Setting %%%%%

lat.R = diag([1, 1]);
latp  = 1;
lat.Q = latp*lat.C'*lat.C;

[lat.K, lat.S, lat.P] = lqr(cruiseLat, lat.Q, lat.R);

%%%%% Closed Loop Response %%%%%

closedLat = ss((lat.A - lat.B*lat.K), lat.B, lat.C, lat.D,...
    'statename',  lat.State,...
    'inputname',  lat.In,...
    'outputname', lat.Out);

step(closedLat)

%% Initial Conditions

[t_trim, w_trim, v_trim, x_trim] = trim.op1.States.x;

lat.theta0 = [t_trim(1), t_trim(3)];
lat.v0     = [v_trim(2)];
lat.w0     = [w_trim(1), w_trim(3)];

lon.x0     = [x_trim(3)];
lon.theta0 = [t_trim(2)];
lon.v0     = [v_trim(1), v_trim(3)];
lon.w0     = [w_trim(2)];
