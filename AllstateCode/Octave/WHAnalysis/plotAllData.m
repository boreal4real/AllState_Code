
figure;
hist(allData(:,1),100);
xlabel("Image Width in Pixels", "fontsize", 12);

figure;
hist(allData(:,2),100);
xlabel("Image Height in Pixels", "fontsize", 12);

figure;
hist(allData(:,3),100);
xlabel("Total Pixels", "fontsize", 12);

figure;
hist(allData(:,4),100);
xlabel("Mean Grayscale Value (Brightness)", "fontsize", 12);

figure;
hist(allData(:,5),100);
xlabel("Standard Deviation", "fontsize", 12);

figure;
hist(allData(:,6),100);
xlabel("Entropy", "fontsize", 12);

figure;
hist(allData(:,7),100);
xlabel("Compression %", "fontsize", 12);
