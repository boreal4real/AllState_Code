function [outputTable] = transformExamOneUC(inputTable, LUT)

reducedTable = inputTable(:,logical(cell2mat(LUT(:,2))));

reducedTable.APP_SEX = grp2idx(categorical(reducedTable.APP_SEX));
reducedTable.UCOT = grp2idx(categorical(reducedTable.UCOT));
reducedTable.UCOC = grp2idx(categorical(reducedTable.UCOC));

Height = rowfun(@transformHeight, reducedTable, 'InputVariables', {'APP_HEIGHT_1', 'APP_HEIGHT_2'});
reducedTable.Height = Height.Var1;
reducedTable.APP_HEIGHT_1 =[];
reducedTable.APP_HEIGHT_2 =[];

% UWClass = rowfun(@UC2Int2, reducedTable, 'InputVariables', 'underwritingclasscd');
UWClass = rowfun(@UC2Int3, reducedTable, 'InputVariables', 'underwritingclasscd');
reducedTable.UWClass = UWClass.Var1;
reducedTable.underwritingclasscd =[];

Pulse = rowfun(@transformPulse, reducedTable, 'InputVariables', {'PULSE_RATE_1', 'PULSE_RATE_2', 'PULSE_RATE_3'});
reducedTable.Pulse = Pulse.Var1;
reducedTable.PULSE_RATE_1 = [];
reducedTable.PULSE_RATE_2 = [];
reducedTable.PULSE_RATE_3 = [];

outputTable = rmmissing(reducedTable);
outputTable(outputTable.UWClass == 0,:) = [];

end


function heightMeters = transformHeight(feet, inches)

heightMeters = feet*0.3048 + inches*0.0254;

end

function pulse = transformPulse(p1, p2, p3)
allVals = [];

if p1 > 0
    allVals = [allVals;p1];
end

if p2 > 0
    allVals = [allVals;p2];
end

if p3 > 0
    allVals = [allVals;p3];
end

pulse = median(allVals);

end