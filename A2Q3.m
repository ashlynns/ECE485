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
% x1 = [10,2];
% x2 = [-3,4];
% x3 = [2,2];
% x4 = [5,-7];
% 
% x1_class = [mahal(x1,class1), mahal(x1,class2), mahal(x1,class3)]
% x2_class = [mahal(x2,class1), mahal(x2,class2), mahal(x2,class3)]
% x3_class = [mahal(x3,class1), mahal(x3,class2), mahal(x3,class3)]
% x4_class = [mahal(x4,class1), mahal(x4,class2), mahal(x4,class3)]

%3c
% figure()
% title('3c')
% hold on
% plot(class1(:,1), class1(:,2), '+')
% plot(class2(:,1), class2(:,2), '+')
% plot(class3(:,1), class3(:,2), '+')
% plot(x1(1),x1(2),'ro', 'Linewidth',3) 
% plot(x2(1),x2(2),'gx', 'Linewidth',3)
% plot(x3(1),x3(2),'bs', 'Linewidth',3)
% plot(x4(1),x4(2),'md', 'Linewidth',3)
% legend('Class1', 'Class2', 'Class3', 'x1', 'x2', 'x3', 'x4')
% c1_2c = c_plot(class1)
% c2_2c = c_plot(class2)
% c3_2c = c_plot(class3)

%3e 
% syms x1 x2

% a1 = ((2*pi*sqrt(det(cov_c1)))^-1);
% b1 = (-0.5*([x1 x2]-mean_c1)*inv(cov_c1)*transpose([x1 x2]-mean_c1));
% gaus_c1 = a1*exp(b1);
% 
% a2 = ((2*pi*sqrt(det(cov_c2)))^-1);
% b2 = (-0.5*([x1 x2]-mean_c2)*inv(cov_c2)*transpose([x1 x2]-mean_c2));
% gaus_c2 = a2*exp(b2);
% 
% a3 = ((2*pi*sqrt(det(cov_c3)))^-1);
% b3 = (-0.5*([x1 x2]-mean_c3)*inv(cov_c3)*transpose([x1 x2]-mean_c3));
% gaus_c3 = a3*exp(b3);
% 
% c1_c2 = gaus_c1 - gaus_c2;
% vpa(c1_c2,3)
% 
x1 = -6 : 0.1 : 6;
x2 = -15 : 0.1 : 15;
plot_gaus(x1, x2, cov_c1, mean_c1, cov_c2, mean_c2, class1, class2, '3e - Class 1 & 2');

x1 = -6 : 0.1 : 6;
x2 = -6 : 0.1 : 12;
plot_gaus(x1, x2, cov_c1, mean_c1, cov_c3, mean_c3, class1, class3, '3e - Class 1 & 3');

x1 = -6 : 0.1 : 6;
x2 = -12 : 0.1 : 10;
plot_gaus(x1, x2, cov_c2, mean_c2, cov_c3, mean_c3, class2, class3, '3e - Class 2 & 3');

% 
% c1_c2 = gaus_c1 == gaus_c2;
% vpa(c1_c2,3)
% sol_c1_c2 = isolate(c1_c2, x2);
% vpa(sol_c1_c2, 3)
% c1_c2_sol_ = 0.651*(12.4*x1^2 - 52.3*x1 + 63.5)^(1/2) - 2.12*x1 + 10.3;

% c1_c3 = gaus_c1 == gaus_c3;
% sol_c1_c3 = isolate(c1_c3, x2); 
% vpa(sol_c1_c3, 3)
% c1_c3_sol_ = 1.22*(3.44*x1^2 - 67.5*x1 + 347.0)^(1/2) - 2.55*x1 + 25.3;
% 
% c2_c3 = gaus_c2 == gaus_c3;
% sol_c2_c3 = isolate(c2_c3, x2);
% vpa(sol_c2_c3, 3)
% c2_c3_sol_= 1.4*(2.99*x1^2 + 17.9*x1 + 14.0)^(1/2) - 1.63*x1 - 7.03
% 
% figure()
% title('3e - Class 1 & 2')
% hold on
% plot(class1(:,1), class1(:,2), 'k+', 'Linewidth', 1.5)
% plot(class2(:,1), class2(:,2), 'ko', 'Linewidth', 1.5)
% % legend('Class1', 'Class2')
% c1_2c = c_plot(class1)
% c2_2c = c_plot(class2)
% contour(x1, x2, c1_c2, [0 0]);
% %fplot(c1_c2_sol_)

% figure()
% title('3e - Class 1 & 3')
% hold on
% plot(class1(:,1), class1(:,2), 'k+', 'Linewidth', 1.5)
% plot(class3(:,1), class3(:,2), 'k*', 'Linewidth', 1.5)
% %legend('Class1', 'Class3')
% % %c1_2c = c_plot(class1)
% % %c3_2c = c_plot(class3)
% fplot(c1_c3_sol_)
% 
% figure()
% title('3e - Class 2 & 3')
% hold on
% plot(class3(:,1), class3(:,2), 'k*', 'Linewidth', 1.5)
% plot(class2(:,1), class2(:,2), 'ko', 'Linewidth', 1.5)
% % legend('Class2', 'Class3')
% % c2_2c = c_plot(class2)
% % c3_2c = c_plot(class3)
% fplot(c2_c3_sol_)


   