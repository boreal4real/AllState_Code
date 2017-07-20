function [ pass ] = gradeSingleBB( truthBB, evalBB )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

truthSize = truthBB(3)*truthBB(4);
evalSize = evalBB(3)*evalBB(4);

percDiffSize = (abs(truthSize-evalSize) / truthSize ) * 100;

percOverlap = bboxOverlapRatio(truthBB, evalBB, 'ratioType', 'Min') * 100;

% if(percDiffSize < 50 && percOverlap > 20)
if(percOverlap > 20)
    pass = 1;
else
    pass = 0;
end

end

