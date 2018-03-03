function [t,x]=meulermej(f,intervalo,x0,N)

x=zeros(N+1,size(x0,2));
t=zeros(N+1,1);
x(1,:)=x0;
t(1)=intervalo(1);
h=(intervalo(2)-intervalo(1))/N;

for i= 1:N
    t(i+1)=t(i)+h;
    F1=f(t(i),x(i,:));
    F2=f(t(i+1),x(i,:)+h*F1.');
    x(i+1,:)=x(i,:)+h/2*(F1+F2).'; %Hay que trasponer la f
end
