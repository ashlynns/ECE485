u = 5;
o = 10; 
a = -5; 
k = 1/10; 
step = 0.0001;
%x values used for graphing
x = -50:step:50; 
% x values used to calculate D_KL
%x = -50:step:500;
len = length(x);

p1= (1/((sqrt(2*pi))*o))*exp(-((x-u).^2)/((2*o^2)));

p2 = zeros(size(x));
for i = 1 : len
    if x(i) >= a
        p2(i)= k*exp(-k*(x(i)-a));
    end
end

% 1a
close all;
figure();
plot(x,p1, '--', 'LineWidth', 2);
hold on;
plot(x, p2, '-','LineWidth', 2);
legend('Pw1(x)', 'Pw2(x)')
title('1a')

%1b
bi = 0;
min_diff_bi = 1000;

bii = 0;
min_diff_bii = 1000;

biii = 0; 
min_diff_biii = 1000;

for i = 1 : len
    if x(i)>-5 && x(i)< 25
        if abs(p1(i) - p2(i))< min_diff_bi
            min_diff_bi = abs(p1(i) - p2(i));
            bi = x(i);
        end
        if abs(p1(i) - 3*p2(i)) < min_diff_bii
            min_diff_bii = abs(p1(i) - 3*p2(i));
            bii = x(i);
        end
        if abs(3*p1(i) - p2(i)) < min_diff_biii
            min_diff_biii = abs(3*p1(i) - p2(i)); 
            biii =x(i);
        end
    end 
    
end

figure();
plot(x,p1, '--','LineWidth', 2);
hold on;
plot(x, p2, '-','LineWidth', 2);
plot([bi bi], [0 0.1], '-.','LineWidth', 2);
%plot([bii bii], [0 0.1], '-.','LineWidth', 2);
plot([biii biii], [0 0.1], '-.','LineWidth', 2);
legend('Pw1(x)', 'Pw2(x)', '1bi Class Boundary', '1biii Class Boundary')
title('1b')

% 1c 
D_p1p2 = zeros(size(x)); 
D_p2p1 = zeros(size(x));


for i = 1 : length(x)
    if p1(i) == 0 || p2(i) ==0
        D_p1p2(i) = 0;
        D_p2p1(i) = 0;  
    else
        D_p1p2(i) = p2(i)*log((p2(i))/(p1(i)));
        D_p2p1(i) = p1(i)*log((p1(i))/(p2(i)));
    end 
end

DKL_p1p2 = sum(D_p1p2)*step
DKL_p2p1 = sum(D_p2p1)*step


