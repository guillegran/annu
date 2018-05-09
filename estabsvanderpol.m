%alpha=0.1; T=150; 
alpha=30; T=250; 
TOL=1.e-5;
f=@(t,x) [x(2);-alpha*(x(1)^2-1)*x(2)-x(1)];
x0=[0.1,0.1];
intervalo=[0,T];

opciones=odeset('Stats','off','AbsTol',TOL,'RelTol',TOL);
[t1,x1]=ode45(f,intervalo,x0,opciones);
[t2,x2]=ode15s(f,intervalo,x0,opciones);

figure(1)
subplot(2,1,1)
plot(t1,x1(:,1),t2,x2(:,1))
legend('Coordenada x con ode45','Coordenada x con ode15s');
subplot(2,1,2)
plot(t1,x1(:,2),t2,x2(:,2))
legend('Coordenada y con ode45','Coordenada y con ode15s');

figure(2)
plot(x1(:,1),x1(:,2),x2(:,1),x2(:,2))
legend('Solución con ode45','Solución con ode15s');

i1=(1:1:length(t1)-1);
i2=(1:1:length(t2)-1);
figure(3)
plot(i1,t1(i1+1)-t1(i1),i2,t2(i2+1)-t2(i2))
s1=sprintf('%d pasos con ode45',length(t1));
s2=sprintf('%d pasos con ode15s',length(t2));
legend(s1,s2);
