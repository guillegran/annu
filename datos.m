% Genérico
%f=@funcpvi;
%intervalo=[0,10]; x0=[1,0]; N=1000;

% Exponencial
%intervalo=[0,10]; x0=1; N=1000;
%f=@(t,x) x;

% Ojitos
%intervalo=[0,2*pi]; x0=[0,4]; N=1000;
%f=@(t,x) [x(2);-9*x(1)+8*sin(t)];

% Oscilador armónico
%k=1; m=1; intervalo=[0,10]; x0=[1,0]; N=1000;
%f=@(t,x) [x(2);-(k/m)*x(1)]; 

% Oscilador de Van der Pol
%a=8; b=1; T=150;
a=0.1; b=1; T=150;
intervalo=[0,T]; 
TOL=1.e-5;
%x0=[0.2,0.4]; 
x0=[0.1,0.1]; 
N=1000;
f=@(t,x) [x(2);-a*(x(1)^2-b)*x(2)-x(1)]; 

% Péndulo
%intervalo=[0,10]; x0=[0,1000]; N=1000;
%m=1; g=9.8; F=0; L=1; b=0;
%f=@(t,x) [x(2);-2*b/m*x(2)-g/L*sin(x(1))+F];

% Atractor de Lorenz
%s=10; b=8/3; p=0.1; x0=[0,5,75]; intervalo=[0,10]; N=1000;
%f=@(t,x) [s*(x(2)-x(1));p*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)];

% PVI's del ejercicio 10
% (a)
%f=@(t,x) [-0.1*x(1)+2*x(2);-2*x(1)-0.1*x(2)];
%x0=[0,1]; intervalo=[0,10]; N=1000;
% (b)
%f=@(t,x) [x(2);cos(3*t)-2*x(1)];
%x0=[1,0]; intervalo=[0,10]; N=1000;

% Otro más:
%f=@(t,x) [x(2);cos(3*x(1))-2*x(1)]; intervalo=[0,10];x0=[0,1];N=1000;
