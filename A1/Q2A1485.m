P_apple = 1/8; 
P_orange = 1/4;
P_pear = 1/2;
P_lemon = 1/8;
Set_A = [P_apple, P_orange, P_pear, P_lemon];

P_heart = 1/6; 
P_diamond = 1/12; 
P_square = 1/4; 
P_triangle = 7/24; 
P_sidetri = 1/6; 
P_star = 1/24; 
Set_B = [P_heart, P_diamond, P_square, P_triangle, P_sidetri, P_star]; 

%2a 
Info_triangle = -log2(P_triangle)
Info_orange = -log2(P_orange)

Ha_values = zeros(size(Set_A));
Hb_values = zeros(size(Set_B));

for i = 1:length(Set_A) 
    Ha_values(i)=Set_A(i)*log2(Set_A(i));
end 

for i = 1:length(Set_B) 
    Hb_values(i)=Set_B(i)*log2(Set_B(i));
end 

%2b 
Ha = -sum(Ha_values)
Hb = -sum(Hb_values)

%2c 
len_a = length(Set_A);
H_max_a = -len_a*(1/len_a)*log2(1/len_a)

len_b = length(Set_B);
H_max_b = -len_b*(1/len_b)*log2(1/len_b)

%2d 
P_d = P_square*P_lemon*P_sidetri*P_apple

%2e 
P_lemon_given_square = 1;
P_lemon_square = P_lemon_given_square*P_square;
P_e = P_lemon_square*P_sidetri*P_apple



