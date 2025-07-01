function B = convolution(A, h)
    [n, m, dim] = size(A);
    
    if dim == 3
        A = rgbtogray(A);
    end
    
    [l, k] = size(h);
    B = zeros(n, m);
    
    if mod(l, 2) == 1 && mod(k, 2) == 1

        l = floor(l / 2);
        k = floor(k / 2);
        
        for x = 1+l : n-l
            for y = 1+k : m-k
                s = 0;
                for i = -l : l
                    for j = -k : k
                        s = s + h(i+l+1, j+k+1) * A(x+i, y+j);
                    end
                end
                B(x, y) = s;
            end
        end
    else
        for x = 1 : n
            for y = 1 : m
                s = 0;
                for i = 1 : size(h, 1)
                    for j = 1 : size(h, 2)
                        if (x + i - 1) <= n && (y + j - 1) <= m
                            s = s + h(i,j) * A(x + i - 1, y + j - 1);
                        end
                    end
                end
                B(x, y) = s;
            end
        end
    end
end
