w1_x1 = [10, 0, 5]; 
w1_x2 = [0, -10, -2]; 

w2_x1 = [5, 0 ,5]; 
w2_x2 = [10, 5, 5]; 

w3_x1 = [2, -5, 10]; 
w3_x2 = [8, 2, -4]; 

% Boundary information about provided data
min_x1 = min([w1_x1 w2_x1 w3_x1]);
max_x1 = max([w1_x1 w2_x1 w3_x1]);
x1_values = min_x1:1:max_x1;

% Sample mean class 1
w1_x1_mean = mean(w1_x1);
w1_x2_mean = mean(w1_x2);

% Sample mean class 2
w2_x1_mean = mean(w2_x1);
w2_x2_mean = mean(w2_x2);

% Sample mean class 2
w3_x1_mean = mean(w3_x1);
w3_x2_mean = mean(w3_x2);

% Midpoint between sample means of class 1 and 3 (point boundary must cross)
x1_13_mid = (w1_x1_mean + w3_x1_mean)/2;
x2_13_mid = (w1_x2_mean + w3_x2_mean)/2;

% Midpoint between sample means of class 2 and 3 (point boundary must cross)
x1_23_mid = (w2_x1_mean + w3_x1_mean)/2;
x2_23_mid = (w2_x2_mean + w3_x2_mean)/2;

% Vector between sample means of class 1 and 3
x1_13_vec = w1_x1_mean - w3_x1_mean;
x2_13_vec = w1_x2_mean - w3_x2_mean;

% Vector between sample means of class 2 and 3
x1_23_vec = w2_x1_mean - w3_x1_mean;
x2_23_vec = w2_x2_mean - w3_x2_mean;

% Slope of line orthogonal to vector between means of class 1 and 3
boundary_13_slope = x1_13_vec/-x2_13_vec
boundary_13 = zeros(1,length(x1_values));

% Slope of line orthogonal to vector between means of class 2 and 3
boundary_23_slope = x1_23_vec/-x2_23_vec
boundary_23 = zeros(1,length(x1_values));

% Generating boundary values
for i= 1:length(x1_values)
    x1_value = x1_values(i);
    boundary_13(i) = boundary_13_slope*(x1_value - x1_13_mid)+x2_13_mid;
    boundary_23(i) = boundary_23_slope*(x1_value - x1_23_mid)+x2_23_mid;
end

% Ensuring that boundary is orthogonal to vector between means of class 1 and 3
pt_vec_13 = [x1_13_vec, x2_13_vec];
bound_vec_13 = [max_x1-min_x1, boundary_13(length(x1_values))-boundary_13(1)];
check_13 = dot(pt_vec, bound_vec)

% Ensuring that boundary is orthogonal to vector between means of class 2 and 3
pt_vec_23 = [x1_23_vec, x2_23_vec];
bound_vec_23 = [max_x1-min_x1, boundary_23(length(x1_values))-boundary_23(1)];
check_23 = dot(pt_vec_23, bound_vec_23)


if check_13 < 0.001 && check_23 < 0.001
    
    hold on;
    % Plot given data points
    plot(w1_x1, w1_x2, '*b', 'Linewidth', 1)
    plot(w2_x1, w2_x2, '*r', 'Linewidth', 1)
    plot(w3_x1, w3_x2, '*g', 'Linewidth', 1)
    
    % Plot means
    plot(w1_x1_mean, w1_x2_mean, '*b', 'Linewidth', 4)
    plot(w2_x1_mean, w2_x2_mean, '*r', 'Linewidth', 4)
    plot(w3_x1_mean, w3_x2_mean, '*g', 'Linewidth', 4)
    
    % Plot boundary
    plot(x1_values, boundary_13,'-.k', 'Linewidth', 2)
    plot(x1_values, boundary_23,'--k', 'Linewidth', 2)
    title('9d - w1, w2 and w3')
    
    %plot(x1_mid, x2_mid, '*b', 'Linewidth', 2)
    %plot([w2_x1_mean,w1_x1_mean],[w2_x2_mean,w1_x2_mean], 'g', 'Linewidth', 2)
    
    
end

