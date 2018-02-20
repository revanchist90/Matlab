I=im2double(imread('house.tif'));
S1=zeros(200,1);
S2=zeros(200,1);
S3=zeros(200,1);


for k=1:200
  [a ,b,c]=denoise(I,k/100); 
  S1(k)=a;
  S2(k)=b;
  S3(k)=c;
end  
figure,plot(S1,S1,S1,S2,S1,S3)