function [op, opreport] = get_oppoints(mdl, options)
%GET_OPPOINTS get representative operating points for the pendulum

% This function is modified based on the generated script by the Steady
% State Manager.

%% Parse Inputs
arguments
    mdl
    options.y = [-1, 1]
end

%% Create the operating point specification object
opspec_base = operspec(mdl);

for i=1:length(options.y)
    opspec(i) = define_oppoint(copy(opspec_base), options.y(i));
end

%Create the options
opt = findopOptions('DisplayReport','none');

%% Perform the operating point search
[op,opreport] = findop(mdl,opspec,opt);


end

%% Auxiliary functions
function opspec = define_oppoint(opspec, y)
%DEFINE_OPPOINT, define the operating point constraints per se

%Set the constraints on the inputs in the model.
% - The defaults for all inputs are Known = false, Min = -Inf, and
% Max = Inf.

% helper function, to make robust against changes
index_in = @(name) find(strcmp(opspec.Inputs.get("Block"), "pendulum/"+name));

% Input - pendulum/fx
% - Default model initial conditions are used to initialize optimization.

% Input - pendulum/y
opspec.Inputs(index_in("y")).u = y;
opspec.Inputs(index_in("y")).Known = true;


%Set the constraints on the outputs in the model.
% - The defaults for all outputs are Known = false, Min = -Inf, and
% Max = Inf.

% helper function, to make robust against changes
index_out = @(name) find(strcmp(opspec.Outputs.get("Block"), "pendulum/"+name));

% Output - pendulum/x
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(index_out("x")).Known = true;

% Output - pendulum/x_dot
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(index_out("x_dot")).Known = true;

% Output - pendulum/theta
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(index_out("theta")).Known = true;

% Output - pendulum/theta_dot
% - Default model initial conditions are used to initialize optimization.
opspec.Outputs(index_out("theta_dot")).Known = true;

end