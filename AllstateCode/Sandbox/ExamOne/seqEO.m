load fisheriris;
X = randn(150,10);
X(:,[1 3 5 7 ])= meas;
y = species;

c = cvpartition(y,'k',10);
opts = statset('display','iter');

[fs,history] = sequentialfs(@treeTraining,X,y,'cv',c,'options',opts);