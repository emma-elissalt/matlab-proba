clear variables;
close all;
n = 10000;
y = LancerDeSixFaces(n);

figure(1);
[h1,xout1] = hist(y,1:6);
bar(xout1,h1);
xlabel('numéro de dé')
ylabel('nbr obtentions')
%Jeu A
cpt = 0;
for k = 1:n
    jeuA = LancerDeSixFaces(4);
    [h2,xout2] = hist(jeuA,1:6);
    if h2(6) > 0
        cpt = cpt+1;
    end
end
probA_emp = cpt/n;
probA_th = 1-(5/6)^4;


%Jeu B
cpt = 0;
for k = 1:n
    jeuB = LancerDeSixFaces(24)+LancerDeSixFaces(24);
    [h3,xout3] = hist(jeuB,2:12);
    if h3(11) > 0
        cpt = cpt+1;
    end
end
probB_emp = cpt/n;
probB_th = 1- (35/36)^24;
