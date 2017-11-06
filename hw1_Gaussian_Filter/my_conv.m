% Use convolution theorem: 
% X = DFT(x), Y = DFT(y)
% Z = X dot Y
% z = IDFT(Z)
% And z is actually: z = x*y (x convolution y)
function Y = my_conv(X,kernel)
    fftX = fft2( double(X) );
    fftk = fft2( padarray(double(kernel), size(X)-size(kernel), 0, 'pre') );
    Y = real(ifft2( fftX.*fftk ));