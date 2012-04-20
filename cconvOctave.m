function Y=cconvOctave(x,y) %%Zyklische Faltung fuer Octave
	Y=ifft(fft(x).*fft(y));
end