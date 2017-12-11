function [y_one_hot] = oneHot(y)
%ONEHOT Summary of this function goes here
%   Detailed explanation goes here
y_one_hot = ind2vec(y')';
end

