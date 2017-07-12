function [dataTrain,dataTest] = whData()

data = imageDatastore('C:\CD_Photos_Mini_Resize',...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

[dataTrain,dataTest] = splitEachLabel(data,0.8);

dataTrain = shuffle(dataTrain);

end