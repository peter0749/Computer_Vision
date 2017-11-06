function z = gaussian_2dkernel(shape, sigma)
    [R,C] = ndgrid(1:shape(1), 1:shape(2));
    cx = (1+shape(1))/2;
    cy = (1+shape(2))/2;
    z = gaussian_2d(R,C, cx, cy, sigma(1), sigma(2));
    z = z./sum(sum(z));
    