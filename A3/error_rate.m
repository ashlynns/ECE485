%7c 
function[ov] = error_rate(n)
    mu_1 = [1 0]';
    mu_2 = [-1 0]';
    sigma = eye(2);
    
    x1 = SEVENa(mu_1, sigma, n/2);
    x2 = SEVENa(mu_2, sigma, n/2) ;
    
    error = sum(x1(1,:)<0) + sum(x2(1,:)>0); 
    ov = error/n;
end 