function [] = splitRustSeverity(origFolder, excelFile, newFolder, numSamples)

lowRustFolder = [newFolder '\LowRust'];
mediumRustFolder = [newFolder '\MedRust'];
highRustFolder = [newFolder '\HighRust'];

%% Make Folders if they don't exist
if(~exist(newFolder)), mkdir(newFolder);end
if(~exist(lowRustFolder)), mkdir(lowRustFolder);end
if(~exist(mediumRustFolder)), mkdir(mediumRustFolder);end
if(~exist(highRustFolder)), mkdir(highRustFolder);end

TrainingSetMetadata = readtable(excelFile);

WHimages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverity == 1));
WHimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], WHimages, 'UniformOutput', false);

NoiseImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverity == 2));
NoiseimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], NoiseImages, 'UniformOutput', false);

rustImages = TrainingSetMetadata.ImageID(logical(TrainingSetMetadata.RustSeverity == 3));
rustimagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], rustImages, 'UniformOutput', false);

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(WHimages);
end

for k = 1:loopSize
    curWH = WHimages{k};
    curWHPath = WHimagesPath{k};
    
   try copyfile(curWHPath, lowRustFolder); catch; end
end


if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(NoiseImages);
end

parfor k = 1:loopSize
    curWH = NoiseImages{k};
    curWHPath = NoiseimagesPath{k};
    
   try copyfile(curWHPath, mediumRustFolder); catch; end
end

if nargin > 3
    loopSize = numSamples;
else
    loopSize = length(rustImages);
end

parfor k = 1:loopSize
    curWH = rustImages{k};
    curWHPath = rustimagesPath{k};
    
   try copyfile(curWHPath, highRustFolder);  catch; end 
end

end