function ds = dataset_setname(ds, name, ts)

% find index
idx = find(strcmp(name, ds.getElementNames()));
if length(idx)>1
    warning('more than one matching signal, writing to the first one')
elseif isempty(idx)
    error('no matching signal');
end

% set per se
ds_element_type = class(ds.getElement(idx));
switch ds_element_type      
    case 'Simulink.SimulationData.State'
        x = ds.getElement(idx);
        x.Values = ts;
        ds = ds.setElement(idx, x);
    otherwise % timeseries and structures of timeseries
        ds = ds.setElement(idx, ts, name);

end