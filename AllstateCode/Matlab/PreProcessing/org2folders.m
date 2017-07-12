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

WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.WaterHeaterPresent));
WHimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(~logical(TrainingSetMetadata.WaterHeaterPresent));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

rustImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustPresent));
rustimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], rustImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    length(WHimages);
end

parfor k = 1:loopSize
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    
   copyfile(curWHPath, WaterHeaterFolder);
end


if nargin > 3
    loopSize = numSamples;
else
    length(NoiseImages);
end

parfor k = 1:loopSize
    curWH = NoiseImages{k};
    curWHPath = NoiseimagesPath{k};
    
   copyfile(curWHPath, noiseFolder); 
end

if nargin > 3
    loopSize = numSamples;
else
    length(rustImages);
end

parfor k = 1:loopSize
    curWH = rustImages{k};
    curWHPath = rustimagesPath{k};
    
   copyfile(curWHPath, rustFolder);   
end

end