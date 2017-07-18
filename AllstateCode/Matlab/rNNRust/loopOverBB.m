function [ ] = loopOverBB( inputTable )
%LOOPOVERBB Summary of this function goes here
%   Detailed explanation goes here
for k = 1:numel(inputTable.imageNames)
    curFile = inputTable.imageNames{k};
    testImage = imread(curFile);
%     [bboxes, score, label] = detect(rcnn, testImage, 'MiniBatchSize', 128);
%     
%     [score, idx] = max(score);
%     bbox = bboxes(idx, :);
    bbox = inputTable.BoundingBox(k,:);
    score = inputTable.Confidence(k);
    annotation = sprintf('%s: (Confidence = %f)', 'Rust', score);
    outputImage = insertObjectAnnotation(testImage, 'rectangle', bbox, annotation);
    h = figure;
    imshow(outputImage);
    waitforbuttonpress;
    close(h);
    
end

end

