function [SNR_Dz,CR_Dz]=idct_zigzag(Z_Y,Z_Cb,Z_Cr,I)


  iY=blkproc(Z_Y, [8 8], 'idct2');
  iCb=blkproc(Z_Cb, [8 8], 'idct2');
  iCr=blkproc(Z_Cr, [8 8], 'idct2');
  
  iYCbCr(:,:,1) = iY;
  iYCbCr(:,:,2) = iCb;
  iYCbCr(:,:,3) = iCr;
  
  I2= ycbcr2rgb(iYCbCr);
  SNR_Dz=snr(I,I2-I);
  
  N=0;
  for i=1:362
      for j=1:500
          if Z_Y(i,j)~=0
              N=N+1;
          end
          if Z_Cb(i,j)~=0
              N=N+1;
          end
          if Z_Cr(i,j)~=0
              N=N+1;
          end
      end
  end
  
  CR_Dz=(362*500*3)/N;
end  