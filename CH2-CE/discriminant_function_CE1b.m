function [discriminant] = discriminant_function_CE1b(mu, sigma,x, prior_prob) 
    % x = value at which to calculate disctiminant 
    
    [r_x, c_x] = size(x);
    [r_mu, c_mu] = size(mu);
    [r_sigma, c_sigma] = size(sigma);
    
    % Values used to calculate the discriminant
    xmmu = x - mu; 
    invs = inv(sigma); 
    dets = det(sigma); 
    
    % Make sure dimensionality is correct 
    if r_x == r_mu && r_mu == r_sigma && r_sigma == c_sigma && c_x == c_mu ==1
        discriminant = (-0.5*xmmu'*invs*xmmu)-((r_x/2)*log(2*pi))-(0.5*log(dets))+(log(prior_prob)); 
    
    % Error message incase dimensionality is incorrect 
    else 
        discriminant = "Dimensionality Error.X and mu expected as rx1 vectors, sigma expected as rxr matrix ";
    end 

end 

