function[distance] = Euclidian_distance_CE1c(pt1, pt2)
    % Input points should be a rx1 vector 
    
    [r1, c1] = size(pt1);
    [r2, c2] = size(pt2);
    
    % Make sure points are in the right format & of the same dimensionality
    if c1 == c2 == 1 && r1 == r2
        % Initialize value under sqrt of euclidian distance
        sqrt_val = 0;
        % Generate value under sqrt of euclidian distance
        for i = 1:r1
            sqrt_val = sqrt_val + (pt1(i)-pt2(i))^2;
        end 
        distance = sqrt(sqrt_val); 
    
    % Error message incase points are provided incorrectly 
    else
        distance = "Inproper Points. Points are expected as 2 rx1 vectors";  
    end  
end 
    