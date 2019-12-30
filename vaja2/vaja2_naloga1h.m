function vaja2_naloga1h()
    k = [0, 0, 0; 0, 2, 0; 0, 0, 0] - 1/9 * ones(3, 3);
    
    I = rgb2gray(imread('museum.jpg'));
    I_filtered = conv2(I, k, 'same');
    I_filtered2 = conv2(I_filtered, k);
    
    figure(8); clf;
    subplot(121); imagesc(I); colormap gray;
    title('Original');
    subplot(122); imagesc(I_filtered2);
    title('Sharpened');
    hold off;
end

