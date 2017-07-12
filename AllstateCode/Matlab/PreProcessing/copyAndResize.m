function [ ] = copyAndResize( origDir, width, height )
%COPYANDRESIZE Summary of this function goes here
%   Detailed explanation goes here

newDir = [origDir '_resize_' num2str(width) 'x' num2str(height)];
copyfile([origDir '\*'], newDir);

rootFiles = dir(newDir);
folders = rootFiles([rootFiles(:).isdir]);
for i = 3:numel(folders)
    folder = [folders(i).folder '\' folders(i).name];
    files = dir([folder '\*.jpg']);
    parfor k=1:numel(files)
        file = files(k);
        imData = imread([file.folder '\' file.name]);
        imDataResize = imresize(imData, [width height]);
        imwrite(imDataResize, [file.folder '\' file.name]);
        % Do some stuff
    end
end


end

