function J = freqfilt(I, h)
[M, N] = size(I);
F = fft2(I, M+10, N+10);
H = fft2(h, M+10, N+10);
J = abs(ifft2(F.*H)); J = J(6:end-5, 6:end-5);
end

