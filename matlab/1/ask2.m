b = [0 0.9  ];  %numerator
a=[1 -1.8 0.81]; %denominator
W=linspace(-pi,pi,512);
H =freqz(b,a,W,'whole'); %theloume na doume gia oles tis syxnothtes w apo 0 ews 2ð
%H=fftshift(H);
ab  = abs(H);
ph = phase(H);
figure
plot(W,ab)
figure
plot(W,ph)
th_ab = 0.9./((1+0.81- (1.8 .*cos(W)))); %ypologismos tis theotitikhs timhs toy platous
th_ph = atan((0.6 .*sin(W))./(1+0.6 .*cos(W))); %ypologismos tis theotitikhs timhs thw fashs
figure
plot(W,th_ab)
figure
plot(W,th_ph )