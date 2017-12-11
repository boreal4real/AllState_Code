function [out] = convertYearCoarse(in)
%CONVERTYEAR Summary of this function goes here
%   Detailed explanation goes here

if in < 1995
    out= 0;
elseif in < 2000
    out = 1;
elseif in < 2005
    out = 2;
else
    out = 3;
end

end

