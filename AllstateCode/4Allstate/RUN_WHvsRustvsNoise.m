%% Declare Inputs, Statics, and Add Paths
% Inputs
preTrainedNet = alexnet;
metaData = [pwd '\PhotoTruthAndMeta.xlsx'];
photoLocation = 'C:\CD_Photos';
numOfPhotoLimit = 500; % Leave empty to use all images []

% Statics
trainingDataPath = [pwd '\ImageData\Training'];
testDataPath = [pwd '\ImageData\Test'];

% Paths
addpath('PreProcessing');
addpath('Training');
addpath('Evaluate');
addpath('Scoring');
%% Organize and Resize Data
if (~(exist('ImageData', 'dir') > 0))
    netInputImageSize = preTrainedNet.Layers(1).InputSize(1:2);
    organizeAllFolders(photoLocation, metaData, [pwd '\ImageData'], netInputImageSize, numOfPhotoLimit);
end
%% Train Classifier
if(~exist('WHmodel', 'var'))
    options = trainingOptions('sgdm',...
        'MiniBatchSize',200,...
        'MaxEpochs',10,...
        'InitialLearnRate',0.001,...
        'ExecutionEnvironment', 'gpu');
    WHmodel = trainNNModel(trainingDataPath, testDataPath, preTrainedNet, options);
end
%% Evaluate
netClassifications = gradeClassifier( model, testDataPath, []);
%% Scoring
netResults = gradeSet(netClassifications, [pwd '\Test'], 1, metaData);
