function [] = org2folders_generic(origFolder, excelFile, newFolder, indicators, numSamples)

TrainingSetMetadata = readtable(excelFile);
if(~exist(newFolder)), mkdir(newFolder);end
% imageLength = length(TrainingSetMetadata.HorizonPath);

[a b] = size(indicators);

for i=1:a
    curFolder = [newFolder '\' indicators{i,1}];
    if(~exist(curFolder)), mkdir(curFolder);end
    allStrings = indicators{i,2};
    [c d] = size(allStrings);
    for k=1:d
        myStr = allStrings{k};
        IndexC = strfind(TrainingSetMetadata.HorizonPath, myStr);
        Idx = cellfun(@(x) ~isempty(x), IndexC);
        curImages = TrainingSetMetadata.ImageID(Idx);
        curImagesPath = cellfun(@(x) [origFolder '\'  x '.jpg'], curImages, 'UniformOutput', false);
        
        if nargin > 4
            loopSize = numSamples;
        else
            loopSize = length(curImagesPath);
        end

        parfor k = 1:loopSize
            curWHPath = curImagesPath{k};
            if(exist(curWHPath, 'file')), copyfile(curWHPath, curFolder); end
        end
    end
end

end