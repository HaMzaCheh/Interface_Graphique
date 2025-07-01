function img_f = ajuster_brillance(img, coef)
    if size(img,3) == 3   
        img_f = double(img);
        for c = 1:3
            imgDim = img_f(:,:,c);
            imgDim = imgDim  + coef ;
            imgDim = max(min(imgDim, 255), 0);
            img_f(:,:,c) = imgDim;
        end   
    else
        img_f = img + coef;
        img_f = max(min(img_f,255),0);
    end
    img_f = uint8(img_f);
end
