clear all, clc
labels = [];
for i = 1:400
    labels = [labels, {['Variable_' int2str(i)]}];
    
end

labels = [labels, 'Target'];
tic
parfor k = 1:1000000
    for j = 1:401
        
        if j==401
            data(k,j) = round(4 + (1-4).*rand());
        elseif j < 100
            data(k,j) = 10 + (-10-10).*rand();
        elseif j < 200
            data(k,j) = 10 + (-10-10).*randn();
        else
            data(k,j) = round(rand());
        end
        
    end
        
end
toc
