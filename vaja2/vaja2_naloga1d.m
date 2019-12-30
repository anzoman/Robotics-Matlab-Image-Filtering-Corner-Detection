figure(2);
hold on;
plot(gauss(0.5));
plot(gauss(1));
plot(gauss(2));
plot(gauss(3));
plot(gauss(4));
hold off;

% x je dolžine 2sigma + 1 kar je tudi velikost jedra

function [g, x] = gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end