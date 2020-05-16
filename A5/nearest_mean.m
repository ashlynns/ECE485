function[x] = nearest_mean(c1_x1, c1_x2, c2_x1, c2_x2, fig_title)

    figure();
   
    % Boundary information about provided data 
    min_x1 = min([c1_x1 c2_x1]);
    max_x1 = max([c1_x1 c2_x1]);
    x1_values = min_x1:1:max_x1;
    
    % Sample mean class 1
    c1_x1_mean = mean(c1_x1); 
    c1_x2_mean = mean(c1_x2); 

    % Sample mean class 2
    c2_x1_mean = mean(c2_x1); 
    c2_x2_mean = mean(c2_x2); 
    
    % Midpoint between 2 sample means (point boundary must cross)
    x1_mid = (c1_x1_mean + c2_x1_mean)/2;
    x2_mid = (c1_x2_mean + c2_x2_mean)/2;
    
    % Vector between sample means 
    x1_vec = c1_x1_mean - c2_x1_mean; 
    x2_vec = c1_x2_mean - c2_x2_mean;
    
    % Slope of line orthogonal to vector between means
    boundary_slope = x1_vec/-x2_vec;
    boundary = zeros(1,length(x1_values)); 
    
    % Generating boundary values 
    for i= 1:length(x1_values)
        x1_value = x1_values(i);
        boundary(i) = boundary_slope*(x1_value - x1_mid)+x2_mid; 
    end
    
    % Ensuring that boundary is orthogonal to vector between means 
    pt_vec = [x1_vec, x2_vec];
    bound_vec = [max_x1-min_x1, boundary(length(x1_values))-boundary(1)]; 
    check = dot(pt_vec, bound_vec);
    

    if check < 0.001
        
        hold on; 
        % Plot given data points 
        plot(c1_x1, c1_x2, '*b', 'Linewidth', 1)
        plot(c2_x1, c2_x2, '*r', 'Linewidth', 1)
        
        % Plot means
        plot(c1_x1_mean, c1_x2_mean, '*b', 'Linewidth', 4)
        plot(c2_x1_mean, c2_x2_mean, '*r', 'Linewidth', 4)

        % Plot boundary
        plot(x1_values, boundary,'--k', 'Linewidth', 2)
        title(fig_title)
        
        %plot(x1_mid, x2_mid, '*b', 'Linewidth', 2)
        %plot([c2_x1_mean,c1_x1_mean],[c2_x2_mean,c1_x2_mean], 'g', 'Linewidth', 2)
        
        x = boundary; 
    
    else
        x = 'Check Failed'; 

    end 
end 
    