% Check Constant Overlap Add Property
M = 33;          % window length
R = (M-1)/2;     % hop size
N = 3*M;         % overlap-add span
w = hamming(M);  % window
z = zeros(N,1);  plot(z,'-k');  hold on;  s = z;
for so=0:R:N-M
  ndx = so+1:so+M;        % current window location
  s(ndx) = s(ndx) + w;    % window overlap-add
  wzp = z; wzp(ndx) = w;  % for plot only 
  so = so + R;            % hop along now
  plot(wzp,'--ok');        % plot just this window
end
plot(s,'ok');  hold off;  % plot window overlap-add
