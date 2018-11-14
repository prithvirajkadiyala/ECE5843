%1. For given two parameters a=1.15 and b=0.91
% 2.clear up the workspace and define FPF and TPF value;
clear;
clc;
close all;
aa=1.23; bb=0.709;
aa2=1.15;bb2=0.91;
kk=1/200; % 0.005 interval;
xx=[0:kk:1]; % Setting up the FPF Value;
yy= normcdf(norminv(xx)*bb+aa); % Calculating TPF value;
y2= normcdf(norminv(xx)*bb2+aa2); % Calculating TPF value;
% 3. plot the ROC curve
figure;
plot(xx,yy,'r',xx,y2,'b');
legend('System1','System2');
title('Smooth binormal ROC curve','FontSize',16,'FontWeight','bold','Color','r');
xlabel('FPF=1-specificty','FontSize',16,'FontWeight','bold')
ylabel('sensitivity, TPF','FontSize',16,'FontWeight','bold');
