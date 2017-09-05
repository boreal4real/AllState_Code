% I = imread(imWithRoi.imageFilename{1});
% I = insertObjectAnnotation(I, 'Rectangle', imWithRoi.Unnamed{1}, 'stop sign', 'LineWidth', 8);

function model = trainrNN(trainingBoxes, photoLocation, inputModel, options)

% options = trainingOptions('sgdm', ...
%     'MiniBatchSize', 128, ...
%     'InitialLearnRate', 1e-3, ...
%     'LearnRateSchedule', 'piecewise', ...
%     'LearnRateDropFactor', 0.1, ...
%     'LearnRateDropPeriod', 100, ...
%     'MaxEpochs', 15, ...
%     'Verbose', true);

for i = 1:height(trainingBoxes)
    curStr = trainingBoxes.imageFilename{i};
    tempStr = strsplit(curStr, '\');
    newStr = {[photoLocation '\' tempStr{end}]};
    trainingBoxes.imageFilename(i) = newStr;
end


% Train an R-CNN object detector. This will take several minutes.
model = trainRCNNObjectDetector(trainingBoxes, inputModel, options, ...
'NegativeOverlapRange', [0 0.3], 'PositiveOverlapRange',[0.5 1])

    
end
