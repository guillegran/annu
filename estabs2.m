mu=50;
%N1=24; N2=26; 
N1=20; N2=50;
x0=0; intervalo=[0,1];

[t1,x1]=meulerimp(intervalo,x0,N1,mu);
[t2,x2]=meulerimp(intervalo,x0,N2,mu);

t0=linspace(intervalo(1),intervalo(2),101);

for i=1:101
x_exacta(i)=mu^2/(1+mu^2)*(cos(t0(i))-exp(-mu*t0(i))+sin(t0(i))/mu);
end

plot(t0,x_exacta,'r',t1,x1,'g',t2,x2,'b')
s1=sprintf('N=%d',N1);
s2=sprintf('N=%d',N2);
legend('Solución exacta', s1,s2);

function [t,x]=meulerimp(intervalo,x0,N,mu)
% Esta función resuelve el PVI por el método de Euler implícito.
% Como la función es lineal, se puede despejar x(i+1).
	h=(intervalo(2)-intervalo(1))/N;
	t=linspace(intervalo(1),intervalo(2),N+1);
	t=t(:);
	x(1,:)=x0;
	for i=1:N
		x(i+1,:)=(x(i,:)+mu*h*cos(t(i+1)))/(1+mu*h);
	end
end
