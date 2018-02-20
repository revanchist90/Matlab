 voice=wavread('s022ad165');
 s1=voice(65590:66069);%480 deigmata dhladh 30 ms mhkos
  h=hamming(480);
  s1=s1.*h;
  ak =lpc(s1,20); %20 =16 +4
  ak2=lpc(s1,100);
  er=filter([0 -ak(2:end)],1,s1);
  er=s1-er;
   er2=filter([0 -ak2(2:end)],1,s1);
  er2=s1-er2; 
  y =  (fft(er))  ;
  y2=(fft(er2))  ;
  y=fftshift(y);
  y=abs(y);
  y2=fftshift(y2); 
  y2=abs(y2);
   figure
   x=linspace(-pi,pi,480);
   plot(x,y,x,y2,'m')
   figure
    autocorr(er)
    figure
    autocorr(er2)
    G=sqrt(sum(er.^2 ) );
    G2=sqrt(sum(er2.^2 ) );
    W=linspace(0,pi,240);
    Hlpc =freqz(G,ak,W);
    Hlpc=20*log10(abs(Hlpc));
    H=fft(s1);
    H=20*log10(abs(H(1:240)));
    figure
    plot(W,H,W,Hlpc,'m')
     Hlpc =freqz(G2,ak2,W);
      Hlpc=20*log10(abs(Hlpc));
       figure
    plot(W,H,W,Hlpc,'m')
     
    
   