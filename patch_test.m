
% Develop algorithm to plot patch pixels

close all; clear all; 

xstep = 0.1;
ystep = 0.2;

x = 0:xstep:5;
y = 0:ystep:5;

%% Create Patch Matrices

% k = [-xstep, xstep, xstep, -xstep]; 
% [X Y] = meshgrid(k, x);
% x2 = X + Y; 
% % k2 = repmat(k/2, [length(x) 1]);
% % x2 = k2 + repmat(x', [1 length(k)]);
% 
% h = [-ystep, -ystep, ystep, ystep];
% [X2 Y2] = meshgrid(h, y);
% y2 = X2 + Y2;
% % h2 = repmat(h/2, [length(y) 1]);
% % y2 = h2 + repmat(y', [1 length(h)]);

myGrid = ForwGrid(0.2, 0.5);

%% Generate z values

[Zx Zy] = meshgrid(myGrid.y, myGrid.x);
exponent = (Zx.^2 + Zy.^2)./(2*0.5);
val = (exp(-exponent));  
% 
% %% Plot Patches
% 
figure('color', 'white'); figure(1)

for j = 1:length(myGrid.y2)
    for i = 1:length(myGrid.x2)
        patch(myGrid.x2(i,:), myGrid.y2(j,:), projection(i, j))
    end
end
% %  
% % for i  = 1:3
% %     xvals = [x(i)-xstep/2, x(i)+xstep/2, x(i)+xstep/2, x(i)-xstep/2];
% %     yvals = [y-ystep/2, y-ystep/2, y+ystep/2, y+ystep/2];
% %     z = ones(1,4)*randn(1);
% %     patch(xvals, yvals, z)
% %     hold on
% %     colormap cool
% % end
% 
% figure('color','white'); figure(2)
% 
% x1 = -1:0.05:1;
% y1 = -1:0.05:1;
% 

% 

% 
% surf(X, Y, val)
% 
% view(3)
% % view([-61 90])
% % 
% % xlim([0 2])
% % ylim([0 2])