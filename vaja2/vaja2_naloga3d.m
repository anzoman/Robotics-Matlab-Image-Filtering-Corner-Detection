function vaja2_naloga3d()
    I_1 = imread('oneline.png');
    I_2 = imread('rectangle.png');
    
    A = hough(I_1);
    B = hough(I_2);
    figure(1); clf;
    subplot(1,2,1);
    imagesc(A);
    title('oneline.png');
    subplot(1,2,2);
    imagesc(B);
    title('rectangle.png');
end

function [A] = hough(I)
    edges = edge(rgb2gray(I));
    [size_y, size_x, ~] = size(I); 
    % Resolution of the accumulator array
    bins_theta = 300; 
    bins_rho = 300;
    % Max rho is sually the diagonal of the image
    max_rho = sqrt(size_y^2 + size_x^2);
    val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
    val_rho = linspace(-max_rho, max_rho, bins_rho);
    A = zeros(bins_rho, bins_theta);

    % get non-zero elemments from edges matrix
    [row, col] = find(edges > 0);

    for i_edgepoints = 1 : length(row)
        rho = row(i_edgepoints) * cos(val_theta) + col(i_edgepoints) * sin(val_theta); % compute rho for all thetas
        bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho
        for i = 1:bins_theta % Go over all the points
            if bin_rho(i) > 0 && bin_rho(i) <= bins_rho % Mandatory out-of-bounds check
                A(bin_rho(i), i) = A(bin_rho(i), i) + 1; % Increment the accumulator cells
            end
        end
    end
    [A] = A;
end
