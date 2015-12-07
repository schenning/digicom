% Lab 2 Digicom
close all
 
% Read in sample file (example here)
fd = fopen('usrp_samples.dat','r') ;
s = fread(fd,153600*2,'int16') ;
fclose(fd) ;
s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ;
s2= s2.* exp(-1i * 2*pi*100 * 17 *(0:length(s2)-1)/15.36e6).';


N_f = ind2-15; %needs to be changed for every new ind
sss_e = [];
ss0 = s2((N_f-72-1024-1023):(N_f-72-1024));
pss0 = s2((N_f -1024): (N_f));
p_f = fft(pss0, 1024);
p_f2(1:36) =  p_f(1024 + (-35:0)) ;
p_f2(37:72)=  p_f(2:37);
s_f  = (fft(ss0,1024));ind2
figure;
stem(abs(fftshift(s_f)))
title 's_f'
sss_e(1:36)= s_f((1024-35):1024);
sss_e(37:72)= s_f(2:37);
figure;
stem(abs(sss_e));
title 'SSS extracted'
figure;
plot(sss_e,'o')

axis([-10*power(10,5) 10*power(10,5) -10*power(10,5) 10*power(10,5)])
pss2_f_extracted = [];
i=6;
pss2_f_extracted = pss2_f0(1:2:length(pss2_f0)) + sqrt(-1)*pss2_f0(2:2:length(pss2_f0));
   
   %for j=1:1:1024
   %     if (abs(pss2_f(j))~= 0)
   %         pss2_f_extracted(i) = pss2_f(j);
   %         i=i+1;
   %     end
   %end
   %pss2_f_extracted(end:end+5) = 0
   
   H_n = conj(pss2_f_extracted).* p_f2;
   figure; stem(abs(H_n));
   title('H_n');
   figure 
   plot(abs(ifft([0 fftshift(H_n)])));
   
   figure; 
   
   sss_comp = conj(H_n).* sss_e;
   figure;
   title('imag');
   plot(imag(H_n),'b');
   figure;
   plot(real(H_n),'r');
   figure
   plot(sss_comp,'x');
   axis([-max(abs(sss_comp)) max(abs(sss_comp)) -1.5*max(abs(sss_comp)) 1.5*max(abs(sss_comp))])
   
   
 
% c)
 
%h_pss = cconv(conj(pss_2f),