clc
clear all
close all
x1=edfread('Epileptic_patient_EEG_data.edf');
x=x1.C3__{1,1};x=x(1:160,1);n=220;
subplot 331;plot(x,'r');
title('Raw EEG signal');y1=[];y2=[];e=[];sum=0;
len1=length(x);
for i=1:len1
 for j=1:i-1
 y1(i)=x(i-j);sum=sum+y1(i);
 end
 y2(i)=sum;e(i)=x(i)-y2(i);som=0;
 y3(i)=y2(i)+e(i);
end
ar=y3;subplot 332;plot(y2);
grid on;title('1st sum of AR');
subplot 333;plot(e);grid on;
title('Error(e) EEG signal');
subplot 334;plot(y3);grid on;
title('AR coefficient');
c=0.0001/500;d=3/500;
[b,a]=butter(3,[c,d]);
Delta=filter(b,a,ar);
subplot 335;plot(Delta);title('Delta');
%Theta
c=4/500;d=8/500;[b,a]=butter(3,[c,d]);Theta=filter(b,a,ar);
subplot 336;plot(Theta);title('Theta');
%Alpha
c=8/500;d=13/500;[b,a]=butter(3,[c,d]);
Alpha=filter(b,a,ar);subplot 337;plot(Alpha);title('Alpha');
%Beta
c=14/500;d=30/500;[b,a]=butter(3,[c,d]);Beta=filter(b,a,ar);
subplot 338;plot(Beta);title('Beta');



