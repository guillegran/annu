mu=50;
f=@(t,x) funcestabs(t,x,mu);
N1=24; N2=26; 
%N1=20; N2=30;
x0=0; intervalo=[0,1];

[t1,x1]=meuler(f,intervalo,x0,N1);
[t2,x2]=meuler(f,intervalo,x0,N2);

t0=linspace(intervalo(1),intervalo(2),101);

for i=1:101
x_exacta(i)=mu^2/(1+mu^2)*(cos(t0(i))-exp(-mu*t0(i))+sin(t0(i))/mu);
end

plot(t0,x_exacta,'r',t1,x1,'g',t2,x2,'b')
s1=sprintf('N=%d',N1);
s2=sprintf('N=%d',N2);
legend('Solución exacta', s1,s2);
