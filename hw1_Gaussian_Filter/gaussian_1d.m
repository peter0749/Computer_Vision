function g = gaussian_1d(x, mu, sigma)
    g = exp(-(((x-mu)/sigma).^2)/2) / sigma / sqrt(2*pi);