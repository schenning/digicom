lab2;
close all


N_RB_DL = 50;  % Number of Recource blocks

lte_gt = lte_rs_gold(0,N_idcell);
l=0;
p_l_Ns = zeros(2,100);
p_l_Ns(1,:) = lte_rs(0,N_idcell,l,0,N_RB_DL,lte_gt);
l=1;
p_l_Ns(2,:) = lte_rs(0,N_idcell,l,0,N_RB_DL,lte_gt);


%v_shift = cellID mod 6

startpoint_sss= N_f-72-1024-1023;
endpoint_sss= N_f-72-1024; % Using this to find time instance of first PBCH-symbol


%Exetract the PBCH
startpoint_PBCH = endpoint_sss + 72 + 1024 + 80; % Latter is bc 
displacement = 0;
pbch_symbols = zeros(1024,5);
for i = 1:5
    for j = 1:1024
        pbch_symbols(j,i) = s2(startpoint_PBCH + displacement + j);
    end
    displacement = displacement + 72 + 1024;
end
R=zeros(1024,5);
% Take the DFT of each PBCH
for i = 1:5
    R(:,i)= fft(pbch_symbols(:,i),1024);
end

% Ext0

for i=1:5
    R_e(:,i) = [R(1024+(-299:0),i) ; R(2:301,i)]; %
end

    
v=mod(N_idcell,6) +1; 



RS70 = R_e(v:6:end,1); % for p=0 
RS71 = R_e(mod(v+3,6):6:end,1); % for p=1
RS110= R_e(mod(v+3,6):6:end,5); % p=0
RS111= R_e(v:6:end,5); % p=1

idxPRB22 = 12*22+1; % startindex of PRB22

% Exetracting resource elements and set pilots to zero
RE7 = R_e( idxPRB22: 12*28, 1);
RE7(min( v, mod(v+3,6)):3:end) = 0; 
RE8 = R_e( idxPRB22: 12*28, 2);
RE8(min(v, mod(v+3,6)): 3: end) = 0;
RE9 = R_e( idxPRB22:12*28,3);
RE10 = R_e( idxPRB22:12*28,4);
k=1;

% Removing the indices in RE7 and RE8 that contain pilots 
% in order to extract the PRB's in RE7 and RE8
for i=1:48
    if RE7(i) == 0
        RE7(i)= [];
    end
end

for i=1:48
    if RE8(i) == 0
        RE8(i)= [];
    end
end


% Resource elments

RE = [RE10 ;RE9 ;RE8 ; RE7];


% channel estimation

H0_7_est  = RS70.* p_l_Ns(1,:).';
H1_7_est  = RS71.* p_l_Ns(1,:).';
H0_11_est = RS110.*p_l_Ns(2,:).';
H1_11_est = RS111.*p_l_Ns(2,:).';

figure;
subplot(2,1,1)
plot(20*log10(abs(H0_7_est)),'r')
hold on
plot(20*log10(abs(H0_11_est)),'b')


subplot(2,1,2)
plot(20*log10(abs(H1_7_est)),'r')
hold on
plot(20*log10(abs(H1_11_est)),'b')


% Applaying the conjugated channel estiamtes to the received resource
% elements 




























        


