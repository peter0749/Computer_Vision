% input: kernel_shape, sigma_of_gaussian_funciton, normlize_or_not
%        The filter is normlized by default.
% output: A gaussian filter with specific shape (normalized/not normalized)

function z = gaussian_2dkernel(shape, sigma, normalize)
    [R,C] = ndgrid(1:shape(1), 1:shape(2));
    cx = (1+shape(1))/2;
    cy = (1+shape(2))/2;
    z = gaussian_2d(R,C, cx, cy, sigma(1), sigma(2));
    if nargin < 3 || normalize==true
        z = z./sum(sum(z)); %% normalize
    end
    