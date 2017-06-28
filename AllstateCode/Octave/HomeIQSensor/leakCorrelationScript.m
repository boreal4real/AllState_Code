%thePath = 'C:\Users\abouv\Desktop\Sensor Data\Leaks\Home19_DW-L Sensor.csv';
%tempDataPath = 'C:\Users\abouv\Desktop\Sensor Data\Organized\Home19_DW-D Sensor.csv';

thePath = 'C:\Users\abouv\Desktop\Sensor Data\Leaks\Home269_DW-L Sensor.csv';
tempDataPath = 'C:\Users\abouv\Desktop\Sensor Data\Organized\Home269_DW-L Sensor.csv';

leakData = loadLeaks(fopen(thePath));
tempData = loadAndPlotCSV(tempDataPath);
peaks = findDWCycles(tempData);

peakTimestamps = tempData(peaks,2);

[l w] = size(leakData);

count = 0;
for k=1:l
    
    if(min(abs(peakTimestamps - leakData(k,1))) < 3600)
    count = count + 1;
    end

end

(count / l) * 100
plot(tempData(:,2),tempData(:,1),tempData(peaks,2),tempData(peaks,1),'.m')
hold on
[l w] = size(leakData);
for k = 1:l
plot(leakData(k,1),90,'markersize', 10, 'color', 'red');
plot(leakData(k,2),90,'markersize', 10, 'color', 'blue');
end
axis([0 1 55 100], "autox");
xlabel('Time');
ylabel('Temperature');