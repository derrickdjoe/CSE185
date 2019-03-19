function [magnitude, orientation] = sobel_feature(img)

    Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge
    Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge
    
    %% Sobel filtering
    
    I = img;
    I = imfilter(img, Hy);
    
    I2 = img;
    I2 = imfilter(img, Hx);
    
    mag = zeros(size(img));
    orient = zeros(size(img));
    
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            
            mag(v, u) = sqrt(I(v, u) * I(v , u) + I2(v, u) * I2(v, u));
            orient(v, u) = atan(I2(v, u) / I(v, u));
            
        end
    end
    
    %% compute gradient magnitude and orientation
    magnitude = mag; % change img to your gradient magnitude
    orientation = orient; % change img to your gradient orientation
end