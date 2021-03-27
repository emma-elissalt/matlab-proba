function nbSucces=LoiBinomiale(n,p)
    nbSucces=0;
    for k=1:n;
        X=LoiBernoulli(p);
        nbSucces=nbSucces + X;
    end
end