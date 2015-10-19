function [ch] = channel(amps,delays,bandwidth,channel_length)

% ch is FIR filter response
% amps is channel amplitudes (energy)
% delays is channel tap delays (in microseconds)
% bandwidth is system bandwidth (e.g. sampling frequency) in MHz

amps = amps/sum(amps);
k = floor(-channel_length/2):floor(channel_length/2);
a = sqrt(amps/2) .* (randn(1,length(amps)) + j*randn(1,length(amps)));
ch = zeros(1,length(k));

for l=1:length(a)
     ch = ch + a(l)*sinc(k-delays(l)*bandwidth);
end
