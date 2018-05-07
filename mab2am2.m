function [t,x]=mab2am2(f,intervalo,x0,N)
% Método predictor: Adams-Bashforth de 2 pasos
% Método corrector: Adams-Moulton de 2 pasos

%x=zeros(N+1,size(x0,2)); %No hace falta inicializar esto

x(1,:)=x0;
h=(intervalo(2)-intervalo(1))/N;
t=(intervalo(1):h:intervalo(2));
F(1,:)=f(t(1),x(1,:)).';

% Inicializamos con Euler mejorado
F1=F(1,:);
F2=f(t(2),x(1,:)+h*F1).';
x(2,:)=x(1,:)+h/2*(F1+F2); 

for i= 1:N-1
	F(i+1,:)=f(t(i+1),x(i+1,:)); %Evaluación
	x(i+2,:)=x(i+1,:)+h/2*(3*F(i+1,:)-F(i,:)); %Predicción
	F(i+2,:)=f(t(i+2),x(i+2,:)); %Evaluación
	x(i+2,:)=x(i+1,:)+h/12*(5*F(i+2,:)+8*F(i+1,:)-F(i,:)); %Corrección
end
