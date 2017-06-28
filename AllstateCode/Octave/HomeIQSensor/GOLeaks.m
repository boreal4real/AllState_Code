folderPath = 'C:\Users\abouv\Desktop\Sensor Data\Leaks';
filelist = readdir (folderPath);
allLeakDur = [];
counter = 0;
for ii = 1:numel(filelist)
         filePath = [folderPath '\' filelist{ii,1}];
         fid = fopen(filePath);
         if(fid != -1)
            try
              data = loadLeaks(fid);
              plotLeakEvents(data,filelist{ii,1});
              
              if (!isempty(data))
              allLeakDur = [allLeakDur; data(:,3)];
              %allVariance = [allVariance; std(data(:,1))];
              end
            catch
            end
            fclose(fid);
          end 
end

allLeakDurHours = allLeakDur / 3600;
figure;
hist(allLeakDurHours, [0:0.5:48])
xlabel('Leak Duration in Hours');
ylabel('# of Leaks');