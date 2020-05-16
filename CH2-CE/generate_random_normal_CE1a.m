function[samples]= generate_random_normal_CE1a(mu, sigma, d, n)
    % d = dimensions 
    % n = number of samples 
    
    % Using matlab function to generate samples 
    samples = normrnd(mu, sigma, d, n); 
end 
