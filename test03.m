clc
clear all
close all
x=edfread('Epileptic_patient_EEG_data.edf');
x1=x.C3__{1,1};
x1=x1(1:160,1);n=220;
subplot 331
plot(x1,'r');title('Raw EEG signal');
%delta
c=0.0001/500;d=3/500;
[b,a]=butter(3,[c,d]);
Feature_Delta=filter(b,a,x1);
subplot 332
plot(Feature_Delta);
title('Delta(0.0001Hz to 3Hz)');
%Theta
c=4/500;d=8/500;
[b,a]=butter(3,[c,d]);
Feature_Theta=filter(b,a,x1);
subplot 333
plot(Feature_Theta);
title('Theta(4Hz to 8Hz)');
%Alpha
c=8/500;d=13/500;
[b,a]=butter(3,[c,d]);
Feature_Alpha=filter(b,a,x1);
subplot 334
plot(Feature_Alpha);
title('Alpha(8Hz to 13Hz)');
%Beta
c=14/500;d=30/500;
[b,a]=butter(3,[c,d]);
Feature_Beta=filter(b,a,x1);
subplot 335
plot(Feature_Beta);
title('Beta(14Hz to 30Hz)');


