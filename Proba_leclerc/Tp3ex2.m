clear variables;
close all;

% LOI GEOMETRIQUE X
N = 10000; %nbr d'expérience
X = zeros(1,N); %Variable aléatoire
lambda = 0.3;
for k =1:N
    X(k) = LoiGeometrique(lambda);
end
figure(1);
subplot(1,3,1)
hold on;
[h_emp,xout1] = hist(X,1:floor(10/lambda));
bar(xout1,h_emp/N)
taille_h = 1:floor(10/lambda);
h_th = ((1-lambda).^(taille_h-1))*lambda;
bar(xout1,h_th,0.5,'w')
xlabel('nombre essais jusqu au 1er succes')
ylabel('probabilite')
legend('Empirique','Théorique')
axis([0 10/lambda+1 0 max(h_th)+0.1])

% LOI GEOMETRIQUE Y
N = 10000; %nbr d'expérience
Y = zeros(1,N); %Variable aléatoire
micro = 0.5;
for k =1:N
    Y(k) = LoiGeometrique(micro);
end
figure(1);
subplot(1,3,2)
hold on;
[h_emp2,xout2] = hist(Y,1:floor(10/micro));
bar(xout2,h_emp2/N)
taille_h2 = 1:floor(10/micro);
h_th2 = ((1-micro).^(taille_h2-1))*micro;
bar(xout2,h_th2,0.5,'w')
xlabel('nombre essais jusqu au 1er succes')
ylabel('probabilite')
legend('Empirique','Théorique')
axis([0 10/micro+1 0 max(h_th2)+0.1])


% Z
Z = min(X,Y);
p = lambda+micro-lambda*micro;
figure(1)
subplot(1,3,3)
hold on;
[h_emp3, xout3] = hist(Z,1:10/p);
bar(xout3,h_emp3/N)
taille_h3 = 1:floor(10/p);
h_th3 = ((1-p).^(taille_h3-1))*p;
bar(xout3,h_th3,0.5,'w')
xlabel('nombre essais jusqu au 1er succes')
ylabel('probabilite')
legend('Empirique','Théorique')
axis([0 10/p+1 0 max(h_th3)+0.1])