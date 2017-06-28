function peaks = findDWCycles(data)
 pkg load signal;
peaks = [];
%THRESHOLD = 71;
THRESHOLD = mean(data(:,1)) + 2*std(data(:,1));
THRESHOLD = median(data(:,1)) + 2*std(data(:,1));
[l w] = size(data);

[a b c] = findpeaks(data(:,1), 'MinPeakHeight', THRESHOLD, 'MinPeakDistance', 10, 'MinPeakWidth', 1);
figure;
plot(data(:,2), data(:,1), data(b,2),data(b,1),'.m')

peaks = b;

end