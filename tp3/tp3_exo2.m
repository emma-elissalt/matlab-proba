clear varaiables; close all;

nbExp = 300;
lambda = 0.3;
mu = 0.5;

figure(1);
%Loi geometrique de X
resultX = zeros(1,nbExp);
for k=1:nbExp
    resultX(k) = LoiGeometrique(lambda);
end
[h, xout] = hist(resultX, 0:max(resultX));
h = h/nbExp;
subplot(1,3,1); hold on;
bar(xout, h, 'r')


resultTh = zeros(1,nbExp);
for k=1:nbExp
    resultTh(k) = ((1-lambda)^(k-1))*lambda;
end
bar(resultTh, 0.3, 'b')
ylim([0 1])
axis([0 max(resultX) 0 1]);
title('Loi Géometrique de X')
legend('empirique','theorique')

%Loi geometrique de Y
resultY = zeros(1,nbExp);
for k=1:nbExp
    resultY(k) = LoiGeometrique(mu);
end
[h, xout] = hist(resultY, 0:max(resultY));
h = h/nbExp;
subplot(1,3,2), hold on;
bar(xout, h, 'r')

resultTh = zeros(1,nbExp);
for k=1:nbExp
    resultTh(k) = ((1-mu)^(k-1))*mu;
end
bar(resultTh, 0.3, 'b')
ylim([0 1])
axis([0 max(resultX) 0 1]);
title('Loi Géometrique de Y')
legend('empirique','theorique')

%Loi Z
resultZ = min([resultX;resultY]);
[h, xout] = hist(resultZ, 0:max(resultZ));
h = h/nbExp;
subplot(1,3,3), hold on;
bar(xout, h, 'r')
axis([0 max(resultZ) 0 1]);

title('Loi de Z')

resultTh = zeros(1,nbExp);
for k=1:nbExp
    resultTh(k) = ((1-(lambda + mu -lambda*mu))^(k-1))*(lambda + mu -lambda*mu);
end
bar(resultTh, 0.3, 'b')
ylim([0 1])
axis([0 max(resultX) 0 1]);
title('Loi Géometrique de X')
legend('empirique','theorique')
