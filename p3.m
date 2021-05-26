[x,fs] = audioread('dtmf4.wav');    
fs    % 8000 hz
N = 512;
T = 1/fs;             % Sampling period 0.125 ms      
LB = 0.05;             % Length of each digit (50ms) 
t = (0:length(x)-1)*T;        % Time vector (0,1.8) signal has 1.8s
% tendo 12 digitos, cada digito terá aproximadamente 10.42 ms
start = [0.1549 0.2839 0.4383 0.557 0.6929 0.8243 0.9659 1.089 1.226 1.362 1.49 1.634];
% start / sampling period (0.125ms) dá o vector de samples
startN = [1239  2271 3506 4456 5543 6594 7727 8712 9808 10896 11920 13072];
N2 = N/2;
n = (0:N2-1);
k = (0:N2-1);

for i=1:12
    figure(1);
    nstart = startN(i);
    nend = startN(i)+400;
    n = (nstart:nend);
    x2 = x(nstart:nend)
    plot(n,x2);
    Y = fft(x2,N2); 
    Yb = Y.*imag(Y);
    figure(2);
    stem(k*fs/N2,Yb);
    title('An�lise Espectral');
    xlabel('Frequ�ncia (Hz)');
    ylabel('Densidade Espetral Pot�ncia');
    pause;
end
