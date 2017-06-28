function nothing = plotLeakEvents(data, name)

h = figure;
reference = min(data(:,1)) / 3600;
rangeDays = (max(data(:,2)) / 86400) - (min(data(:,1)) / 86400);
[l w] = size(data);
hold on;
for k = 1:l
plot([data(k,1) / 3600] - reference,1,'markersize', 10, 'color', 'red',[data(k,2) / 3600] - reference,1, 'markersize', 10,'color', 'blue' );
end
title(name);
close(h);
end