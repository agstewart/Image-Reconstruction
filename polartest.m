
close all; clear all;

R = 5;

theta = degtorad(0:10:80);

x = R*cos(theta);
y = R*sin(theta);

figure('color','white'); figure(1);

plot(x,y,'sb','MarkerSize',1.6)
xlim([0 5]); ylim([0 5]);

% r = 2:10;
% 
% theta = ones(1,length(r))*degtorad(10);
% 
% [x, y] = pol2cart(r, theta);
% 
% figure('color','white'); figure(1)
% 
% for i = 1:length(r)
%     plot(x(i),y(i),'o-b','MarkerSize',1.6)
%     hold on
% end