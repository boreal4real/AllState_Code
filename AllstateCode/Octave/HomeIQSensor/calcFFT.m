function freqResponse = calcFFT(timeSignal, sampFreq)
L = length(timeSignal);
f = sampFreq;
Y = fft(timeSignal);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = sampFreq*(0:(L/2))/L;
plot(f,P1)

end