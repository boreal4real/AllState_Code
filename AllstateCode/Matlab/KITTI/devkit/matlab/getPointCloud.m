function [ outPC ] = getPointCloud( base_dir,calib_dir, frame )
% KITTI RAW DATA DEVELOPMENT KIT
% 
% Demonstrates projection of the velodyne points into the image plane
%
% Input arguments:
% base_dir .... absolute path to sequence base directory (ends with _sync)
% calib_dir ... absolute path to directory that contains calibration files

% clear and close everything
close all; dbstop error; clc;
disp('======= KITTI DevKit Demo =======');

% load velodyne points
fid = fopen(sprintf('%s/velodyne_points/data/%010d.bin',base_dir,frame),'rb');
velo = fread(fid,[4 inf],'single')';
colors = zeros(length(velo),3, 'uint8');
% velo = velo(1:5:end,:); % remove every 5th point for display speed
fclose(fid);
% options (modify this to select your sequence)
cams       = [2 3]; % 0-based index

for i = 1:length(cams)
    cam = cams(i);
    % load calibration
    calib = loadCalibrationCamToCam(fullfile(calib_dir,'calib_cam_to_cam.txt'));
    Tr_velo_to_cam = loadCalibrationRigid(fullfile(calib_dir,'calib_velo_to_cam.txt'));

    % compute projection matrix velodyne->image plane
    R_cam_to_rect = eye(4);
    R_cam_to_rect(1:3,1:3) = calib.R_rect{1};
    P_velo_to_img = calib.P_rect{cam+1}*R_cam_to_rect*Tr_velo_to_cam;

    % load and display image
    img = imread(sprintf('%s/image_%02d/data/%010d.png',base_dir,cam,frame));
    % fig = figure('Position',[20 100 size(img,2) size(img,1)]); axes('Position',[0 0 1 1]);
    % imshow(img); hold on;



    % remove all points behind image plane (approximation
    idx = velo(:,1)<5;
    velo(idx,:) = [];

    % project to image plane (exclude luminance)
    velo_img = project(velo(:,1:3),P_velo_to_img);

    % plot points
%     cols = jet;
%     for k=1:size(velo_img,1)
%       col_idx = round(64*5/velo(k,1));
%       plot(velo_img(k,1),velo_img(k,2),'o','LineWidth',4,'MarkerSize',1,'Color',cols(col_idx,:));
%     end

    
    for k=1:length(velo_img)
        valX = int32(round(velo_img(k,1)));
        valY = int32(round(velo_img(k,2)));
        if(valY > 0 && valY <= 376 && valX > 0 && valX <= 1241)
            colors(k,:) = img(valY, valX,:);
        end
    end
end
haveColor = sum(colors,2)>0;

outPC = pointCloud(velo(haveColor,1:3), 'Color', colors(haveColor,:) );

end

