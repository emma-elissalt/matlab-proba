
%Exercice1
% n=1:6 ou n=6

N=10000;
Y=lancerDeSixFaces(N);
[h,xout]=hist(Y,1:6);%n nombres de classes / pour calculer l'histogramme cette ligne, hist classe les nombres par categorie(classe)
bar (xout,h); %affiche l'histogramme

%jeuA
cpt=0;%compteur
for k=1:N
    Y=lancerDeSixFaces(4);
    if max(Y)>=6;
        cpt=cpt+1;
    end
end

probaA_emp=cpt/N 
probaA_th=1-(5/6)^4 %1-elements contraire (ne pas obtenir 6 a l'issu des 4
%parties)

%jeuB
cpt=0;
for k=1:N
    Y=lancerDeSixFaces(24);
    Z=lancerDeSixFaces(24); %demander exo car il marche mais pas bonne commande 
    if max(Y+Z)>=12;
           cpt=cpt+1; 
    end
end
probaB_emp=cpt/N 
probaB_th=1-(35/36)^24


