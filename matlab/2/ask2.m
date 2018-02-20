
[voice,f,b]=wavread('s022ad165');

v=buffer(voice,480,320,'nodelay');

p=load('pitch');

p=p.pitch;


 for n = 1:569
     if p(n) == 0
         input(:,n)=2.*(rand(480,1)-0.5);
     else
         input(:,n)=zeros(480,1); 
         for o=1:480
           if mod(o,round(16000./p(n)))==0  
            input(o,n)=1;
           end 
         end
     end     
 end    
for n=1:569
    s=v(:,n).*hamming(480);
    ak=lpc(s,30);
    er=filter([0 -ak(2:end)],1,s);
    er=s-er;
    G= sqrt(sum(er.^2));
    
    output(:,n)=filter(G,[1 ak(2:end)],input(:,n));
    
end


 crv = zeros(92000,1); %created voice
 for n = 1:569
    for o=1:480
      crv(160.*(n-1)+o) =   crv(160.*(n-1)+o) + output(o,n);
    end
 end    
 
 
 
wavwrite(crv,16000,16,'createdvoice.wav');
wavwrite(crv,32000,16,'funnyvoice.wav');
figure
spectrogram(voice,480,320,2048,16000)
figure
spectrogram(crv,480,320,2048,16000)


