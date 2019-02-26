function img_filtered = gaussian_filter(img, hsize, sigma)

    kernel = fspecial('gaussian', hsize, sigma);
    % your code here
    I2 = zeros(size(img));
    
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            
            if(u >= 1 && u <= size(img, 1) - hsize && v >= 1 && v <= size(img, 2) - hsize)
                
                temp = sum(sum(kernel.* img(v:v + hsize - 1, u : u + hsize - 1)));
                I2(v, u, :) = temp;
                
            else
                
                I2(v, u, :) = img(v, u);
                
            end
        end
    end
    
    img_filtered = I2;
    
end