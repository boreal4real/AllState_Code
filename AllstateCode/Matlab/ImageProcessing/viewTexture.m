img = imread('F:\CD_Photos_Mini\Rust\5ddd32fa-831d-44af-ad1f-04c33971c4df.jpg');

rangeImg = rangefilt(img, ones(5));
stdImg = stdfilt(img, ones(5));
entropyImg = entropyfilt(rgb2gray(img), ones(5));

figure;
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(rangeImg);
subplot(2,2,3);
imshow(uint8(stdImg));
subplot(2,2,4);
imshow(uint8((entropyImg ./ maxVal)*255));