I = rgb2gray(imread("pier.jpg"));
 
bw = edge(I,'canny');
bw2 = edge(I,'sobel');
bw3 = edge(I,'prewitt');
bw4 = edge(I,'roberts');
bw5 = edge(I,'canny', 0.1);

figure(1);
colormap gray;
subplot(2,3,1);
imagesc(I);
title("Original");
 
subplot(2,3,2);
imagesc(bw);
title("Canny");
subplot(2,3,3);
imagesc(bw2);
title("Sobel");
subplot(2,3,4);
imagesc(bw3);
title("Prewitt");
subplot(2,3,5);
imagesc(bw4);
title("Roberts");
subplot(2,3,6);
imagesc(bw5);
title("Simple treshold");