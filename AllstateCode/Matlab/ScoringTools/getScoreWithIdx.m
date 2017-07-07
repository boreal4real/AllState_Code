function [ Results ] = getScoreWithIdx( dataPred,dataTruth, idx, filterString )
%GETSCOREWITHIDX Summary of this function goes here
%   Detailed explanation goes here
% idx = logical(idx);
if sum(idx) == 0
    Results = [];
    return;
end

filteredDataPred = dataPred(idx);
filteredDataTruth = dataTruth(idx);

if(max(dataTruth > 1))
    classes = [1 2 3];
else
    classes = [0 1];
end 

% conf = confusionmat(filteredDataTruth, filteredDataPred);

[conf Accuracy Precision Sensitivity Specificity ] = cfmatrix2(filteredDataTruth, filteredDataPred, classes, 0, 1);

% TN = conf(1,1);
% FP = conf(1,2);
% FN = conf(2,1);
% TP = conf(2,2);
% total = sum(conf(:));
% totalFalse = TN+FP;
% totalTrue = FN+TP;
% 
% 
% Accuracy = (TP+TN) / total;
% MisClassification = (FP+FN) / total;
% TP_Rate = TP/totalTrue;
% FP_Rate = FP/totalFalse;
% Specificity = TN/totalFalse;
% Precision = TP/(FP+TP);

Results = table( Accuracy,...
                 Precision,...
                 Sensitivity,...
                 Specificity,...
                 'RowNames', {filterString});

% c = classperf(filteredDataTruth, filteredDataPred);
% Accuracy = c.LastCorrectRate;
% MisClassification = c.LastErrorRate;
% Specificity = c.Specificity;
% Sensitivity = c.Sensitivity;
% Precision = c.NegativePredictiveValue;
% 
% Results = table( Accuracy,...
%                  MisClassification,...
%                  Specificity,...
%                  Sensitivity,...
%                  Precision,...
%                  'RowNames', {filterString});
                 

end

