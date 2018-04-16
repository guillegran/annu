function [t,x]=mmilne4bdf5(f,intervalo,x0,N)
% Método predictor: Milne de 4 pasos
% Método corrector: BDF de 5 pasos

%x=zeros(N+1,size(x0,2)); %No hace falta inicializar esto

x(1,:)=x0;
h=(intervalo(2)-intervalo(1))/N;
t=(intervalo(1):h:intervalo(2));

% Inicializamos x(2,:), x(3,:), x(4,:) y x(5,:) con Runge-Kutta de orden 4
F(1,:)=f(t(1),x(1,:)).';
for i=1:4
F1=F(i,:);
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+h/2,x(i,:)+h/2*F2).';
F4=f(t(i)+h,x(i,:)+h*F3).';
x(i+1,:)=x(1,:)+h/6*(F1+2*F2+2*F3+F4); 
F(i+1,:)=f(t(i+1),x(i+1,:)).';
end

for i= 1:N-5
	x(i+5,:)=x(i+1,:)+4*h/3*(2*F(i+4,:)-F(i+3,:)+2*F(i+2,:)); %Predicción
	F(i+5,:)=f(t(i+5),x(i+5,:)); %Evaluación
	x(i+5,:)=1/137*(300*x(i+4,:)-300*x(i+3,:)+200*x(i+2,:)-75*x(i+1,:)+12*x(i,:)+60*h*F(i+5,:)); %Corrección
	F(i+5,:)=f(t(i+5),x(i+5,:)); %Evaluación
end

	x(N+1,:)=x(N-3,:)+4*h/3*(2*F(N,:)-F(N-1,:)+2*F(N-2,:)); %Predicción
	F(N+1,:)=f(t(N+1),x(N+1,:)); %Evaluación
	x(N+1,:)=1/137*(300*x(N,:)-300*x(N-1,:)+200*x(N-2,:)-75*x(N-3,:)+12*x(N-4,:)+60*h*F(N+1,:)); %Corrección

