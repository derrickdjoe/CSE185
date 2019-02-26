function img_filtered = sobel_filter(img, kernel)

    % your code here
    I2 = zeros(size(img));
    
    for u = 1 + 1 : size(img, 2) - 2
        for v = 1 + 1 : size(img, 1) - 2
            
            temp = 0;
            
            for i = -1 : 1
                for j = - 1 : 1
                    
                    temp = temp + sum(sum(kernel(i + 2, j + 2) * img(v + j, u + i)));
                    
                end
            end 
            
        I2(v, u) = temp;

        end
    end

    img_filtered = I2;

end