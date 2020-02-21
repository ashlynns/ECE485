Data3 = importdata('Data3');

class1 = Data3(1:1000,1:2);
class2 = Data3(1001:2000,1:2);
class3 = Data3(2001:3000,1:2);

%3a 
mean_c1 = mean(class1)
cov_c1 = cov(class1)

mean_c2 = mean(class2) 
cov_c2 = cov(class2) 

mean_c3 = mean(class3) 
cov_c3 = cov(class3)

%3b 
x1 = [10,2];
x2 = [-3,4];
x3 = [2,2];
x4 = [5,-7];

x1_class = [mahal(x1,class1), mahal(x1,class2), mahal(x1,class3)]
x2_class = [mahal(x2,class1), mahal(x2,class2), mahal(x2,class3)]
x3_class = [mahal(x3,class1), mahal(x3,class2), mahal(x3,class3)]
x4_class = [mahal(x4,class1), mahal(x4,class2), mahal(x4,class3)]

%3c
figure()
title('3c')
hold on
plot(class1(:,1), class1(:,2), '+')
plot(class2(:,1), class2(:,2), '+')
plot(class3(:,1), class3(:,2), '+')
plot(x1(1),x1(2),'ro', 'Linewidth',3) 
plot(x2(1),x2(2),'gx', 'Linewidth',3)
plot(x3(1),x3(2),'bs', 'Linewidth',3)
plot(x4(1),x4(2),'md', 'Linewidth',3)
legend('Class1', 'Class2', 'Class3', 'x1', 'x2', 'x3', 'x4')
c1_2c = c_plot(class1)
c2_2c = c_plot(class2)
c3_2c = c_plot(class3)

%3e 
figure()
title('3e - Class 1 & 2')
hold on
plot(class1(:,1), class1(:,2), 'k+', 'Linewidth', 1.5)
plot(class2(:,1), class2(:,2), 'ko', 'Linewidth', 1.5)
legend('Class1', 'Class2')
c1_2c = c_plot(class1)
c2_2c = c_plot(class2)

figure()
title('3e - Class 1 & 3')
hold on
plot(class1(:,1), class1(:,2), 'k+', 'Linewidth', 1.5)
plot(class3(:,1), class3(:,2), 'k*', 'Linewidth', 1.5)
legend('Class1', 'Class3')
c1_2c = c_plot(class1)
c3_2c = c_plot(class3)

figure()
title('3e - Class 2 & 3')
hold on
plot(class3(:,1), class3(:,2), 'k*', 'Linewidth', 1.5)
plot(class2(:,1), class2(:,2), 'ko', 'Linewidth', 1.5)
legend('Class2', 'Class3')
c2_2c = c_plot(class2)
c3_2c = c_plot(class3)

function c = c_plot(set) 
    mu = mean(set);
    sigma = cov(set);
    [v,d] = eig(sigma);
    
    e_vec1 = v(:,1);
    e_vec2 = v(:,2);
    
    e_val1 = sqrt(d(1));
    e_val2 = sqrt(d(4));
    
    hold on;
    v1 = mu +(e_vec1.'*e_val1);
    v2 = mu+(e_vec2.'*e_val2);
    plot([mu(1) v1(1)], [mu(2) v1(2)],'k', 'Linewidth', 2)
    plot([mu(1) v2(1)], [mu(2) v2(2)],'k', 'Linewidth', 2)
    
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
    plot(X,Y,'k', 'Linewidth', 2)
    
    x = 2*a*cos(phi);
    y = 2*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y,'k', 'Linewidth', 2)
    
    x = 3*a*cos(phi);
    y = 3*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y,'k', 'Linewidth', 2)
    
    c= 0;
end 



   