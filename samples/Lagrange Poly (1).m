clear
clc
%%===initial data set=====
xp = [0,1,2,3,4,5,6,7];
yp = [1,2.7183,7.3891,0.32,1.4,1,2,3,4];
%%=======================
syms lag_poly(x);
lag_poly(x) = 0;

for j=1: length(xp)
    N(j)=sym(yp(j));
    for k=1:length(xp)
        if k==j
        else
            N(j)=N(j)*(x-xp(k))/(xp(j)-xp(k)); % y*cardinal functions
        end
    end
    lag_poly(x) = lag_poly(x) + N(j);
end
simplify(lag_poly,10)