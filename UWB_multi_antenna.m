## Copyright (C) 2012 Tobias

## Author: Tobias Volkmar
## Created: 2012-04-05

function X= UWB_single_antenna()
	%% Eingabewerte 4x1
	X=[1:4; 5:8; 9:12; 13:16]

	%% Übertragungsfunktion
	h=rand(4,4)+i*rand(4,4);

	%%IFFT, Faltung und FFT
	for i=1:4
		x=ifft(X(:,i));
		y=cconv(h(:,i),x);
		Y(:,i)=fft(y);
		H(:,i)=fft(h(:,i));
	end
	
	%%Decoder
	X=Y./H;
endfunction

function Y=cconv(x,y)
	Y=ifft(fft(x).*fft(y));
endfunction