I = load('signal.txt');
figure(1);
subplot(1,2,1);
plot(I);
axis([1, 40, 0, 7]);

subplot(1,2,2);
plot(simple_median(I, 3));
axis([1, 40, 0, 7]);

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