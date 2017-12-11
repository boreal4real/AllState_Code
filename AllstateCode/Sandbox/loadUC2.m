inputData = readtable('dsprod_transform3.csv');
inputData.policyid = [];


B = rowfun(@genderToBinary, inputData, 'InputVariables', 'gendercd');
inputData.gendercd = B.Var1;

idx = strcmp(inputData.underwritingclasscd, 'E') | ...
    strcmp(inputData.underwritingclasscd, 'R') | ...
    strcmp(inputData.underwritingclasscd, '8') | ...
    strcmp(inputData.underwritingclasscd, 'D') | ...
    strcmp(inputData.underwritingclasscd, '9');
filteredTable = inputData(idx, :);

C = rowfun(@UC2Int2, filteredTable, 'InputVariables', 'underwritingclasscd');
filteredTable.underwritingclasscd = C.Var1;

% inputs = [inputs; inputs(class3,:)];
% class = [class; class(class3,:)];