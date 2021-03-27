clear variables; close all; 


n=10
X=3:8; %tableau de 3 à 8 avec un pas de 1
h=[4,1,3,7,2,3]/20;
c=h

subplot(2,2,1)
bar(X,h) %afficher les barres de l'histogramme

esp=X*h'; %produit scalaire entre les ki et les Pi
var=(X-esp).^2*h';
ecart_typ=sqrt(var);

H=conv(h,h);
subplot(2,2,2)
bar([6:16],H)

for k=1:n-1
    c=conv(c,h)
end     
c;

hold on
subplot(2,2,3)
bar([n*3:n*8],c)

espS=n*esp
ecart_typS=ecart_typ*sqrt(n)

f=exp(-(zout-espS).^2/(2*(ecart_typS.^2)))/(ecart_typS*sqrt(2*pi));
plot ([n*3:n*8],f)