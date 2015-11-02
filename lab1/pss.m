Nfft=1024;

pss0_f0=[0,0,0,0,0,0,0,0,0,0,32767,0,-26120,-19785,11971,-30502,-24020,-22288,32117,6492,31311,9658,-16384,-28378,25100,-21063,-7292,-31946,20429,25618,14948,29158,11971,-30502,31311,9658,25100,-21063,-16384,28377,-24020,22287,32117,6492,-7292,31945,20429,25618,-26120,-19785,-16384,-28378,-16384,28377,-26120,-19785,-32402,4883,31311,-9659,32117,6492,-7292,-31946,32767,-1,25100,-21063,-24020,22287,-32402,4883,-32402,4883,-24020,22287,25100,-21063,32767,-1,-7292,-31946,32117,6492,31311,-9659,-32402,4883,-26120,-19785,-16384,28377,-16384,-28378,-26120,-19785,20429,25618,-7292,31945,32117,6492,-24020,22287,-16384,28377,25100,-21063,31311,9658,11971,-30502,14948,29158,20429,25618,-7292,-31946,25100,-21063,-16384,-28378,31311,9658,32117,6492,-24020,-22288,11971,-30502,-26120,-19785,32767,0,0,0,0,0,0,0,0,0,0,0];

pss1_f0=[0,0,0,0,0,0,0,0,0,0,32767,0,-31754,-8086,-24020,-22288,2448,32675,-26120,19784,27073,18458,-16384,28377,25100,21062,-29523,14217,-7292,31945,-13477,-29868,-24020,-22288,27073,18458,25100,21062,-16384,-28378,2448,-32676,-26120,19784,-29523,-14218,-7292,31945,-31754,-8086,-16384,28377,-16384,-28378,-31754,-8086,31311,-9659,27073,-18459,-26120,19784,-29523,14217,32767,-1,25100,21062,2448,-32676,31311,-9659,31311,-9659,2448,-32676,25100,21062,32767,0,-29523,14217,-26120,19784,27073,-18459,31311,-9659,-31754,-8086,-16384,-28378,-16384,28377,-31754,-8086,-7292,31945,-29523,-14218,-26120,19784,2448,-32676,-16384,-28378,25100,21062,27073,18458,-24020,-22288,-13477,-29868,-7292,31945,-29523,14217,25100,21062,-16384,28377,27073,18458,-26120,19784,2448,32675,-24020,-22288,-31754,-8086,32767,0,0,0,0,0,0,0,0,0,0,0];

pss2_f0 = [0,0,0,0,0,0,0,0,0,0,32767,0,-31754,8085,-24020,22287,2448,-32676,-26120,-19785,27073,-18459,-16384,-28378,25100,-21063,-29523,-14218,-7292,-31946,-13477,29867,-24020,22287,27073,-18459,25100,-21063,-16384,28377,2448,32675,-26120,-19785,-29523,14217,-7292,-31946,-31754,8085,-16384,-28378,-16384,28377,-31754,8085,31311,9658,27073,18458,-26120,-19785,-29523,-14218,32767,0,25100,-21063,2448,32675,31311,9658,31311,9658,2448,32675,25100,-21063,32767,0,-29523,-14218,-26120,-19785,27073,18458,31311,9658,-31754,8085,-16384,28377,-16384,-28378,-31754,8085,-7292,-31946,-29523,14217,-26120,-19785,2448,32675,-16384,28377,25100,-21063,27073,-18459,-24020,22287,-13477,29867,-7292,-31946,-29523,-14218,25100,-21063,-16384,-28378,27073,-18459,-26120,-19785,2448,-32676,-24020,22287,-31754,8085,32767,-1,0,0,0,0,0,0,0,0,0,0];

pss0_f = pss0_f0(1:2:length(pss0_f0)) + sqrt(-1)*pss0_f0(2:2:length(pss0_f0));
pss0_f = [0 pss0_f(37:72) zeros(1,Nfft-73) pss0_f(1:36)];
pss0_t = ifft(pss0_f);
pss0_t = [pss0_t((Nfft-127):Nfft) pss0_t];
pss0_t = [pss0_t zeros(1,Nfft+36) pss0_t]; 
pss0_t = pss0_t/norm(pss0_t);

pss1_f = pss1_f0(1:2:length(pss1_f0)) + sqrt(-1)*pss1_f0(2:2:length(pss1_f0));
pss1_f = [0 pss1_f(37:72) zeros(1,Nfft-73) pss1_f(1:36)];
pss1_t = ifft(pss1_f);
pss1_t = pss1_t / norm(pss1_t);

pss2_f = pss2_f0(1:2:length(pss2_f0)) + sqrt(-1)*pss2_f0(2:2:length(pss2_f0));
pss2_f = [0 pss2_f(37:72) zeros(1,Nfft-73) pss2_f(1:36)];
pss2_t = ifft(pss2_f);
pss2_t = pss2_t / norm(pss2_t);


