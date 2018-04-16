function [t,x]=mmilne(f,intervalo,x0,N)

%Mejor inicializar:
x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

%Inicializamos x(2,:), x(3,:) y x(4,:) con el método de Runge-Kutta de orden 3
for i=1:3
t(i+1)=t(i)+h;
F1=f(t(i),x(i,:)).'; 
G(i,:)=F1;
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+3/4*h,x(i,:)+3/4*h*F2).';
x(i+1,:)=x(i,:)+h/9*(2*F1+3*F2+4*F3);
end

%El método:
for i=1:N-3
	%x(i+4,:)=x(i,:)+4/3*h*(2*f(t(i+3),x(i+3,:))-f(t(i+2),x(i+2,:))+2*f(t(i+1),x(i+1,:))).';
	%También vale pero es computacionalmente más costoso
	G(4,:)=f(t(i+3),x(i+3,:)).';
	x(i+4,:)=x(i,:)+4/3*h*(2*f(t(i+3),x(i+3,:))-f(t(i+2),x(i+2,:))+2*f(t(i+1),x(i+1,:))).';
	t(i+4)=t(i+3)+h;
	G(1,:)=G(2,:);
	G(2,:)=G(3,:);
	G(3,:)=G(4,:);
end

