function [ Results ] = getScoreWithIdx( dataPred,dataTruth, idx )
%GETSCOREWITHIDX Summary of this function goes here
%   Detailed explanation goes here
filteredDataPred = dataPred(idx);
filteredDataTruth = dataTruth(idx);

conf = confusionmat(filteredDataTruth, filteredDataPred);

TN = conf(1,1);
FP = conf(1,2);
FN = conf(2,1);
TP = conf(2,2);
total = sum(conf);
totalFalse = TN+FP;
totalTrue = FN+TP;

Results = struct('Accuracy', (TP+TN) / total, ...
                 'MisClassification', (FP+FN) / total, ...
                 'TP Rate', TP/totalTrue, ...
                 'FP Rate', FP/totalFalse, ...
                 'Specificity', TN/totalFalse, ...
                 'Precision', TP/(FP+TP));
                 

end

