I=imread('board.tif') ;
I=rgb2gray(I);
WN=imnoise(I,'salt & pepper',0.15);
F1=medfilt2(WN,[5 5]);
F2=adpmedian(WN,7);
Img1=I(200:250,10:60);
Img2=WN(200:250,10:60);
Img3=F1(200:250,10:60);
Img4=F2(200:250,10:60);
Img1=imresize(Img1, 10, 'nearest');
Img2=imresize(Img2, 10, 'nearest');
Img3=imresize(Img3, 10, 'nearest');
Img4=imresize(Img4, 10, 'nearest');
figure ,imshow(Img1)
figure ,imshow(Img2)
figure ,imshow(Img3)
figure ,imshow(Img4)
S1=snr(I,WN)
S2=snr(I,F1)
S3=snr(I,F2)