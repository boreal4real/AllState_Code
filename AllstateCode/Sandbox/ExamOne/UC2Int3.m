function [output] = UC2Int3(input)
%UC2INT Summary of this function goes here
%   Detailed explanation goes here

    if(strcmp('E',input))
        output = 4;
    elseif(strcmp('R',input) || strcmp('8',input))
        output = 3;
    elseif(strcmp('D',input))
        output = 2;
    elseif(strcmp('9',input))
        output = 1;
    else
        output = 0;
    end

end

