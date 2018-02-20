%askhsh 4 mono pou afth thn fora to mikos parathirou einai 25ms
x=wavread('sx41'); %diavasma arxeiou
wh=hamming(400);%reithmos deigmatolipsias =16000 
%ara samples = 16000*25 *10^(-3)=400 
%gia na petyxoume parathyro hamming diarkeias 25 ms
%parathroume apoton orismo oti h energeia vraxeos xronou einai
% h synelijh dyo shmatwn tou w^2 kai tou x^2
x2=x.^2;
wh2=wh.^2;
Energy=conv(x2,wh2); %ypolgismos Energeias
N=length(Energy);
p=0:(N-1);
figure
plot(p,Energy)
s=[x;0];
s1=sign(s);    %ypologismos rythmou enalaghs proshmou
s=[0; x];
s2=sign(s);
A=abs(s1-s2);
ze_cr_rate = conv(A,wh); %parathroume oti pali exoume sineliksh shmatwn
N=length(ze_cr_rate);
p=0:(N-1);
figure
plot(p,ze_cr_rate)