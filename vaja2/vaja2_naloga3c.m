function vaja2_naloga3c()
    A = hough(50,90);
    figure(1);
    subplot(2,2,1);
    imagesc(A); % Display status of the accumulator
    title("x= 50, y=90");

    A = hough(10,10);
    subplot(2,2,2);
    imagesc(A);
    title("x= 10, y=10");

    A = hough(30,60);
    subplot(2,2,3);
    imagesc(A);
    title("x= 30, y=60");

    A = hough(50,20);
    subplot(2,2,4);
    imagesc(A);
    title("x= 50, y=20");
end

function [A] = hough(x, y)
    bins_theta = 300; bins_rho = 300; % Resolution of the accumulator array
    max_rho = 100; % Usually the diagonal of the image
    val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
    val_rho = linspace(-max_rho, max_rho, bins_rho);
    A = zeros(bins_rho, bins_theta);

    rho = x * cos(val_theta) + y * sin(val_theta); % compute rho for all thetas
    bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
    for i = 1:bins_theta % Go over all the points
        if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
            A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells
        end
    end
    [A] = A;
end
