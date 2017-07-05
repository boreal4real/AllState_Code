function [Pdec, FAR] = gradeCascade(detector)

rustData = imageDatastore('F:\CD_Photos\Rust');
noiseData = imageDatastore('F:\CD_Photos\Noise');


% totalRust = length(rustData.Files);
% totalNoise = length(noiseData.Files);

totalRust = 200;
totalNoise = 200;

rustResults = zeros(totalRust,1);
noiseResults = zeros(totalNoise,1);

parfor k=1:totalRust
    
    imData = imread(rustData.Files{k});
    bbox = step(detector,imData);
    
    rustResults(k) = ~isempty(bbox);
end

parfor k=1:totalNoise
    
    imData = imread(noiseData.Files{k});
    bbox = step(detector,imData);
    
    noiseResults(k) = ~isempty(bbox);
end

Pdec = sum(rustResults) / totalRust;
FAR = sum(noiseResults) / totalNoise;