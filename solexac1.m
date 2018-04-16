function x=solexac1(t)
for i = 1:size(t,1)
x(i,1)=exp(-0.1*t(i))*sin(2*t(i));
x(i,2)=exp(-0.1*t(i))*cos(2*t(i));
end
