clear variables; close all;

N=50000; %nbr d'experiences
n=8
X=zeros(1,N);%varaiable aléatoire
for k=1:N
    %utiliser rand ou randi et une boucle while
    b=ceil(n*rand(1,2));
    while b(1)==b(2)
        b=ceil(n*rand(1,2));
    end
    X(k)=min(b);
end

%loi empirique
[h_emp,xout]=hist(X,1:n-1);
figure(1); hold on;
bar(xout,h_emp/N,0.6, 'b');%affichage

%loi théorique
j=1:1:n-1
h_th=(2*(n-j))/(n*(n-1));%histogramme théorique
bar(xout,h_th,0.3,'w'); %affichage, %largeur et couleur dans l'odre pour les deux derniers

% %Esperances et écarts types, %histogramme, utiliser mean et std pour les calculs de l'esperance et de l'ecart type
E_emp=mean(X);
sigma_Emp=std(X);
E_th=(n+1)/3;
sigma_th=sqrt((n.n-n-2)/18);
