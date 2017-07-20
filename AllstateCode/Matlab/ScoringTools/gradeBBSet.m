function [ ] = gradeBBSet( inputTable )
%GRADEBB Summary of this function goes here
%   Detailed explanation goes here
truthBB = load('truthBB.mat');
addpath('C:\Test4NN\Rust');
truthBB = truthBB.tankTable;
goodBBs = 0;
for i=1:numel(truthBB.Filename)
    
    findMe = truthBB.Filename{i};
    curTruthBB = truthBB.BoundingBox(i,:);
    
    curID = findMe(1:end-4);
    IndexC = strfind(cellstr(inputTable.allFileNames), curID);
    Idx = cellfun(@(x) ~isempty(x), IndexC);
    idx = int16(find(Idx));
    
    curEvalBB = inputTable.BoundingBox(idx,:);
%     curEvalBB = [inputTable.BoundingBoxP1x1(idx) inputTable.BoundingBoxP1x1 inputTable.BoundingBoxP1x2 inputTable.BoundingBoxP1y2];
    
    if(sum(curEvalBB) > 0)
        plotBB( curTruthBB, curEvalBB, findMe )
        if(gradeSingleBB(curTruthBB, curEvalBB)) goodBBs = goodBBs + 1; end
    end
end

(goodBBs / numel(truthBB.Filename) ) * 100

end

