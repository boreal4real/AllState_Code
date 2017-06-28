function allLeaks = loadLeaks(fid)
allLeaks = [];
%fid = fopen(filePath);
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s';
C = textscan(fid,formatSpec,'Delimiter',',');

leakStart = strmatch( 'leak', C{7});
leakEnd = strmatch('no_leak', C{7});

leaks = [];
leaks(leakStart) = 1;
leaks(leakEnd) = 0;
leaks = leaks';

timeStamp = C{10};
epochTime = cellfun(@convertToEpoch, timeStamp);
data = [leaks, epochTime];
badIdx = isnan (data(:,1));
data(badIdx,:) = [];
[s ind] = sort(data(:,2));
data = data(ind,:);
[l w] = size(data);
for k=1:(l-1)

      if (data(k,1) == 1 && data(k+1) == 0)
      allLeaks = [allLeaks; data(k,2), data(k+1,2), data(k+1,2) - data(k,2)];
      end

end




%fclose(fid);
end
