clear variables; close all; 

n=10; 
X=3:1:8;
h=[4,1,3,7,2,3]/20;
c=h;

subplot(3,1,1);
bar(X,h);
esp=X*h'; 
var=(X-esp).^2*h';
ecart_typ=sqrt(var);

H=conv(h,h);
subplot(3,1,2);
bar([6:16],H);

for k=1:n-1
    c=conv(c,h);
end 


subplot(3,1,3);hold on; 
bar([n*3:n*8],c);

%théorique
espS=n*esp;
ecart_typS=ecart_typ*sqrt(n);
x = espS - ecart_typS:0.1:espS + ecart_typS;
f=1/(ecart_typS*sqrt(2*pi))*exp(-(x-espS).^2/(2*ecart_typS.^2));
plot(x,f);


