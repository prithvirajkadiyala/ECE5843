%1. For pixel size = 0.048 mm
% 1.clear up the workspace and define the pixel size
clear;clc;close all;
DeltaX1=0.048;% pixel size = 0.048 mm
kkk=(-63:1:64);
% 2.load the LSF data from RawLSF.txt whose size is 128
load RawLSF1.txt;
distance = kkk*DeltaX1;% distance from each pixel to the slit line
LSF = RawLSF1(:)';% intensity of each pixel
% 3. plot the LSF curve
figure;
plot(distance,LSF);
title('LSF curve (Sampling Interval=0.048mm)');
xlabel('distance');
ylabel('Intensity');
% 4. calculate the MTF by taking the complex magnitude of the fft of LSF
MTF = abs(fft(LSF));
figure, plot(MTF);
%5. Shift MTF curve
MTF=fftshift(MTF);
figure, plot(kkk,MTF);
% 6. save the positive frequency part of the MTF
N=length(MTF);
MTF = MTF(floor(N/2)+1:N);
% 7. Normalize the MTF by dividing the MTF by its zero-frequency element
MTF = MTF/MTF(1);
figure, plot(MTF);
% 8. calculate the spatial frequency from the pixel size and the point
% number
f = (0:floor(N/2)-1)/(N/2)/(2*DeltaX1); % spatial frequency, linepair/mm
% the Nyquist frequency is set as the max frequency
% 9. plot the MTF vs frquency curve
figure;
plot(f,MTF,'-k');
xlabel('Spatial Frequency (linepair/mm)');
title('Modulation Transfer Function');