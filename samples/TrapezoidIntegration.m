%%=====Integration====

clc; close all; clear variables;
a=-1;b=1;% total interval
n=5; h=(b-a)/n;% uniform grids
x=a:h:b;% discrete points
K=func(a)+func(b);% f_0+f_n

for i=2:n
   K=K + func(x(i))*2;    
end
Result=K*h/2;



function v=func(x)
v=exp(sin(x)^3);
end

%===analytical/exact solution of int x dx=x^2/2 