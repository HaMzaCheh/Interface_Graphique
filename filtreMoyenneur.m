function G = filtreMoyenneur(J, c)    
    [n, m, k] = size(J);
    G = zeros(n, m, k, 'uint8');
    cmp = 1 / (c * c);
    B = cmp * ones(c, c); 
    o = floor(c / 2);    
    J_pad = vpadding(J,c);
    [l, h, ~] = size(J_pad);    
    if k == 3
        Gr = convolution(J_pad(:,:,1), B);
        Gg = convolution(J_pad(:,:,2), B);
        Gb = convolution(J_pad(:,:,3), B);
        G1 = cat(3, Gr, Gg, Gb);
        G(:,:,:) = G1(o+1:l-o, o+1:h-o, :);
    else
        G1 = convolution(J_pad, B);
        G(:,:) = G1(o+1:l-o, o+1:h-o);
    end  
end
