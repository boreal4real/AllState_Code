function [l count perCorr] = findLeakCorrelation(fidL, fidT, plotOrNot)

leakData = loadLeaks(fidL);
tempData = loadTempData(fidT);

peaks = findDWCycles(tempData);
peakTimestamps = tempData(peaks,2);

[l w] = size(leakData);
count = 0;
for k=1:l
    
    if(min(abs(peakTimestamps - leakData(k,1))) < 2*3600 || min(abs(peakTimestamps - leakData(k,2))) < 2*3600 || sum(peakTimestamps > leakData(k,1) & peakTimestamps < leakData(k,2) > 0)    )
    count = count + 1;
    end

end
disp(['# of leak events: ' num2str(l)]);
disp(['# of correlated leak events: ' num2str(count)]);
perCorr = (count/l)*100;
disp(['Percent Correlated: ' num2str((count/l)*100)]);
timeInHours = tempData(:,2) / 3600;
relativeTimeInHours = timeInHours - timeInHours(1);
if (plotOrNot)
  plot(relativeTimeInHours,tempData(:,1),relativeTimeInHours(peaks),tempData(peaks,1),'.m')
  hold on
  [l w] = size(leakData);
  for k = 1:l
  plot((leakData(k,1) / 3600)-timeInHours(1),90,'markersize', 10, 'color', 'red');
  plot((leakData(k,2) / 3600)-timeInHours(1),90,'markersize', 10, 'color', 'blue');
  end
  axis([0 1 55 100], "autox");
  xlabel('Time (Hours)', 'fontsize', 14);
  ylabel('Temperature (F)','fontsize', 14);
end



end