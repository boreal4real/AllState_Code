function [BMICol] = CalcBMI(inputTable)
%CALCBMI Summary of this function goes here
%   Detailed explanation goes here
BMICol = (inputTable.APP_WEIGHT * 0.453592) ./ ((inputTable.APP_HEIGHT_1 * 0.3048) + (inputTable.APP_HEIGHT_2 * 0.0254) ).^2 ;
% inputTable.BMI_Calc = BMICol;
% outputTable = inputTable;
end

