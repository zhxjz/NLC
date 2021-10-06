%% getnx(X,KID) 对X,Y分别找各自k近邻方向的距离
function nx = getnx(X, KID)
N = size(X,1);
sx = sort(X);
nx = zeros(N,1);
eps = 1e-6;
    for i = 1:N
        xv = X(i);
        d = max(abs(X(KID(i,:))-xv))+eps;
        nx(i) = upperbound(sx, xv+d, N) - lowerbound(sx, xv-d, N) - 1;
    end
end
% %% getnx(X,D) 对X,Y通用D的距离
% function nx = getnx(X, D)
% N = size(X,1);
% sx = sort(X);
% nx = zeros(N,1);
% eps = 1e-6;
%     for i = 1:N
%         xv = X(i);
%         d = D(i)+eps;
%         nx(i) = lowerbound(sx,xv+d,N) - upperbound(sx,xv-d,N) - 1;
%     end
% end
%% upperbound 参考C++ STL源码
function id = upperbound(sx, key, N)
fir = 0;
len = N-1;
while( len > 0 )
    haf = floor(len/2);
    mid = fir + haf;
    if(sx(mid+1) > key)
        len = haf;
    else
        fir = mid + 1;
        len = len - haf - 1;
    end
end
id = fir + 1;
end
%% lowerbound 参考C++ STL源码
function id = lowerbound(sx, key, N)
fir = 0;
len = N-1;
while( len > 0 )
    haf = floor(len/2);
    mid = fir + haf;
    if(sx(mid+1) < key)
        fir = mid + 1;
        len = len - haf - 1;
    else
        len = haf;
    end
end
id = fir + 1;
end