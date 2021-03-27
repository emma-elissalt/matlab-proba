clear variables;
close all;

%QUESTION 1
N = 5000;
a = -3;
b = 2;
Y = rand(N,1);
X = -4+exp(Y*log(6));
[h_emp, xout] = hist(X,50);
figure(1);hold on;
S_h_emp = trapz(xout,h_emp);
h_emp = h_emp./S_h_emp;
bar(xout,h_emp);
E_emp = mean(X);
sigma_emp = std(X);

f = (1/log(6)).*(1./(xout+4));
plot(xout,f)
E_th = 5/log(6) -4;
sigma_th = sqrt((1/log(6))*(22-(9/2)-8*(5-2*log(6)))-(E_th*E_th));

%QUESTION 2
figure(2);hold on;
n=100000;% nombre d’expériences
Y1= 0.5*rand(n,1);% VA uniforme sur [0,1/2] 
Y2= 0.5+0.5*rand(n,1);% VA uniforme sur [1/2,1]
X1= sqrt(8*Y1);% simulation de la VA X sur [0,2[
X2= -sqrt(-8*Y2+8)+4;% simulation de la VA X sur [2,4[
X= cat(1,X1,X2);% concaténation des VA X1 et X2
[h,xout]= hist(X,50);% calcul de l’histogramme de X
bar(xout,h/trapz(xout,h));% affichage de l’histogramme de X
mu_emp2= mean(X);% moyenne empirique
sigma_emp2= std(X);% écart type empirique
mu_th2= 2;% moyenne théorique
sigma_th2= sqrt(14/3-4);% écart type théorique
