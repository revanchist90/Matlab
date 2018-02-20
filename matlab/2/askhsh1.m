 voice=wavread('s022ad165');
 music=wavread('music');
 x1=linspace(0,5.72,91510);
 figure
 plot(x1,voice)
 x2=linspace(0,5.59,246535);
 figure
 plot(x2,music)
 s1=voice(65590:66069);%480 deigmata dhladh 30 ms mhkos
  x1=linspace(0,30,480);
 figure
 plot(x1,s1)
 s2=music(46000:47322);%1323 deigmata dhladh 30 ms mhkos
  x2=linspace(0,30,1323);
 figure
 plot(x2,s2)
 
 
 