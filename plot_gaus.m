function plot_gaus(x1, x2, cov_c1, mean_c1, cov_c2, mean_c2, class1, class2, tit)   
    c1_c2 = zeros(length(x2), length(x1));
    for x1i = 1 : length(x1)
        for x2i = 1 : length(x2)
            a1 = ((2*pi*sqrt(det(cov_c1)))^-1);
            b1 = (-0.5*([x1(x1i) x2(x2i)]-mean_c1)*inv(cov_c1)*transpose([x1(x1i) x2(x2i)]-mean_c1));
            gaus_c1 = a1*exp(b1);
    
            a2 = ((2*pi*sqrt(det(cov_c2)))^-1);
            b2 = (-0.5*([x1(x1i) x2(x2i)]-mean_c2)*inv(cov_c2)*transpose([x1(x1i) x2(x2i)]-mean_c2));
            gaus_c2 = a2*exp(b2);
            
            c1_c2(x2i, x1i) = gaus_c1 - gaus_c2;
        end
    end
    
    syms x1s x2s

    a1 = ((2*pi*sqrt(det(cov_c1)))^-1);
    b1 = (-0.5*([x1s x2s]-mean_c1)*inv(cov_c1)*transpose([x1s x2s]-mean_c1));
    gaus_c1 = a1*exp(b1);
     
    a2 = ((2*pi*sqrt(det(cov_c2)))^-1);
    b2 = (-0.5*([x1s x2s]-mean_c2)*inv(cov_c2)*transpose([x1s x2s]-mean_c2));
    gaus_c2 = a2*exp(b2);
    
    c1_c2sym = simplify(log(a1 / a2) == b2 - b1);
    vpa(c1_c2sym, 3)
    
    
    figure()
    title(tit)
    xlabel('x1')
    ylabel('x2')
    hold on
    plot(class1(:,1), class1(:,2), 'k+', 'Linewidth', 1)
    plot(class2(:,1), class2(:,2), 'ko', 'Linewidth', 1)
    contour(x1, x2, c1_c2, [0 0],'Linewidth', 3);
    c1_2c = c_plot(class1);
    c2_2c = c_plot(class2);
    
end