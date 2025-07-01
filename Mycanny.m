function c = Mycanny(A)
    % Conversion en niveaux de gris si nécessaire
    if size(A, 3) == 3
        A_gr = rgb2gray(A);
    else
        A_gr = A;
    end
    
    % Lissage avec un noyau gaussien
    A_gr = vpadding(A_gr, 5);
    B = 1 / 159 * [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2];
    A2 = convolution(double(A_gr), B);
    
    % Filtrage Sobel pour détecter les gradients
    Sobx = [-1 0 1; -2 0 2; -1 0 1];
    Soby = [1 2 1; 0 0 0; -1 -2 -1];
    Gx = conv2(A2, Sobx);
    Gy = conv2(A2, Soby);
    
    % Calcul de la magnitude et de la phase des gradients
    F2 = sqrt(Gx.^2 + Gy.^2);
    phase = atan2(Gy, Gx);
    
    % Suppression des non-maxima
    [n, m] = size(F2);
    img = F2;
    for i = 2:n-1
        for j = 2:m-1
            angle = phase(i, j);
            if ((angle > -pi/8 && angle < pi/8) || (angle < -7*pi/8 && angle > 7*pi/8))
                if F2(i, j) <= F2(i, j-1) || F2(i, j) <= F2(i, j+1)
                    img(i, j) = 0;
                end
            elseif ((angle > pi/8 && angle < 3*pi/8) || (angle < -5*pi/8 && angle > -7*pi/8))
                if F2(i, j) <= F2(i-1, j+1) || F2(i, j) <= F2(i+1, j-1)
                    img(i, j) = 0;
                end
            elseif ((angle > 3*pi/8 && angle < 5*pi/8) || (angle < -3*pi/8 && angle > -5*pi/8))
                if F2(i, j) <= F2(i-1, j) || F2(i, j) <= F2(i+1, j)
                    img(i, j) = 0;
                end
            else
                if F2(i, j) <= F2(i-1, j-1) || F2(i, j) <= F2(i+1, j+1)
                    img(i, j) = 0;
                end
            end
        end
    end
    
    % Application du double seuillage
    vlow = 20;
    vhigh = 80;
    c = zeros(size(img));
    for i = 1:n
        for j = 1:m
            if img(i, j) < vlow
                c(i, j) = 0;
            elseif img(i, j) > vhigh
                c(i, j) = 1;
            else
                c(i, j) = 0.5;
            end
        end
    end
    
    % Propagation des contours faibles
    for i = 3:n-2
        for j = 3:m-2
            if c(i, j) == 0.5
                if any(any(c(i-2:i+2, j-2:j+2) == 1))
                    c(i, j) = 1;
                else
                    c(i, j) = 0;
                end
            end
        end
    end
    
    c = logical(c);
end
