function vaja2_naloga1m()
    I = zeros(25,25);
    I(13,13) = 255;

    sigma = 6;
    
    [g, ~] = gauss(sigma);
    d = first_order_gauss_derivative(sigma);
    
    figure(1); clf;
    subplot(231);
    imagesc(I);
    subplot(232); imagesc(conv2(conv2(I, g), g'));
    subplot(233); imagesc(conv2(conv2(I, g), d'));
    subplot(234); imagesc(conv2(conv2(I, d), g'));
    subplot(235); imagesc(conv2(conv2(I, g'), d));
    subplot(236); imagesc(conv2(conv2(I, d'), g));
    
    % lepši prikaz
 
    sigma = 6;
    G = gauss(sigma);
    D = gaussdx(sigma);

    x_G = conv2(I, G);
    x_D = conv2(I, D);

    figure(2);
    colormap gray;
    subplot(1,3,1);
    imagesc(I);
    subplot(1,3,2);
    imagesc(x_G);
    subplot(1,3,3);
    imagesc(x_D);

    % a.)
    x_G = conv2(I, G);
    x_GGt = conv2(x_G, G');

    % b.)
    x_GDt = conv2(x_G, D');

    % c.)
    x_D = conv2(I, D);
    x_DGt = conv2(x_D, G');

    % d.)
    x_Gt = conv2(I, G');
    x_GtD = conv2(x_Gt, D);

    % e.)
    x_Dt = conv2(I, D');
    x_DtG = conv2(x_Dt, G);

    figure(3);
    colormap gray;
    subplot(2,3,1);
    imagesc(I);
    title("original");
    subplot(2,3,2);
    imagesc(x_GGt);
    title("G Gt");

    subplot(2,3,3);
    imagesc(x_GDt);
    title("G Dt");

    subplot(2,3,4);
    imagesc(x_DGt);
    title("D Gt");

    subplot(2,3,5);
    imagesc(x_GtD);
    title("Gt D");

    subplot(2,3,6);
    imagesc(x_DtG);
    title("Dt G");
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