
%% load input image
% name = 'lines';
% name = 'bridge';
name = 'hill';

img = imread(sprintf('%s.png', name));


%% extract edge map
edge_map = edge(rgb2gray(img), 'canny', 0.1, 3);
figure, imshow(edge_map);


%% Hough Transform (vote for m and b)
[m, b] = hough_transform(edge_map);
x = 1:size(img, 2);
y = m * x + b;

figure, imagesc(img); title('Your implementation (mb)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'red');
h = gcf;
saveas(h, sprintf('%s_mb_line.png', name));


%% Hough Transform (vote for r and theta)
[r, theta] = hough_transform_polar(edge_map);
x = 1:size(img, 2);
y = -(cos(theta)/sin(theta)) * x + (r / sin(theta));

figure, imagesc(img); title('Your implementation (polar)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'blue');
h = gcf;
saveas(h, sprintf('%s_polar_line.png', name));