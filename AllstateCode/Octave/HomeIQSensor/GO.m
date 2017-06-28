folderPath = 'C:\Users\abouv\Desktop\Sensor Data\Organized';
sensorName = 'DW-D';
filelist = readdir (folderPath);
allMedian = [];
allVariance = [];
counter = 0;
for ii = 1:numel(filelist)
      if(strfind(filelist{ii,1}, sensorName) > 0)
         filePath = [folderPath '\' filelist{ii,1}];
          try
          data = loadAndPlotCSV(filePath);
          if (!isempty(data))
          counter = counter + 1;
          allMedian = [allMedian; median(data(:,1))];
          allVariance = [allVariance; std(data(:,1))];
          plotSensorData(data);
          end

          catch
          end
      end
end
