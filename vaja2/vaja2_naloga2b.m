function vaja2_naloga2b()
    I = rgb2gray(imread("museum.jpg"));
    figure(1); clf;
    subplot(161); imagesc(I); colormap gray;
    subplot(162); imagesc(edges_simple(I, 10));
    title('10');
    subplot(163); imagesc(edges_simple(I, 30));
    title('30');
    subplot(164); imagesc(edges_simple(I, 60));
    title('60');
    subplot(165); imagesc(edges_simple(I, 100));
    title('100');
    subplot(166); imagesc(edges_simple(I, 200));
    title('200');
end

function [Ie] = edges_simple(I, theta)
    
    [Imag, Idir] = gradient_magnitude(I, 2);

    Ie = Imag > theta;
end

function [Imag, Idir] = gradient_magnitude(I, sigma)
    Hx_s2 = 1/32 * [-3, 0, 3; ...
                    -10, 0, 10; ...
                    -3, 0, 3]; 
    
    Hy_s2 = 1/32 * [-3, -10, -3; ...
                     0, 0, 0; ...
                     3, 10, 3]; 
                 
    Hx_p = 1/6 * [-1, 0, 1; ...
                  -1, 0, 1; ...
                  -1, 0, 1];
              
    Hy_p = 1/6 * [-1, -1, -1; ...
                   0, 0, 0; ...
                   1, 1, 1];
               
    I_x = abs(conv2(I, Hx_p, 'same'));
    I_y = abs(conv2(I, Hy_p, 'same'));
    
    Imag = uint8(sqrt(double( I_x.^2 + I_y.^2 )));
    Idir = uint8(atan2(double(I_y), double(I_x)));
end