% El script de gráficas que hice yo
if size(x,2)==1
    % Caso escalar
    figure(1)
    plot(t,x,'r')
elseif size(x,2)==2
    % Caso vectorial
    figure(1)
    subplot(2,1,1)
    plot(t,x(:,1),'r')
    subplot(2,1,2)
    plot(t,x(:,2),'g')
    figure(2)
    plot(x(:,1),x(:,2),'r')
elseif size(x,2)==3
    % Caso vectorial
    figure(1)
    subplot(3,1,1)
    plot(t,x(:,1),'r')
    subplot(3,1,2)
    plot(t,x(:,2),'g')
    subplot(3,1,3)
    plot(t,x(:,3),'b')
    figure(2)
    plot3(x(:,1),x(:,2),x(:,3),'r')
else
    disp('No sé pintar en dimensiones superiores')
end
