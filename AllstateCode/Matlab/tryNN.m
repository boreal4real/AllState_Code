digitData = imageDatastore('C:\TrainingDataFolders','IncludeSubfolders',true,'LabelSource','foldernames');
CountLabel = digitData.countEachLabel;
trainingNumFiles = 750;
rng(1) % For reproducibility
[trainDigitData,testDigitData] = splitEachLabel(digitData, trainingNumFiles,'randomize');

layers = [imageInputLayer([480 640 1])
          convolution2dLayer(5,20)
          reluLayer
          maxPooling2dLayer(2,'Stride',2)
          fullyConnectedLayer(2)
          softmaxLayer
          classificationLayer()];
      
options = trainingOptions('sgdm','MaxEpochs',15, ...
	'InitialLearnRate',0.0001);

convnet = trainNetwork(trainDigitData,layers,options);

YTest = classify(convnet,testDigitData);
TTest = testDigitData.Labels;

accuracy = sum(YTest == TTest)/numel(TTest)