% Generate a transmit pulse with oversampling 16
ups=16;

% Set up a root-raised cosine transmit filter 
% Bandwidth is approximately 1.22 times the symbol rate)

txfilt = rraised_cosine(.22,ups,-6,6);
txfilt = txfilt/sqrt(sum(txfilt.^2));

%**********************************************************************************************
% Question 0, Plot some time and frequency versions of the TX filter, 
% change the values of the length (try 6,12,24,etc.).  For frequency, 
% plot on a dB log-scale (for example using 20*log10(abs(fft(txfilt,10*length(txfilt))))) 
%**********************************************************************************************

% Set the intermediate carrier frequency (.125 - .4)
f_IF = .4;

% Set the SNR as desired
SNR = 10;

%Generate a random signal of length 1024 16-QAM symbols (512 bytes)
INPUT_LEN=1024;
p = floor(256*rand(1,INPUT_LEN/2));
pmod = QAM_MOD(16,p);

%Build the transmission burst
txsig0 = zeros(1,160*ups);

for i=1:INPUT_LEN,
  txsig0((ups*i) : ((ups*i)+length(txfilt)-1)) = txsig0((ups*i):((ups*i)+length(txfilt)-1)) + pmod(i)*txfilt; 
end

%**********************************************************************************************
% Question 1, explain the above, specifically why it corresponds to equation (1) in the handout.
%**********************************************************************************************
% Modulate by f_IF and compute real signal
txsig1 = XXXXXXX

% Plot the power spectrum (using fft if you like)
figure(1)
plot(20*log10(abs(fft(txsig1))))


% Channel

%Set up a propagation channel with a delay profile ranging from 0 to 10 us
%and an exponentially decaying impulse response
decay_factor = 2;
amps = exp(-decay_factor*(0:.1:9));
% Normalize channel energy
amps = amps/sum(amps);
delays = (0:.1:9)*10/9;
BW = .2*ups;  % sampling frequency normalized to 1 MHz (here 200 kHz * 2)

ch = channel(amps,delays,BW,12*ups);

rxsig0 = conv(ch,txsig1);
%*******************************************************************************
% Question 2, explain the function of the channel.m function
% Plot the output of the channel (without noise) in the 
% frequency-domain (log-dB plot), does the channel have an effect, if 
% so what?  If not, can you change parameters so that it does (i.e. 
% the channel dispersion)
%*******************************************************************************


% Fill in the following two receivers according to the figures in the 
% handout.  Be careful to apply a proper time-shift to the matched 
% filter before downsampling.  This amounts to a synchronization 
% circuit in a real digital receiver. How should you choose this delay?

% Receiver 1 (quadrature demodulator)

% Downconvert
rxsig1 = 

figure(2)
plot(20*log10(abs(fft(rxsig0))))


% Receiver 2 (Hilbert transformer)

rxsig2 = 


%Add noise to rxsig0 according to the SNR defined above (use the randn 
%function with a variance chosen so that the signal to noise ratio is 
%correct.  For this, you have to compute the averate signal strength
%in txsig1.

rxsig3 = rxsig0 + K*randn(1,length(rxsig0));

%***********************************************************************************
% Question 3. Plot the spectrum of rxsig3.  How is it different than that of rxsig0?
%***********************************************************************************
  

% Apply receiver 1 to rxsig3 to generate rxsig4 and plot the output as

plot(rxsig4,'x')

%***********************************************************************************
% Question 4: Explain what you see in the plot of rxsig4 as a function 
% of the time-dispersion of the channel. What is the effect of the SNR 
% (try values from 10-40 dB)
%***********************************************************************************