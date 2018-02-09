%% generator data with Reactive Power limits
function mpc = casenew
%   Summary of this function goes here
%   Detailed explanation goes here
 
%% Matpower version
mpc.version = '2';
 
% System MVA Base
mpc.baseMVA=2;
 
%% bus data
          %   bus_i   type    Pd  Qd  Gs  Bs  area    Vm  Va  baseKV  zone Vmax  Vmin
mpc.bus = [     
    80  2   0   0   0   0   1   1   0  0.4  1   1.01    0.99;
    1   3   0   0   0   0   2   1   0  110  1   1.01    0.99;
    2   2   0   0   0   0   1   1   0   20  1   1.01    0.99;
    3   2   0   0   0   0   2   1   0   20  1   1.01    0.99;
    4   1  0.63 0.2 0   0   3   1   0   20  1   1.01    0.99;
    5   1  1.05 0.6 0   0   3   1   0   20  1   1.01    0.99;
    6   1   1   0.2 0   0   3   1   0   20  1   1.01    0.99;
    7   1  1.03 0.2 0   0   2   1   0   20  1   1.01    0.99;
    8   2   0   0   0   0   1   1   0   20  1   1.01    0.99;
    9   1   0   0   0   0   1   1   0   20  1   1.01    0.99;
    10  2   0   0   0   0   1   1   0   20  1   1.01    0.99; 
];
 
%% generator data with Reactive Power limits 
%   bus Pg  Qg  Qmax    Qmin    Vg  mBase   status  Pmax    Pmin
mpc.gen = [
    80   2.0   0   3   -3      1    2.0   1   2.0  0;
    1    0     0   1e3 -1e3    1    2.0   1   2.0  0;
    5    0.25  0   3   -3      1    2.0   1   0.25 0;
    8    1.50   0   3   -3      1    2.0   1   1.50 1.0;
    10   2     0   3   -3      1    2.0   1   2    0;
];
 
% Settings
bkV04=400;
bkV20=20000;
bkV110=110000;
bMVA=2000;
freq=50;
 
l1=0.5;
l2=1.2;
l3=0.4;
l4=1;
l5=0.2;
l6=0.6;
l7=0.1;
l8=2;
l9=0.9;
l10=0.7;
 
R1=0.443;
R2=0.32;
R3=0.253;
R4=0.206;
R5=0.413;
R6=0.31;
 
X1=0.137;
X2=0.13;
X3=0.125;
X4=0.112;
X5=0.36;
X6=0.35;
 
C1=191;
C2=212;
C3=231;
C4=249;
C5=10;
C6=10;
 
uk=12.5;
ur=8;
 
ST1=12500000;
ST2=2000000;
 
LR1=l1*R4*bMVA/bkV20^2
LR2=l2*R3*bMVA/bkV20^2
LR3=l3*R2*bMVA/bkV20^2
LR4=l4*R2*bMVA/bkV20^2
LR5=l5*R1*bMVA/bkV20^2
LR6=l6*R1*bMVA/bkV20^2
LR7=l7*R2*bMVA/bkV20^2
LR8=l8*R5*bMVA/bkV20^2
LR9=l9*R3*bMVA/bkV20^2
LR10=l10*R6*bMVA/bkV20^2
 
LX1=l1*X4*bMVA/bkV20^2
LX2=l2*X3*bMVA/bkV20^2
LX3=l3*X2*bMVA/bkV20^2
LX4=l4*X2*bMVA/bkV20^2
LX5=l5*X1*bMVA/bkV20^2
LX6=l6*X1*bMVA/bkV20^2
LX7=l7*X2*bMVA/bkV20^2
LX8=l8*X5*bMVA/bkV20^2
LX9=l9*X3*bMVA/bkV20^2
LX10=l10*X6*bMVA/bkV20^2
 
LC1=l1*C4*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC2=l2*C3*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC3=l3*C2*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC4=l4*C2*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC5=l5*C1*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC6=l6*C1*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC7=l7*C2*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC8=l8*C5*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC9=l9*C3*2*pi*freq*1e-9*(bkV20^2/bMVA)
LC10=l10*C6*2*pi*freq*1e-9*(bkV20^2/bMVA)
 


TR1=ur/100*(110000/bkV110)^2*bMVA/ST1
TR2=ur/100*(20000/bkV20)^2*bMVA/ST2
 
TX1=(110000/bkV110)^2*bMVA/ST1*sqrt(uk^2-ur^2)/100
TX2=(20000/bkV20)^2*bMVA/ST2*sqrt(uk^2-ur^2)/100
 
TC1=0;
TC2=0;
n1=bkV110/bkV20*bkV20/bkV110;
n2=bkV20/bkV04*bkV04/bkV20;
ang=30;
%rate
l70=.208 * bkV20/1000;
l95=.248 * bkV20/1000;
l120=.283 * bkV20/1000;
l150=.315 * bkV20/1000;
lh70=.29 * bkV20/1000;
lh95=.35 * bkV20/1000;

% Branch Details
   
%	fbus	Tbus  r  x   b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch=[									
    2       3       LR1     LX1     LC1     l150    l150    l150       0       0       1       -360    360;    % Ln1			
    3       4       LR2     LX2     LC2     l120    l120    l120       0       0       1       -360    360;    % Ln2			
    4       5       LR3     LX3     LC3     l95      l95     l95           0       0       1       -360    360;     % Ln3			
    5       6       LR4     LX4     LC4     l95      l95     l95           0       0       1       -360    360;     % Ln4			
    6       7       LR5     LX5     LC5     l70      l70     l70           0       0       1       -360    360;      % Ln5			
    7       8       LR6     LX6     LC6     l70      l70     l70           0       0       1       -360    360;      % Ln6			
    8       9       LR7     LX7     LC7     l95      l95     l95           0       0       1       -360    360;       %Ln7
    9       10     LR8     LX8     LC8     lh70    lh70  lh70         0       0       1       -360    360;      % Ln8			
    9       2       LR9     LX9     LC9     l120     l120  l120         0       0       1       -360    360;      % Ln9			
    3       7       LR10   LX10   LC10  lh95     lh95  lh95         0       0       1       -360    360;      % Ln10			
    1       3       TR1     TX1     TC1     0         0       0              n1       ang   1       -360    360;      % T1			
    80      2      TR2     TX2     TC2     0         0       0              n1       ang   1       -360    360;      % T2			
     										
    ];										
