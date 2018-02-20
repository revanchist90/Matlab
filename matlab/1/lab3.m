clear;
close all;
I=imread('flowers.tif');
I=im2double(I);  
i=0;
for k_Y=2:20
    i=i+1;
    [Z_Y,Z_Cb,Z_Cr]=dct_block(I,k_Y,k_Y/2);
    [SNR_Dz(i),CR_Dz(i)]=idct_zigzag(Z_Y,Z_Cb,Z_Cr,I);
end
L1=1./CR_Dz;
i=0;
for q=0.2:16
    i=i+1;
    [Q_Y,Q_Cb,Q_Cr]=dct_quant(I,q);
    [SNR_Dq(i),CR_Dq(i)]=idct_quant(Q_Y,Q_Cb,Q_Cr,I,q);
end
L2=1./CR_Dq;
plot(L1,SNR_Dz,'r',L2,SNR_Dq,'b') 
 