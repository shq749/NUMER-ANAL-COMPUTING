clc; clearvars; close all;
dt=10; Ttime=2000;
t0=0;
u0=0;
figure(); hold on; box on; axis([0 Ttime -inf inf])
%% Taylor m=1
tn=t0; un=u0; time_array=t0; u_array=u0;
while tn < Ttime
    un = un + dt*exp(-tn);
    tn = tn+dt;
    time_array=[time_array; tn];
    u_array   =[u_array; un];
end
plot(time_array, u_array, 'bo-.', 'LineWidth', 1.2)
leg{1}=['m=1'];

%% Taylor m=2
tn=t0; un=u0; time_array=t0; u_array=u0;
while tn < Ttime
    un = un + dt*exp(-tn) + dt^2/2*(-exp(-tn));
    tn = tn+dt;
    time_array=[time_array; tn];
    u_array   =[u_array; un];
end
plot(time_array, u_array, 'kv-.', 'LineWidth', 1.2)
leg{2}=['m=2'];


%% RK-4
tn=t0; un=u0; time_array=t0; u_array=u0;
while tn < Ttime
    K1=dt*exp(-tn);
    K2=dt*exp(-(tn+0.5*dt));
    K3=dt*exp(-(tn+0.5*dt));
    K4=dt*exp(-(tn+dt));
    un = un + 1/6*(K1+2*K2+2*K3+K4);
    tn = tn+dt;
    time_array=[time_array; tn];
    u_array   =[u_array; un];
end
plot(time_array, u_array, 'go-', 'LineWidth', 2)
leg{3}=['RK4'];



%% Exact solution
texa=0 : 0.01 : Ttime;
uexa=-exp(-texa)+1;
plot(texa, uexa, 'r-', 'LineWidth', 1.2)
leg{4}=['Exact solution'];
%%
xlabel('x'); ylabel('u');
mylegend=legend(leg);
set(mylegend,'Interpreter','Latex','Location','SouthEast');