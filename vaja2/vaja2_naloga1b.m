function vaja2_naloga1b()
    signal = load('signal.txt');
    kernel = load('kernel.txt');
    
    conv_res = simple_convolution(signal, kernel);
    
    figure(1);
    clf;
    x_axis = linspace(1, 40, 40);
    x_axis_kernel = linspace(1, 13, 13);
    plot(signal); hold on;
    plot(kernel); hold on;
    plot(conv_res); hold on;
    
    hold off;
end

function Ig = simple_convolution(I, g)
    N = (length(g) - 1) / 2;
    Ig = zeros(1, length(I));
    for i = N+1:length(I)-N
        i_left = max([1, i - N]);
        i_right = min([length(I), i + N]);
        Ig(i) = sum(g .* I(i_left:i_right));
    end
end
    
% Jedro je Gaussovo. Vsota vseh elementov jedra je 1.