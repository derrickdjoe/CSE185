function img_filtered = median_filter_pad(img, patch_size, what)

    % your code here
   
  
    I2 = zeros(600, 600, 'double');
    
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
            I2(v + 42, u + 42) = value;
            
        end
    end
    
    
 
   for v = 43 : 553
            
         I2(43, v) = I2(44, v);
         I2(553, v) = I2(553, v);
         I2(v, 43) = I2(v, 44);
         I2(v, 553) = I2(v, 533);

   end
   
   if what == 1
       
       for u = 1 : 41
           for v = 1 : size(I2, 2)
               
               I2(v, u) = 0;
               I2(v, size(I2, 1) - u) = 0;
               
           end
       end
       
       for v = 1 : size(I2, 2)
           for u = 1 : 41
               
               I2(u, v) = 0;
               I2(size(I2, 1) - u, v) = 0;
               
           end
       end
       
   end
    
   img_filtered = I2;
    
end