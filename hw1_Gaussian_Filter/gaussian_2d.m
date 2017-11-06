function g = gaussian_2d(x,y,mu_x,mu_y,sigma_x,sigma_y)
    g = gaussian_1d(x,mu_x,sigma_x) * gaussian_1d(y,mu_y,sigma_y);