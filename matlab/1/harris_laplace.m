function points = harris_laplace(I)
% P = harris_laplace(I) returns the Harris-Laplace corners of grayscale image I.
% P is an Nx3 matrix where N is the number of corners extracted.
I = im2double(I); if(ndims(I) == 3), I = rgb2gray(I); end
s_n = 12; s_step = 1.2; s_array = s_step .^ (1:s_n);
harris_pts = harris_multi(I, s_step, s_n);
disp('Laplace')
[lap ,sar] = laplace(I, s_step, s_n);
% keep points where laplacian attains a maximum over scale
points = zeros(0, 3);
for i = 1:size(harris_pts, 1)
   ind = harris_pts(i,3);
   r = harris_pts(i,1);
   c = harris_pts(i,2);
   if ((ind>1) && (ind<s_n))
   if (lap(r,c,ind)>lap(r,c,ind+1))&&(lap(r,c,ind)>lap(r,c,ind-1))
      points=[points;r c ind]; 
   end 
   end
end
% Set scale to 3*sigma for display
points(:,3) = 3 * s_array(points(:,3));
end