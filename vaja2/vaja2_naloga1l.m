I = load('signal.txt');

g = gaussdx(3);
x_g = conv(I, g, 'same');
figure(1);
subplot(1,3,1);
plot(I);
subplot(1,3,2);
plot(x_g);
subplot(1,3,3);
plot(g);

function [res] = gaussdx(sigma)
   x = -round(3.0*sigma):round(3.0*sigma);
   g = - (1/(sqrt(2 * pi) * sigma^3) * x .* exp(-(x .^2 / (2 * sigma^2))));
   g = g / (0.5 * sum(abs(g)));
   sum(g)
   [res] = g;
end
