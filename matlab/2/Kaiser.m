function Hd = Kaiser
%KAISER Returns a discrete-time filter object.

%
% M-File generated by MATLAB(R) 7.10 and the Signal Processing Toolbox 6.13.
%
% Generated on: 21-Jun-2011 11:41:44
%

% FIR Window Highpass filter designed using the FIR1 function.

% All frequency values are normalized to 1.

Fstop = 0.49;           % Stopband Frequency
Fpass = 0.5;            % Passband Frequency
Dstop = 0.001;          % Stopband Attenuation
Dpass = 0.11462326752;  % Passband Ripple
flag  = 'scale';        % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fstop Fpass], [0 1], [Dpass Dstop]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

% [EOF]
