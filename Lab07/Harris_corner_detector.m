function [corner_x, corner_y] = Harris_corner_detector...
                                    (I, sigma1, sigma2, alpha, R_threshold, name)
    
	%% Gaussian kernels
    hsize1 = 1 + 2 * ceil(sigma1 * 2);
    hsize2 = 1 + 2 * ceil(sigma2 * 2);

    gaussian_kernel1 = fspecial('gaussian', hsize1, sigma1);
    gaussian_kernel2 = fspecial('gaussian', hsize2, sigma2);

    
    %% derivative filter
    Dx = [1, 0, -1];
    Dy = [1; 0; -1];

    
    
    %% Use derivative of Gaussian to compute x-gradient (Ix) and y-gradient (Iy)
    
    I1 = imfilter(I, gaussian_kernel1, 'replicate');
    Ix = imfilter(I1, Dx, 'replicate');
    Iy = imfilter(I1, Dy, 'replicate');

%     figure, imshow(Ix + 0.5);
%     figure, imshow(Iy + 0.5);



    %% compute Ixx, Iyy, Ixy
    Ixx = Ix.^2;
    Iyy = Iy.^2;
    Ixy = Ix .* Iy;

    
    
    %% compute Sxx, Syy, Sxy
    Sxx = imfilter(Ixx, gaussian_kernel2);
    Syy = imfilter(Iyy, gaussian_kernel2);
    Sxy = imfilter(Ixy, gaussian_kernel2);

    
    
    %% compute corner response from determine and trace
    R = ((Sxx .* Syy) - (Sxy .* Sxy)) - alpha * (Sxx + Syy) .^2;

    %figure, imagesc(R); colormap jet; colorbar; axis image;

    
    
    %% find corner map with R > R_threshold
    corner_map = R > R_threshold;
    
    %figure, imshow(corner_map);

    
    
    %% find local maxima of R
    local_maxima = imregionalmax(R);
    
 
    Z = I;
    %figure, imshow(I);
    for x = 1 : 15
        
        Z1 = Z;
        htemp = fspecial('average', [3,3]);
        Z1 = imfilter(Z1, htemp, 'replicate');
        %figure, imshow(Z1);
        
    for i = 1 : size(Z, 1)
        for j = 1 : size(Z, 2)
            
            if(Z(i, j) > Z1(i, j))
                  
            else
                
                Z(i, j) = 0;
                
            end
        end
    end
    
       %figure, imshow(Z);
        
    end
    
        Z1 = Z;
        htemp = fspecial('average', [3,1]);
        Z1 = imfilter(Z1, htemp, 'replicate');
        %figure, imshow(Z1);
        
    for i = 1 : size(Z, 1)
        for j = 1 : size(Z, 2)
            
            if(Z(i, j) > Z1(i, j))
                  
            else
                
                Z(i, j) = 0;
                
            end
        end
    end
            
        Z1 = Z;
        htemp = fspecial('average', [1,3]);
        Z1 = imfilter(Z1, htemp, 'replicate');
        %figure, imshow(Z1);
        
    for i = 1 : size(Z, 1)
        for j = 1 : size(Z, 2)
            
            if(Z(i, j) > Z1(i, j))
                  
            else
                
                Z(i, j) = 0;
                
            end
        end
    end
    
    
   figure, imshow(Z);
   %figure, imshow(local_maxima);
    
    %figure, imshow(local_maxima)

    
    
    %% final corner map and corner x, y coordinates
    final_corner_map = corner_map & local_maxima;
    
    [corner_y, corner_x] = find(final_corner_map);


end

