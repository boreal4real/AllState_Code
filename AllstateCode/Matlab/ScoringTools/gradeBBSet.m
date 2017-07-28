function [ ] = gradeBBSet( inputTable )
%GRADEBB Summary of this function goes here
%   Detailed explanation goes here
truthBB = load('truthBB.mat');
addpath('F:\TestData\Rust');
truthBB = truthBB.truthBB;
goodBBs = 0;
runningOverlapMin = 0;
runningOverlapUnion = 0;
for i=1:numel(truthBB.Filename)
    
    findMe = truthBB.Filename{i};
    curTruthBB = truthBB.BoundingBox(i,:);
    
    curID = findMe(1:end-4);
    IndexC = strfind(cellstr(inputTable.allFileNames), curID);
    Idx = cellfun(@(x) ~isempty(x), IndexC);
    idx = int16(find(Idx));
    
    
    tempMin = 0;
    tempUnion = 0;
    for k = 1:3
        startIdx = (4*k) - 3;
        endIdx = 4*k;
        curEvalBB = inputTable.BoundingBox(idx,startIdx:endIdx);
        if(sum(curEvalBB) > 0)
%             plotBB( curTruthBB, curEvalBB, findMe )
            goodBBs = goodBBs + 1;
            result = gradeSingleBB(curTruthBB, curEvalBB);
            tempMin = max(tempMin, result.Min);
            tempUnion = max(tempUnion, result.Union);
        end
    end
    
    runningOverlapMin = runningOverlapMin + tempMin;
    runningOverlapUnion = runningOverlapUnion + tempUnion;
end

(runningOverlapMin / numel(truthBB.Filename) )

(runningOverlapUnion / numel(truthBB.Filename) )

end

