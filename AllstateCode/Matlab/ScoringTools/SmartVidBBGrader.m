svBB = readtable('F:\CompanyResults\SmartVid\testsetb_results-regions.xlsx');

BoundingBox = [svBB.BoundingBoxP1x1, svBB.BoundingBoxP1y1, svBB.BoundingBoxP1x2 - svBB.BoundingBoxP1x1, svBB.BoundingBoxP1y2 - svBB.BoundingBoxP1y1,...
                svBB.BoundingBoxP2x1, svBB.BoundingBoxP2y1, svBB.BoundingBoxP2x2 - svBB.BoundingBoxP2x1, svBB.BoundingBoxP2y2 - svBB.BoundingBoxP2y1,...
                svBB.BoundingBoxP3x1, svBB.BoundingBoxP3y1, svBB.BoundingBoxP3x2 - svBB.BoundingBoxP3x1, svBB.BoundingBoxP3y2 - svBB.BoundingBoxP3y1];
allFileNames = svBB.ImageID;

svInput = table(allFileNames, BoundingBox);

gradeBBSetTraining(svInput);
% gradeBBSet(svInput);