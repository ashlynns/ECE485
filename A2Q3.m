Data3 = importdata('Data3');

class1 = Data3(1:1000,1:2);
class2 = Data3(1001:2000,1:2);
class3 = Data3(2001:3000,1:2);

%3a 
mean_c1 = mean(class1);
cov_c1 = cov(class1);

mean_c2 = mean(class2);
cov_c2 = cov(class2);

mean_c3 = mean(class3); 
cov_c3 = cov(class3);

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
xlabel('x1')
ylabel('x2')
hold on
plot(class1(:,1), class1(:,2), 'k+')
plot(class2(:,1), class2(:,2), 'ko')
plot(class3(:,1), class3(:,2), 'kx')
plot(x1(1),x1(2),'ro', 'Linewidth',3) 
plot(x2(1),x2(2),'gx', 'Linewidth',3)
plot(x3(1),x3(2),'bs', 'Linewidth',3)
plot(x4(1),x4(2),'md', 'Linewidth',3)
legend('Class1', 'Class2', 'Class3', 'x1', 'x2', 'x3', 'x4', 'AutoUpdate','off')
c1_2c = c_plot(class1);
c2_2c = c_plot(class2);
c3_2c = c_plot(class3);

%3e 
x1 = -6 : 0.1 : 6;
x2 = -15 : 0.1 : 15;
plot_gaus(x1, x2, cov_c1, mean_c1, cov_c2, mean_c2, class1, class2, '3e - Class 1 & 2');
legend('Class1', 'Class2', 'Decision Boundary')

x1 = -6 : 0.1 : 6;
x2 = -6 : 0.1 : 12;
plot_gaus(x1, x2, cov_c1, mean_c1, cov_c3, mean_c3, class1, class3, '3e - Class 1 & 3');
legend('Class1', 'Class3', 'Decision Boundary')

x1 = -6 : 0.1 : 6;
x2 = -12 : 0.1 : 10;
plot_gaus(x1, x2, cov_c2, mean_c2, cov_c3, mean_c3, class2, class3, '3e - Class 2 & 3');
legend('Class2', 'Class3', 'Decision Boundary')



   