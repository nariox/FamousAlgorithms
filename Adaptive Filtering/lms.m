function[w,y,e,J,w1]=lms(x,dn,mu,M)
%function[w,y,e,J,w1]=lms(x,dn,mu,M,eps)
% Least Mean Squares filter
% x = input data
% dn = desired signal (must be same of same size as x)
% M = filter length
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
    w=w+mu*e(n)*x1;
    w1(n,:)=w(:,1)';
end

J=e.^2;


