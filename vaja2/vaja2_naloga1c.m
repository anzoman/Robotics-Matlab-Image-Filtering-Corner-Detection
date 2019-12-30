I = load('signal.txt');
g = load('kernel.txt');

Ig_c = conv(I, g, 'same');
figure(1);
plot(I); hold on;
plot(g); hold on;
plot(Ig_c);

hold off;

% conv(I, g , 'same') izracuna konvolucijo samo za centralni del, torej iste velikosti kot I
