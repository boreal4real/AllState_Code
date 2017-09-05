function [] = organizeAllFoldersRustSeverity(origFolder, excelFile, newFolder, size, numSamples)

AllMetaData = readtable(excelFile);
TrainingMetaData = AllMetaData(logical(AllMetaData.Training), :);
TestMetaData = AllMetaData(logical(AllMetaData.Test), :);

splitRustSeverity(origFolder, TrainingMetaData, [newFolder '\Training'], size, numSamples);
splitRustSeverity(origFolder, TestMetaData, [newFolder '\Test'], size, numSamples);

end