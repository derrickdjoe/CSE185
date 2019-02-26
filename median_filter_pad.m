function img_filtered = median_filter_pad(img, patch_size, what)

    % your code here
   
  
    I2 = zeros(513, 513, 'double');
    
    if patch_size(2) == 3
        mm = 1;
    end
    
    if patch_size(2) == 5
        mm = 2;
    end
    
    for u = 1 + 1 : size(img, 2) - mm
        for v = 1 + mm : size(img, 1) - mm
            
            x1 = u - mm;
            x2 = u + mm;
            y1 = v - mm;
            y2 = v + mm;
            patch = img(y1:y2, x1:x2);
            patch = patch(:);
            value = median(patch);
            I2(v + 1, u + 1) = value;
            
        end
    end
    
    
 
   for v = 1 : 513
            
         I2(1, v) = I2(3, v);
         I2(2, v) = I2(3, v);
         I2(513, v) = I2(512, v);
         I2(v, 2) = I2(v, 3);
         I2(v, 1) = I2(v, 3);
         I2(v, 513) = I2(v, 512);

   end
   
   if what == 1
       
       for v = 1 : 513
       I2(1, v) = 0;
       I2(513, v) = 0;
       I2(v, 1) = 0;
       I2(v, 513) = 0;
       end
   end
    
   img_filtered = I2;
    
end