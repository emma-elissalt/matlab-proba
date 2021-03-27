clear variables;
close all; 


n = 50000;

X = 1+rand(n,1);
Y = 1+rand(n,1);

S = X+Y;
P = X.*Y;
Q = X./Y;

figure(1);
subplot(221); hold on;
[h_emp1,xout1]= hist(X,50);
bar(xout1,h_emp1/trapz(xout1,h_emp1))
axis([0.95 2.05 0 1.5])

subplot(222); hold on;
[h_emp2,xout2]= hist(S,50);
bar(xout2,h_emp2/trapz(xout2,h_emp2))
s_th1 = 2:0.01:3;
s_th2 = 3:0.01:4;
s_th = cat(2,s_th1-2,4-s_th2);
plot(cat(2,s_th1,s_th2),s_th);

subplot(223); hold on;
[h_emp3,xout3]= hist(P,50);
bar(xout3,h_emp3/trapz(xout3,h_emp3))
p_th1 = 1:0.01:2;
p_th2 = 2:0.01:4;
p_th = cat(2,log(p_th1),2*log(2)-log(p_th2));
plot(cat(2,p_th1,p_th2),p_th);
E_p_th = ((1+2)/2)*((1+2)/2);
E_p_emp = mean(P);


subplot(224); hold on;
[h_emp4,xout4]= hist(Q,50);
bar(xout4,h_emp4/trapz(xout4,h_emp4))
q_th1 = 1/2:0.01:1;
q_th2 = 1:0.01:2;
q_th = cat(2,2-1./(2*q_th1.*q_th1),(2./(q_th2.*q_th2))-1/2);
plot(cat(2,q_th1,q_th2),q_th);
E_q_th = (3/2)*log(2);
E_q_emp = mean(Q);
