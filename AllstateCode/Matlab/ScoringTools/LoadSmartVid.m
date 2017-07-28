whData = readtable('F:\CompanyResults\SkyMind\AllstateWaterHeaterClassifierResults.xlsx', 'Sheet', 'TestSetB');
rustData = readtable('F:\CompanyResults\SkyMind\AllstateRustClassifierResults.xlsx', 'Sheet', 'TestSetB');
severityData = readtable('F:\CompanyResults\SkyMind\AllstateRustSeverityResults.xlsx',  'Sheet', 'TestSetB');

meshData = innerjoin(whData, rustData, 'Key', 'ImageID');
meshData = innerjoin(meshData, severityData, 'Key', 'ImageID');
WaterHeaterPresent = [];
RustPresent = [];
RustSeverity = [];
ImageID = {};
for i = 1:numel(meshData.ImageID)
    WaterHeaterPresent = [WaterHeaterPresent;int8(meshData.WaterHeater(i) > meshData.NoWaterHeater(i))];
    RustPresent = [RustPresent; int8(meshData.Rust(i) > meshData.NoRust(i))];
    
    switch max(max(meshData.Low(i), meshData.Medium(i)), meshData.High(i))
        
        case meshData.Low(i)
            RustSeverity = [RustSeverity; 1];
        case meshData.Medium(i)
            RustSeverity = [RustSeverity; 2];
        case meshData.High(i)
            RustSeverity = [RustSeverity; 3];
    end
    
    temp = strsplit(meshData.ImageID{i}, '.');
    ImageID = [ImageID; temp(1)];
end

myTable = table(ImageID, WaterHeaterPresent, RustPresent, RustSeverity);

writetable(myTable, 'SkyMind_B.xlsx');