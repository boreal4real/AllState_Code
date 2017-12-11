inputData = readtable('dsprod_transform.csv');
inputData.INTERESTEDPARTYTYPECD = [];
inputData.PARTYID = [];
inputData.SOURCESYSTEMCOMPANYCD = [];
inputData.POLICYID = [];


B = rowfun(@genderToBinary, inputData, 'InputVariables', 'GENDERCD');
inputData.GENDERCD = B.Var1;

idx = strcmp(inputData.UNDERWRITINGCLASSCD, 'E') | ...
    strcmp(inputData.UNDERWRITINGCLASSCD, 'P') | ...
    strcmp(inputData.UNDERWRITINGCLASSCD, 'D') | ...
    strcmp(inputData.UNDERWRITINGCLASSCD, 'Q');
filteredTable = inputData(idx, :);

C = rowfun(@UC2Int, filteredTable, 'InputVariables', 'UNDERWRITINGCLASSCD');
filteredTable.UNDERWRITINGCLASSCD = C.Var1;

% inputs = [inputs; inputs(class3,:)];
% class = [class; class(class3,:)];