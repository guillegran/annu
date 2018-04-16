% El script de gráficas del profesor
colx=size(x,2); % Numero de columnas de la matriz x
color=['r' 'g' 'b'];
figure(1)
for i=1:colx 
  subplot(colx,1,i)
  plot(t,x(:,i),color(i))
  s=sprintf('Coordenada %d de la solución',i);
  title(s)
end
if colx>1
  pause(3) 
  figure(2)
  if colx==2
      plot(x(:,1),x(:,2),'r')
      %comet(x(:,1),x(:,2))
  else
      %plot3(x(:,1),x(:,2),x(:,3),'r')
      comet3(x(:,1),x(:,2),x(:,3))
  end
title('Trayectoria de la solución')
end
