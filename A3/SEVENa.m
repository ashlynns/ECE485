%7a 
function [y] = SEVENa(mu, sigma, n)
    d = length(mu); 
    [phi, lam] = eig(sigma);
    w = randn(d, n);
    y = phi*sqrt(lam)*w+mu*ones(1,n); 
end 
    