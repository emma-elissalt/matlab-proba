clear variables;
close all;

% QUESTION 1
n = 50000;
U1 = rand(1,n);
U2 = rand(1,n);
X = sqrt(-2*log(U1)).*cos(2*pi*U2);
Y = sqrt(-2*log(U1)).*sin(2*pi*U2);
[h_empX, xoutX] = hist(X,50);
[h_empY, xoutY] = hist(Y,50);
S_h_empX = trapz(xoutX,h_empX);
h_empX = h_empX./S_h_empX;
S_h_empY = trapz(xoutY,h_empY);
h_empY = h_empY./S_h_empY;
figure(1);
bar(xoutX,h_empX);
figure(2);
bar(xoutY,h_empY);

% QUESTION 2
mu = 4;
sigma = 3;
Z = X*sigma + mu;
[h_empZ, xoutZ] = hist(Z,50);
S_h_empZ = trapz(xoutZ,h_empZ);
h_empZ = h_empZ./S_h_empZ;
x_th = mu-5*sigma:0.1:mu+5*sigma;
f_thZ = (1/(sigma*sqrt(2*pi)))*exp(-(x_th-mu).*(x_th-mu)/(2*sigma*sigma)); 
figure(3); hold on;
bar(xoutZ,h_empZ);
plot(x_th,f_thZ);
E_emp = mean(Z);
sigma_emp = std(Z);