## Copyright (C) 2012 Tobias

## Author: Tobias Volkmar
## Created: 2012-04-05

function X= UWB_single_antenna()
%% Eingabewerte 4x1
X=[1:4]'

%% Ausgabewerte 4x1
Y=zeros(4,1);

%% Übertragungsfunktion
h=rand(4,4)+i*rand(4,4);

%%IFFT, Faltung und FFT
x=ifft(X);
y=cconv(h(:,1),x);
Y=fft(y);
H=fft(h);

%%Decoder
Hinv=inv(H);
X=Y.*Hinv(:,1);

endfunction
