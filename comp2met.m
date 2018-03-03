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
else
	disp('No sé pintar en dimensiones superiores')
end
