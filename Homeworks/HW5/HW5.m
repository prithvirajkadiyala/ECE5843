clear;
clc;
close all;

cross_section=load('cross_section.dat','-ASCII');
step = 30;
max_angle = 150;
theta = 0:step:max_angle;
[R,xp] = radon(cross_section, theta);

imshow(R',[],'Xdata',theta,'Ydata',xp,'InitialMagnification','fit')
xlabel('\theta (degrees)');
ylabel('x''');
title('Step=30 Max=150');
colormap(gca,hot), colorbar

I = iradon(R,theta);
figure; imshow(I);