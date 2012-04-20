%% Copyright (C) 2012 Tobias

%% Author: Tobias Volkmar
%% Created: 2012-04-05

function X= UWB_multi_antenna()
	%% Eingabewerte 4x4
	X=[1:4; 5:8; 9:12; 13:16]   % Sendesymbole spaltenweise    

	%% Uebertragungsfunktion
	h=rand(4,4)+1j*rand(4,4);   %Zufallskanal

	%%iFFT, Faltung und FFT
	for k=1:4                  	%spaltenweise Berechnung der IFFT, der Faltung 
		x=ifft(X(:,k));         %und der resultierenden Ausgabe- und Kanal-FFT
		y=cconvOctave(h(:,k),x);
        y=awgn(y,28);           %Rauschen auf das Singal geben, max 28dB
		Y(:,k)=fft(y);          %Kanal- und Ausgabewerte hier spaltenweise aufbauend
		H(:,k)=fft(h(:,k));
    end
    
    %{
    Output
    X2=1:100;
    t=0:99;
    a=awgn(X2,.0001);
    plot(X2,t,a,t);
    %}
    
	%%Decoder
	X=Y./H
    X=real(round(X));           %Runden und Realteil isolieren um Signal zu rekonstruieren
    %% runden mit Rauschen
end
    