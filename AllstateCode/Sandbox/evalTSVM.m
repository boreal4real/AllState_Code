function label = evalTSVM(feat1,feat2)
%EVALTSVM Summary of this function goes here
%   Detailed explanation goes here
model = loadCompactModel('TonysSVM');
label = predict(model, [feat1 feat2]);
end

