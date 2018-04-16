function [t,x]=mab5(f,intervalo,x0,N)

%No hace falta inicializar:
%x=zeros(N+1,size(x0,2));
%t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

%Inicializamos x(2,:), x(3,:), x(4,:) y x(5,:) con el método de Runge-Kutta de orden 4
for i=1:4
t(i+1)=t(i)+h;
F1=f(t(i),x(i,:)).'; 
G(i,:)=F1;
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+h/2,x(i,:)+h/2*F2).';
F4=f(t(i)+h,x(i,:)+h*F3).';
x(i+1,:)=x(i,:)+h/6*(F1+2*F2+2*F3+F4);
end

%El método:
for i=1:N-4
	%x(i+5,:)=x(i+4,:)+h/720*(1901*f(t(i+4),x(i+4,:))-2774*f(t(i+3),x(i+3,:))+2616*f(t(i+2),x(i+2,:))-1274*f(t(i+1),x(i+1,:))+251*f(t(i),x(i,:))).';
	% También vale pero es computacionalmente más costoso
	G(5,:)=f(t(i+4),x(i+4,:)).';
	x(i+5,:)=x(i+4,:)+h/720*(1901*G(5,:)-2774*G(4,:)+2616*G(3,:)-1274*G(2,:)+251*G(1,:));
	t(i+5)=t(i+4)+h;
	G(1,:)=G(2,:);
	G(2,:)=G(3,:);
	G(3,:)=G(4,:);
	G(4,:)=G(5,:);
end

