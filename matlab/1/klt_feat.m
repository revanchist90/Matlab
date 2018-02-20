function [d, points, R] = klt_feat(I, J, ws, points);
 if (size(I) ~= size(J)), error('input images are not the same size'), end
ws = max(3, ws);
ws=9;
% keep luminance value only
I = im2double(I); if(ndims(I) > 2), I = rgb2gray(I); end
J = im2double(J); if(ndims(J) > 2), J = rgb2gray(J); end

% derivative filters
fx = (1/2) * [-1 1; -1 1];
fy = fx';

% image derivatives
Ix = imfilter((I+J)/2, fx, 'replicate');
Iy = imfilter((I+J)/2, fy, 'replicate');

% frame difference (temporal derivative)
h  = imfilter(I - J, (1/4) * ones(2), 'replicate');

% Gaussian window for averaging
w = fspecial('gaussian', ws, (ws-1)/2);

% components of matrix G
A = imfilter(Ix.^2, w, 'replicate', 'conv'); 
B = imfilter(Iy.^2, w, 'replicate', 'conv');
C = imfilter(Ix.*Iy, w, 'replicate', 'conv');
ex = imfilter(Ix.*h, w, 'replicate', 'conv'); 
ey = imfilter(Iy.*h, w, 'replicate', 'conv');

D=(A-B).^2 +4.*C.^2;
R=0.5.*(A+B-D.^0.5);
[r, c,R2] = local_max(R, 3);
crit=0.15*max(max(R));
new_pt=[];
for i = 1:size(r)
      if R2(r(i),c(i))>crit
          new_pt =[ new_pt ;r(i) c(i)];
      end     
end    

% ... (CONT) ...
% combine new features with pre-existing ones
if(isempty(points) | size(points,1) < 1 |isnan(points(:)))
    % allocate new feature points
    points = new_pt;
else
    % remove new points that overlap previous ones
    valid = zeros(1,size(new_pt,1));
        for k = 1:size(new_pt,1)
         p = ones(size(points,1),1) * new_pt(k,:);
         valid(k) = min(max(abs(p - points)')) > ws;
        end
% append non-overlapping new points to previous ones
    new_pt(~valid, :) = [];
    points = [points; new_pt];
end
% ... (CONT) ...


[x,y]=size(I);
% initialization of displacements
%d = zeros(size(points));
d=[];
for k = 1:size(points,1);
 if isnan(fix(points(k,1)))==0
  if  (points(k,1)>x)||(points(k,2)>y||points(k,1)<1 ||points(k,2)<1)
     points(k,:)=NaN;
  else
   if R(round(points(k,1)),round(points(k,2)))<(0.75*crit)
     points(k,:)=NaN; 
   end 
  end
 end
 if  (isnan(points(k,1))==0)
        i=round(points(k,1));
        j=round(points(k,2));
       % linear system to solve
		H = [A(i,j) C(i,j); C(i,j) B(i,j)];
		e = [ex(i,j) ey(i,j)]';
		d2= pinv(H) * e;
        d=[d;d2(2) d2(1)];
 else
        d=[d;0 0];
 end 
 
end



