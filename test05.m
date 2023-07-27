clc
clear all
close all
x1=edfread('Epileptic_patient_EEG_data.edf');
x=x1.C3__{1,1};x=x(1:160,1);n=220;
subplot 331;plot(x,'r');
title('Raw EEG signal');
len=length(x);y1=zeros(1,len);
for n=4:len
 y1(n)=x(n)+0.6*y1(n-1)-0.2*y1(n-3);
end
ARMA=y1;subplot 332;
plot(y1);grid on;title('ARMA coefficient');
%Delta
c=0.0001/500;d=3/500;[b,a]=butter(3,[c,d]);
Delta=filter(b,a,ARMA);subplot 333
plot(Delta);title('Delta');
%Theta
c=4/500;d=8/500;
[b,a]=butter(3,[c,d]);Theta=filter(b,a,ARMA);
subplot 334;plot(Theta);title('Theta');
%Alpha
c=8/500;d=13/500;
[b,a]=butter(3,[c,d]);Alpha=filter(b,a,ARMA);
subplot 335;plot(Alpha);title('Alpha');
%Beta
c=14/500;d=30/500;
[b,a]=butter(3,[c,d]);
Beta=filter(b,a,ARMA);
subplot 336
plot(Beta);
title('Beta');



