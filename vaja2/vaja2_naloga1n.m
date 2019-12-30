img = rgb2gray(imread("pier.jpg"));
image_derivatives(img, 4);

function [Ix, Iy] = image_derivatives(I, sigma)
    [g, ~] = gauss(sigma);
    d = first_order_gauss_derivative(sigma);
    
    Ix = conv2(conv2(I, g'), d);
    Iy = conv2(conv2(I, d'), g);

    G = gauss(sigma);
    D = gaussdx(sigma);

    x_G = conv2(I, G);
    x_Gt = conv2(I, G');

    x_GDt = conv2(x_G, D');
    x_GtD = conv2(x_Gt, D);

    figure(1);
    colormap gray;
    subplot(1,3,1);
    imagesc(I);
    title('Original');
    subplot(1,3,2);
    imagesc(x_GtD);
    title('lx');
    subplot(1,3,3);
    imagesc(x_GDt);
    title('ly');
    hold off;
end

function [g, x] = gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end

function [res] = gaussdx(sigma)
   x = -round(3.0*sigma):round(3.0*sigma);
   g = - (1/(sqrt(2 * pi) * sigma^3) * x .* exp(-(x .^2 / (2 * sigma^2))));
   g = g / (0.5 * sum(abs(g)));
   sum(g)
   [res] = g;
end

function g = first_order_gauss_derivative(sigma)
    x = -round(3.0*sigma) : round(3.0*sigma); % izven tega intervala
    g = - x ./ (sigma^3 * sqrt(2*pi)) .* exp(-(x.^2 / (2*sigma^2)));
    g = g / (0.5 * sum(abs(g)));
    sum(g)
end