function img_filtered = median_filter(img, patch_size)

    % your code here
  
    I2 = zeros(size(img));
    x = round(patch_size(1) - (patch_size(1) / 2));
    y = round(patch_size(2) - (patch_size(2) / 2));
    
    for u = 1 + x : size(img, 2) - x
        for v = 1 + y : size(img, 1) - y
           

            x1 = u - x;
            x2 = u + x;
            y1 = v - y;
            y2 = v + y;
            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            value = median(patch);
            I2(v, u) = value;
            
        end
    end
    
    for i = 1 : x
        
        x1 = I2(:, patch_size(1));
        I2(:, i) = x1;
        
        x2 = I2(:, 512 - patch_size(1));
        I2(:, 512 - i) = x2;
        
        x3 = I2(patch_size(2), :);
        I2(i, :) = x3;
        
        x4 = I2(512 - patch_size(2), :);
        I2(512 - i, :) = x4;
        
    end

    img_filtered = I2;
    
end