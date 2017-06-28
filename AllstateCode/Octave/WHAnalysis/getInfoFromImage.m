function data = getInfoFromImage(curImage)

imgData = imread(curImage);
imgAtt = imfinfo(curImage);
grayImgData = rgb2gray(imgData);
imgMean = mean2(grayImgData);
imgSTD = std2(grayImgData);
imgEntropy = entropy(imgData);
imgWidth = imgAtt.Width;
imgHeight = imgAtt.Height;
imgPixels = imgAtt.Width * imgAtt.Height;

totalRawBytes = imgPixels*3;
totalActualBytes = imgAtt.FileSize;

compression = 100 - ((totalActualBytes / totalRawBytes) * 100);

data = [imgWidth, imgHeight, imgPixels, imgMean, imgSTD, imgEntropy, compression];


end