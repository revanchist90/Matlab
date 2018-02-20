 music=wavread('music');
   s1=music(46000:47322);%1323 deigmata dhladh 30 ms mhkos
  h=hamming(1323);
  s1=s1.*h;
  x1=linspace(0,1322,1323);
 figure
 plot(x1,s1)
 cep=rceps(s1);
 window=[ones(1,100) zeros(1,1123) ones(1,100)];
  figure
 plot(x1,cep,x1,window)
 window=window';
 ceplow=cep.*window;
 Ft=20.*log10(abs(fft(s1)));
 Ft=Ft(1:662);
 ceplow=20.*log10(abs( exp(fft(ceplow))));
 ceplow=ceplow(1:662);
 x=linspace(0,pi,662);
figure  
 plot(x,Ft,x,ceplow,'m') 
 