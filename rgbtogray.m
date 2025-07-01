function J=rgbtogray(A)

    R=A(:,:,1);
    G=A(:,:,2);
    B=A(:,:,3);
    J = 0.3*R + 0.59*G + 0.11*B;
end