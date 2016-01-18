lab2;
close all


N_RB_DL = 50;  % Number of Recource blocks
lte_gt = lte_rs_gold(0,N_idcell);
p_l_Ns = lte_rs(0,N_idcell,1,0,N_RB_DL,lte_gt);

%v_shift = cellID mod 6

startpoint_sss= N_f-72-1024-1023;
endpoint_sss= N_f-72-1024;


%Exetract the PBCH
startpoint_PBCH = endpoint_sss + 72 + 1024 + 80; % Latter is bc 
displacement = 0;
pbch_symbols = zeros(1024,4);
for i = 1:4
    for j = 1:1024
        pbch_symbols(j,i) = s2(startpoint_PBCH + displacement + j);
    end
    displacement = displacement + 72 + 1024;
end
R=zeros(1024,4);
% Take the DFT of each PBCH
for i = 1:4
    R(:,i)= fft(pbch_symbols(:,i),1024);
end

% Ext0

for i=1:4
    R_e(:,i) = [R(1024-299:1024,i) ; R(2:301,i)]; %
end


    % Symbol 7
    
v=mod(N_idcell,6); 
RS70 = R_e(v:6:end,1); % for p=0
RS71 = R_e(mod(v+3,6):6:end,1); % for p=1

RS110= R_e(mod(v+3,6):6:end,4); % p=0
RS111= R_e(v:6:end,4); % p=1

intx = 1:100;
xq = 1:0.25:100;
vq = interp1(intx,RS110,xq);









R_ext2 = R_e(12*21-1:12*27);






%RS07= 
















        


