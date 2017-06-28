function data = loadTempData(fid)

%fid = fopen(filePath);
formatSpec = '%s%s%s%s%s%s%f%s%s%s%s%s%s';
C = textscan(fid,formatSpec,'Delimiter',',');

temp = C(7){:};
temp = temp .* 1.8;
dataValue = temp + 32;
timeStamp = C{10};
dataType = C{6};
tempIdx = strmatch( 'temperature', dataType);
dataValue = dataValue(tempIdx);
timeStamp = timeStamp(tempIdx);
epochTime = cellfun(@convertToEpoch, timeStamp);
data = [dataValue, epochTime];
badIdx = isnan (data(:,1));
data(badIdx,:) = [];
[s ind] = sort(data(:,2));
data = data(ind,:);
end