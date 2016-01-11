% Lab 2 Digicom
TP1_top;
sss;
close all
 
% Read in sample file (example here)
% fd = fopen(inputfile,'r') ;
% s = fread(fd,153600*2,'int16') ;
% fclose(fd) ;
% s2 = s(1:2:end) + sqrt(-1)*s(2:2:end) ;
% s2= s2.* exp(-1i * 2*pi*100 * 17 *(0:length(s2)-1)/15.36e6).';


%Remember to also do the same for subframe5, ie the same operation as sss_e

N_f = i_pos-15; %why?
sss_extracted0 = [];
ss0   = s2((N_f-72-1024-1023):(N_f-72-1024));
ss5   = s2((N_f-72-1024-1023 + 76800):(N_f-72-1024 + 76800));
pss0  = s2((N_f -1024): (N_f));




p_f = fft(pss0, 1024); 
p_f2(1:36) =  p_f(1024 + (-35:0)) ;
p_f2(37:72)=  p_f(2:37);
s_f0  = (fft(ss0,1024)); 
s_f5  = (fft(ss5,1024));






figure;
stem(abs(fftshift(s_f0)))
title 's_f'


sss_extracted0(1:36) = s_f0((1024-35):1024);
sss_extracted0(37:72)= s_f0(2:37);
sss_extracted5(1:36) = s_f5((1024-35):1024);
sss_extracted5(37:72)= s_f5(2:37);



figure;
stem(abs(sss_extracted0));
title 'SSS extracted'
figure;
plot(sss_extracted0,'o')
axis([-10*power(10,5) 10*power(10,5) -10*power(10,5) 10*power(10,5)])


i=6; %%?
switch PSS_index
    
    case 0
        pss_f_extracted = pss0_f0(1:2:length(pss0_f0)) + sqrt(-1)*pss0_f0(2:2:length(pss0_f0));
    case 1
        pss_f_extracted = pss1_f0(1:2:length(pss1_f0)) + sqrt(-1)*pss1_f0(2:2:length(pss1_f0));
    case 2
        pss_f_extracted = pss2_f0(1:2:length(pss2_f0)) + sqrt(-1)*pss2_f0(2:2:length(pss2_f0));
        
    otherwise
        fprintf('Error happend\n');
        return
end

        
H_n = conj(pss_f_extracted).* p_f2;
sss_comp = conj(H_n).* sss_extracted0; %complex

figure; stem(abs(H_n));
title('H_n');
figure; plot(abs(ifft([0 fftshift(H_n)])));
figure; 
figure;
title('imag');
plot(imag(H_n),'b');
figure;
plot(real(H_n),'r');
figure
plot(sss_comp,'x');
title 'constellation'
axis([-max(abs(sss_comp)) max(abs(sss_comp)) -6*max(abs(sss_comp)) 6*max(abs(sss_comp))])
   

sss_estimate  = conj(H_n).*sss_extracted0;
sss5_estimate = conj(H_n).*sss_extracted5;

sss_estimate_extracted0 = [real(sss_estimate(6:36)) real(sss_estimate(38:68))];
sss_estimate_extracted5 = [real(sss5_estimate(6:36)) real(sss5_estimate(38:68))];


% c)

sssCorr00 = d0((PSS_index+1):3:end,:) * sss_estimate_extracted0.';  
sssCorr55 = d5((PSS_index+1):3:end,:) * sss_estimate_extracted5 .';
sssCorr50 = d5((PSS_index+1):3:end,:) * sss_estimate_extracted0 .';
sssCorr05 = d0((PSS_index+1):3:end,:) * sss_estimate_extracted5 .';
sss05     = sssCorr00 + sssCorr55;
sss50     = sssCorr05 + sssCorr50; 


stem(sss50)
figure;
stem(sss05)
title 'sss05'



  
[mx05, idx05]  = max(sss05);
[mx50,idx50] = max(sss50);


% tmp = [mx05, idx05; mx50, idx50];
% [mx,inx]  = max(tmp(:,1));
% sd = tmp(inx,inx+1)



tmp = max(idx05,idx50);

N_idcell = 3*(tmp-1) + PSS_index;

fprintf('%d\n', N_idcell);





   
   
