function [criteria] = treeTraining(XT,yT,Xt,yt)
tree = fitctree(XT,yT);
predictions = tree.predict(Xt);
criteria = sum(~(yt == predictions));
end

