function f = figure_named(name, options)
arguments
    name {mustBeTextOrCellStr}
    options.Clear = false;
    options.NumberTitle matlab.lang.OnOffSwitchState = 'on';
    options.Number = [];
end

% Find plots with the same name, or else create if
f = findall(groot,'Type', 'figure', 'Name', name);
if length(f)>1
    warning('figure_named:more_than_one_figure_match', ...
            'More than one figure found with the specified name, returning the first match')
    f = f(1);
elseif isempty(f)
    if isempty(options.Number)
        f = figure("Name", name);
    else
        f = figure(options.Number, "Name", name);
    end
end
figure(f);

% Apply options
if options.Clear
    clf(f)
end
f.NumberTitle = options.NumberTitle;
