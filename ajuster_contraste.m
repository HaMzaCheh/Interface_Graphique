function img_f = ajuster_contraste(img, coef)
    [~, ~, k] = size(img);
    b = brillance(img);
    img_f = double(img);

    if k == 3   
        for c = 1:3
        imgDim = img_f(:,:,c);

        imgDim = (imgDim - b) * coef + b;
        imgDim = max(min(imgDim, 255), 0);

        img_f(:,:,c) = imgDim;
        end   
    else
        img_gray = double(img);

        img_f = (img_gray - b) * coef + b ;

        img_f = max(min(img_f, 255), 0);        
    end
    img_f = uint8(img_f);
end
