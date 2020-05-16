function[w1_classifications, w2_classifications] = Two_Class_Dichotomizer_CE2a(w1, w2, P_w1, P_w2)
 % w1 and w2 are the datasets from the respective classes, expected format
 % is that each column is a point & number of rows = number of dimensions.
 % Function returns a vector (length = number of points in provided
 % dataset) that indicates if the dichotomizer classified the point in
 % class 1 or class 2 

    [r_w1, c_w1] = size(w1);
    [r_w2, c_w2] = size(w1);
    
    % Deriving covarriance matrix from the data 
    sigma_w1 = cov(w1'); 
    sigma_w2 = cov(w2'); 
    
    % Deriving mean from the data 
    mu_w1 = mean(w1')'; 
    mu_w2 = mean(w2')';

    % Initializing classification vectors
    w1_classifications = zeros(1,c_w1);
    w2_classifications = zeros(1,c_w2);
    
    for i = 1:length(w1)
        % Calliing the discriminant function for the point in w1 and each class 
        discriminant_w1 = discriminant_function_CE1b(mu_w1, sigma_w1, w1(:,i), P_w1);
        discriminant_w2 = discriminant_function_CE1b(mu_w2, sigma_w2, w1(:,i), P_w2);
        
        % Assigning the pt to a class based on which discriminant value is larger 
        if discriminant_w1>discriminant_w2
            w1_classifications(i) = 1;
        else
            w1_classifications(i) = 2;
        end 
    end 
    

    for i = 1:length(w2)
        
        % Calliing the discriminant function for the point in w1 and each class 
        discriminant_w1 = discriminant_function_CE1b(mu_w1, sigma_w1, w2(:,i), P_w1);
        discriminant_w2 = discriminant_function_CE1b(mu_w2, sigma_w2, w2(:,i), P_w2);
        
        % Assigning the pt to a class based on which discriminant value is larger 
        if discriminant_w1>discriminant_w2
            w2_classifications(i) = 1;
        else
            w2_classifications(i) = 2;
        end 
    end 

end 




    