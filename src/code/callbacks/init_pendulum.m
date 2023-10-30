%% Setup workspace

src_path = fullfile(fileparts(mfilename('fullpath')), '..','..');
addpath(genpath(src_path));
clear src_path


%% Load data

mdl = 'pendulum';

data = load_pendulum_data();

load_system(mdl);
