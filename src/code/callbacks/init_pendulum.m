%% Init pendulum

%% Setup workspace

src_path = fullfile(fileparts(mfilename('fullpath')), '..','..');
addpath(genpath(src_path));
clear src_path;

%% Load data

mdl = 'pendulum';
load_system(mdl);
data = load_pendulum_data();