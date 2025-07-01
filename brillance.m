function B = brillance(image)
    
    [n, m, k] = size(image);
    if k == 3
        img_gr = double(rgbtogray(image));
    else
        img_gr = double(image);
    end
    
    s = 0;
    
    for i = 1:n
        for j = 1:m
            s = s + img_gr(i, j);
        end
    end
    
    B = s / (n * m);
end
