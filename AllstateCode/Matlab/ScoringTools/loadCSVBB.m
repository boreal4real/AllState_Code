% test = readtable('TankBB.csv');
% Filename = [];
% BoundingBox = [];
% 
% for i=1:numel(test.x_filename)
%     if(test.region_count(i) > 0)
%         Filename = [Filename; test.x_filename(i)];
%         tempStr = test.region_shape_attributes{i};
%         allNums = regexp(tempStr,'\d*','Match');
%         curBB = [str2num(allNums{1}), str2num(allNums{2}), str2num(allNums{3}), str2num(allNums{4})];
%         BoundingBox = [BoundingBox; curBB];
%     end
% end
% 
% tankTable = table(Filename, BoundingBox);

% test = readtable('PipingBB.csv');
% Filename = [];
% BoundingBox = [];
% 
% for i=1:numel(test.x_filename)
%     if(test.region_count(i) > 0)
%         Filename = [Filename; test.x_filename(i)];
%         tempStr = test.region_shape_attributes{i};
%         allNums = regexp(tempStr,'\d*','Match');
%         curBB = [str2num(allNums{1}), str2num(allNums{2}), str2num(allNums{3}), str2num(allNums{4})];
%         BoundingBox = [BoundingBox; curBB];
%     end
% end
% 
% pipingTable = table(Filename, BoundingBox);

test = readtable('ventingBB.csv');
Filename = [];
BoundingBox = [];

for i=1:numel(test.x_filename)
    if(test.region_count(i) > 0)
        Filename = [Filename; test.x_filename(i)];
        tempStr = test.region_shape_attributes{i};
        allNums = regexp(tempStr,'\d*','Match');
        curBB = [str2num(allNums{1}), str2num(allNums{2}), str2num(allNums{3}), str2num(allNums{4})];
        BoundingBox = [BoundingBox; curBB];
    end
end

ventingTable = table(Filename, BoundingBox);