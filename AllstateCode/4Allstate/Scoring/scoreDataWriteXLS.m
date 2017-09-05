function [overallResults] = scoreDataWriteXLS(inputTable, xlsName, sheetName, runTable)


% scoreTable1 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, ':', 'AllData');
% scoreTable2 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, inputTable.HasWaterHeaterTruth, 'WHData');
% scoreTable3 = getScoreWithIdx(~inputTable.WaterHeaterPresent, ~inputTable.HasWaterHeaterTruth, ~inputTable.HasWaterHeaterTruth, 'NoiseData');
% scoreTable4 = getScoreWithIdx(inputTable.RustPresent, inputTable.HasRustTruth, inputTable.HasRustTruth, 'RustData');
% scoreTable5 = getScoreWithIdx(inputTable.RustSeverity, inputTable.RustSeverityTruth, inputTable.RustSeverityTruth > 0, 'RustSeverityData');
% scoreTable = [scoreTable1;scoreTable2;scoreTable3;scoreTable4;scoreTable5];

scoreTable1 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, ':', 'WHvsNoise');
% scoreTable2 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, inputTable.HasWaterHeaterTruth, 'WHData');
% scoreTable3 = getScoreWithIdx(~inputTable.WaterHeaterPresent, ~inputTable.HasWaterHeaterTruth, ~inputTable.HasWaterHeaterTruth, 'NoiseData');
scoreTable2 = getScoreWithIdx(inputTable.RustPresent, inputTable.HasRustTruth, inputTable.HasWaterHeaterTruth, 'WHvsRust');
scoreTable3 = getScoreWithIdx(inputTable.RustSeverity, inputTable.RustSeverityTruth, inputTable.RustSeverityTruth > 0, 'RustSeverity');

scoreTable = [scoreTable1;scoreTable2;scoreTable3];

writetable(scoreTable,xlsName,'Sheet',sheetName,'WriteRowNames',true);

Accuracy = scoreTable1.Accuracy;
Precision = scoreTable1.Precision;
Sensitivity = scoreTable1.Sensitivity;
Specificity = scoreTable1.Specificity;


tempResults = table( Accuracy,...
                 Precision,...
                 Sensitivity,...
                 Specificity,...
                 'RowNames', {sheetName});

overallResults = [runTable; tempResults];


end