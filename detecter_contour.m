function img_contours = detecter_contour(img, type)
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    img = double(img);
    
    switch type
        case 'Sobel'
            Hx = [-1 0 1; -2 0 2; -1 0 1]; 
            Hy = [-1 -2 -1; 0 0 0; 1 2 1]; 
            
        case 'Prewitt'
            Hx = [-1 0 1; -1 0 1; -1 0 1];
            Hy = [-1 -1 -1; 0 0 0; 1 1 1];
            
        case 'Roberts'
            Hx = [0 -1; 1 0];
            Hy = [-1 0; 0 1];
            
        otherwise
            error('Méthode non reconnue. Choisissez entre "Sobel", "Prewitt" ou "Roberts".');
    end
    
    img_x = convolution(img, Hx);
    img_y = convolution(img, Hy);
    
    img_contours = sqrt(img_x.^2 + img_y.^2);
    img_contours = uint8(img_contours);
    
end
