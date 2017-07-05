function [] = gradeSet(companyResults, companyName)

MEAN_LOW_THRESH = 87;
MEAN_HIGH_THRESH = 124;

VAR_LOW_THRESH = 47;
VAR_HIGH_THRESH = 64;

PIX_THRESH = 200000;

xlsxName = [companyName '.xlsx'];

try
    load('truthData.mat')
catch
    truthData = readtable('..\.\PhotoTruthAndMeta.xlsx');
end

curData = readtable(companyResults);
meshData = innerjoin(curData, truthData, 'Key', 'ImageID');
meshData.HasWaterHeaterTruth = logical(meshData.HasWaterHeaterTruth);
meshData.HasRustTruth = logical(meshData.HasRustTruth);
meshData.WaterHeaterPresent = logical(meshData.WaterHeaterPresent);
meshData.RustPresent = logical(meshData.RustPresent);

scoreDataWriteXLS(meshData, xlsxName, 'AllPhotos');
scoreDataWriteXLS(meshData(meshData.Brightness < MEAN_LOW_THRESH,:), xlsxName, 'DarkPhotos');
scoreDataWriteXLS(meshData(meshData.Brightness > MEAN_LOW_THRESH | meshData.Brightness < MEAN_HIGH_THRESH,:), xlsxName, 'MediumPhotos');
scoreDataWriteXLS(meshData(meshData.Brightness > MEAN_HIGH_THRESH,:), xlsxName, 'BrightPhotos');

scoreDataWriteXLS(meshData(meshData.Variance < VAR_LOW_THRESH,:), xlsxName, 'LowVarPhotos');
scoreDataWriteXLS(meshData(meshData.Variance > VAR_LOW_THRESH | meshData.Variance < VAR_HIGH_THRESH,:), xlsxName, 'MediumVarPhotos');
scoreDataWriteXLS(meshData(meshData.Variance > VAR_HIGH_THRESH,:), xlsxName, 'HighVarPhotos');

scoreDataWriteXLS(meshData(meshData.TotalPixels < PIX_THRESH,:), xlsxName, 'LowResPhotos');
scoreDataWriteXLS(meshData(meshData.TotalPixels > PIX_THRESH,:), xlsxName, 'HighResPhotos');

RemoveSheet123(xlsxName);

end
                                             
                                              