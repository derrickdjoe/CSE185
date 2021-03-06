%1
I = imread('01.jpg');
I(:, :, 1) = 0;
imwrite(I, 'red.jpg');
%2
I = imread('02.jpg');
Y = I(: ,: ,1) * 0.299 + I(: ,: ,2) * 0.587 + I(: ,: ,3) * 0.114;
imwrite(Y, 'gray.jpg');
%3
I = imread('03.jpg');
I = imrotate(I, 90);
imwrite(I, 'rotate.jpg');
%4
I = imread('04.jpg');
I2 = I(30:270 - 1, 30:370 - 1, :);
imwrite(I2, 'crop.jpg');
%5
I = imread('04.jpg');
I = flip(I);
imwrite(I, 'flip.jpg');
%6
I1 = imread('01.jpg');
I2 = imread('02.jpg');
I3 = imread('03.jpg');
I4 = imread('04.jpg');
canvas = zeros(300 * 2 + 15, 400 * 2 + 15, 3, 'uint8');
canvas(1:300, 1:400, : ) = I1;
canvas(1:300, 416:815, : ) = I2;
canvas(316:615, 1:400, : ) = I3;
canvas(316:615, 416:815, : ) = I4;
imwrite(canvas, 'combine.jpg');
%7
I1 = imread('04.jpg');
I2 = imread('flip.jpg');
I4 = reshape(I1, 300, 400, 3);
I5 = reshape(I2, 300, 400, 3);
I3 = I4+ I5;
imwrite(I3, 'average.jpg');

