clc
clear all
close all
x1=edfread('Epileptic_patient_EEG_data.edf');
x=x1.C3__{1,1};
x=x(1:160,1);
n=220;
y1=zeros(1,length(x));
wavelet_Function= 'db8';
[C,L]= wavedec(x,8,wavelet_Function);
CD1=detcoef(C,L,1);CD2=detcoef(C,L,2);
CD3=detcoef(C,L,3);CD4=detcoef(C,L,4);
CD5=detcoef(C,L,5);CD6=detcoef(C,L,6);
CD7=detcoef(C,L,7);CD8=detcoef(C,L,8);
CA8=appcoef(C,L,wavelet_Function,8);
subplot(10,1,1)
plot(CD1);
subplot(10,1,2)
plot(CD2);
subplot(10,1,3) 
plot(CD3);
subplot(10,1,4) 
plot(CD4);
subplot(10,1,5) 
plot(CD5);
subplot(10,1,6) 
plot(CD6);
subplot(10,1,7) 
plot(CD7);
subplot(10,1,8) 
plot(CD8);
subplot(10,1,9) 
plot(CA8);
subplot(10,1,10) 
plot(x,'r');


