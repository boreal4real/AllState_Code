load('TrainingMeta.mat')

WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.WaterHeaterPresent));
WHimagesPath = cellfun(@getFilePath, WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(~logical(TrainingSetMetadata.WaterHeaterPresent));
NoiseimagesPath = cellfun(@getFilePath, NoiseImages, 'UniformOutput', false);


for k = 1:length(WHimages)
    curWHPath = WHimagesPath{k};
    imgData = imread(curWHPath);
    
    findArcs(imgData, 1);
    k = waitforbuttonpress;
end


% parfor k = 1:length(WHimages)
%     curWH = WHimages{k};
%     curWHPath = WHimagesPath{k};
%     
%    copyfile(curWHPath, 'C:\WHTrainingPhotos');
%     
%     
%     
% end


% parfor k = 1:length(NoiseImages)
%     curWH = NoiseImages{k};
%     curWHPath = NoiseimagesPath{k};
%     
%    copyfile(curWHPath, 'C:\NoiseTrainingPhotos');
%     
%     
%     
% end
