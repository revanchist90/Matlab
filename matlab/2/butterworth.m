function Hd = butterworth
%BUTTERWORTH Returns a discrete-time filter object.

%
% M-File generated by MATLAB(R) 7.10 and the Signal Processing Toolbox 6.13.
%
% Generated on: 21-Jun-2011 10:55:49
%

% Butterworth Highpass filter designed using FDESIGN.HIGHPASS.

% All frequency values are normalized to 1.

Fstop = 0.49;        % Stopband Frequency
Fpass = 0.5;         % Passband Frequency
Astop = 60;          % Stopband Attenuation (dB)
Apass = 2;           % Passband Ripple (dB)
match = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.highpass(Fstop, Fpass, Astop, Apass);
Hd = design(h, 'butter', 'MatchExactly', match);

% [EOF]
