function[pzn_density] = pzn_window(pt, h, training_data)
    pzn_density = 0; 
    [r,c] = size(training_data); 
    
    for i = 1:c
        y = pt - training_data(:,1);
        pzn_density = pzn_density + (2*pi)^(-r/2)*h^(-r)*exp(-y'*y/(2*h^2));
    end 
    
    pzn_density = pzn_density/c; 
     
end 
    
    
    