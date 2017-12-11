loadEO2
Alltree = fitctree(outputTable, 'UWClass', 'MinParentSize', 2000, 'MaxNumSplits', 10,'CrossVal','on');
% tree = fitctree(outputTable, 'UWClass', 'OptimizeHyperparameters','auto')
for j=1:length(Alltree.Trained)
    tree = Alltree.Trained{j};
    predictions = tree.predict(outputTable);
    criteria = sum(~(outputTable.UWClass == predictions));
    view(tree, 'mode', 'graph')
    total = height(outputTable);
    (total - criteria) / total
end

