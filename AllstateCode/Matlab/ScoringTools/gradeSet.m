function [] = gradeSet(companyResults, companyName, filterTest)

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
meshData.Test = logical(meshData.Test);
meshData.Training = logical(meshData.Training);

if(nargin > 2)
    if(filterTest)
       meshData = meshData(meshData.Test, :);
       IndexC = strfind(meshData.HorizonPath, 'Venting system');
       Idx = cellfun(@(x) ~isempty(x), IndexC);
       meshData = meshData(~Idx, :);

    else
       meshData = meshData(meshData.Training, :);
    end
end
overallScores = [];

overallScores = scoreDataWriteXLS(meshData, xlsxName, 'AllPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.Brightness < MEAN_LOW_THRESH,:), xlsxName, 'DarkPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.Brightness > MEAN_LOW_THRESH | meshData.Brightness < MEAN_HIGH_THRESH,:), xlsxName, 'MediumPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.Brightness > MEAN_HIGH_THRESH,:), xlsxName, 'BrightPhotos', overallScores);

overallScores = scoreDataWriteXLS(meshData(meshData.Variance < VAR_LOW_THRESH,:), xlsxName, 'LowVarPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.Variance > VAR_LOW_THRESH | meshData.Variance < VAR_HIGH_THRESH,:), xlsxName, 'MediumVarPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.Variance > VAR_HIGH_THRESH,:), xlsxName, 'HighVarPhotos', overallScores);

overallScores = scoreDataWriteXLS(meshData(meshData.TotalPixels < PIX_THRESH,:), xlsxName, 'LowResPhotos', overallScores);
overallScores = scoreDataWriteXLS(meshData(meshData.TotalPixels > PIX_THRESH,:), xlsxName, 'HighResPhotos', overallScores);

IndexC = strfind(meshData.HorizonPath, 'Water heater type\Conventional');
Idx = cellfun(@(x) ~isempty(x), IndexC);
overallScores = scoreDataWriteXLS(meshData(Idx,:), xlsxName, 'ConventionalWHPhotos', overallScores);

IndexC = strfind(meshData.HorizonPath, 'Induced draft');
Idx = cellfun(@(x) ~isempty(x), IndexC);
overallScores = scoreDataWriteXLS(meshData(Idx,:), xlsxName, 'InducedDraftWHPhotos', overallScores);

IndexC = strfind(meshData.HorizonPath, 'Tank\Rust');
Idx = cellfun(@(x) ~isempty(x), IndexC);
overallScores = scoreDataWriteXLS(meshData(Idx,:), xlsxName, 'RustOnTank', overallScores);

IndexC = strfind(meshData.HorizonPath, 'Hot/cold piping');
Idx = cellfun(@(x) ~isempty(x), IndexC);
overallScores = scoreDataWriteXLS(meshData(Idx,:), xlsxName, 'RustOnPipes', overallScores);

IndexC = strfind(meshData.HorizonPath, 'Venting system');
Idx = cellfun(@(x) ~isempty(x), IndexC);
overallScores = scoreDataWriteXLS(meshData(Idx,:), xlsxName, 'RustOnVenting', overallScores);

writetable(overallScores,xlsxName,'Sheet','Summary','WriteRowNames',true);
RemoveSheet123(xlsxName);

end
                                             
                                              