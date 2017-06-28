function plotSensorData(totalData)
  
  totalData(:,2) = convertToDays(totalData(:,2));
  plot(totalData(:,2), totalData(:,1));


end