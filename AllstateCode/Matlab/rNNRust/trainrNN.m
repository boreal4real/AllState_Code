% I = imread(imWithRoi.imageFilename{1});
% I = insertObjectAnnotation(I, 'Rectangle', imWithRoi.Unnamed{1}, 'stop sign', 'LineWidth', 8);

options = trainingOptions('sgdm', ...
    'MiniBatchSize', 128, ...
    'InitialLearnRate', 1e-3, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.1, ...
    'LearnRateDropPeriod', 100, ...
    'MaxEpochs', 20, ...
    'Verbose', true, ...
    'CheckpointPath','C:\AllState_Code\trunk\AllstateCode\Matlab\rNNRust\TrainingChecks');

% Train an R-CNN object detector. This will take several minutes.
rcnn500 = trainRCNNObjectDetector(Rust, alexnet, options, ...
'NegativeOverlapRange', [0 0.3], 'PositiveOverlapRange',[0.5 1])

testImage = imread('C:\Test4NN\Rust\0a5f2253-a0ab-4a28-af3d-c8507bcf55c1.jpg');

% Detect stop signs
[bboxes, score, label] = detect(rcnn, testImage, 'MiniBatchSize', 128)

%%
% The R-CNN object |detect| method returns the object bounding boxes, a
% detection score, and a class label for each detection. The labels are
% useful when detecting multiple objects, e.g. stop, yield, or speed limit
% signs. The scores, which range between 0 and 1, indicate the confidence
% in the detection and can be used to ignore low scoring detections.

% Display the detection results
[score, idx] = max(score);

bbox = bboxes(idx, :);
annotation = sprintf('%s: (Confidence = %f)', label(idx), score);

outputImage = insertObjectAnnotation(testImage, 'rectangle', bbox, annotation);

figure
imshow(outputImage)

allTestImages = imageDatastore('C:\Test4NN\Rust');

for k = 1:numel(allTestImages.Files)
    curFile = allTestImages.Files{k};
    testImage = imread(curFile);
    [bboxes, score, label] = detect(rcnn, testImage, 'MiniBatchSize', 128);
    
    [score, idx] = max(score);
    bbox = bboxes(idx, :);
    annotation = sprintf('%s: (Confidence = %f)', label(idx), score);
    outputImage = insertObjectAnnotation(testImage, 'rectangle', bbox, annotation);
    h = figure;
    imshow(outputImage);
    waitforbuttonpress;
    close(h);
    
end
