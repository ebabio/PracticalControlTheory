%% Run basic simulation

clear
clc

%% Setup simulation

init_pendulum;

%% Run example simulation


% Define initial state


%Simulation input definition
% create dataset of inputs
u_ds = createInputDataset(mdl);
u_ds = dataset_setname(u_ds, "length", timeseries_zoh([0,1,1], [0, 10, 20]));
% create dataset of initial states
x0_ds = Simulink.BlockDiagram.getInitialState(mdl);
x0_ds = dataset_setname(x0_ds, "theta", timeseries(1, 0));
% create simulation input
simin = Simulink.SimulationInput(mdl);
simin = simin.setExternalInput(u_ds);
simin = simin.setInitialState(x0_ds);
% final time
simin = setModelParameter(simin,"StopTime","20");

%Run Simulation
% applyToModel(simIn); % i think you can run it without this
simout = simin.sim();
simtt = extractTimetable(simout.logsout);

%Plot data
figure(1)
simplot(simtt);






