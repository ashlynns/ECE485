function[bat_bound] = bhattacharyya_bound_CE2c(w1, w2, P_w1, P_w2)
 % w1 and w2 are the datasets from the respective classes, expected format
 % is that each column is a point & number of rows = number of dimensions.
    
    % Deriving covarriance matrix from the data 
    sigma_w1 = cov(w1'); 
    sigma_w2 = cov(w2'); 
    
    % Deriving mean from the data 
    mu_w1 = mean(w1')'; 
    mu_w2 = mean(w2')';
    
    k = ((1/8)*(mu_w2-mu_w1)'*(inv((sigma_w1+sigma_w2)/2))*(mu_w2-mu_w1))+(1/2)*log((det((sigma_w1+sigma_w2)/2))/(sqrt(det(sigma_w1)*det(sigma_w2))));
    bat_bound = sqrt(P_w1*P_w2)*exp(-k);
    
end 