%%====Cubic==spline===
clear 
clc

%===initial data===
xp=[0:1:10] %==inital t
yp=cos(xp)  %===example
n=length(xp);
syms x S(x) real % symbolic evaluation

for j=1:n-1
    dx(j)=xp(j+1)-xp(j);
    h(j)=(yp(j+1)-yp(j))/dx(j);
end

A=zeros(n-2); %===exclude Boundaries 0 n+1
B=zeros(n-2,1);

for i=1:n-2
    for j=1:n-2
        if i==j
            A(i,j)=2*(dx(j)+dx(i));
        end
        if i==j+1
            A(i,j)=dx(i);
        end
        if j==i+1
            A(i,j)=dx(j);
        end
    end
    B(i)=6*(h(i+1)-h(i));
end
%===SOR/GS====
z=inv(A)*B;%===find z
z=[0;z;0];% adding BC

for i=1:n-1
   Ss(i,1)=z(i+1)/(6*dx(i))*(x-xp(i))^3-z(i)/(6*(dx(i)))*(x-xp(i+1))^3+(yp(i+1)/dx(i)-dx(i)/6*z(i+1))*(x-xp(i))-(yp(i)/dx(i)-dx(i)*z(i)/6)*(x-xp(i+1));
end
  vpa(Ss,4)  
   
  spline_plot;







