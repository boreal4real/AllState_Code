classes = unique(inputData.underwritingclasscd);
counts = [];
for i = 1:length(classes)
    curClass = classes(i);
    counts(i) = sum(strcmp(curClass, inputData.underwritingclasscd));
end

classes'
counts
