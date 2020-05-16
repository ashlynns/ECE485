function[distance] = mahalanobis_distance_CE1d(mu, sigma, pt)
    % Calculate the mahalanobis distance to a given point 
    % pt and mu expected as rx1 vectors
    
    [r_pt, c_pt] = size(pt);
    [r_mu, c_mu] = size(mu);
    [r_sigma, c_sigma] = size(sigma);
    
    % Make sure dimensionality is correct 
    if r_pt == r_mu && r_mu == r_sigma && r_sigma == c_sigma && c_pt == c_mu ==1
        % (x-mu)
        ptmmu = pt - mu; 
        % r^2 = (x-mu)'*sigma^-1*(x-mu)
        sqrt_val = ptmmu'*inv(sigma)*ptmmu;
        % r = sqrt((x-mu)'*sigma^-1*(x-mu))
        distance = sqrt(sqrt_val);
    
    % Error message incase dimensionality is incorrect 
    else 
        distance = "Dimensionality Error.Pt and mu expected as rx1 vectors, sigma expected as rxr matrix ";
        
    end 
end 