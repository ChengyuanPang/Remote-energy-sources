function [B]=runmean(A,bi,bj,type)
%=================================================
%   Runmean averaging of a vector or a matrix
%
%   Use [B]=runmean(A,bi,bj,type)
%
%       'A'  - input marix
%       'bi' - block size
%       'bj' - block size
%     'type' - type: 0  - 1D or 2D in both dimensions
%                   DIM - 2D along dimension DIM
%                    3  - same as type==1, but preserving number of grid points
%=================================================          

[nj,ni] = size(A);

if (type==0)
B = zeros(nj+1-bj,ni+1-bi);
for i = 1:(ni+1-bi)
for j = 1:(nj+1-bj)
C = A(j:(j+bj-1),i:(i+bi-1));
B(j,i)=nanmean(C(:));
end
end
end

if (type==1)
B = zeros(nj+1-bj,ni);
for j = 1:(nj+1-bj)
C = A(j:(j+bj-1),:);
B(j,:)=nanmean(C);
end
end

if (type==2)
B = zeros(nj,ni+1-bi);
for i = 1:(ni+1-bi)
C = A(:,i:(i+bi-1));
B(:,i)=nanmean(C')';
end
end

if (type==3)
B = zeros(size(A));
for i = 1:ni
for j = 1:nj
C = A(max(j-bj,1):min(j+bj,nj),max(i-bi,1):min(i+bi,ni));
B(j,i)=nanmean(C(:));
end
end
end

