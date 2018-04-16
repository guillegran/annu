function [t,x]=mab4am4(f,intervalo,x0,N)
% Método predictor: Adams-Bashforth de 4 pasos
% Método corrector: Adams-Moulton de 4 pasos

%x=zeros(N+1,size(x0,2)); %No hace falta inicializar esto

x(1,:)=x0;
h=(intervalo(2)-intervalo(1))/N;
t=(intervalo(1):h:intervalo(2));

% Inicializamos x(2,:), x(3,:) y x(4,:) con Runge-Kutta de orden 4
F(1,:)=f(t(1),x(1,:)).';
for i=1:3
F1=F(i,:);
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+h/2,x(i,:)+h/2*F2).';
F4=f(t(i)+h,x(i,:)+h*F3).';
x(i+1,:)=x(1,:)+h/6*(F1+2*F2+2*F3+F4); 
F(i+1,:)=f(t(i+1),x(i+1,:)).';
end

for i= 1:N-4
	x(i+4,:)=x(i+3,:)+h/24*(55*F(i+3,:)-59*F(i+2,:)+37*F(i+1,:)-9*F(i,:)); %Predicción
	F(i+4,:)=f(t(i+4),x(i+4,:)); %Evaluación
	x(i+4,:)=x(i+3,:)+h/720*(251*F(i+4)+646*F(i+3,:)-264*F(i+2,:)+106*F(i+1,:)-19*F(i,:)); %Corrección
	F(i+4,:)=f(t(i+4),x(i+4,:)); %Evaluación
end

	x(N+1,:)=x(N,:)+h/24*(55*F(N,:)-59*F(N-1,:)+37*F(N-2,:)-9*F(N-3,:)); %Predicción
	F(N+1,:)=f(t(N+1),x(N+1,:)); %Evaluación
	x(N+1,:)=x(N,:)+h/720*(251*F(N+1)+646*F(N,:)-264*F(N-1,:)+106*F(N-2,:)-19*F(N-3,:)); %Corrección

