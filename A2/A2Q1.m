Data1 = importdata('Data1');
Data2 = importdata('Data2');

%1a 
figure();
D1_hist = histogram(Data1,40);
title('1a - Data1');

figure();
D2_hist = histogram(Data2,40);
title('1a - Data2');

%1b 
figure()
D1_hist_fit = histfit(Data1,40);
title('1b-Data1');

figure()
D2_hist_fit = histfit(Data2,40);
title('1b-Data2');

%1c 
[D1_hc, D1_pc] = chi2gof(Data1);
[D2_hc, D2_pc] = chi2gof(Data2);

%1d 
D2_pd = fitdist(Data2.','Exponential');
[D2_hd, D2_pd] = chi2gof(Data2, 'CDF', D2_pd);




