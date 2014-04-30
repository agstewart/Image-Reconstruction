
close all; clear all; 

%% Simple Use of Polybool
% 
% box = [1, 1;
%     2, 1;
%     3, 1;
%     4, 1;
%     5, 1;
%     5, 2;
%     5, 3;
%     5, 4;
%     5, 5;
%     4, 5;
%     3, 5;
%     2, 5;
%     1, 5;
%     1, 4;
%     1, 3;
%     1, 2;
%     1, 1];

box = [1, 1;
    2, 1;
    2, 2;
    1, 2;
    1, 1];

m = (5-1)/(5-1);
c = 5 - m*5; 

x = 1:5;
y = m*x + c;

% line = [1, 1;
%     5, 5;
%     5, 1;
%     1, 1];

line = [x(i)/2, y(i)/2;
    x(i), y(i);
    ]

% box2 = [box(:,1)+1, box(:,2)+0.5];

%% Grid

N=10;
sqX = repmat([1:N]',1,N);
sqX = sqX(:);
sqY = repmat(1:N,N,1);
sqY = sqY(:);

figure('color','white'); figure(1);

for j = 1:N-1

    for i = 1:N-1
        
        i = i + (j-1)*N;

        sqBox = [sqX(i), sqY(i); %(1,1)
            sqX(i+1), sqY(i+1); %(2,1)
            sqX(N+1+i), sqY(N+1+i);
            sqX(N+i), sqY(N+i);
            sqX(i), sqY(i)];
        
%         polygon = 

        plot(sqBox(:,1), sqBox(:,2), 'o-b', line(:,1), line(:,2), '-r');
        [xa ya] = polybool('intersection', sqBox(:,1), sqBox(:,2),...
            line(:,1), line(:,2));
        patch(xa, ya, 1, 'Facecolor', 'g')
        hold on;
        xlim([0 11])
        ylim([0 11])
        pause(0.5)
    end
end

% figure('color','white'); figure(1);
% plot(box(:,1), box(:,2), '*-b', line(:,1), line(:,2), '--r')
% % plot(box(:,1), box(:,2), '*-b', box2(:,1), box2(:,2), '-or')
% hold on
% plot(sqX,sqY,'*g')
% 
% xlim([0 7]);
% ylim([0 7]);
% 
% [xa ya] = polybool('intersection', box(:,1), box(:,2), line(:,1), line(:,2));
% patch(xa, ya, 1, 'Facecolor', 'g')

%%

% N=22;
% sqX = repmat([1:N]',1,N);
% sqX = sqX(:);
% sqY = repmat(1:N,N,1);
% sqY = sqY(:);
% 
% figure('color','white'); figure(1)
% 
% plot(sqX, sqY, 's-r', 'MarkerSize', 1.6)
% 
% 
% intersects = arrayfun((@(xs,ys) ...
%       (~isempty(polybool('intersection',X,Y,[xs-1 xs-1 xs xs],[ys-1 ys ys ys-1])))),...
%       sqX,sqY);
% 
% intersects = reshape(intersects,22,22);
