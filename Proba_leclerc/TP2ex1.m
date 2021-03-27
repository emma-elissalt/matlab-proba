clear variables;
close all;
N = 50000; %nbr d'expérience
n = 12; %nombre de boules
X = zeros(1,N); %Variable aléatoire

for k =1:N
    b1 = randi(n);
    b2 = randi(n);
    while b2 == b1
        b2 = randi(n);
    end
    X(k) = min(b1,b2);
end
figure(1);hold on;
[h_emp,xout1] = hist(X,1:n-1);
bar(xout1,h_emp/N)
E_emp = mean(X);
sigma_emp = std(X);

E_th = (n+1)/3;
sigma_th = sqrt((n*n-n-2)/18);

xlabel('nombre obtenu')
ylabel('probabilité')
h_th = 2*(n-xout1)/(n*(n-1));
bar(xout1,h_th,0.5,'w' )
legend('empirique','théorique')