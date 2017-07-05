load('TrainingMeta.mat')

WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.WaterHeaterPresent));
WHimagesPath = cellfun(@getFilePath, WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(~logical(TrainingSetMetadata.WaterHeaterPresent));
NoiseimagesPath = cellfun(@getFilePath, NoiseImages, 'UniformOutput', false);

rustImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustPresent));
rustimagesPath = cellfun(@getFilePath, rustImages, 'UniformOutput', false);


% for k = 1:length(WHimages)
%     curWHPath = WHimagesPath{k};
%     imgData = imread(curWHPath);
%     
%     findArcs(imgData, 1);
%     k = waitforbuttonpress;
% end


% parfor k = 1:length(WHimages)
%     curWH = WHimages{k};
%     curWHPath = WHimagesPath{k};
%     
%    copyfile(curWHPath, 'F:\CD_Photos_Mini\WaterHeater');
% end
% 
% 
% parfor k = 1:length(NoiseImages)
%     curWH = NoiseImages{k};
%     curWHPath = NoiseimagesPath{k};
%     
%    copyfile(curWHPath, 'F:\CD_Photos_Mini\Noise'); 
% end
% 
% parfor k = 1:length(rustImages)
%     curWH = rustImages{k};
%     curWHPath = rustimagesPath{k};
%     
%    copyfile(curWHPath, 'F:\CD_Photos_Mini\Rust');   
% end


parfor k = 1:1000
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    
   copyfile(curWHPath, 'F:\CD_Photos_Mini\WaterHeater');
end


parfor k = 1:1000
    curWH = NoiseImages{k};
    curWHPath = NoiseimagesPath{k};
    
   copyfile(curWHPath, 'F:\CD_Photos_Mini\Noise'); 
end

parfor k = 1:500
    curWH = rustImages{k};
    curWHPath = rustimagesPath{k};
    
   copyfile(curWHPath, 'F:\CD_Photos_Mini\Rust');   
end