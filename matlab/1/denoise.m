function   [SNR_0, SNR_G, SNR_S] = denoise(I, s)
N=IMNOISE(I,'gaussian',0,s^2);
g = fspecial('gaussian',11,2);
[f1,f2] = freqspace(11, 'meshgrid');
Hd = zeros(11);
Hd(sqrt(f1.^2 + f2.^2) < 0.5) = 1;
h = fsamp2(Hd);
SNR_0=snr(I,N);

filtg=freqfilt(N,g);

SNR_G=snr(I,filtg);

filth=freqfilt(N,h);

SNR_S=snr(I,filth);

end

