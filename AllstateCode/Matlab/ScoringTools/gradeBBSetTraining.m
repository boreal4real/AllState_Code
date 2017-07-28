function [ ] = gradeBBSetTraining( inputTable )
%GRADEBB Summary of this function goes here
%   Detailed explanation goes here
truthBB = load('labeledRustTraining.mat');
addpath('C:\Training4NN\Rust');
truthBB = truthBB.Rust;
goodBBs = 0;
runningOverlapMin = 0;
runningOverlapUnion = 0;
for i=1:numel(truthBB.imageFilename)
    
    findMe = truthBB.imageFilename{i};
    test = strsplit(findMe, '\');
    findMe = test{4};
    
    curID = findMe(1:end-4);
    IndexC = strfind(cellstr(inputTable.allFileNames), curID);
    Idx = cellfun(@(x) ~isempty(x), IndexC);
    idx = int16(find(Idx));
    allTruthBB = truthBB.Rust{i,:};
    [numBB nothing] = size(allTruthBB);

    tempMin = 0;
    tempUnion = 0;
    
    for t = 1:numBB
        curTruthBB = allTruthBB(t,:);
        for k = 1:1
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
    end
    
    runningOverlapMin = runningOverlapMin + tempMin;
    runningOverlapUnion = runningOverlapUnion + tempUnion;
end

(runningOverlapMin / numel(truthBB.imageFilename) )

(runningOverlapUnion / numel(truthBB.imageFilename) )

end

