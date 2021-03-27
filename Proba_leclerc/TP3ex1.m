clear variables;
close all;

% IMPACTS ALEATOIRES
figure(1); hold on;
n_cases=24;
cx = [0:n_cases];
cy = [0:n_cases];
[CX,CY] = meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));

n_impacts = 537;
M = zeros(n_cases,n_cases);
IMPACT = zeros(2,n_impacts);
for k = 1:n_impacts
    x = 24*rand(1);
    y = 24*rand(1);
    M(ceil(x),ceil(y)) = M(ceil(x),ceil(y))+1;
    IMPACT(1,k) = x;
    IMPACT(2,k) = y;
end

M = M(:);
plot(IMPACT(1,:), IMPACT(2,:),'r*')
figure(2); hold on;
[h_emp,xout] = hist(M,0:max(M));
bar(xout,h_emp)
xlabel('nombre impacts')
axis([-1 10 0 250])
sigma_emp = std(M);
sigma_th = sqrt(537/(24*24));
h_th = zeros(1,max(M)+1);
for k = 1:max(M)+1
    h_th(k) = (exp(-537/(24*24))*((537/(24*24))^(k-1)))/factorial(k-1);
end
h_th = h_th*24*24;
bar(xout,h_th,0.5,'w')
legend('Empirique','Théorique')

% IMPACTS NON ALEATOIRES
figure(3); hold on;
n_cases=24;
cx = [0:n_cases];
cy = [0:n_cases];
[CX,CY] = meshgrid(cx,cy);
mesh(CX,CY,zeros(n_cases+1,n_cases+1));

n_impacts = 537;
M = zeros(n_cases,n_cases);
IMPACT = zeros(2,n_impacts);
for k = 1:n_impacts
    if k < 200
        x = 5*rand(1);
        y = 5*rand(1);
    else
        x = 24*rand(1);
        y = 24*rand(1);
    end
    M(ceil(x),ceil(y)) = M(ceil(x),ceil(y))+1;
    IMPACT(1,k) = x;
    IMPACT(2,k) = y;
end

M = M(:);
plot(IMPACT(1,:), IMPACT(2,:),'r*')
figure(4); hold on;
[h_emp,xout] = hist(M,0:max(M));
bar(xout,h_emp)
xlabel('nombre impacts')
axis([-1 10 0 250])
sigma_emp = std(M);
sigma_th = sqrt(537/(24*24));
h_th = zeros(1,max(M)+1);
for k = 1:max(M)+1
    h_th(k) = (exp(-537/(24*24))*((537/(24*24))^(k-1)))/factorial(k-1);
end
h_th = h_th*24*24;
bar(xout,h_th,0.5,'w')
legend('Empirique','Théorique')
