%to ask3b ypologizei ton DFT toy shmatos y[n]=w[n].*(x1[n]+x2[n])
%gia diafores times ths syxnothtas w2    alla gia N=512(deigmata DFT)
f1 = rand;
f2 = rand;
N=512;
x=linspace(0,255,256);
w1=pi/10;
wh=hamming(256);
wh=wh' ;
w2 = linspace(pi/5,pi/10,20);%allazoume thn w2 me mikro vhma
x1=1.* exp(1i.*(w1.*x +f1));
for n=1:20
x2=-0.9 .* exp(1i.*(w2(n).*x +f2));
y=wh.*((x1)+(x2));%ypologismos toy shmatos y[n]=w[n].*(x1[n]+x2[n])
H=fft(y,N);
H=abs(H);
W=linspace(0,N-1,N);
figure
plot(W,H)
end