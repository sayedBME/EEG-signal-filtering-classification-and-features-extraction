clc
clear all
close all
x1=edfread('Normal_people_eeg_data.edf');
x=x1.EEGC3_Ref{1,1};
x=x(1:160,1);
n=220;
y1=zeros(1,length(x));
subplot 211
plot (x,'r')
title('Origjnal EEG Signal')
hold on;
len=length(x);
for n=4:len
 y1(n)= x(n)+2*x(n-1)+2*x(n-2)+x(n-3)+2*y1(n-1);
end
subplot 212
plot(y1,'r')
title('Filtered EEG signal using FIR filter')
axis([0 300 0 inf])

