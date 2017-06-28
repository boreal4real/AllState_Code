function indexes = findIdxOutliers(inputData, numOfStDev)

all_idx = 1:length(inputData)
outlier_idx = abs(inputData - median(inputData)) > numOfStDev*std(inputData); % Find outlier idx
%x(outlier_idx) = interp1(all_idx(~outlier_idx), x(~outlier_idx), all_idx(outlier_idx)) % Linearly interpolate over outlier idx for x

end