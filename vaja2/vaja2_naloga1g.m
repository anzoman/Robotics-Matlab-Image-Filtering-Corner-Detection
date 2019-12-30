function vaja2_naloga1g()
    I = rgb2gray(imread('lena.png'));
    Icg = imnoise(I,'gaussian', 0, 0.01); % Gaussian noise
    
    Icg_filtered = our_gaussfilter(Icg, 2);
    
    figure;
    subplot(2,2,1); imshow(Icg); colormap gray;
    axis equal; axis tight; title('Gaussian noise');
    Ics = imnoise(I,'salt & pepper', 0.1); % Salt & pepper noise
    subplot(2,2,2) ; imshow(uint8(Ics)); colormap gray;
    axis equal; axis tight; title('Salt and pepper');
    Icg_b = our_gaussfilter(double(Icg), 1);
    Ics_b = our_gaussfilter(double(Ics), 1);
    subplot(2,2,3) ; imshow(uint8(Icg_b)); colormap gray;
    axis equal; axis tight; title('Filtered') ;
    subplot(2,2,4) ; imshow(uint8(Ics_b)); colormap gray;
    axis equal; axis tight; title('Filtered');
    
    figure(7); clf;
    subplot(1, 2, 1); imagesc(Icg); colormap gray;
    subplot(1, 2, 2); imagesc(Icg_filtered);
    hold off;
end

function Ig = our_gaussfilter(I, sigma)
    [g, ~] = our_gauss(sigma);
    Ib = conv2(I, g, 'same');
    Ig = conv2(Ib, g, 'same');
end

function [g, x] = our_gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end

% Gaussov šum bolje odstrani Gaussian noise filter.