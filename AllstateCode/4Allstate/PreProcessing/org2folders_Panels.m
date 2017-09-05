function [] = org2folders_Panels(origFolder, excelFile, newFolder, numSamples)

ConvFolder = [newFolder '\Conventional'];
TanklessFolder = [newFolder '\Tankless'];
InducedFolder = [newFolder '\Induced'];
noiseFolder = [newFolder '\Noise'];

%% Make Folders if they don't exist
if(~exist(newFolder)), mkdir(newFolder);end
if(~exist(ConvFolder)), mkdir(ConvFolder);end
if(~exist(TanklessFolder)), mkdir(TanklessFolder);end
if(~exist(InducedFolder)), mkdir(InducedFolder);end
if(~exist(noiseFolder)), mkdir(noiseFolder);end

TrainingSetMetadata = readtable(excelFile);

IndexC = strfind(TrainingSetMetadata.HorizonPath, 'Water heater type\Conventional');
Idx = cellfun(@(x) ~isempty(x), IndexC);
ConvImages = TrainingSetMetadata.ImageID(Idx);
ConvImagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], ConvImages, 'UniformOutput', false);
if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(ConvImages);
end

parfor k = 1:loopSize
    curWH = ConvImages{k};
    curWHPath = ConvImagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, ConvFolder); end
    
end

IndexC = strfind(TrainingSetMetadata.HorizonPath, 'Water heater type\Tankless/indirect');
Idx = cellfun(@(x) ~isempty(x), IndexC);
TLImages = TrainingSetMetadata.ImageID(Idx);
TLImagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], TLImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(TLImages);
end

parfor k = 1:loopSize
    curWH = TLImages{k};
    curWHPath = TLImagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, TanklessFolder); end
    
end

IndexC = strfind(TrainingSetMetadata.HorizonPath, 'Water heater type\Induced draft');
Idx = cellfun(@(x) ~isempty(x), IndexC);
InducedImages = TrainingSetMetadata.ImageID(Idx);
InducedImagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], InducedImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(InducedImages);
end

parfor k = 1:loopSize
    curWH = InducedImages{k};
    curWHPath = InducedImagesPath{k};
    
    if(exist(curWHPath, 'file')), copyfile(curWHPath, InducedFolder); end
end

NoiseImages = TrainingSetMetadata.ImageID(~logical(TrainingSetMetadata.HasWaterHeater));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

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

end