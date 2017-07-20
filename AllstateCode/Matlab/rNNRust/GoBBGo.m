
maxNumber = 500;


startNumber = 1;
endNumber = 100;
increment = 100;

for i = 1:int8(maxNumber / increment)+1
    
    endNumber = min(endNumber,maxNumber);
    try
    findBoundingBoxes(rcnn, 'C:\rustBB', startNumber, endNumber);
    catch
    end
    endNumber = endNumber+increment;
    startNumber = startNumber+increment;

end
