N = 1000; 
mu = [5 5];
p1 = -0.8 ;
p2 = 0.2 ;
p3 = 0.9 ;
sigmax1 = 2;
sigmax2 = 1;
 
%2a 
sigma_set1 = [sigmax1^2 p1*sigmax1*sigmax2; p1*sigmax1*sigmax2 sigmax2^2];
set1 = mvnrnd(mu,sigma_set1, 1000);

sigma_set2 = [sigmax1^2 p2*sigmax1*sigmax2; p2*sigmax1*sigmax2 sigmax2^2];
set2 = mvnrnd(mu,sigma_set2, 1000);

sigma_set3 = [sigmax1^2 p3*sigmax1*sigmax2; p3*sigmax1*sigmax2 sigmax2^2];
set3 = mvnrnd(mu,sigma_set3, 1000);

%2b
figure()
xlabel('x1')
ylabel('x2')
plot(set1(:,1), set1(:,2), 'k+', 'Linewidth', 1.5)
title('2b - Generated Data Set 1')

figure()
xlabel('x1')
ylabel('x2')
plot(set2(:,1), set2(:,2), 'k+', 'Linewidth', 1.5)
title('2b - Generated Data Set 2')

figure()
xlabel('x1')
ylabel('x2')
plot(set3(:,1), set3(:,2), 'k+', 'Linewidth', 1.5)
title('2b - Generated Data Set 3')

%2c
figure()
xlabel('x1')
ylabel('x2')
title('2c -Generated Data Set 1')
ds1_2c = c_plot(set1)

figure()
xlabel('x1')
ylabel('x2')
title('2c -Generated Data Set 2')
ds2_2c = c_plot(set2)

figure()
xlabel('x1')
ylabel('x2')
title('2c -Generated Data Set 3')
ds3_2c = c_plot(set3)


function c = c_plot(set) 
    mu = mean(set);
    sigma = cov(set);
    [v,d] = eig(sigma);
    
    e_vec1 = v(:,1);
    e_vec2 = v(:,2);
    
    e_val1 = sqrt(d(1));
    e_val2 = sqrt(d(4));
    
    hold on;
    plot(set(:,1), set(:,2), 'k+', 'Linewidth', 1.5)
    v1 = mu +(e_vec1.'*e_val1);
    v2 = mu+(e_vec2.'*e_val2);
    plot(mu(1),mu(2), 'ko', 'Linewidth',5)
    plot([mu(1) v1(1)], [mu(2) v1(2)], 'Linewidth', 3)
    plot([mu(1) v2(1)], [mu(2) v2(2)], 'Linewidth', 3)
    
    phi = (0:0.1:2.1*pi);
    
    a = e_val2;
    b = e_val1;
   
    if mu(2)<v2(2)
        theta = acos(dot(e_vec2,[1,0]));
    else 
        theta = -acos(dot(e_vec2,[1,0]));
    end 
    
    x = a*cos(phi);
    y = b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y, 'Linewidth', 3)
    
    x = 2*a*cos(phi);
    y = 2*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y, 'Linewidth', 3)
    
    x = 3*a*cos(phi);
    y = 3*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y, 'Linewidth', 3)
    
    c= 0;
end 
   
    

