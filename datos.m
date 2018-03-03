% Genérico
%f=@funcpvi;
%intervalo=[0,10]; x0=[1,0]; N=1000;

% Exponencial
intervalo=[0,10]; x0=1; N=1000;
f=@(t,x) x;

% Oscilador armónico
%k=1; m=1; intervalo=[0,10]; x0=[1,0]; N=1000;
%f=@(t,x) [x(2);-(k/m)*x(1)]; 

% Atractor de Lorenz
%s=10; b=8/3; p=0.1; x0=[0,5,75]; intervalo=[0,10];
%f=@(t,x) [s*(x(2)-x(1));p*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)];
