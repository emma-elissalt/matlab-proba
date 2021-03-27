clear variables;
close all;

% QUESTION A
k = 3:1:8;
P_k = (1/20)*[4,1,3,7,2,3];
figure(1);
subplot(3,1,1)
bar(3:1:8,P_k);
axis([2 9 0 0.4]);
moyenne = k*P_k';
ecart_type = sqrt((k.*k)*P_k'-moyenne*moyenne);

% QUESTION B
X1_X2 = conv(P_k,P_k);
subplot(3,1,2)
bar(6:1:16,X1_X2)
axis( [5 17 0 0.2])

% QUESTION C D E 
n = 10;
Z = P_k;
for i = 2:1:n
    Z = conv(Z,P_k);
end
subplot(3,1,3); hold on;
S_Z = trapz(3*n:1:8*n,Z);
Z = Z./S_Z;
bar(3*n:1:8*n,Z)
axis([3*n-1 8*n+1 0 1.1*max(Z)])
mu = n*moyenne;
sigma = ecart_type*sqrt(n);
x_th = mu-5*sigma:0.1:mu+5*sigma;
f_thZ = (1/(sigma*sqrt(2*pi)))*exp(-(x_th-mu).*(x_th-mu)/(2*sigma*sigma));
plot(x_th, f_thZ)