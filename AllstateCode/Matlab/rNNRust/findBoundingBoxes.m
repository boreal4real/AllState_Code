function [] = findBoundingBoxes(rcnn, imagePath, start, stop)

allTestImages = imageDatastore(imagePath);

num = stop - start +1;
if nargin > 2
    NUMIMAGES = num;
else
    NUMIMAGES = numel(allTestImages.Files);
end


imageNames = allTestImages.Files;
BoundingBox = zeros(NUMIMAGES,4);
Confidence = zeros(NUMIMAGES,1);
allFileNames = [];
i = 0;
stop = min(stop, numel(imageNames));
for k = start:stop
    i = i +1;
    curFile = imageNames{k};
    allFileNames = [allFileNames; curFile];
    testImage = imread(curFile);
    try
    [bboxes, score, label] = detect(rcnn, testImage, 'MiniBatchSize', 128, 'SelectStrongest', true);
    [score, idx] = max(score);
    bbox = bboxes(idx, :);
    if(~isempty(bbox))
        BoundingBox(i,:) = bbox;
        Confidence(i) = score;
        
    end
    catch
    end
end

myTable = table(allFileNames, BoundingBox, Confidence);

save(['BB_' num2str(start) '.mat'], 'myTable');

end

