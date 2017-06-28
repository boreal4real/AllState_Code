%pkg load image;
%pkg load io;
%
%excelFile = "C:\\Users\\abouv\\Desktop\\HomeIQ\\PhotoInfoLabeled_RustID_CleanWH_Others2.xlsx";
%folderPath = "C:\\Users\\abouv\\Desktop\\HomeIQ\\Carson_Dunlop";
saveFolder = "C:\\Users\\abouv\\Desktop\\HomeIQ\\TrainingSet_Labels";
%allData = [];
%counter = 0;
%
%[num,txt,raw] = xlsread(excelFile);
%
%imageIDs = raw(2:end, 1);
%selectedIdx = logical(num(:,7));
%filteredImageIds = imageIDs(selectedIdx);
%
%hasWH = num(selectedIdx,4);
%hasRust = num(selectedIdx,5);
%rustSeverity = num(selectedIdx,6);

allFilePaths = {};

for i =1:length(filteredImageIds)

  filePath = [folderPath '\' filteredImageIds{i} '.jpg'];
  allFilePaths = [allFilePaths; filePath];
  saveName = createImageName(i, hasWH(i), hasRust(i), rustSeverity(i), 1);
  savePath = [saveFolder '\' saveName];
%  savePath = [saveFolder '\' filteredImageIds{i} '.jpg'];
  try
  copyfile(filePath, savePath);
  counter = counter + 1;
%  data = getInfoFromImage(filePath);
%  if (!isempty(data))
%  counter = counter + 1;
%%  allData = [allData; data];
%  end

  catch
  end

end

%save ('testData_ImageMetrics');



