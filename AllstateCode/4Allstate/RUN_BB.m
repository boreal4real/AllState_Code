%% Declare Inputs, Statics, and Add Paths
% Inputs
preTrainedNet = alexnet;
metaData = [pwd '\PhotoTruthAndMeta.xlsx'];
photoLocation = 'E:\CD_Photos';
numOfPhotoLimit = 500; % Leave empty to use all images []

% Statics
% trainingDataPath = [pwd '\ImageDataRustSeverity\Training'];
% testDataPath = [pwd '\ImageDataRustSeverity\Test'];

% Paths
addpath('PreProcessing');
addpath('Training');
addpath('Evaluate');
addpath('Scoring');
%% Organize and Resize Data
if (~exist('Rust', 'var'))
    load('allRust.mat');
end
%% Train Classifier
if(~exist('BBmodel', 'var'))
options = trainingOptions('sgdm', ...
    'MiniBatchSize', 128, ...
    'InitialLearnRate', 1e-3, ...
    'LearnRateSchedule', 'piecewise', ...
    'LearnRateDropFactor', 0.1, ...
    'LearnRateDropPeriod', 100, ...
    'MaxEpochs', 15, ...
    'Verbose', true);
    BBmodel = trainrNN(Rust, photoLocation, preTrainedNet, options);
end
%% Evaluate
outputBB = findBoundingBoxes(rcnn, photoLocation);
%% Scoring
gradeBBSet( outputBB )