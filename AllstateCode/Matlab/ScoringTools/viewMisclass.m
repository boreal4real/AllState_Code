function [] = viewMisclass(companyResults, filterTest)

xferFolder = 'F:\MechTurk\';
turkLoc = 'https://s3.amazonaws.com/tony-imageturk/';
% xlsxName = [companyName '.xlsx'];

try
    load('truthData.mat')
catch
    truthData = readtable('..\.\PhotoTruthAndMeta.xlsx');
end

curData = readtable(companyResults);
meshData = innerjoin(curData, truthData, 'Key', 'ImageID');
[test ia ib] = unique(meshData.ImageID);
meshData = meshData(ia,:);
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

% Idx = (meshData.HasWaterHeaterTruth & ~meshData.WaterHeaterPresent) | (~meshData.HasWaterHeaterTruth & meshData.WaterHeaterPresent) | (meshData.HasRustTruth & ~meshData.RustPresent) | (~meshData.HasRustTruth & meshData.RustPresent);
Idx = (meshData.HasWaterHeaterTruth ~= meshData.WaterHeaterPresent) | (meshData.HasRustTruth ~= meshData.RustPresent);
missedWH = meshData(Idx, :);
fullImageIDUrl =[];

for i=1:numel(missedWH.ImageID)
%     samp = imread(['F:\TestPhotos\' missedWH.ImageID{i}  '.jpg']);
%     copyfile(['F:\TestPhotos\' missedWH.ImageID{i}  '.jpg'], [xferFolder missedWH.ImageID{i}  '.jpg']);
%     h = figure('units','normalized','outerposition',[0 0 1 1]);
%     imshow(samp);
%     set(h, 'units','normalized','outerposition',[0 0 1 1]);
%     title(missedWH.ImageID{i});
%     waitforbuttonpress;
%     close(h);
    curPath = {[turkLoc missedWH.ImageID{i}  '.jpg']};
    fullImageIDUrl = [fullImageIDUrl; curPath];
end

fid = fopen('TurkIDs.csv', 'w');
fprintf(fid, '%s\n', fullImageIDUrl{1:end}) ; 
fclose(fid);

end
                                             
                                              