clc; clear; close all
 A=[20,-10,0;
     -10,20,-10;
     0,-10,20];
 B=[1;1;1];%ones(3,1);
 
tol=1e-6; Nmax=1000;

[X,k] = jacobi_result(A, B, tol, Nmax);
X
k
residual = norm(A*X-B)

function [X_1,k] = jacobi_result(A,B, tol, Nmax)
X_2 = zeros(length(A),1); % k+1 step
X_1 = zeros(length(A),1); % k step
k = 0; % counter
residual = [];
%===k=0======%initial guess
for i =1: length(A)
    X_1(i) = B(i)/A(i,i); 
end
%===iteration======
while (norm(A*X_1-B)>tol && k<Nmax) % |A*X_k-B|>tol 
for i =1: length(A)
    X_2(i) = B(i)/A(i,i);
    for j =1: length(A)
%         if j ~= i
%            X_2(i) =  X_2(i)-A(i,j)*X_1(j)/A(i,i);
%         end
         if j < i
           X_2(i) =  X_2(i)-A(i,j)*X_2(j)/A(i,i);
        end
        if j > i
           X_2(i) =  X_2(i)-A(i,j)*X_1(j)/A(i,i);
        end
    end
end
X_1 = X_2;
k = k+1;
residual = [residual norm(A*X_1-B)];
end
end






























% A=[20,-10,0;
%   -10,20,-10;
%     0,-10,20];
% B=ones(3,1);
% A_d=diag(A);
% A_nd=A-diag(A_d);
% Tol=1e-6;
% X0=B./A_d;Xk=X0;counter=1;
% Residul=[];
% while (norm(A*Xk-B)>=Tol)
%     counter=counter+1;
%     Xk=(B-A_nd*Xk)./A_d;
%     Residul=[Residul norm(A*Xk-B)];
% end