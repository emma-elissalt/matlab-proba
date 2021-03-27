clear variables;
close all;

n = 7000;

% QUESTION 1

x = cos(0:pi/(2*n):pi/2);
y = sin(0:pi/(2*n):pi/2);
posX = zeros(1,n);
posY = zeros(1,n);


figure(1);hold on;
plot(x,y)
xlim([-0.1 1.1])
ylim([0 1.1])
cpt = 0;
for k=1:n
    posX(k) = rand(1);
    posY(k) = rand(1);
    color = '*r';
    if posX(k)^2 + posY(k)^2 < 1 
        color = '*g';
        cpt = cpt + 1;
    end
    plot(posX(k),posY(k),color)
end
approPi = cpt*4/n;
disp('APPROXIMATION DE PI (METHODE DE MONTE-CARLO)')
disp(['Nombre total de points : ',num2str(n)])
disp(['Nombre de points dans le quadrant : ',num2str(cpt)])
disp(['Valeur approximative de pi : ',num2str(approPi)])

% QUESTION 2

x2 = 1:(exp(1)-1)/n:exp(1);
y2 = log(x2)./(x2.*x2);
figure(2);hold on;
plot(x2,y2)
xlim([0.9 2.8])
ylim([0 0.3])

posX = zeros(1,n);
posY = zeros(1,n);
cpt = 0;
for k=1:n
    posX(k) = 1+(exp(1)-1)*rand(1);
    posY(k) = 0.25*rand(1);
    color = '*r';
    if posY(k) < log(posX(k))/(posX(k)^2) 
        color = '*g';
        cpt = cpt + 1;
    end
    plot(posX(k),posY(k),color)
end
approInt = cpt*(0.25*(exp(1)-1))/n;
disp('VALEUR APPROXIMATIVE D UNE INTEGRALE')
disp(['Nombre total de points : ',num2str(n)])
disp(['Valeur approximative de l intégrale : ',num2str(approInt)])
