function img_filtered = sobel_filter(img, kernel)

    % your code here
    I2 = zeros(size(img));
    
    for u = 1 + 3 : size(img, 2) - 3
        for v = 1 + 3 : size(img, 1) - 3
            
            x1 = u - 1;
            x2 = u + 1;
            y1 = v - 1;
            y2 = v + 1;
            patch = img(y1:y2, x1:x2);
            value = patch * kernel;
            value = value(:);
            value = median(value);
            I2(v, u) = value;
        end
    end
    
    img_filtered = I2;
    

end