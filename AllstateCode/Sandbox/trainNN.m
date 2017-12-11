dt = tester;
tic
net = patternnet(10);
numRows = 100000 ;
inputdata = dt(1:numRows,2:91).Variables;
tempTar = dt(1:numRows,1).Variables + 1;
y_one_hot = full(ind2vec(tempTar')');
net = train(net,inputdata',y_one_hot');
toc