clear variables; close all; 

N=50000;
n=50;
X=2*ones(1,N)-rand(1,N);
Y=2*ones(1,N)-rand(1,N);

%loi uniforme
subplot(2,2,1);
[h_empX,xout]=hist(X,n);
bar(xout,h_empX/trapz(xout,h_empX),'b');
title('Loi Uniforme');

%somme
S=X+Y; 
[h,sout]=hist(S,n);     
aire=trapz(sout,h);     
densite_emp=h/aire;  
subplot(2,2,2);
bar(sout,densite_emp,'g');
title('S=X+Y');
%théorique
s1=2:0.1:3;
h_theo_s1=s1-2;
s2=3:0.1:4;
h_theo_s2=4-s2;
hold on;
plot(s1,h_theo_s1,s2,h_theo_s2);
legend('Empirique','Théorique');

%produit
P=X.*Y;
subplot(2,2,3)
hold on;
[hp,pout]=hist(P,50);
bar(pout,hp/trapz(pout,hp)); 
p1=1:0.1:2;
fp1=log(p1);
p2=2:0.1:4;
fp2=2*log(2)-log(p2);
plot(p1,fp1,p2,fp2);
hold off;
esp_p=mean(P)
esp_p_th=trapz(p1,p1.*fp1)+trapz(p2,p2.*fp2)
legend('Empirique','Théorique');
title('P=X*Y')

%qiotient
Q=X./Y;
subplot(2,2,4)
hold on;
[hq,qout]=hist(Q,50);
bar(qout,hq/trapz(qout,hq),'k'); 
q1=0.5:0.1:1;
fq1=2-1./(2*q1.^2);
q2=1:0.1:2;
fq2=2./q2.^2-1/2;
plot(q1,fq1,q2,fq2,'r');
hold off;
esp_q=mean(Q)
esp_q_th=1
legend('Empirique','Théorique');
title('P=X/Y')