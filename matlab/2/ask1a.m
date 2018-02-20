 voice=wavread('s022ad165');
  s1=voice(65590:66069);%480 deigmata dhladh 30 ms mhkos
  h=hamming(480);
  s1=s1.*h;
  x1=linspace(0,479,480);
 figure
 plot(x1,s1)
 cep=rceps(s1);
 window=[ones(1,60) zeros(1,360) ones(1,60)];
  figure
 plot(x1,cep,x1,window)
 window=window';
 ceplow=cep.*window;
 Ft=20.*log10(abs(fft(s1)));
 Ft=Ft(1:240);
 ceplow=20.*log10(abs( exp(fft(ceplow))));
 ceplow=ceplow(1:240);
 x=linspace(0,pi,240);
figure  
 plot(x,Ft,x,ceplow,'m') 
 