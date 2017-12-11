function [out] = reg2cat(in)
%REG2CAT Summary of this function goes here
%   Detailed explanation goes here
if (in < 1.5)
    out =1;
elseif (in > 1.5 && in < 2.5)
    out = 2;
elseif (in > 2.5 && in < 3.5)
    out = 3;
elseif (in > 3.5)
    out = 4;
end
    
end

