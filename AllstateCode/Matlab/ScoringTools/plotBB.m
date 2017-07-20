function [  ] = plotBB( BBT, BBE, imagePath )
%PLOTBB Summary of this function goes here
%   Detailed explanation goes here
    testImage = imread(imagePath);
    annotation1 = sprintf('%s', 'Truth');
    outputImage = insertObjectAnnotation(testImage, 'rectangle', BBT, annotation1);
    annotation2 = sprintf('%s', 'Eval');
    outputImage = insertObjectAnnotation(outputImage, 'rectangle', BBE, annotation2);
    h = figure('units','normalized','outerposition',[0 0 1 1]);
    imshow(outputImage);
    set(h, 'units','normalized','outerposition',[0 0 1 1]);
    waitforbuttonpress;
    close(h);

end

