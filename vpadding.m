function I = vpadding(A, coef)
    c = floor(coef / 2);
    [n, m,k] = size(A);
    if k == 3
        R = A(:, :, 1);
        G = A(:, :, 2);
        B = A(:, :, 3);

        I_R = uint8(zeros(n + 2 * c, m + 2 * c));
        I_G = uint8(zeros(n + 2 * c, m + 2 * c));
        I_B = uint8(zeros(n + 2 * c, m + 2 * c));
        
        I_R(c + 1:c + n, c + 1:c + m) = R;
        I_G(c + 1:c + n, c + 1:c + m) = G;
        I_B(c + 1:c + n, c + 1:c + m) = B;
    
        I_R(1:c, c + 1:c + m) = repmat(R(1, :), c, 1);
        I_R(n + c + 1:end, c + 1:c + m) = repmat(R(end, :), c, 1);
        I_R(:, 1:c) = repmat(I_R(:, c + 1), 1, c);
        I_R(:, m + c + 1:end) = repmat(I_R(:, m + c), 1, c);
    
        I_G(1:c, c + 1:c + m) = repmat(G(1, :), c, 1);
        I_G(n + c + 1:end, c + 1:c + m) = repmat(G(end, :), c, 1);
        I_G(:, 1:c) = repmat(I_G(:, c + 1), 1, c);
        I_G(:, m + c + 1:end) = repmat(I_G(:, m + c), 1, c);
    
        I_B(1:c, c + 1:c + m) = repmat(B(1, :), c, 1);
        I_B(n + c + 1:end, c + 1:c + m) = repmat(B(end, :), c, 1);
        I_B(:, 1:c) = repmat(I_B(:, c + 1), 1, c);
        I_B(:, m + c + 1:end) = repmat(I_B(:, m + c), 1, c);
    
        I = cat(3, I_R, I_G, I_B);
    else 
        I = uint8(zeros(n + 2 * c, m + 2 * c));
        
        I(c + 1:c + n, c + 1:c + m) = A;
        I(1:c, c + 1:c + m) = repmat(A(1, :), c, 1);
        I(n + c + 1:end, c + 1:c + m) = repmat(A(end, :), c, 1);
        I(:, 1:c) = repmat(I(:, c + 1), 1, c);
        I(:, m + c + 1:end) = repmat(I(:, m + c), 1, c);
    end
end
