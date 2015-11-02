%Generate the PSS signals (pss0_t,pss1_t,pss2_t)
pss
fs = 15.36e6;
% Do section 1.1 work here
subplot(3,3,1);
plot(20*log10(abs(fftshift(fft(pss0_t)))));
title('PSD of Signal 1');
subplot(3,3,2);
plot(20*log10(abs(fftshift(fft(pss1_t)))));
title('PSD of Signal 2');
subplot(3,3,3);
plot(20*log10(abs(fftshift(fft(pss2_t)))));
title('PSD of Signal 3');
subplot(3,3,4);
plot(20*log10(abs((conv(pss0_t,fliplr(conj(pss0_t)))))));
title('Autocorrelation pss0_t');
subplot(3,3,5);
plot(20*log10(abs(conv(pss1_t,fliplr(conj(pss1_t))))));
title('Autocorrelation pss1_t');
subplot(3,3,6);
plot(20*log10(abs(conv(pss2_t,fliplr(conj(pss2_t))))));
title('Autocorrelation pss2_t');
subplot(3,3,7);
plot(20*log10(abs((conv(pss0_t,fliplr(conj(pss1_t)))))));
title('Cross_correlation pss0_t vs pss1_t');
subplot(3,3,8);
plot(20*log10(abs((conv(pss1_t,fliplr(conj(pss2_t)))))));
title('Cross_correlation pss1_t vs pss2_t');
subplot(3,3,9);
plot(20*log10(abs((conv(pss0_t,fliplr(conj(pss2_t)))))));
title('Cross_correlation pss0_t vs pss2_t');

% Read in sample file (example here)
fd = fopen('usrp_samples_AykutHenning2.dat','r') ; 
s = fread(fd,153600*2,'int16') ; 
fclose(fd) ; 
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 

%plot an approximation to the power spectrum
figure;
subplot(3,1,1);
f = linspace(-7.68e6,7.68e6,153600);
plot(f,20*log10(abs(fftshift(fft(s2)))))
title('Real signal extracted from USRP- Sample 1')
axis([-7.68e6 7.68e6 100 150])

fd = fopen('usrp_samples_AykutHenning3.dat','r') ; 
s = fread(fd,153600*2,'int16') ; 
fclose(fd) ; 
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 

%plot an approximation to the power spectrum

subplot(3,1,2);
f = linspace(-7.68e6,7.68e6,153600);
plot(f,20*log10(abs(fftshift(fft(s2)))))
title('Real signal extracted from USRP-Sample 2')
axis([-7.68e6 7.68e6 100 150])

fd = fopen('usrp_samples.dat','r') ; 
s = fread(fd,153600*2,'int16') ; 
fclose(fd) ; 
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 

%plot an approximation to the power spectrum

subplot(3,1,3);
f = linspace(-7.68e6,7.68e6,153600);
plot(f,20*log10(abs(fftshift(fft(s2)))))
title('Real signal extracted from USRP-Test')
axis([-7.68e6 7.68e6 100 150])



% Do Sections 1.2 and 1.3 work hre
