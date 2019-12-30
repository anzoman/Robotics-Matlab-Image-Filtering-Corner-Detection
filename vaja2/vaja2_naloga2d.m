I = rgb2gray(imread('pier.jpg'));

sigma = 1;
radius = 1;
treshold = 1000;
size = 2* radius + 1;
dx = [-1 0 1; -1 0 1; -1 0 1]; % matrika za x
dy = dx'; % matrika za y
% naredi predefined 2d filter
g = fspecial('gaussian', max(1, fix(6*sigma)), sigma);

% Odvodi za sliko
Ix = conv2(I, dx, 'same');
Iy = conv2(I, dy, 'same');

% Smooth-amo
Ix2 = conv2(Ix.^2, g, 'same');
Iy2 = conv2(Iy.^2, g, 'same');
Ixy = conv2(Ix.*Iy, g, 'same');

% Harris corner measure
harris = (Ix2.*Iy2 - Ixy.^2)./(Ix2+Iy2 + eps);

% Find local maximum (2-D order-statistic filtering)
mx = ordfilt2(harris, size.^2, ones(size));

harris = (harris == mx) & (harris > treshold);

[rows, cols] = find(harris);

figure, image(I); axis image; colormap gray; hold on;
plot(cols, rows, 'ys'), title("Harrisov detektor kotov");
