function [] = org2folders(origFolder, excelFile, newFolder, numSamples)

rustFolder = [newFolder '\Rust'];
WaterHeaterFolder = [newFolder '\WaterHeater'];
noiseFolder = [newFolder '\Noise'];

%% Make Folders if they don't exist
if(~exist(newFolder)), mkdir(newFolder);end
if(~exist(rustFolder)), mkdir(rustFolder);end
if(~exist(WaterHeaterFolder)), mkdir(WaterHeaterFolder);end
if(~exist(noiseFolder)), mkdir(noiseFolder);end

TrainingSetMetadata = readtable(excelFile);

WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.HasWaterHeater) & ~logical(TrainingSetMetadata.HasRust));
WHimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(~logical(TrainingSetMetadata.HasWaterHeater));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

rustImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.HasRust));
rustimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], rustImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(WHimages);
end

parfor k = 1:loopSize
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, WaterHeaterFolder); end
    
end

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(NoiseImages);
end

parfor k = 1:loopSize
    curWH = NoiseImages{k};
    curWHPath = NoiseimagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, noiseFolder); end
end

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(rustImages);
end

parfor k = 1:loopSize
    curWH = rustImages{k};
    curWHPath = rustimagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, rustFolder); end  
end

end