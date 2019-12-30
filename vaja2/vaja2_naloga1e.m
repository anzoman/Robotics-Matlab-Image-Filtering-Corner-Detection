function vaja2_naloga1e
    signal = [1, 1, 1, 1, 1, 0.75, 0.5, 0.25, 0, 0, 0, 0, 0, 0.25, 0.5, 0, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 0, 0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.75]
    
    [q_3, ~] = gauss(2);
    
    q_lder_3 = first_order_gauss_derivative(2);
    figure(5); clf; plot(q_lder_3);
    
    signal_filter_gauss = conv(signal, q_3, 'same');
    signal_filter_gauss_lder = conv(signal, q_lder_3, 'same');
    
    figure(4); clf;
    plot(signal); hold on;
    plot(signal_filter_gauss); hold on;
    plot(signal_filter_gauss_lder); hold on;
end

function g = first_order_gauss_derivative(sigma)
    x = -round(3.0*sigma) : round(3.0*sigma); % izven tega intervala
    g = - x ./ (sigma^3 * sqrt(2*pi)) .* exp(-(x.^2 / (2*sigma^2)));
    g = g / (0.5 * sum(abs(g)));
    sum(g)
end

function [g, x] = gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end