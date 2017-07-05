function [] = scoreDataWriteXLS(inputTable, xlsName, sheetName)


scoreTable1 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, ':', 'AllData');
scoreTable2 = getScoreWithIdx(inputTable.WaterHeaterPresent, inputTable.HasWaterHeaterTruth, inputTable.HasWaterHeaterTruth, 'WHData');
scoreTable3 = getScoreWithIdx(~inputTable.WaterHeaterPresent, ~inputTable.HasWaterHeaterTruth, ~inputTable.HasWaterHeaterTruth, 'NoiseData');
scoreTable4 = getScoreWithIdx(inputTable.RustPresent, inputTable.HasRustTruth, inputTable.HasRustTruth, 'RustData');
scoreTable5 = getScoreWithIdx(inputTable.RustSeverity, inputTable.RustSeverityTruth, inputTable.RustSeverityTruth > 0, 'RustSeverityData');

scoreTable = [scoreTable1;scoreTable2;scoreTable3;scoreTable4;scoreTable5];

writetable(scoreTable,xlsName,'Sheet',sheetName,'WriteRowNames',true);

end