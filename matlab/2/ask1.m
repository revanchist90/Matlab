x=linspace(1,1,24);
[H,W]=dtft(x,240); %240=10*24(input samples)
re = real(H);
im = imag(H);
a = abs(H);
ph = phase(H);
figure
plot(W,re)
figure
plot(W,im)
figure
plot(W,a)
figure
plot(W,ph)
x2=linspace(1,1,31);
[H2,W2]=dtft(x2,310); %310=10*31(input samples)
re2 = real(H2);
im2 = imag(H2);
a2 = abs(H2);
ph2 = phase(H2);
figure
plot(W2,re2)
figure
plot(W2,im2)
figure
plot(W2,a2)
figure
plot(W2,ph2)