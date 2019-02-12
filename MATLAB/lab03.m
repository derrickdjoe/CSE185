
img1 = im2double(imread('lena_noisy.jpg'));
img2 = im2double(imread('lena.jpg'));
% 
% 
%% Median filter
patch_size = [3, 3];
img_median = median_filter(img1, patch_size);
imwrite(img_median, 'median_3.jpg');
imwrite(medfilt2(img1, patch_size), 'mediantest.jpg');

patch_size = [5, 5];
img_median = median_filter(img2, patch_size);
imwrite(img_median, 'median_5.jpg');
imwrite(medfilt2(img2, patch_size), 'mediantest1.jpg');


%% Sobel filter
%H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
%img_sobel = sobel_filter(img2, H);
%imwrite(img_sobel, 'sobel_H.jpg');
%imwrite(imfilter(img2, H), 'sobelhtest.jpg');
%H = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
%img_sobel = sobel_filter(img2, H);
%imwrite(img_sobel, 'sobel_V.jpg');
%imwrite(imfilter(img2, H), 'sobelvtest.jpg');



%% Gaussian filter
% hsize = 5; sigma = 2;
% hsize = 9; sigma = 4;

