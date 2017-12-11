function [output] = UC2Int(input)
%UC2INT Summary of this function goes here
%   Detailed explanation goes here

    if(strcmp('E',input))
        output = 4;
    elseif(strcmp('P',input))
        output = 3;
    elseif(strcmp('D',input))
        output = 2;
    elseif(strcmp('Q',input))
        output = 1;
    end

end

