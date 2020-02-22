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
    plot(X,Y,'Linewidth', 1.5)
    
    x = 2*a*cos(phi);
    y = 2*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y,'Linewidth', 1.5)
    
    x = 3*a*cos(phi);
    y = 3*b*sin(phi);

    X = x*cos(theta)-y*sin(theta);
    Y = x*sin(theta)+y*cos(theta);
    X = X + mu(1);
    Y = Y + mu(2);
    plot(X,Y, 'Linewidth',1.5)
    
    c= 0;
end 
