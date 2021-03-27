clear variables; close all; %le 1 ok, lui demander 

N=5000;
n=40;
p=0.28;

%Loi de Bernoulli

Y=zeros(1,N);

for k=1:N
    Y(k)=LoiBernoulli(p);
end

% loi empirique
[h_emp,xout]=hist(Y,0:1); %histogramme
figure(1); hold on;
bar(xout,h_emp/N,0.2,'g'); %affichage

%loi théorique
h_th=[1-p,p];
bar(xout,h_th,0.1,'r');
legend('empirique','theorique');

%Loi de Binomiale

Y=zeros(1,N);

for k=1:N
    Y(k)=LoiBinomiale(n,p);
end

%empirique
[h_emp,xout]=hist(Y,0:n);

figure(2);hold on;
bar(xout,h_emp/N,0.4,'g');

%théorique
h_th=[];
for k=xout
    h_th=[h_th,nchoosek(n,k)*(p^k)*(1-p)^(n-k)];
end
bar(xout,h_th,0.1,'r');

legend('empirique','theorique');

%Loi de Uniforme

Y=zeros(1,N);

for k=1:N
    Y(k)=LoiUniforme(n);
end

% loi empirique
[h_emp,xout]=hist(Y,0:n); %histogramme
figure(3); hold on;
bar(xout,h_emp/N,0.4,'g'); %affichage

%loi théorique
%h_th=,;
%bar(xout,h_th,0.1,'r');
%legend('empirique','theorique');

%Loi de géométrique

Y=zeros(1,N);

for k=1:N
    Y(k)=LoiGeometrique(p);
end

% loi empirique
[h_emp,xout]=hist(Y,0:n); %histogramme
figure(4); hold on;
bar(xout,h_emp/N,0.4,'g'); %affichage
