clear variables;
close all;

choix = input('Choisissez votre loi (Uniforme = 1 / Bernoulli = 2 / Binomiale = 3 / Geométrique = 4): ');
switch choix
    case 1
        % TEST LOI UNIFORME
        N = 10000; %nbr d'expérience
        n = input('Entrez le paramètre n de la loi uniforme: ');
        X = zeros(1,N); %Variable aléatoire
        for k =1:N
            X(k) = LoiUniforme(n);
        end
        figure(1);hold on;
        [h_emp,xout1] = hist(X,1:n);
        bar(xout1,h_emp/N)
        E_emp = mean(X);
        sigma_emp = std(X);
        h_th = 1/n*ones(1,n);
        E_th = (n+1)/2;
        sigma_th = sqrt((n*n-1)/12);
        bar(xout1,h_th,0.5,'w')
        xlabel('nombre obtenu')
        ylabel('probabilite')
        legend('Empirique','Théorique')
        axis([0 n+1 0 max(h_th)+0.1])
        
    case 2
        % TEST LOI BERNOULLI
        N = 10000; %nbr d'expérience
        X = zeros(1,N); %Variable aléatoire
        p = input('Entrez le paramètre p de la loi de Bernoulli: ');
        for k =1:N
            X(k) = LoiBernoulli(p);
        end
        figure(1);hold on;
        [h_emp,xout1] = hist(X,0:1);
        bar(xout1,h_emp/N)
        E_emp = mean(X);
        sigma_emp = std(X);
        h_th = [1-p p];
        E_th = p;
        sigma_th = sqrt(p*(1-p));
        bar(xout1,h_th,0.5,'w')
        xlabel('nombre obtenu')
        ylabel('probabilite')
        legend('Empirique','Théorique')
        axis([-1 2 0 max(h_th)+0.1])
        
    case 3
        % TEST LOI BINOMIALE
        N = 10000; %nbr d'expérience
        X = zeros(1,N); %Variable aléatoire
        n = input('Entrez le paramètre n de la loi Binomiale: ');
        p = input('Entrez le paramètre p de la loi Binomiale: ');
        for k =1:N
            X(k) = LoiBinomiale(n,p);
        end
        figure(1);hold on;
        [h_emp,xout1] = hist(X,0:n);
        bar(xout1,h_emp/N)
        E_emp = mean(X);
        sigma_emp = std(X);
        h_th = zeros(1,n+1);
        for k =0:n
            h_th(k+1) = nchoosek(n,k)*(p^k)*((1-p)^(n-k));
        end
        E_th = n*p;
        sigma_th = sqrt(n*p*(1-p));
        bar(xout1,h_th,0.5,'w')
        xlabel('nombre de succès')
        ylabel('probabilite')
        legend('Empirique','Théorique')
        axis([-1 n+1 0 max(h_th)+0.1])
        
    case 4
        % TEST LOI GEOMETRIQUE
        N = 10000; %nbr d'expérience
        X = zeros(1,N); %Variable aléatoire
        p = input('Entrez le paramètre p de la loi géométrique: ');
        for k =1:N
            X(k) = LoiGeometrique(p);
        end
        figure(1);hold on;
        [h_emp,xout1] = hist(X,1:floor(10/p));
        bar(xout1,h_emp/N)
        E_emp = mean(X);
        sigma_emp = std(X);
        E_th = 1/p;
        sigma_th = sqrt((1-p)/(p^2));
        taille_h = 1:floor(10/p);
        h_th = ((1-p).^(taille_h-1))*p;
        bar(xout1,h_th,0.5,'w')
        xlabel('nombre essais jusqu au 1er succes')
        ylabel('probabilite')
        legend('Empirique','Théorique')
        axis([0 10/p+1 0 max(h_th)+0.1])
end