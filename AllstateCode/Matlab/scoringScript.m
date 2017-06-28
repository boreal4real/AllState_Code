MEAN_LOW_THRESH = 87;
MEAN_HIGH_THRESH = 124;

VAR_LOW_THRESH = 47;
VAR_HIGH_THRESH = 64;

PIX_THRESH = 20000;


truthData = readtable('C:\AllStateCode\trunk\AllstateCode\PhotoTruthAndMeta.xlsx');
curData = readtable('C:\AllStateCode\trunk\AllstateCode\SampleOutput.csv');
meshData = innerjoin(curData, truthData, 'Key', 'ImageID');

totalScore = getScoreWithIdx(meshData.WaterHeaterPresent, meshData.HasWaterHeaterTruth, 1);

resultTable = cell2table(cell(0,6), VariableNames, {'Accuracy', ...
                                                    'MisClassification', ...
                                                    'TP Rate',  ...
                                                    'FP Rate', ...
                                                    'Specificity', ...
                                                    'Precision'});
                                             
                                              