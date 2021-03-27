clear variables; close all; 

N=5000; 
n=50;
X=-log(1-rand(1,N));    % VA X (loi exponentielle de paramètre 1)
Y=-log(1-rand(1,N))/2; %VA Y(loi exponentielle de paramètre 2)
U=X+2*Y; 
[h,uout]=hist(U,n);     
aire=trapz(uout,h);     
densite_emp=h/aire;     
bar(uout,densite_emp,'g');
hold on;

%théorique
h_theo=uout.*exp(-uout);
plot(uout,h_theo,'b');

legend('Empirique','Théorique');

% moyenne empirique
mu_emp=mean(U);
str_tmp=sprintf('E(X)_{emp} = %1.4f',mu_emp);
text(6,0.25,str_tmp);

%moyenne théorique
mu_th=2;
str_tmp=sprintf('E(X)_{th} = %1.4f',mu_th);
text(6,0.23,str_tmp);

% variance empirique
var_emp=std(U)^2;  
str_tmp=sprintf('V(X)_{emp} = %1.4f',var_emp);
text(6,0.20,str_tmp);

% variance théorique
var_th=2;
str_tmp=sprintf('V(X)_{th} = %1.4f',var_th);
text(6,0.18,str_tmp);

