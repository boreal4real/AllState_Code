galBB = readtable('F:\CompanyResults\Galich\galich_boundingbox_testsetb.xlsx');

BoundingBox = [galBB.BoundingBoxP1x, galBB.BoundingBoxP1y, galBB.BoundingBoxP3x - galBB.BoundingBoxP1x, galBB.BoundingBoxP2y - galBB.BoundingBoxP1y];
allFileNames = galBB.ImageID;

galInput = table(allFileNames, BoundingBox);

gradeBBSetTraining(galInput);
% gradeBBSet(galInput);