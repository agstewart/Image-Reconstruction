
function [img,H] = backproj(varargin)

[p,theta,filter,d,interp,N] = parse_inputs(varargin{:});

% Design the filter
len=size(p,1);   
H = designFilter(filter, len, d);
p(length(H),1)=0;  % Zero pad projections 

% In the code below, I continuously reuse the array p so as to
% save memory.  This makes it harder to read, but the comments
% explain what is going on.

p = fft(p);    % p holds fft of projections

for i = 1:size(p,2)
   p(:,i) = p(:,i).*H; % frequency domain filtering
end

p = real(ifft(p));     % p is the filtered projections
p(len+1:end,:) = [];   % Truncate the filtered projections
img = zeros(N);        % Allocate memory for the image.

% Define the x & y axes for the reconstructed image so that the origin
% (center) is in the spot which RADON would choose.
xax = (1:N)-ceil(N/2);
x = repmat(xax, N, 1);    % x co