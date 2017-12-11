EO = readtable('party_exam_join_v00.csv');
load('LUT2.mat');
allFEO = EO(strcmp(EO.KIT_TYPE, 'F') &...
    EO.APP_HEIGHT_1 > 0 & ...
    EO.APP_WEIGHT > 0,:);

[outputTable] = transformExamOneUC(EO, LUT2);

