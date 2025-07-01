function H = hsto(A)
    H = zeros(1,256);
    k = 0 : 255;

    for i = 1:numel(A)
        H(A(i)+1) = H(A(i)+1) + 1;
    end

%      bar(k,H);
%      title('Histogramme');

