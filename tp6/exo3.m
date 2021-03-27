clear variables; close all; 
%exo5 du chap3 continue
figure(1); hold on;
N=50000;
n=50;
X=rand(1,N);
Y=rand(1,N);
Z=min(X,Y);

%1
[h_emp,xout]=hist(Z,n);
h_emp=h_emp/trapz(xout,h_emp);
bar(xout,h_emp);

%théo
z=0:0.1:1;
h_th=2*(1-z);
plot(z,h_th);

%2
figure(2); hold on;
lambda=2;%on met ce qu'on veut
X1=-log(1-rand(1,N))/lambda;
Y1=-log(1-rand(1,N))/lambda;
Z1=min(X1,Y1);
[h_emp,xout]=hist(Z1,n);
h_emp=h_emp/trapz(xout,h_emp);
bar(xout,h_emp);

h_theoz=2*lambda.*exp(-2*lambda*xout);
plot(xout,h_theoz,'b');

legend('Empirique','Théorique');