%1
I = imread('01.jpg');
I2 = zeros(300 + 25, 400, 3, 'uint8');

for y1 = 1 : 300
    for x1 = 1 : 400
        
        y2 = y1;
        x2 = x1;
        
        I2(y2, x2, :) = I(y1, x1, :);
        
    end
end
imwrite(I2, 'shift.jpg');
It = ('shift.jpg');
figure;
imshow(It);

%2
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
       y2 = (y1 - 150) * cosd(60) + (x1 - 200) * sind(60);
       x2 = -(y1 - 150) * sind(60) + (x1 - 200 ) * cosd(60);
       y2 = round(y2) + 150;
       x2 = round(x2) + 200;
       if( 1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400 )
        I2(y2, x2, :) = I(y1, x1, :);
       end
    end
end
imwrite(I2, 'rotateF.jpg');
It = ('rotateF.jpg');
figure;
imshow(It);

%3
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');
for y1 = 1 : 300
    for x1 = 1 : 400
       y2 = (y1 - 150) * cosd(60) + -(x1 - 200) * sind(60);
       x2 = (y1 - 150) * sind(60) + (x1 - 200 ) * cosd(60);
       y2 = round(y2) + 150;
       x2 = round(x2) + 200;
       if( 1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400 )
        I2(y2, x2, :) = I(y1, x1, :);
       end
    end
end
imwrite(I2, 'rotateB.jpg');
It = ('rotateB.jpg');
figure;
imshow(It);

%4
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');

for y1 = 1 : 300
    for x1 = 1 : 400
        
        y2 = y1;
        x2 = x1;
        
        I2(301 - y2, x2, :) = I(y1, x1, :);
        
    end
end
imwrite(I2, 'flip.jpg');
It = ('flip.jpg');
figure;
imshow(It);

%5
I = imread('01.jpg');
I2 = zeros(150, 200, 3, 'uint8');

for y1 = 2 : 2 : 300
    for x1 = 2 : 2 : 400

                y2 = y1 / 2;
                x2 = x1 / 2;
                I2(y2, x2, :) = I(y1, x1, :);
                
    end
end
imwrite(I2, 'scale.jpg');
It = ('scale.jpg');
figure;
imshow(It);