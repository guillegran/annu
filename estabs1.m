mu=50;
f=@(t,x) funcestabs(t,x,mu);
N1=24; N2=26; N3=20; N4=50;
x0=0; intervalo=[0,1];

x1=meuler(f,intervalo,x0,N1);
x2=meuler(f,intervalo,x0,N2);
x3=meuler(f,intervalo,x0,N3);
x4=meuler(f,intervalo,x0,N4);

t0=linspace(intervalo(1),intervalo(2),101);

t1=linspace(intervalo(1),intervalo(2),N1+1);
t2=linspace(intervalo(1),intervalo(2),N2+1);
t3=linspace(intervalo(1),intervalo(2),N3+1);
t4=linspace(intervalo(1),intervalo(2),N4+1);

for i=1:101
x_exacta(i)=mu^2/(1+mu^2)*(cos(t0(i))-exp(-mu*t0(i))+sin(t0(i))/mu);
end

figure(1)
subplot(2,2,1)
plot(t1,x1)
s=sprintf('M. Euler explícito con N=24');
title(s)
subplot(2,2,2)
plot(t2,x2)
s=sprintf('M. Euler explícito con N=26');
title(s)
subplot(2,2,3)
plot(t3,x3)
s=sprintf('M. Euler explícito con N=20');
title(s)
subplot(2,2,4)
plot(t4,x4)
s=sprintf('M. Euler explícito con N=50');
title(s)

figure(2)
plot(t0,x_exacta)
s=sprintf('Solución exacta (N=100)');
title(s)

