x = [zeros(1, 14), ones(1, 11), zeros(1, 15)]; % Input signal
xc = x; xc(11) = 5; xc(18) = 5; % Corrupted signal
figure;
subplot(1, 4, 1); plot(x); axis([1, 40, 0, 7]); title('Input');
subplot(1, 4, 2); plot(xc); axis([1, 40, 0, 7]); title('Corrupted');
g = gauss(1);
x_g = conv(xc, g, 'same');
x_m = simple_median(xc, 5);
subplot(1, 4, 3); plot(x_g); axis([1, 40, 0, 7]); title('Gauss');
subplot(1, 4, 4); plot(x_m); axis([1, 40, 0, 7]); title('Median');

% nastavitev parametrov - bolje se obnese medianin filter, saj uspešno
% odstrani šum iz slike, poleg tega pa ohrani robove ostre oz. jih ne
% zamegli tako kot Gaussov filter

figure;
subplot(1, 4, 1);
plot(x);
axis([1, 40, 0, 7]);
title('Input');

subplot(1, 4, 2);
plot(xc);
axis([1, 40, 0, 7]);
title('Corrupted');

g = our_gaussfilter(xc, 5);
x_g = conv(xc, g, 'same');
x_m = simple_median(xc, 5);

subplot(1, 4, 3);
plot(x_g);
axis([1, 40, 0, 7]);
title('Gauss');

subplot(1, 4, 4);
plot(x_m);
axis([1, 40, 0, 7]);
title('Median');

function [g, x] = gauss(sigma)
    x = -round(3.0*sigma):round(3.0*sigma); % izven tega intervala
    g = (1 / sqrt(2 * pi * sigma)) * exp(-(x .^2/ ( 2 * sigma^2)));
    g = g / sum(g); % normaliziramo
    sum(g)
end

function Ig = our_gaussfilter(I, sigma)
    [g, ~] = gauss(sigma);
    Ib = conv2(I, g, 'same');
    Ig = conv2(Ib, g, 'same');
end

function Ig = simple_median(I, W)
    N = ceil((W-1)/2) ;
    I_2 = I(:);
    Ig = zeros(1, length(I));
    
    for i = N+1 : length(I)-N
        i_left = max([1, i-N]) ;
        i_right = min([length(I), i+N]) ;
        % sort the values and select the middle one
        tmp_values = sort(I_2(i_left:i_right));
        Ig(i) = tmp_values(floor(end/2));
    end
end