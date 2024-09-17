
clc;clear all; 
syms s R L C r Vdc kp ki kpp kii;
d_11=[1 ((1/R*C)+(r/L)) ((r/(R*L*C))+(1/L*C))];
n_11=Vdc/(R*L*C);
Z_N = Vdc/(R*L*C);
Z_D1 = s^2;
Z_D2 = ((r/L)+(1/(R*C)))*s;
Z_D3= ((r/(R*L*C)+(1/(L*C))));
Z_total = Z_D1 + Z_D2 + Z_D3;
disp('\n Transfer Function of iL/d::');
V_out = Z_N / (Z_D1 + Z_D2 + Z_D3);
pretty(V_out)
c=kp+(ki/s);
 In=(V_out*c);
 G = In;
H = G / (1 + G);
H_simplified = simplify(H);
Open = H_simplified;
 c_2= kpp+(kii/s);
 mnc=Open*c_2;
 nba=simplify(mnc);
 disp('\n Transfer function of open loop:')
 pretty(mnc);
 common_factor = collect(mnc, r);

% Display the result
disp('Expression with "r" factored out from the denominator:');
pretty(common_factor);
