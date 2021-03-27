function nbSucces=LoiBinomiale(n,p)
nbSucces = 0;
for k=1:n
    x = LoiBernoulli(p);
    if x == 1
        nbSucces = nbSucces+1;
    end
end