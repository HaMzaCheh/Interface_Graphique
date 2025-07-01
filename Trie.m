function M=Trie(T)
    for i=1 : numel(T)-1
        for j=i+1 : numel(T)
            if T(i) > T(j)
                c = T(i);
                T(i)=T(j);
                T(j)=c;
            end
        end
    end
    M=T;
end