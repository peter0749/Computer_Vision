% Use convolution theorem: 
% X = DFT(x), Y = DFT(y)
% Z = X dot Y
% z = IDFT(Z)
% And z is actually: z = x*y (x convolution y)
% As for padding size: 
%   see CS231n slides: http://cs231n.github.io/convolutional-networks/
function Y = my_conv(X,kernel,padding)
    if nargin < 3
        padding = 'replicate';
    end
    kernel_size = floor((size(kernel)-1)./2); % compute padding size
    X_size = size(X); % original image size
    X = padarray(X, [kernel_size(1) kernel_size(2)], padding, 'both'); % padding img
    fftX = fft2(double(X));
    fftk = fft2(padarray(double(kernel), size(X)-size(kernel), 0, 'pre'));
    Y = real(ifft2( fftX.*fftk ));
    Y = Y(1:X_size(1), 1:X_size(2), 1:end);