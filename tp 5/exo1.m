clear variables; close all; 

N=10000; 
U1=rand(1,N);
U2=rand(1,N);
n=50;

X=sqrt(-2*log(U1)).*cos(2*pi*U2);
Y=sqrt(-2*log(U1)).*sin(2*pi*U2);

figure(1);
[h,xout]=hist(X,n);
aire=trapz(xout,h);
bar(xout,h/aire,'b');

figure(2);
[h,xout]=hist(Y,n);
aire=trapz(xout,h);
bar(xout,h/aire,'r');

%question2
esp=4;
sigma=3;
Z=X*sigma+esp;

figure(3);
hold on;
[h,xout]=hist(Z,n);
aire=trapz(xout,h);
bar(xout,h/aire,'b');

%théorique
x=-20:0.01:20;
f=1/(sigma*sqrt(2*pi))*exp(-(x-esp).^2/(2*sigma.^2));
plot(x,f);

