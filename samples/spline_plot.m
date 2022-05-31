a=0;
b=10;
n=101;
h=(b-a)/(n-1);
x_plot = a:h:b;
cubic_func(x)=Ss
vpa (cubic_func(x),4)
for i=1:length(x_plot)-1
  cubic_result = eval(cubic_func(x_plot(i)));
  y_cubic_plot(i) = cubic_result(fix((i-1)/10)+1);
end
cubic_result = eval(cubic_func(x_plot(length(x_plot))));
y_cubic_plot(length(x_plot)) = cubic_result(10);
F3=plot(x_plot, y_cubic_plot);
h = legend(F3,'Cubic');
xlabel('data');
ylabel('number of positive cases');
