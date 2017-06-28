folderPath = "C:\\Users\\abouv\\Desktop\\HomeIQ\\Allstate_Test_Data\\TestSet";
filelist = readdir(folderPath);
counter = 0;
allData = [];
for ii = 1:numel(filelist)
      if(strfind(filelist{ii,1}, ".jpg") > 0)
         filePath = [folderPath '\' filelist{ii,1}];
          try
          data = getInfoFromImage(filePath);
          if (!isempty(data))
          counter = counter + 1;
          allData = [allData; data];
          end

          catch
          end
      end
end