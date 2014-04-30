
%% 
% Simulation of forward projection in Matlab
%%

close('all')
clear('all')

%% Animation: Gammas from a point source

figure('color','white'); figure(1)

point_source = [0,0];

det_coor = zeros(10,4);

for j = 1:5

    rand_x = rand(1);
    rand_y = rand(1);

    m = (rand_y - point_source(1,2))./(rand_x - point_source(1,1)); 
    c = rand_y - m*rand_x;

    ray_x = 0:0.1:1;
    ray_y = m*ray_x + c;

    for i = 1:length(ray_x)
%         plot(ray_x(i), ray_y(i), 'ob', ray_x(i)*-1, ray_y(i)*-1, 'ob')
%         xlim([-2,2]); ylim([-5,5]);
%         pause(0.1)
    end
    
    det_coor(j,:) = [ray_x(i), ray_y(i), ray_x(i)*-1, ray_y(i)*-1];

end


%% Plot Circle

r = 1;
px = 0;
py = 0;

x=(sin(0:(2*pi)/100:2*pi)*r)+px;
y=(cos(0:(2*pi)/100:2*pi)*r)+py;

figure('color','white'); figure(2)

plot(x,y,'-r')

hold on;

for k = 1:length(det_coor)
    plot([det_coor(k,1), det_coor(k,3)], [det_coor(k,2), det_coor(k,4)],...
        '-b')
end

ylim([-1, 1])






    