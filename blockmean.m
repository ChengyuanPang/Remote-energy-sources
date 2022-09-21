function [B] = blockmean(A,bi,bj)
%=================================================
%   Block averaging of a vector or a matrix
%
%   Use [Aout] = blockmean(A,bi,bj)
%
%       'A'  - input marix
%       'bi' - block size
%       'bj' - block size
%=================================================          

[nj,ni] = size(A);

B = zeros(nj/bj,ni/bi);

for i = 1:ni/bi
for j = 1:nj/bj

C = A( (j-1)*bj+1:j*bj , (i-1)*bi+1:i*bi );

B(j,i) = nanmean(C(:));

end
end
