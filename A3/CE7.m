%7b 
C1 = mvnrnd([1 0], eye(2), 100);
C2 = mvnrnd([-1 0], eye(2), 100);

figure()
hold on 
plot(C1(:,1), C1(:,2), 'k*')
plot(C2(:,1), C2(:,2), 'r*')
title('7b Visualization')
clear all 

%7c 
SEVENc_er = error_rate(100) 

%7d 
n = [100:100:1000]; 
ov = zeros(size(n));
for i = 1:length(n)
    ov(i) = error_rate(n(i))
    %vals = vals + [i, pn];
end

figure()
plot(n,ov,'-k*', 'LineWidth', 1.5)
ylim([0.1,0.25])
grid
title('7d - Error vs Sample Size')
xlabel('Sample Size (n)')
ylabel('Empirical Error')



    
