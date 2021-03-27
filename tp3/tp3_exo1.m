clear variables; close all;
n_cases=24;
cx=[0:n_cases];
cy=[0:n_cases];
[CX,CY]=meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));
hold on;

%1
n_impacts = 537;
M = zeros(n_cases, n_cases);

%boucle 
for k = 1:1:n_impacts
    x(k) = (n_cases-1)*rand();
    y(k) = (n_cases-1)*rand();
    i= round (x(k)+1);
    j = round(y(k)+1);
    M(i,j) =  M(i,j) + 1;
end

%affichage des points 
plot(x,y,'.r');

%loi de poisson 

figure(2); hold on;
[h, xout] = hist(M(:), 0:max(M(:))); %histogramme
bar(xout, h/n_impacts,0.4);

vecteur=0:1:max(M);

%calcul moyenne ecart type
lambda=mean(M(:))
sigma_emp=std(M(:))

%calcul théorique
h=exp(-lambda)*(lambda.^vecteur./factorial(vecteur));
bar(vecteur, h,0.2,'g');



