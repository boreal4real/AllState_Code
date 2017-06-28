function epochTime = convertToEpoch(time)
timeFormat = "%Y-%m-%e %k:%M:%S %Z";
[tm_struct, nchars] = strptime (time, timeFormat);
epochTime = mktime(tm_struct);
end