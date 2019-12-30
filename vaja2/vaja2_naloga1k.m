function vaja2_naloga1k()
    I = rgb2gray(imread('lena.png'));
    Icg = imnoise(I,'gaussian', 0, 0.01); % Gaussian noise
    
    figure;
    subplot(2,2,1); imshow(Icg); colormap gray;
    axis equal; axis tight; title('Gaussian noise');
    Ics = imnoise(I,'salt & pepper', 0.1); % Salt & pepper noise
    subplot(2,2,2) ; imshow(uint8(Ics)); colormap gray;
    axis equal; axis tight; title('Salt and pepper');
    Icg_b = simple_median2d(double(Icg));
    Ics_b = simple_median2d(double(Ics));
    subplot(2,2,3) ; imshow(uint8(Icg_b)); colormap gray;
    axis equal; axis tight; title('Filtered') ;
    subplot(2,2,4) ; imshow(uint8(Ics_b)); colormap gray;
    axis equal; axis tight; title('Filtered');
    
    hold off;
end

function b = simple_median2d(I)
    a = double(I);
    b = a;
    [row, col] = size(a);    
    for x = 2:1:row-1
        for y = 2:1:col-1
            % 3x3 masko spremenimo v 1x9 masko
            a1 = [a(x-1, y-1) a(x-1, y) a(x-1, y+1) a(x, y-1) a(x, y) a(x, y+1) a(x+1, y-1) a(x+1, y) a(x+1, y+1)];
            a2 = sort(a1);
            
            med = a2(5); % 5. element je vrednosti mediane - to je srednji element
            b(x, y) = med;
        end
    end
end