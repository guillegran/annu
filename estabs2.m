mu=50;
N1=24; N2=26; N3=50; 
x0=0; intervalo=[0,1];

x1=meulerexp(intervalo,x0,N1,mu);
x2=meulerexp(intervalo,x0,N2,mu);
x3=meulerexp(intervalo,x0,N3,mu);

t0=linspace(intervalo(1),intervalo(2),101);

t1=linspace(intervalo(1),intervalo(2),N1+1);
t2=linspace(intervalo(1),intervalo(2),N2+1);
t3=linspace(intervalo(1),intervalo(2),N3+1);

for i=1:101
x_exacta(i)=mu^2/(1+mu^2)*(cos(t0(i))-exp(-mu*t0(i))+sin(t0(i))/mu);
end

figure(1)
subplot(3,1,1)
plot(t1,x1)
s=sprintf('Solución por M. Euler implícito con N=24');
title(s)
subplot(3,1,2)
plot(t2,x2)
s=sprintf('Solución por M. Euler implícito con N=26');
title(s)
subplot(3,1,3)
plot(t3,x3)
s=sprintf('Solución por M. Euler implícito con N=50');
title(s)

figure(2)
plot(t0,x_exacta)
s=sprintf('Solución exacta (N=100)');
title(s)

function [t,x]=meulerexp(intervalo,x0,N,mu)
	h=(intervalo(2)-intervalo(1))/N;
	t=linspace(intervalo(1),intervalo(2),N+1);
	t=t(:);
	x(1,:)=x0;
	for i=1:N
		x(i+1,:)=(x(i,:)+mu*h*cos(t(i+1)))/(1+mu*h);
	end
end
