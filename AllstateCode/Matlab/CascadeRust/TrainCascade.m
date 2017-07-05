load('rustROI.mat');   
%%
% Specify the folder for negative images.
negativeFolder = 'F:\CD_Photos\Noise';   
%%
% Train a cascade object detector called 'stopSignDetector.xml' using HOG features. The following command may take several minutes to run:
% trainCascadeObjectDetector('rustDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.2, 'TruePositiveRate',0.8,'NumCascadeStages',5, 'NegativeSamplesFactor', 10);   
trainCascadeObjectDetector('rustDetector.xml',positiveInstances,negativeFolder,'FalseAlarmRate',0.2, 'TruePositiveRate',0.8,'NumCascadeStages',20, 'NegativeSamplesFactor', 100);
%%
% Use the newly trained classifier to detect a stop sign in an image.
detector = vision.CascadeObjectDetector('rustDetector.xml');   
%%
% Read the test image.
img = imread('F:\CD_Photos\Noise\a3507623-f42b-4d24-8549-1d16d82257c6.jpg'); 
%%
% Detect a stop sign.
bbox = step(detector,img);
%%
% Insert bounding boxes and return marked image.
detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'rust');   
%%
% Display the detected stop sign.
figure;
imshow(detectedImg);
