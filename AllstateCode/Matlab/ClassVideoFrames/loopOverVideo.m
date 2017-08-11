v = VideoReader('20170811_093426.mp4');
classifier = load('AlexNet3.mat');
while hasFrame(v)
    curFrame = readFrame(v);
    curFrame = imrotate(curFrame, 270);
    classify(classifier,imresize(curFrame, [227 227]));
    predict(classifier,imresize(curFrame, [227 227]));
    imshow(curFrame);
end