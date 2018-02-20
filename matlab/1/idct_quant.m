function [SNR_Dq,CR_Dq]=idct_quant(Q_Y,Q_Cb,Q_Cr,I,q)
  I=im2double(I);
  
  iY=(1/255)*blkproc(Q_Y,[8 8],'iquant_Y',q);
  iCb=(1/255)*blkproc(Q_Cb,[8 8],'iquant_C',q);
  iCr=(1/255)*blkproc(Q_Cr,[8 8],'iquant_C',q);
  
  iY=blkproc(iY,[8 8],'idct2');
  iCb=blkproc(iCb,[8 8],'idct2');
  iCr=blkproc(iCr,[8 8],'idct2');
  
  iYCbCr(:,:,1)=iY;
  iYCbCr(:,:,2)=iCb;
  iYCbCr(:,:,3)=iCr;
  
  I2=ycbcr2rgb(iYCbCr);
  SNR_Dq=snr(I,I2-I);

   N=0;
  for i=1:362
      for j=1:500
          if Q_Y(i,j)~=0
              N=N+1;
          end
          if Q_Cb(i,j)~=0
              N=N+1;
          end
          if Q_Cr(i,j)~=0
              N=N+1;
          end
      end
  end
  
  CR_Dq=362*500*3/N;
end  
  