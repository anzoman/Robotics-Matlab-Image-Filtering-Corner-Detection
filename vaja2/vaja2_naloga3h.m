function vaja2_naloga3h()
    I_coins = rgb2gray(imread("coins.jpg"));
    I_eclipse = rgb2gray(imread("eclipse.jpg"));

    I_e_pier = edge(I_coins, 'canny');
    I_e_bricks = edge(I_eclipse, 'canny');

    [xc1, yc1, r1] = hough_find_circles(I_e_pier, 86, 'threshold', 1 , 'count', 5, 'neighborhood', 10);
    [xc2, yc2, r2] = hough_find_circles(I_e_bricks, 50, 'threshold', 1 , 'count', 24, 'neighborhood', 20);

    figure(1);
    subplot(1, 2, 1);
    hough_draw_circles(I_coins, xc1, yc1, r1);
    subplot(1, 2, 2);
    hough_draw_circles(I_eclipse, xc2, yc2, r2);
    
    % drugaène nastavitve parametrov:
    figure(2);
    I_e_1 = edge(I_coins);
    I_e_2 = edge(I_eclipse);
    [xc1, yc1, r1] = hough_find_circles(I_e_1, 86, 'count', 5);
    [xc2, yc2, r2] = hough_find_circles(I_e_2, 86, 'count', 5);
    subplot(1, 2, 1);
    hough_draw_circles(I_coins, xc1, yc1, r1);
    subplot(1, 2, 2);
    hough_draw_circles(I_eclipse, xc2, yc2, r2);
end
