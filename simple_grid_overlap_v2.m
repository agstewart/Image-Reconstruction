
% Forward project example with a simple grid
% Uses Matlab classes
%   AnnGamma - generates 
%   DetectorRing - generates detector ring
%   ForwGrid - generates pixel grid

clear all; close all;

%% Define Detector Ring

r = 5; % Detector Radius
det = DetectorRing(r); % Create object of DetectorRing class

%% Define Grid 

xstep = 0.2; % x grid step
ystep = 0.2; % y grid step

%% Define path of Gamma ray from gamma class

x = -5:0.1:5; %Define x values for LOR

%% Define grid for Forward Projection

runs = 20;

myGrid = ForwGrid(xstep, ystep); % Grid object with x step = 0.2 and y step = 0.4 

projection = zeros(length(myGrid.x2), length(myGrid.y2)); %% Array to hold projection data

gamma_origins = zeros(runs, 2); % Array to hold true origins of radomly generated gammas

scanPatient = ScanPatient(0.5);

%% Plot and Forward Projection

figure('color','white'); figure(1);

%%Overlay Grid
for k = 1:runs
        
    plot(det.dr_x, det.dr_y, '-g', 'LineWidth', 2); % Plot Detector Ring
    hold on
    
    fill(scanPatient.dr_x, scanPatient.dr_y, 'c') % Plot Scan Patient
 
    psource = 0;
    
    g = AnnGamma(psource); % create gamma-pair object from AnnGamma class
    
    gamma_origins(k,:) = g.origin;
    
    % Find where Gamma 1 trajectory and detector ring intersect
    [xdet1,ydet1] = linecirc(g.m_1,g.c_1,0,0,det.radius); 
    %Find where Gamma 2 trajectory and detector ring intersect
    [xdet2,ydet2] = linecirc(g.m_2,g.c_2,0,0,det.radius);
    
    %Plot path of gammas. Split path into positive and negetive
    
    for i = 1:length(g.path1)
        plot(g.path1(1:i,1), g.path1(1:i,2), '-b',...
            g.path2(1:i,1), g.path2(1:i,2), '-b', 'LineWidth', 1.6)
        xlim([-6 6]); ylim([-6 6]);
%             pause(0.1)
    end
    
    % Find detection points
    x_det_points = [xdet1,xdet2];
    y_det_points = [ydet1,ydet2];
    
    [~,ix] = min(abs(x_det_points - g.path1(end,1))); 
    [~,ix2] = min(abs(x_det_points - g.path2(end,1)));
    
    % Calculate the Line of Response
    m_LOR = (y_det_points(1,ix) - y_det_points(1,ix2))/(x_det_points(1,ix) - x_det_points(1,ix2));
    c_LOR = y_det_points(1,ix) - m_LOR*x_det_points(1,ix);
    
    LOR = zeros(length([g.path1; g.path2]));
    LOR(:,1) = [g.path1(:,1); g.path2(:,1)];
    LOR(:,2) = m_LOR*LOR(:,1) + c_LOR;
    
    plot([x_det_points(1,ix), x_det_points(1,ix2)], [y_det_points(1,ix), y_det_points(1,ix2)], '-k',...
        'LineWidth', 1.6) % plot location of gamma detection 
    
    for j = 1:length(myGrid.y2)
        for i = 1:length(myGrid.x2)
            if isempty(find(LOR(:,1) > myGrid.x2(i,1) & LOR(:,1) <=...
                    myGrid.x2(i,2) & LOR(:,2) > myGrid.y2(j,2)  &...
                        LOR(:,2) <= myGrid.y2(j,3), 1)) == 0
                patch(myGrid.x2(i,:), myGrid.y2(j,:), 'b')
                projection(i,j) = projection(i,j) + 1;
            else
                patch(myGrid.x2(i,:), myGrid.y2(j,:), 'r')
            end
        end
    end
    pause(0.5)
    hold off
end

alpha(0.6);

%% Plot Projection Data

figure('color','white'); figure(2);
% subplot(1,2,1)
plot(gamma_origins(:,1), gamma_origins(:,2), 'sk', 'MarkerSize', 1.7)
hold on
fill(scanPatient.dr_x, scanPatient.dr_y, 'c') % Plot Scan Patient
xlim([-2 2]); ylim([-2, 2]);
alpha(0.3)

figure('color','white'); figure(3)
% subplot(1,2,2)
for j = 1:length(myGrid.y2)
    for i = 1:length(myGrid.x2)
        patch(myGrid.x2(i,:), myGrid.y2(j,:), projection(i, j))
    end
end
title('Forward Projection')

figure('color','white'); figure(4)
n = hist3(gamma_origins); % default is to 10x10 bins
n1 = n';
n1(size(n,1) + 1, size(n,2) + 1) = 0;

xb = linspace(min(gamma_origins(:,1)),max(gamma_origins(:,1)),size(n,1)+1);
yb = linspace(min(gamma_origins(:,2)),max(gamma_origins(:,2)),size(n,1)+1);

surf(xb, yb, n1)
ylim([-1 1]); xlim([-1 1])
