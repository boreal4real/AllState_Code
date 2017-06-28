function [ output_args ] = findArcs( rgb_image, plot )
%FINDARCS Summary of this function goes here
%   Detailed explanation goes here


gray_image = rgb2gray(rgb_image);


subplot(2,2,2);
[gray_norm_image bins] = histeq(gray_image);


subplot(2,2,3);
[centers, radii, metric] = imfindcircles(gray_norm_image,[10 150]);


if(plot)
    subplot(2,2,1);
    imshow(rgb_image);
    
    subplot(2,2,2);
    imshow(gray_image);
    
    subplot(2,2,3);
    imshow(gray_norm_image);
    
    subplot(2,2,4);
    imshow(rgb_image);
    viscircles(centers, radii, 'EdgeColor', 'b');
end





end

