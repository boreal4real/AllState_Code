function [ ] = loopOverBB( inputTable )
%LOOPOVERBB Summary of this function goes here
%   Detailed explanation goes here
for k = 32:32
% for k = 3000:3100
    curFile = inputTable.allFileNames(k,:);
    testImage = imread(curFile);
%     [bboxes, score, label] = detect(rcnn, testImage, 'MiniBatchSize', 128);
%     
%     [score, idx] = max(score);
%     bbox = bboxes(idx, :);
%     if(strmatch('0e8e4089-e61a-4ca1-a947-9a5c8441751a.jpg',curFile))
        bbox = inputTable.BoundingBox(k,:);
        score = inputTable.Confidence(k);
        annotation = sprintf('%s: (Confidence = %f)', 'Rust', score);
        outputImage = insertObjectAnnotation(testImage, 'rectangle', bbox, annotation);
        h = figure;
        imshow(outputImage);
        waitforbuttonpress;
        close(h);
%     end
    
end

end

