folderPath = "C:\\Users\\abouv\\Desktop\\HomeIQ\\Carson_Dunlop";
%xlsFile = "C:\\Users\\abouv\\Desktop\\HomeIQ\\PhotoMetaData_Golden_ImageMetrics.xlsx";
xlsFileNew = "C:\\Users\\abouv\\Desktop\\HomeIQ\\PhotoMetaData_Golden_Test.xlsx";
%[numarr, txtarr, rawarr, limits] = xlsread (xlsFile, 1, 'A2:A101752');
%filelist = readdir(folderPath);

processedIDs = {};
counter = 0;
allData = [];
for ii = 1:numel(txtarr)
%for ii = 1:10
    filePath = [folderPath '\' txtarr{ii} '.jpg'];
    try
    data = getInfoFromImage(filePath);
    if (!isempty(data))
    counter = counter + 1;
    allData = [allData; data];
    processedIDs = [processedIDs; txtarr(ii)];
    end

    catch
    end
end

xlswrite(xlsFileNew, processedIDs, 1, 'A1');
xlswrite(xlsFileNew, allData(:,3:5), 1, 'B1');