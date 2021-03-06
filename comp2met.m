function comp2met(metodo1,metodo2)
datos
[t,x1]=metodo1(f,intervalo,x0,N);
[t,x2]=metodo2(f,intervalo,x0,N);

if size(x1,2)==1
	%Caso escalar
	figure(1)
	plot(t,x1,'r')

	pause(1)
	figure(2)
	plot(t,x2-x1,'r')

	pause(1)
	figure(3)
	plot([0 1],[norm(x2-x1,Inf) norm(x2-x1,Inf)],'r')
	legend(num2str(norm(x2-x1,Inf)))

elseif size(x1,2)==2
	% Caso vectorial (dimensión 2)
	figure(1)
	subplot(2,1,1)
	plot(t,x1(:,1),'r')
	subplot(2,1,2)
	plot(t,x1(:,2),'g')

	pause(1)
	figure(2)
	subplot(2,1,1)
	plot(t,x2(:,1)-x1(:,1),'r')
	subplot(2,1,2)
	plot(t,x2(:,2)-x1(:,2),'g')

	pause(1)
	figure(3)
	plot(x1(:,1),x1(:,2),'r')

	pause(1)
	figure(4)
	plot([0 1],[norm(x2-x1,Inf) norm(x2-x1,Inf)],'r')
	legend(num2str(norm(x2-x1,Inf)))
	
elseif size(x1,2)==3
	% Caso vectorial (dimensión 3)
	figure(1)
	subplot(3,1,1)
	plot(t,x1(:,1),'r')
	subplot(3,1,2)
	plot(t,x1(:,2),'g')
	subplot(3,1,3)
	plot(t,x1(:,3),'b')

	pause(1)
	figure(2)
	subplot(3,1,1)
	plot(t,x2(:,1)-x1(:,1),'r')
	subplot(3,1,2)
	plot(t,x2(:,2)-x1(:,2),'g')
	subplot(3,1,3)
	plot(t,x2(:,3)-x1(:,3),'b')

	pause(1)
	figure(3)
	plot3(x1(:,1),x1(:,2),x1(:,3),'r')

	pause(1)
	figure(4)
	plot([0 1],[norm(x2-x1,Inf) norm(x2-x1,Inf)],'r')
	legend(num2str(norm(x2-x1,Inf)))

else
	disp('No sé pintar en dimensiones superiores')
end
