function [t,x]=mab2(f,intervalo,x0,N)

%Mejor inicializar:
x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

%Inicializamos x(2,:) con el método de Euler
F1=f(t(1),x(1,:)).';
x(2,:)=x(1,:)+h*F1;
t(2)=t(1)+h;
F2=f(t(2),x(2,:)).';

%El método:
for i=1:N-1
	%x(i+2,:)=x(i+1,:)+h/2*(3*f(t(i+1),x(i+1,:))-f(t(i),x(i,:))).'; 
	% También vale esto, pero es más costoso computacionalmente
	x(i+2,:)=x(i+1,:)+h/2*(3*F2-F1);
	t(i+2)=t(i+1)+h;
	F1=F2;
	F2=f(t(i+2),x(i+2,:)).';
end

