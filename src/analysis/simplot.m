function simplot(simtt, options)
arguments
    simtt timetable
    options.PlotEnergy = false;
end

if options.PlotEnergy
    tiledlayout(3,1);
else
    tiledlayout(2,1);
end
ax = [];

ax= [ax, nexttile()];
plot(simtt.Time, simtt.x);
ylabel('x')
ax= [ax, nexttile()];
plot(simtt.Time, simtt.theta);
ylabel('\theta')
if options.PlotEnergy
    ax= [ax, nexttile()];
    plot(simtt.Time, simtt.energy);
    ylabel('e')
end

linkaxes(ax, 'x');
xlabel('time [s]')
end