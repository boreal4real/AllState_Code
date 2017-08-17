v = VideoReader('StaveHomeTour.mp4');
w = VideoWriter('StaveHomeTour_labeled_AlexNetNoise.mp4', 'MPEG-4');
open(w);
classifier = load('AlexNetHeavyNoise.mat');
classifier = classifier.netTransfer;
counter = 0;
while hasFrame(v)
    curFrame = readFrame(v);
    counter = counter + 1;
%     if (mod(counter,5) == 0)
        curFrame = imrotate(curFrame, 90);
        [height wid depth] = size(curFrame);
        imCat = classify(classifier,imresize(curFrame, [227 227]));
        catString = cellstr(imCat);
        catString = catString{1};
        curFrame = insertText(curFrame, [wid/2, 50], catString, 'FontSize', 60, 'AnchorPoint', 'Center');
        writeVideo(w,curFrame);
%         imshow(curFrame);
%     end
end
close();
close(w);