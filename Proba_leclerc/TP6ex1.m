clear variables;
close all; 


figure(1); hold on;

n = 10000;
U1= rand(n,1);% VA uniforme sur [0,1] 
U2= rand(n,1);% VA uniforme sur [0,1]
X = -log(1-U1);
Y = -log(1-U2)/2;
U = X+2*Y;
[h_emp,xout]= hist(U,50);
bar(xout,h_emp/trapz(xout,h_emp));% affichage de l’histogramme de U
E_emp= mean(U);% moyenne empirique
V_emp= std(U)*std(U);% variance empirique
axis([-0.5 20 0 0.4])
x_th = 0:0.01:16;
h_th = x_th.*exp(-x_th);
plot(x_th,h_th)
E_th = 2;
V_th = 2;