function [] = splitRustSeverity(origFolder, dataTable, newFolder, size, numSamples)

lowRustFolder = [newFolder '\LowRust'];
mediumRustFolder = [newFolder '\MedRust'];
highRustFolder = [newFolder '\HighRust'];

%% Make Folders if they don't exist
if(~exist(newFolder)), mkdir(newFolder);end
if(~exist(lowRustFolder)), mkdir(lowRustFolder);end
if(~exist(mediumRustFolder)), mkdir(mediumRustFolder);end
if(~exist(highRustFolder)), mkdir(highRustFolder);end

TrainingSetMetadata = dataTable;
WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverityTruth == 1));
WHimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverityTruth == 2));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

rustImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverityTruth == 3));
rustimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], rustImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(WHimages);
end

for k = 1:loopSize
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    if(exist(curWHPath, 'file'))
        imData = imread(curWHPath);
        imDataResize = imresize(imData, size);
        imwrite(imDataResize, [lowRustFolder '\' curWH '.jpg']);
    end
end


if nargin > 3
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
        imwrite(imDataResize, [mediumRustFolder '\' curWH '.jpg']);
    end

end

if nargin > 3
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
        imwrite(imDataResize, [highRustFolder '\' curWH '.jpg']);
    end 
end

end