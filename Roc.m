load 'Recall.mat' 
x = [0.005:0.005:0.02 0.05:0.05:1];
 figure;
 plot(x,exhaust,'LineWidth',2),hold on
 plot(x,LSH_480','LineWidth',2),hold on
 plot(x,LSH_1024','LineWidth',2),hold on
 plot(x,LSH_4096','LineWidth',2),hold on
 plot(x,SH_64','LineWidth',2),hold on
 plot(x,SH_128','LineWidth',2),hold on
%  plot(x,Reo_recall','LineWidth',2),hold on
 grid on
 axis([0 1 0 1])
 ylabel('Recall')
% legend('Exhaust-eu','LSH-480bits')
legend('传统方法','LSH-480','LSH-1024','LSH-4096','SH-64','SH-128')