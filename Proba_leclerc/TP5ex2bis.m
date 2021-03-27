clear variables;
close all;

% QUESTION A
k = 1:1:6;
P_k = (1/6)*[1,1,1,1,1,1];
figure(1);
subplot(3,1,1)
bar(1:1:6,P_k);
axis([0 7 0 1/6+0.1]);
moyenne = k*P_k';
ecart_type = sqrt((k.*k)*P_k'-moyenne*moyenne);

% QUESTION B
X1_X2 = conv(P_k,P_k);
subplot(3,1,2)
bar(2:1:12,X1_X2)
axis( [1 13 0 0.5])

% QUESTION C D E 
n = 20;
Z = P_k;
for i = 2:1:n
    Z = conv(Z,P_k);
end
subplot(3,1,3); hold on;
S_Z = trapz(1*n:1:6*n,Z);
Z = Z./S_Z;
bar(1*n:1:6*n,Z)
axis([1*n-1 6*n+1 0 1.1*max(Z)])
mu = n*moyenne;
sigma = ecart_type*sqrt(n);
x_th = mu-5*sigma:0.1:mu+5*sigma;
f_thZ = (1/(sigma*sqrt(2*pi)))*exp(-(x_th-mu).*(x_th-mu)/(2*sigma*sigma));
plot(x_th, f_thZ)