img = im2double(imread('cameraman.jpg'));
ratio = 0.1;

[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'cameraman_low_01.jpg');
imwrite(high_pass_img + 0.5, 'cameraman_high_01.jpg');

ratio = 0.2;

[low_pass_img, high_pass_img] = separate_frequency(img, ratio);
figure, imshow(low_pass_img);
figure, imshow(high_pass_img + 0.5);
imwrite(low_pass_img, 'cameraman_low_02.jpg');
imwrite(high_pass_img + 0.5, 'cameraman_high_02.jpg');

name1 = 'cat.jpg';
name2 = 'dog.jpg';

img1 = im2double(imread(name1));
img2 = im2double(imread(name2));

ratio = 0.025;
img_merged = hybrid_image(img1, img2, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_1.jpg');

ratio = 0.025;
img_merged = hybrid_image(img2, img1, ratio);
figure, imshow(img_merged);
imwrite(img_merged, 'hybrid_2.jpg');