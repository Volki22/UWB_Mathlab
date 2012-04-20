%% Copyright (C) 2012 Tobias

%% Author: Tobias Volkmar
%% Created: 2012-04-05

function X= UWB_single_antenna()
	%% Eingabewerte 4x1
	X=[1:4]'
    
	%% Uebertragungsfunktion
	h=rand(4,4)+1i*rand(4,4);

	%%IFFT, Faltung und FFT
	x=ifft(X);                  
	y=cconvOctave(h(:,1),x);
	Y=fft(y);
	H=fft(h);

	%%Decoder
	X=Y./H(:,1);
end