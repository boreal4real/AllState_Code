function [out] = readAndResizeVGG(in)
tempData = imread(in);
out = imresize(tempData, [224, 224]);

end
