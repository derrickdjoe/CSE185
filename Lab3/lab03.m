
img1 = im2double(imread('lena_noisy.jpg'));
img2 = im2double(imread('lena.jpg'));
% 
% 
%% Median filter
patch_size = [3, 3];
img_median = median_filter(img2, patch_size);
imwrite(img_median, 'median_3.jpg');
imwrite(medfilt2(img2, patch_size), 'mediantest.jpg');
It = ('median_3.jpg');
figure
imshow(It);

patch_size = [5, 5];
img_median = median_filter(img2, patch_size);
imwrite(img_median, 'median_5.jpg');
It = ('median_5.jpg');
figure
imshow(It);
imwrite(medfilt2(img2, patch_size), 'mediantest1.jpg');

patch_size = [3, 3];
img_median = median_filter_pad(img2, patch_size, 1);
imwrite(img_median, 'median_pada.jpg');
It = ('median_pada.jpg');
figure
imshow(It);

patch_size = [3, 3];
img_median = median_filter_pad(img2, patch_size, 2);
imwrite(img_median, 'median_pad1b.jpg');
It = ('median_pad1b.jpg');
figure
imshow(It);

%% Sobel filter
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
img_sobel = sobel_filter(img2, H);
imwrite(img_sobel, 'sobel_h.jpg');
imwrite(imfilter(img2, H), 'sobelhtest.jpg');
It = ('sobel_h.jpg');
figure
imshow(It);

V = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
img_sobel1 = sobel_filter(img2, V);
imwrite(img_sobel1, 'sobel_v.jpg');
imwrite(imfilter(img2, V), 'sobelvtest.jpg');
It = ('sobel_v.jpg');
figure
imshow(It);


%% Gaussian filter
hsize = 5; sigma = 2;
img_g = gaussian_filter(img2, hsize, sigma);
imwrite(img_g, 'gauss1.jpg');
It = ('gauss1.jpg');
figure
imshow(It);

hsize = 9; sigma = 4;
img_g = gaussian_filter(img2, hsize, sigma);
imwrite(img_g, 'gauss2.jpg');
It = ('gauss2.jpg');
figure
imshow(It);

