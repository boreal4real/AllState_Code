tic
% X = dataTall(1:1000,:).Variables;
options = statset('UseParallel',true);
svmMod = templateSVM('IterationLimit', 5, 'Standardize', 1, 'GapTolerance', 0.01);
SVMModel = fitcecoc(tester(1:500000,:), 'Var1', 'Learners',svmMod, 'Coding','onevsall', 'Options', options, 'Verbose', 2);
% DTModel = fitctree(dt(1:10000,:), 'Target', 'MaxNumSplits', 15);
toc
