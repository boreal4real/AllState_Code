input = readtable('examOneTransMF.csv');
X = input.Variables;
X(:,2) = [];
y = input.APP_SEX;

% c = cvpartition(y,'k',10);
opts = statset('display','iter', 'UseParallel', 1);

% [fs,history] = sequentialfs(@treeTraining,X,y,'cv',c,'options',opts, 'nfeatures', 5);
[fs,history] = sequentialfs(@treeTraining,X,y,'options',opts, 'nfeatures', 5);