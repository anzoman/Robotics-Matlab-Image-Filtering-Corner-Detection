function vaja2_naloga3e()
    I_pier = rgb2gray(imread("pier.jpg"));
    I_bricks = rgb2gray(imread("bricks.jpg"));

    I_e_pier = edge(I_pier, 'canny');
    I_e_bricks = edge(I_bricks, 'canny');

    [rho, theta] = hough_find_lines(I_e_pier, 'rhobins', 400 , 'thetabins', 400 , 'count', 10, 'neighborhood', 10);
    [rho2, theta2] = hough_find_lines(I_e_bricks, 'rhobins', 800 , 'thetabins', 800 , 'count', 10, 'neighborhood', 10);

    figure(1);
    subplot(1, 2, 1);
    hough_draw_lines(I_pier, rho, theta);
    subplot(1, 2, 2);
    hough_draw_lines(I_bricks, rho2, theta2);
    
    % drugaène nastavitve parametrov:
    figure(2);
    I_e_1 = edge(I_pier);
    I_e_2 = edge(I_bricks);
    [rho, theta] = hough_find_lines(I_e_1, 'count', 15);
    [rho2, theta2] = hough_find_lines(I_e_2, 'count', 15);
    subplot(1, 2, 1);
    hough_draw_lines(I_pier, rho, theta);
    subplot(1, 2, 2);
    hough_draw_lines(I_bricks, rho2, theta2);
end
