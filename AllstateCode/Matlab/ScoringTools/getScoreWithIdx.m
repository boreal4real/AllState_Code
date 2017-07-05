function [ Results ] = getScoreWithIdx( dataPred,dataTruth, idx, filterString )
%GETSCOREWITHIDX Summary of this function goes here
%   Detailed explanation goes here
% idx = logical(idx);
filteredDataPred = dataPred(idx);
filteredDataTruth = dataTruth(idx);

conf = confusionmat(filteredDataTruth, filteredDataPred);

TN = conf(1,1);
FP = conf(1,2);
FN = conf(2,1);
TP = conf(2,2);
total = sum(conf(:));
totalFalse = TN+FP;
totalTrue = FN+TP;


Accuracy = (TP+TN) / total;
MisClassification = (FP+FN) / total;
TP_Rate = TP/totalTrue;
FP_Rate = FP/totalFalse;
Specificity = TN/totalFalse;
Precision = TP/(FP+TP);

Results = table( Accuracy,...
                 MisClassification,...
                 TP_Rate,...
                 FP_Rate,...
                 Specificity,...
                 Precision,...
                 'RowNames', {filterString});
                 

end

