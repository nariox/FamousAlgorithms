function[w,y,e,J,w1]=nlms(x,dn,mubar,M,eps)
%function[w,y,e,J,w1]=nlnlms(x,dn,mubar,M,eps)
% Normalized Least Mean Squares filter
% x = input data (column-vector)
% dn = desired signal (must be same of same size as x)
% M = filter length
% eps = epsilon
% J = learning curve
% w1 = w samples
% Originally written by Pedro Nariyoshi

% Pre-allocating variables
N=length(x);
y=zeros(N,1);
w=zeros(M,1);
e=zeros(N,1);
w1=zeros(N,M);

for n=M:N
    x1 = x(n:-1:n-M+1);
    y(n)=w'*x1;
    e(n)=dn(n)-y(n);
    step=mubar*e(n)/(eps+x1'*x1);
    w=w+step*x1;
    w1(n,:)=w(:,1)';
end

J=e.^2;


