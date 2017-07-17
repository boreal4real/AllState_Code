function [out] = readAndResizeAlex(in)
tempData = imread(in);
out = imresize(tempData, [227, 227]);

end
