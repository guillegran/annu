function [t,x]=mab3(f,intervalo,x0,N)

%Mejor inicializar:
x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

%Inicializamos x(2,:) y x(3,:) con el método de Euler mejorado
t(2)=t(1)+h;
t(3)=t(2)+h;
% Primero x(2,:)
F1=f(t(1),x(1,:)).'; 
G1=F1;
F2=f(t(2),x(1,:)+h*F1).';
x(2,:)=x(1,:)+h/2*(F1+F2);
% Y luego x(3,:)
F1=f(t(2),x(2,:)).'; 
G2=F1;
F2=f(t(3),x(2,:)+h*F1).';
x(3,:)=x(2,:)+h/2*(F1+F2);
G3=f(t(3),x(3,:)).';

%El método:
for i=1:N-2
	%x(i+3,:)=x(i+2,:)+h/12*(23*f(t(i+2),x(i+2,:))-16*f(t(i+1),x(i+1,:))+5*f(t(i),x(i,:))).';
	%También vale pero es más costoso computacionalmente
	x(i+3,:)=x(i+2,:)+h/12*(23*G3-16*G2+5*G1);
	t(i+3)=t(i+2)+h;
	G1=G2;
	G2=G3;
	G3=f(t(i+3),x(i+3,:)).';
end

