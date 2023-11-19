%% Init pendulum

%% Setup workspace

src_path = fullfile(fileparts(mfilename('fullpath')), '..','..');
addpath(genpath(src_path));
clear src_path;

%% Load data

% plant
plant.I = 1; % pendulum MOI
plant.y = 0; % pendulum CG position
plant.g = 1; % gravity

% controller
control.y_scheduling = [-1. 1];
control.k = zeros(1, 4, 2);


%% Load model

mdl = 'pendulum';
load_system(mdl);