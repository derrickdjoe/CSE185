function img_filtered = median_filter(img, patch_size)

    % your code here
  
    I2 = zeros(size(img));
    
    if patch_size(2) == 3
        mm = 1;
    end
    
    if patch_size(2) == 5
        mm = 2;
    end
    
    for u = 1 + mm : size(img, 2) - mm
        for v = 1 + mm : size(img, 1) - mm
            
            x1 = u - mm;
            x2 = u + mm;
            y1 = v - mm;
            y2 = v + mm;
            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            value = median(patch);
            I2(v, u) = value;
            
        end
    end
        
    for i = 1 : mm + 2
        for v = 1 : size(img, 2)
            
         I2(v, i) = I2(v, mm + 2);
         I2(v, size(img, 1) - i) = I2(v, size(img, 1) - mm);
            
        end
    end
    
   for v = 1 : size(img, 2)
        for i = 1 : mm + 2
        
         I2(i, v) = I2(mm + 2, v);
         I2(size(img, 1) - i, v) = I2(size(img, 1) - mm, v);
            
        end
    end
    
    
    img_filtered = I2;
    
end