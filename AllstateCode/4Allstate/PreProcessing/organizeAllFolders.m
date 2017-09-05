function [] = organizeAllFolders(origFolder, excelFile, newFolder, size, numSamples)

AllMetaData = readtable(excelFile);
TrainingMetaData = AllMetaData(logical(AllMetaData.Training), :);
TestMetaData = AllMetaData(logical(AllMetaData.Test), :);

organizeFolderAndResize(origFolder, TrainingMetaData, [newFolder '\Training'], size, numSamples);
organizeFolderAndResize(origFolder, TestMetaData, [newFolder '\Test'], size, numSamples);

end