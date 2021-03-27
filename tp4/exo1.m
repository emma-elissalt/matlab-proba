clear variables; close all;

N=50000;
n=50;
a=-2; 
b=3;
X=a + (b-a).*rand(N,1);

%loi empirique
[h,xout]=hist(X,n);
bar(xout,h/trapz(xout,h),'b');
hold on;

%loi théorique
f=1/(b-a).*ones(length(xout),1); %densité
plot(xout,f,'r');
ylim([0 1]);

%empirique
E_emp=mean(X);
sigma_emp=std(X);
str=['E(X)=',num2str(E_emp)];
text(1,0.55,str);
str=['Sigma(X)=',num2str(sigma_emp)];
text(1,0.5,str);

%theorique
E_th=(a+b)/2;
sigma_th=sqrt((b-a).^2/12);
str=['E(X) _th=',num2str(E_th)];
text(1,0.45,str);
str=['Sigma(X) _th=',num2str(sigma_th)];
text(1,0.40,str);
