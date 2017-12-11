function [output] = genderToBinary(input)
%GENDERTOBINARY Summary of this function goes here
%   Detailed explanation goes here
if strmatch(input, 'M')
    output = 1;
else
    output = 0;
end

end

