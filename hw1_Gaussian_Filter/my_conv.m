function Y = my_conv(X,kernel)
    X = double(X);
    kernel = padarray(kernel, size(X)-size(kernel), 'post');
    fftX = fft2(X);
    fftk = fft2(kernel);
    Y = real(ifft2( fftX.*fftk ));