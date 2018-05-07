function [t,x]=mab4am4(f,intervalo,x0,N)
% Método predictor: Adams-Bashforth de 4 pasos
% Método corrector: Adams-Moulton de 4 pasos

%x=zeros(N+1,size(x0,2)); %No hace falta inicializar esto

x(1,:)=x0;
h=(intervalo(2)-intervalo(1))/N;
t=(intervalo(1):h:intervalo(2));

% Inicializamos x(2,:), x(3,:) y x(4,:) con Runge-Kutta de orden 4
for i=1:3
F(i,:)=f(t(i),x(i,:)).';
F1=F(i,:);
F2=f(t(i)+h/2,x(i,:)+h/2*F1).';
F3=f(t(i)+h/2,x(i,:)+h/2*F2).';
F4=f(t(i)+h,x(i,:)+h*F3).';
x(i+1,:)=x(1,:)+h/6*(F1+2*F2+2*F3+F4); 
end

for i= 1:N-3
	F(i+3,:)=f(t(i+3),x(i+3,:)).'; %Evaluación
	x(i+4,:)=x(i+3,:)+h/24*(55*F(i+3,:)-59*F(i+2,:)+37*F(i+1,:)-9*F(i,:)); %Predicción
	F(i+4,:)=f(t(i+4),x(i+4,:)).'; %Evaluación
	x(i+4,:)=x(i+3,:)+h/720*(251*F(i+4,:)+646*F(i+3,:)-264*F(i+2,:)+106*F(i+1,:)-19*F(i,:)); %Corrección
end
