function Hnc = hstoNC(A)
    H = zeros(1,256);
    k = 0 : 255;
    c = 0;

    for i = 1:numel(A)
        H(A(i)+1) = H(A(i)+1) + 1;
    end

%     subplot(4,1,1);
%      bar(k,H);
%      title('Histogramme');

% histogramme cummule

    Hc = zeros(1,256);
    for i = 1:256
        Hc(i) = H(i) + c;
        c = Hc(i);
    end

%     subplot(4,1,2);
%     bar(k,Hc)
%     title('histogramme cummele');

    % histogramme normalise

    Hn = zeros(1,256);
    for i = 1:256
        Hn(i) = H(i) / numel(A);
    end

%     subplot(4,1,3);
%     bar(k,Hn)
%     title('histogramme normalise');

%     histogramme normalisee cummele

    Hnc = zeros(1,256);
    for i = 1:256
        Hnc(i) = (Hc(i)/numel(A));
    end
    
%     subplot(4,1,4);
%     bar(k, Hnc);
%     title('histogramme cummele normalisee');
end

