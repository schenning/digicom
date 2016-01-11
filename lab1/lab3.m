lab2;



N_RB_DL = 50;  % Number of Recource blocks
lte_gt = lte_rs_gold(0,N_idcell);
p_l_Ns = lte_rs(0,N_idcell,1,0,N_RB_DL,lte_gt);
%v_shift = cellID mod 6