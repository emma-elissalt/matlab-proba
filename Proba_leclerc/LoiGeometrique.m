function n=LoiGeometrique(p)
n = 1;
test = LoiBernoulli(p);
while test == 0
    n = n+1;
    test = LoiBernoulli(p);
end