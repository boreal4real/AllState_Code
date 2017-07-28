tonyBB = readtable('F:\CompanyResults\Bouril\Tony_BB.xlsx');

BoundingBox = [tonyBB.BoundingBox_1, tonyBB.BoundingBox_2, tonyBB.BoundingBox_3, tonyBB.BoundingBox_4];
allFileNames = tonyBB.allFileNames;

tonyInput = table(allFileNames, BoundingBox);

gradeBBSetTraining(tonyInput);
% gradeBBSet(tonyInput);