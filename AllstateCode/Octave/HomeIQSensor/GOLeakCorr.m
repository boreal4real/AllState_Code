folderPath = 'C:\Users\abouv\Desktop\Sensor Data\Leaks';
folderPathTemp = 'C:\Users\abouv\Desktop\Sensor Data\Organized';
filelist = readdir (folderPath);
allData = [];
counter = 0;
for ii = 3:numel(filelist)
         fileName = filelist{ii,1};
         filePathLeak = [folderPath '\' fileName];
         fileNameChop = strsplit(fileName, '_');
         homeName = fileNameChop{1};
         sensorChop = strsplit(fileNameChop{2}, '-');
         sensorName = sensorChop{1};
         
         if(strcmp(sensorName, "DW"))
         
           filePathTemp = [folderPathTemp '\' homeName '_DW-L Sensor.csv'];
           fidL = fopen(filePathLeak);
           fidT = fopen(filePathTemp);
           if(fidL != -1 && fidT != -1)
              try
                [leaks corrLeaks corrPerc] = findLeakCorrelation(fidL, fidT, 1);
                
                if (!isempty(leaks))
                allData = [allData; leaks corrLeaks corrPerc];
                %allVariance = [allVariance; std(data(:,1))];
                end
              catch
              end
              fclose(fidL);
              fclose(fidT);
            end 
        end
end
