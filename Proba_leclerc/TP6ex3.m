clear variables;
close all; 
% Reprendre les résultats ex5 chap 3 et les vérifier de façon empirique
% à l'aide d'un programme matlab

n = 50000;

% Loi uniforme sur [0;1]
X1 = rand(n,1);
Y1 = rand(n,1);
Z1 = min(X1,Y1);

figure(1); hold on;
[h_emp1,xout1]= hist(Z1,50);
bar(xout1,h_emp1/trapz(xout1,h_emp1))
z_th1 = 0:0.01:1;
h_th1 = 2*(1-z_th1);
plot(z_th1,h_th1);

% Loi exp de paramètre lambda
lambda = 2;
X2 = -log(1-X1)/lambda;
Y2 = -log(1-Y1)/lambda;
Z2 = min(X2,Y2);

figure(2); hold on;
[h_emp2,xout2]= hist(Z2,50);
bar(xout2,h_emp2/trapz(xout2,h_emp2))
z_th2 = 0:0.01:3;
h_th2 = 2*lambda*exp(-2*lambda*z_th2);
plot(z_th2,h_th2);