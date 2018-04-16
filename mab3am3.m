function [t,x]=mab3am3(f,intervalo,x0,N)
% Método predictor: Adams-Bashforth de 3 pasos
% Método corrector: Adams-Moulton de 3 pasos

%x=zeros(N+1,size(x0,2)); %No hace falta inicializar esto

x(1,:)=x0;
h=(intervalo(2)-intervalo(1))/N;
t=(intervalo(1):h:intervalo(2));

% Inicializamos x(2,:) y x(3,:) con Runge-Kutta de orden 3
F(1,:)=f(t(1),x(1,:)).';
for i=1:2
F1=F(i,:);
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+3/4*h,x(i,:)+3/4*h*F2).';
x(i+1,:)=x(1,:)+h/9*(2*F1+3*F2+4*F3); 
F(i+1,:)=f(t(i+1),x(i+1,:)).';
end

for i= 1:N-3
	x(i+3,:)=x(i+2,:)+h/12*(23*F(i+2,:)-16*F(i+1,:)+5*F(i,:)); %Predicción
	F(i+3,:)=f(t(i+3),x(i+3,:)); %Evaluación
	x(i+3,:)=x(i+2,:)+h/24*(9*F(i+3,:)+19*F(i+2,:)-5*F(i+1,:)+F(i,:)); %Corrección
	F(i+3,:)=f(t(i+3),x(i+3,:)); %Evaluación
end

	x(N+1,:)=x(N,:)+h/12*(23*F(N,:)-16*F(N-1,:)+5*F(N-2,:)); %Predicción
	F(N+1,:)=f(t(N+1),x(N+1,:)); %Evaluación
	x(N+1,:)=x(N,:)+h/24*(9*F(N+1,:)+19*F(N,:)-5*F(N-1,:)+F(N-2,:)); %Corrección

