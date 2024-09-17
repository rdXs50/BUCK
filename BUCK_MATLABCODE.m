clear all;clc;
Vdc=48;
R=15;
L=100e-6;
C=25e-6;
n = [Vdc/L Vdc/(R*L*C)];
d=[ 1 1/(R*C) 1/(L*C)];
t = tf(n,d);   %(iL/d) wo PI
n_1=[Vdc/(L*C)];
d_1=[1 1/(R*C) 1/(L*C)];
t_1=tf(n_1,d_1);   % Vo/d wo PI
disp('\n Transfer Function without PI controller:');
flag= (t_1)/t     % Vo/iL wo PI
kp_i= [0.0009];
a=50.90;
m = [1 0];
ki_i= a*tf(1,m);
 c= kp_i+ki_i;
 t_11=t*c;     %iL/d w PI inner loop
 In= t_11/(t_11+1);
 kp_o= [0.08];
p =704.03;
m_1 = [1 0];
ki_2= p*tf(1,m_1);
 c_2= kp_o+ki_2;
 disp('\n Transfer function after adding PI contoller:')
 flag_2= (In*c_2)
%margin(flag_2);
 %pzplot(flag_2)
%nyquist(flag_2)
disp('\n Bandwidth::')
fb=bandwidth(flag)
disp('\n inductor series resistance Added!!')
%kp_i1=1; %kp inner
%a_1=10;  %ki inner
%Num = [(R*C) 1 0 0];
%den = [(R*L*C) L R (Vdc*(kp_i1)) (Vdc*(a_1)) 0];
%disp('\n Transfer function with controller::');
%pop=tf(Num,den)
%rlocus(pop);
%rlocus(flag_5);
Num = [(R*C) 1 0 0];
den = [(R*L*C) L R (Vdc*(kp_i)) (Vdc*(a)) 0];
disp('\n Transfer function with controller::');
pop=tf(Num,den)
rlocus(pop);
