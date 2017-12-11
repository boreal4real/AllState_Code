function [output] = percPop(inTable)
output = [];
[nrows, ncols] = size(inTable);

for k = 1:ncols
   curData = inTable(:,k);
   
   if (isnumeric(table2array(curData)))
       perc = (sum(ismissing(curData) | table2array(curData) == 0) / nrows) * 100;
   else
       perc = (sum(ismissing(curData)) / nrows) * 100;
   end
   
   if iscellstr(table2array(curData))
       output = [output; inTable.Properties.VariableNames(k), perc, {unique(curData)}];
   else
       output = [output; inTable.Properties.VariableNames(k), perc, {'none'}];
   end
end

end

