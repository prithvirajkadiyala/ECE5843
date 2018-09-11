%1. For pixel size = 0.048 mm
% 1.clear up the workspace and define the pixel size
clear;clc;close all;
DeltaX1=0.024;% pixel size = 0.024 mm
kkk=(-63:1:64);
% 2.load the LSF data from RawLSF.txt whose size is 128
load RawLSF2.txt;
distance = kkk*DeltaX1;% distance from each pixel to the slit line
LSF = RawLSF2(:)';% intensity of each pixel
% 3. plot the LSF curve
figure(1);
plot(distance,LSF);
title('LSF curve (Sampling Interval=0.024mm)');
xlabel('distance');
ylabel('Intensity');
print (figure(1),'LSF Curve','-dpng');
% 4. calculate the MTF by taking the complex magnitude of the fft of LSF
MTF = abs(fft(LSF));
figure(2), plot(MTF);
title('MTF Curve');
print (figure(2),'MTF Curve','-dpng');
%5. Shift MTF curve
MTF=fftshift(MTF);
figure(3), plot(kkk,MTF);
title('Shift MTF Curve');
print (figure(3),'Shift MTF Curve','-dpng');
% 6. save the positive frequency part of the MTF
N=length(MTF);
MTF = MTF(floor(N/2)+1:N);
% 7. Normalize the MTF by dividing the MTF by its zero-frequency element
MTF = MTF/MTF(1);
figure(4);
plot(MTF);
title('Normalize MTF');
print (figure(4),'Normalized MTF','-dpng');
% 8. calculate the spatial frequency from the pixel size and the point
% number
f = (0:floor(N/2)-1)/(N/2)/(2*DeltaX1); % spatial frequency, linepair/mm
% the Nyquist frequency is set as the max frequency
% 9. plot the MTF vs frquency curve
figure(5);
plot(f,MTF,'-k');
xlabel('Spatial Frequency (linepair/mm)');
title('Modulation Transfer Function');
print (figure(5),'MTF final','-dpng');