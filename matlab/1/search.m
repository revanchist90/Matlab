function [result, dist] = search(query, list, W, desc_func)
if(nargin < 3 | isempty(W) | ~W), W = inf; end
if(nargin < 4), desc_func = 'scd'; end
if(nargin < 5), param = []; end
% initialize distance vector (list length)
d=zeros(length(list));
N=length(list);
% distance function corresponding to given descriptor function
dist_func = [desc_func '_dist'];
% process query image
 I = im2double(imread(query));
des=feval(desc_func,I);
% loop over database images
for i=1:N
I = im2double(imread(list(i).name));
des2=feval(desc_func,I);
d(i)=feval(dist_func,des,des2);
end
[dist,ix]=sort(d);
% keep first W elements for given window
if W~=inf
    dist=dist(1:end);
end
result=[];
for i=1:size(dist,1)
  result=[result list(ix(i))];
end
end
