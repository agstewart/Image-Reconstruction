

%% First Steps in Image Reconstruction
%Andrew Stewart
%University of Glasgow
%11th October 2013

close('all')
clear('all')

%% Define Image
Image = zeros(100,100);
Image(25:75, 25:75) = 1; % a square
%Image(50, 50) = 1;

%% Different Plot
x = 1:1:100;
y = 1:1:100;
[X, Y] = meshgrid(x, y);
figure('color', 'white'); subplot(121)
surf(X, Y, Image);
xlabel('x'); ylabel('y')

%% Plot Image 
subplot(122);
contour(Image,1)
xlabel('x'); ylabel('y')

%% Perform Radon Transform

[R, xp] = radon(Image,[0 45]); % computes Radon Transform at 0 and 45 degrees

%Plot transform

figure('color', 'white'); figure(2);
subplot(121)
plot(R(:,1),xp); title('R_{0^o} (x\prime)');
hold on
% subplot(121)
plot(xp,R(:,2)); title('R_{45^o} (x\prime)');

%% Radon Transform as an Image

subplot(122)
theta = 0:1:180;
[R,xp] = radon(Image,theta); 
imagesc(theta,xp,R); title('Sinogram (Radon Transform)')
colormap(hot)

%% Inverse Radon Transform

figure('color','white'); figure(3);
% iradon uses the filtered backprojection algorithm to compute the inverse
% Radon Transform
I = iradon(R, theta); % compute inverse Radon Transform
contour(I, 1)
xlabel('x'); ylabel('y'); 
title('Inverse Radon Tranform')


