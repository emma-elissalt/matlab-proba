clear variables;
close all;

N = 50000;
a = -2;
b = 3;
X = a + (b-a)*rand(1,N);
n = 50;
figure(1);hold on;
[h_emp,xout] = hist(X,n);
S_h_emp = trapz(xout,h_emp);
h_emp = h_emp./S_h_emp;
bar(xout,h_emp)
E_emp = mean(X);
sigma_emp = std(X);

f = 1/(b-a)*ones(size(xout));
plot(xout,f)
E_th = (a+b)/2;
sigma_th = sqrt((b-a)*(b-a)/12);