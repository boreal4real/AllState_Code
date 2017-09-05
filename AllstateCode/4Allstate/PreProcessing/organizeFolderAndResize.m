function [] = organizeFolderAndResize(origFolder, dataTable, newFolder, size, numSamples)

rustFolder = [newFolder '\Rust'];
WaterHeaterFolder = [newFolder '\WaterHeater'];
noiseFolder = [newFolder '\Noise'];

%% Make Folders if they don't exist
if(~exist(newFolder)), mkdir(newFolder);end
if(~exist(rustFolder)), mkdir(rustFolder);end
if(~exist(WaterHeaterFolder)), mkdir(WaterHeaterFolder);end
if(~exist(noiseFolder)), mkdir(noiseFolder);end


WHimages = dataTable.ImageID(logical(dataTable.HasWaterHeaterTruth) & ~logical(dataTable.HasRustTruth));
WHimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], WHimages, 'UniformOutput', false);

NoiseImages = dataTable.ImageID(~logical(dataTable.HasWaterHeaterTruth));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

rustImages = dataTable.ImageID(logical(dataTable.HasRustTruth));
rustimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], rustImages, 'UniformOutput', false);

if nargin > 4
    loopSize = numSamples;
else
    loopSize = length(WHimages);
end

parfor k = 1:loopSize
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    
    if(exist(curWHPath, 'file'))
        imData = imread(curWHPath);
        imDataResize = imresize(imData, size);
        imwrite(imDataResize, [WaterHeaterFolder '\' curWH '.jpg']);
    end
    
end

if nargin > 4
    loopSize = numSamples;
else
    loopSize = length(NoiseImages);
end

parfor k = 1:loopSize
    curWH = NoiseImages{k};
    curWHPath = NoiseimagesPath{k};
    
    if(exist(curWHPath, 'file'))
        imData = imread(curWHPath);
        imDataResize = imresize(imData, size);
        imwrite(imDataResize, [noiseFolder '\' curWH '.jpg']);
    end
end

if nargin > 4
    loopSize = numSamples;
else
    loopSize = length(rustImages);
end

parfor k = 1:loopSize
    curWH = rustImages{k};
    curWHPath = rustimagesPath{k};
    
    if(exist(curWHPath, 'file'))
        imData = imread(curWHPath);
        imDataResize = imresize(imData, size);
        imwrite(imDataResize, [rustFolder '\' curWH '.jpg']);
    end  
end

end