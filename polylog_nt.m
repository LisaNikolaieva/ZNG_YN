function [y] = mypolylog(n,z) 
%% polylog - Computes the n-based polylogarithm of z: Li_n(z)

nsum = 100;
y = zeros(size(z),'like',z);
tmp = ones(size(z),'like',z);

for i=1:nsum
    tmp=tmp.*z; 
    y = y + tmp./i.^n;
end

