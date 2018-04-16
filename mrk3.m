function [t,x]=mrk3(f,intervalo,x0,N)
% La función mrk3 resuelve un problema de valor inicial de la forma
% x'=f(t,x) en [t0,T]
% x(t0)=x0,
% con x0 en R^n, mediante el método de Runge-Kutta de orden 3.
% ENTRADA:
% f: nombre de la función (definida en formato anónimo o como fichero de tipo función de Matlab)
% del problema que se quiere resolver, con dos argumentos de entrada: el primero es un
% número real y el segundo es un vector columna de tipo (n,1)
% intervalo: [t0,T], donde está planteado el sistema de ecuaciones diferenciales
% x0: vector inicial de tipo (1,n)
% N: número de subintervalos
% SALIDA:
% t: vector columna de abscisas donde se va a aproximar la solución de tipo (N+1,1)
% x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)

% Mejor inicializar para que te saque columnas:
x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);

x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

for i= 1:N
    t(i+1)=t(i)+h;
    F1=f(t(i),x(i,:));
    F2=f(t(i)+h/2,x(i,:)+h/2*F1.');
    F3=f(t(i)+3*h/4,x(i,:)+3*h/4*F2.');
    x(i+1,:)=x(i,:)+h/9*(2*F1+3*F2+4*F3).'; 
end
