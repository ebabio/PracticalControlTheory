%% Run basic simulation

clear
clc

%% Setup simulation

init_pendulum;

%% Run example simulation

% Define initial state
theta_0 = 0;

%Simulation input definition
% create dataset of inputs
u_ds = createInputDataset(mdl);
u_ds = dataset_setname(u_ds, "y", timeseries_zoh([0,-1,-1], [0, 10, 20]));
% create dataset of initial states
x0_ds = Simulink.BlockDiagram.getInitialState(mdl);
x0_ds = dataset_setname(x0_ds, "theta", timeseries(1, theta_0));
% create simulation input
simin = Simulink.SimulationInput(mdl);
simin = simin.setExternalInput(u_ds);
simin = simin.setInitialState(x0_ds);
% final time
simin = setModelParameter(simin,"StopTime","20");

%Run Simulation
simout = simin.sim();
simtt = extractTimetable(simout.logsout);

%Plot data
% plot the nergy to verify th eimplementation is correct, 
% but it requires changing the solver since an ode1 is not very precise
figure_named('Simulation time History');
simplot(simtt, PlotEnergy=false);






