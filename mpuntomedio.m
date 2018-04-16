function [t,x]=mpuntomedio(f,intervalo,x0,N)

%Mejor inicializar:
x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

%Inicializamos x(2,:) con el método de Euler
x(2,:)=x(1,:)+h*f(t(1),x(1,:)).';
t(2)=t(1)+h;

%El método:
for i=1:N-1
	x(i+2,:)=x(i,:)+2*h*f(t(i+1),x(i+1,:)).';
	t(i+2)=t(i+1)+h;
end
