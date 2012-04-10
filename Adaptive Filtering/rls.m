function[w,y,e,J,w1]=rls(x,dn,lambda,M,eps)
%function[w,y,e,J,w1]=rls(x,dn,lambda,M,eps)
% 
% Recursive Least Squares Filter
% x = input data
% dn = desired signal (must be same of same size as x)
% M = filter length
% eps = epsilon
% lambda = forgetting factor
% J = learning curve
% w1 = w samples
% Originally written by Wilder B. Lopes

% Pre-allocating variables
N=length(x);
y=zeros(N,1);
w=zeros(M,1);
e=zeros(N,1);
w1=zeros(N,M);

% Initialize Pi 
Pi=(1/eps)*eye(M); 


for n=M:N
    x1 = x(n:-1:n-M+1);
    
    y(n)=w'*x1;
    e(n)=dn(n)-y(n);
    
    Pi=(1/lambda)*(Pi - ((1/lambda)*Pi*(x1)*(x1')*Pi)/(1+(1/lambda)*(x1')*Pi*(x1))); 
    
    w = w + (Pi*x1*e(n));
    w1(n,:)=w(:,1)';
end

J=e.^2;
