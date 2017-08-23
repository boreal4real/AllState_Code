function [ outTable ] = loadTurk( fileName )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
inputTable = readtable(fileName);
turkLabels = inputTable.Answer;
WaterHeaterPresent = cellfun(@(x) strcmp(x, 'Water Heater'), turkLabels);
RustPresent = cellfun(@(x) strcmp(x, 'Water Heater with Rust'), turkLabels);
WaterHeaterPresent = WaterHeaterPresent | RustPresent;
imageID = cellfun(@getID, inputTable.image_url, 'UniformOutput', false);

outTable = table(imageID, WaterHeaterPresent, RustPresent);

end

function out = getID(in)

temp = strsplit(in, '/');
temp = strsplit(temp{end}, '.');
out = temp{1};

end



