function [ ] = gradeClassifier( myAlex, rustDetect, inputDataPath, xlsName )
%GRADECLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

whImagesTest = imageDatastore(inputDataPath,...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

predictedLabels = classify(myAlex,whImagesTest);

predictedSeverity = classify(rustDetect,whImagesTest);



tempNames = cellfun(@(x) strsplit(x, '\'), whImagesTest.Files, 'UniformOutput', false);
tempNames2 = cellfun(@(x) strsplit(x{end}, '.'), tempNames, 'UniformOutput', false);
ImageID = cellfun(@(x) x{1}, tempNames2,  'UniformOutput', false);

WaterHeaterPresent = int8(predictedLabels == 'WaterHeater' | predictedLabels == 'Rust');
RustPresent = int8(predictedLabels == 'Rust');
% RustSeverity = int8(predictedLabels == 'Rust');

for i = 1:numel(predictedLabels)
    if(predictedLabels(i) == 'Rust')
        switch predictedSeverity(i)
            case 'HighRust'
                RustSeverity(i) = 3;
            case 'MedRust'
                RustSeverity(i) = 2;
            case 'LowRust'
                RustSeverity(i) = 1;
        end
    else
        RustSeverity(i) = 0;
    end
    
    
end
% predClass = int8(predictedLabels == 'WaterHeater');
RustSeverity = transpose(RustSeverity);
tableResults = table( ImageID,...
                 WaterHeaterPresent,...
                 RustPresent,...
                 RustSeverity);
writetable(tableResults, xlsName);

confMat = confusionmat(whImagesTest.Labels, predictedLabels);
confMat = bsxfun(@rdivide,confMat,sum(confMat,2))

end

