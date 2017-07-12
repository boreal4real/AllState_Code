function [ ] = gradeClassifier( classifier, inputDataPath, xlsName )
%GRADECLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

whImagesTest = imageDatastore(inputDataPath,...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

predictedLabels = classify(classifier,whImagesTest);



tempNames = cellfun(@(x) strsplit(x, '\'), whImagesTest.Files, 'UniformOutput', false);
tempNames2 = cellfun(@(x) strsplit(x{end}, '.'), tempNames, 'UniformOutput', false);
ImageID = cellfun(@(x) x{1}, tempNames2,  'UniformOutput', false);

WaterHeaterPresent = int8(whImagesTest.Labels == 'WaterHeater');
RustPresent = int8(whImagesTest.Labels == 'Rust');
RustSeverity = int8(whImagesTest.Labels == 'Rust');

tableResults = table( ImageID,...
                 WaterHeaterPresent,...
                 RustPresent,...
                 RustSeverity);
writetable(tableResults, xlsName);

confMat = confusionmat(whImagesTest.Labels, predictedLabels);
confMat = bsxfun(@rdivide,confMat,sum(confMat,2))

end

