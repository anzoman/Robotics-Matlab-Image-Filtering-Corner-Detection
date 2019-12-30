function vaja2_naloga1f()
    signal = load('signal.txt');
    [k1, ~] = our_gauss(2);
    k2 = [0.1, 0.6, 0.4];
    
    conv1 = conv(conv(signal, k1), k2);
    conv2 = conv(conv(signal, k2), k1);
    conv3 = conv(signal, conv(k1, k2));

    figure(6); clf;
    subplot(141);
    plot(signal);
    subplot(142);
    plot(conv1);
    subplot(143);
    plot(conv2);
    subplot(144);
    plot(conv3);
    
    hold off;
end

function [g, x] = our_gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end