function model = trainNNModel(trainingPath, testPath, inputModel, options)
whImagesTrain = imageDatastore(trainingPath,...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

whImagesTest = imageDatastore(testPath,...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

%%
% Load a pretrained AlexNet network.
net = inputModel;

layersTransfer = net.Layers(1:end-3);

%%
% Determine the number of classes from the training data.
numClasses = numel(categories(whImagesTrain.Labels))

%%
% Create the layer array by combining the transferred layers with the new
% layers.
layers = [...
    layersTransfer
    fullyConnectedLayer(numClasses,'WeightLearnRateFactor',20,'BiasLearnRateFactor',20)
    softmaxLayer
    classificationLayer];

%%
% Fine-tune the network using |trainNetwork| on the new layer array.
netTransfer = trainNetwork(whImagesTrain,layers,options);

%%
% Classify the test images using |classify|.
predictedLabels = classify(netTransfer,whImagesTest);

%%
% Calculate the classification accuracy.
testLabels = whImagesTest.Labels;

accuracy = sum(predictedLabels==testLabels)/numel(predictedLabels)

model = netTransfer;

end