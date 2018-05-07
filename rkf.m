function [t,x]=rkf(f,intervalo,x0,N)

% La función rkf resuelve un problema de valor inicial de la forma
%  x'=f(t,x) en [t0,T]
%  x(t0)=x0
% con x0 en R^n, mediante el método adaptativo de Runge-Kutta-Fehlberg.
%
% ENTRADA:
%  f=@func: función f definida en el fichero func.m con dos argumentos de entrada: 
%  el primero es un número real y el segundo es un vector columna de tipo (n,1)
%  intervalo: [t0,T], donde está planteado el sistema de ecuaciones diferenciales
%  x0: vector inicial de tipo (1,n)
%  N: número de subintervalos
%
% SALIDA:
%  t: vector de abscisas donde se va a aproximar la solución con N+1 componentes
%  x: matriz de ordenadas de la solución aproximada de tipo (N+1,n)

a=intervalo(1);
b=intervalo(2);
tol=10^(-6);

a2=1/4;
b2=1/4;
a3=3/8;
b3=3/32;
c3=9/32;
a4=12/13;
b4=1932/2197;
c4=-7200/2197;
d4=7296/2197;
a5=1;
b5=439/216;
c5=-8;
d5=3680/513;
e5=-845/4104;
a6=1/2;
b6=-8/27;
c6=2;
d6=-3544/2565;
e6=1859/4104;
f6=-11/40;
r1=1/360;
r3=-128/4275;
r4=-2197/75240;
r5=1/50;
r6=2/55;
n1=25/216;
n3=1408/2565;
n4=2197/4104;
n5=-1/5;
big=1e15;
h=(b-a)/N;
hmin=h/64;
hmax=64*h;
max1=N;
x(:,1)=x0;
t(1)=a;
j=1;
tj=t(1);
br=b-0.00001*abs(b);
while (t(j)<b),
    if ((t(j)+h)>br),
        h=b-t(j);
    end
    tj=t(j);
    xj=x(:,j);
    x1=xj;
    F1=h*f(tj,x1);
    x2=xj+b2*F1;
    if big<abs(x2)
        break
    end
    F2=h*f(tj+a2*h,x2);
    x3=xj+b3*F1+c3*F2;
    if big<abs(x3)
        break
    end
    F3=h*f(tj+a3*h,x3);
    x4=xj+b4*F1+c4*F2+d4*F3;
    if big<abs(x4)
        break
    end
    F4=h*f(tj+a4*h,x4);
    x5=xj+b5*F1+c5*F2+d5*F3+e5*F4;
    if big<abs(x5)
        break
    end
    F5=h*f(tj+a5*h,x5);
    x6=xj+b6*F1+c6*F2+d6*F3+e6*F4+f6*F5;
    if big<abs(x6)
        break
    end
    F6=h*f(tj+a6*h,x6);
    err=abs(r1*F1+r3*F3+r4*F4+r5*F5+r6*F6);
    xnew=xj+n1*F1+n3*F3+n4*F4+n5*F5;
    if ((err<tol) | (h<2*hmin))
        x(:,j+1)=xnew;
        if ((tj+h)>br)
            t(j+1)=b;
        else
            t(j+1)=tj+h;
        end
        j=j+1;
        tj=t(j);
    end
    if (err==0)
        s=0;
    else
        s=0.84*(tol*h/err).^(0.25);
    end
    if ((s<0.75) & (h>2*hmin))
        h=h/2;
    end
    if ((s>1.50) & (2*h<hmax))
        h=2*h;
    end
    if ((big<abs(x(:,j))) | (max1==j))
        break
    end
    mend=j;
    if (b>t(j))
        N=j+1;
    else
        N=j;
    end
end
x=x.';
