
function ts = timeseries_zoh(x, t)
ts = timeseries(x, t);
ts = setinterpmethod(ts, 'zoh');
end