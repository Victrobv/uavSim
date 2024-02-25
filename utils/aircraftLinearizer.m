%% Linearization
%%%%% Load Operating Points %%%%%

trim = load('utils\trim_points.mat');

% trim.op1: Cruise
% trim.op2: Climb
% trim.op3: Turn (W.I.P)

%%%%% I/O %%%%%

mdl = 'uavControl';

io(1) = linio('uavControl/UAV/Bus Creator', 1,'openinput', [], 'dA');
io(2) = linio('uavControl/UAV/Bus Creator', 1,'openinput', [], 'dR');
io(3) = linio('uavControl/UAV/Bus Creator', 1,'openinput', [], 'dE');
io(4) = linio('uavControl/UAV/Bus Creator', 1,'openinput', [], 'dT');

io(5) = linio('uavControl/UAV/ Aircraft Model', 1,'openoutput', [], 'stateBus.[Theta]b');
io(6) = linio('uavControl/UAV/ Aircraft Model', 1,'openoutput', [], 'stateBus.[W]b');
io(7) = linio('uavControl/UAV/ Aircraft Model', 1,'openoutput', [], 'stateBus.[V]b');
io(8) = linio('uavControl/UAV/ Aircraft Model', 1,'openoutput', [], 'stateBus.[X]e');

%%%%% Linear Model %%%%%

cruiseConditions = linearize(mdl,io,trim.op1);

%% Lateral & Longitudinal Models 

%%%%% I/O %%%%%

lat.State    = {"roll", "yaw", "p", "r", "v"};
lat.StateIdx = [1, 2, 4, 6, 8];
lat.In       = {"dA", "dR"};
lat.InIdx    = [1, 2];
lat.Out      = lat.State;
lat.OutIdx   = lat.StateIdx;

lon.State    = {"pitch", "q", "u", "w", "z"};
lon.StateIdx = [2, 5, 7, 9, 12];
lon.In       = {"dE", "dT"};
lon.InIdx    = [3, 4];
lon.Out      = lon.State;
lon.OutIdx   = lon.StateIdx;

%%%%% State-Space %%%%%

lat.A = cruiseConditions.A(lat.StateIdx, lat.StateIdx);
lat.B = cruiseConditions.B(lat.StateIdx, lat.InIdx);
lat.C = cruiseConditions.C(lat.OutIdx, lat.StateIdx);
lat.D = cruiseConditions.D(lat.OutIdx, lat.InIdx);

cruiseLat  = ss(lat.A, lat.B, lat.C, lat.D,...
    'statename',  lat.State,...
    'inputname',  lat.In,...
    'outputname', lat.Out);

lon.A = cruiseConditions.A(lon.StateIdx, lon.StateIdx);
lon.B = cruiseConditions.B(lon.StateIdx, lon.InIdx);
lon.C = cruiseConditions.C(lon.OutIdx, lon.StateIdx);
lon.D = cruiseConditions.D(lon.OutIdx, lon.InIdx);

cruiseLong = ss(lon.A, lon.B, lon.C, lon.D,...
    'statename',  lon.State,...
    'inputname',  lon.In,...
    'outputname', lon.Out);
