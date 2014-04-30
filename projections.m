
% projections.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%takes an image matrix and vector of angles and then finds the 1D
%projection (Radon Transform) at each of the angles. It returns a matrix
%whose columns are the projections at each angle. 

function PR = projections(IMG, THETA)

% pad the image with zeros so that nothing is lost when the rotations are
% preformed. 

[iLength, iWidth] = size(IMG);
iDiag = sqrt(iLength^2 + iWidth^2);

LengthPad = ceil(iDiag - iLength) + 2;
WidthPad = ceil(iDiag - iWidth) + 2;

padIMG = zeros(iLength+LengthPad, iWidth+WidthPad); 

padIMG(ceil(LengthPad/2):(ceil(LengthPad/2)+iLength-1),...
    ceil(WidthPad/2):(ceil(WidthPad/2)+iWidth-1)) = IMG;

% loop over the number of angles, rotate 90-theta and then add up. Don't
% perform any interpolation on the rotation

n = length(THETA);
PR = zeros(size(padIMG,2), n); 

for i = 1:n
    tic
    tmpimg = imrotate(padIMG, 90-THETA(i), 'bilinear', 'crop');
    PR(:,i) = (sum(tmpimg))';
    toc 
end
