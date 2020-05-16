w1_x1 = [10, 0, 5]; 
w1_x2 = [0, -10, -2]; 

w2_x1 = [5, 0 ,5]; 
w2_x2 = [10, 5, 5]; 

w3_x1 = [2, -5, 10]; 
w3_x2 = [8, 2, -4]; 

%9a - w1 and w2  
A = nearest_mean(w1_x1, w1_x2, w2_x1, w2_x2, '9a - w1 and w2');

%9b - w1 and w3 
B = nearest_mean(w1_x1, w1_x2, w3_x1, w3_x2, '9b - w1 and w3');

%9c - w2 and w3 
C = nearest_mean(w2_x1, w2_x2, w3_x1, w3_x2,'9c - w2 and w3');