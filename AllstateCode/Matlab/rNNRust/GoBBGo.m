
maxNumber = 4550;


startNumber = 1;
endNumber = 500;
increment = 500;

for i = 1:int8(maxNumber / increment)+1
    
    endNumber = min(endNumber,maxNumber);
    findBoundingBoxes(rcnn, 'C:\TestRust', startNumber, endNumber);
    endNumber = endNumber+increment;
    startNumber = startNumber+increment;

end
