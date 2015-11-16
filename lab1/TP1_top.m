%Generate the PSS signals (pss0_t,pss1_t,pss2_t)
pss
close all
%% Section 1.1.1
%
% 1. 
% Plot of real, imag and magnutude of one of the PSS signals

subplot(3,1,1)
plot(real(pss1_t));
title 'Real part'
subplot(3,1,2)
plot(imag(pss1_t));
title 'Imaginary part' 
subplot(3,1,3)
plot(abs(pss1_t));
title 'Magnitude'

% Both the real and imag part seem symmetrical and have about the same
% energy 


% 2.
% Plot of PSS, 
figure;
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


%% Questions 1.2.1. 


% 1. Acquiering snapshots of 10 ms duration.

figure;
% Read in sample file (example here)
fd = fopen('usrp_samples.dat','r') ; 
s = fread(fd,153600*2,'int16') ; 
fclose(fd) ; 
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 
% Plot an approximation to the power spectrum
f = linspace(-7.68e6,7.68e6,153600);
plot(f,20*log10(abs(fftshift(fft(s2)))))
axis([-7.68e6 7.68e6 100 150])
fd = fopen('usrp_samples_AykutHenning2.dat','r') ;
s = fread(fd,153600*2,'int16') ;
fclose(fd) ;
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ; 
sig = s2;



% 2. Plot of time and frequency representation of PSS-signals on DB-scale
% Matched filters
matched_flt0 = conv(sig,fliplr(conj(pss0_t)));
matched_flt1 = conv(sig,fliplr(conj(pss1_t)));
matched_flt2 = conv(sig,fliplr(conj(pss2_t)));
figure;
subplot(3,1,1)
plot(abs(matched_flt0));
subplot(3,1,2)
plot(abs(matched_flt1));
subplot(3,1,3)
plot(abs(matched_flt2));
 
 
figure;
 
plot(abs(matched_flt0),'r');
hold on
plot(abs(matched_flt1),'b');
plot(abs(matched_flt2),'g');
% steepest decent algoritm
hold off
figure;


% 4. Changing the position of the antenna contributes to the 'changing
% shape' of the main signal component. 




%% Questions 1.3.1 

% 1. The statitic is related to very closely related to the Maximum
% likelihood detector, because it basically is, hehe.






 
plot(power(abs(matched_flt1),2));


[ymax0, ind0] = max(abs(matched_flt0));
[ymax1, ind1] = max(abs(matched_flt1));
[ymax2, ind2] = max(abs(matched_flt2));


% Dirty way to find index of the most likely pss, represented by b
i_e   = [ymax0, ind0; ymax1, ind1; ymax2, ind2];
[a,b] = max(i_e(:,1)); b=b-1;  
i_pos = (i_e(b,2));




% N_f   = i_pos - delta_pss;










