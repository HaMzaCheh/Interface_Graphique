function G = egalisation(A)
    [n,m,k] = size (A);
    G = zeros(n,m,k);

    if k == 3
        
        gr = A(:,:,1);
        gv = A(:,:,2);
        gb = A(:,:,3);

        A_gr = rgbtogray(A);

        y = hstoNC(A_gr);

        for i = 1 : n
            for j = 1 : m
                Gr(i,j) = round(255 * y(gr(i,j)+1));
                Gv(i,j) = round(255 * y(gv(i,j)+1));
                Gb(i,j) = round(255 * y(gb(i,j)+1));
                
            end
        end

        G = cat(3,Gr,Gv,Gb);
    else
        A_gr = A;
        y = hstoNC(A_gr);
        G(:,:) = round(255*y(A_gr(:,:)+1));
    end

    G = uint8(G);
    
%     subplot(2,2,1);
%     imshow(A);
%     title("image originale");
% 
%     subplot(2,2,2)
%     hsto(A);
%     title("Histogramme de l'image originale");
% 
%     subplot(2,2,3);
%     imshow(G);
%     title("image eclairee");
% 
%     subplot(2,2,4)
%     hsto(G);
%     title("Histogramme de l'image apres egalisation");
end
