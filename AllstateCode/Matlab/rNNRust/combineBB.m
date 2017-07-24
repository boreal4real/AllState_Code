allBB =[];


temp = load('BB_1.mat');
BB_1 = temp.myTable;
allBB = [allBB; BB_1];

temp = load('BB_101.mat');
BB_101 = temp.myTable;
allBB = [allBB; BB_101];

temp = load('BB_201.mat');
BB_201 = temp.myTable;
allBB = [allBB; BB_201];

temp = load('BB_301.mat');
BB_301 = temp.myTable;
allBB = [allBB; BB_301];

temp = load('BB_401.mat');
BB_401 = temp.myTable;
allBB = [allBB; BB_401];

writetable(allBB, 'Tony_BB.xlsx');

% temp = load('BB_2501.mat');
% BB_2501 = temp.myTable;
% allBB = [allBB; BB_2501];
% 
% temp = load('BB_3001.mat');
% BB_3001 = temp.myTable;
% allBB = [allBB; BB_3001];
% 
% temp = load('BB_3501.mat');
% BB_3501 = temp.myTable;
% allBB = [allBB; BB_3501];
% 
% temp = load('BB_4001.mat');
% BB_4001 = temp.myTable;
% allBB = [allBB; BB_4001];
% 
% temp = load('BB_4501.mat');
% BB_4501 = temp.myTable;
% allBB = [allBB; BB_4501];