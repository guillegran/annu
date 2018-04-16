function x=solexac2(t)
for i = 1:size(t,1)
x(i,1)=(8/7)*cos(sqrt(2)*t(i))-(1/7)*cos(3*t(i));
x(i,2)=-(8/7)*sqrt(2)*sin(sqrt(2)*t(i))+(1/7)*3*sin(3*t(i));
end
