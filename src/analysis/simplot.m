function simplot(simtt)
tiledlayout(3,1);
ax = [];

ax= [ax, nexttile()];
plot(simtt.Time, simtt.x);
ylabel('x')
ax= [ax, nexttile()];
plot(simtt.Time, simtt.theta);
ylabel('\theta')
ax= [ax, nexttile()];
plot(simtt.Time, simtt.energy);
ylabel('e')

linkaxes(ax, 'x');
xlabel('time [s]')
end