function dvars_dt = Math_chemostat_edit(t,vars)

load params

Fglc = params(1);
Fgln = params(2);
Cglcin = params(3); %0:50 conc
Cglnin = params(4); %0:8 conc

Xv = vars(1);
Cglc = vars(2);
Cgln = vars(3);
Clac = vars(4);
Camm = vars(5);
Cmab = vars(6);
V = vars(7);


% 
% Xvo=2*10^8
% Cglco=25
% Cglno=4
% Claco=0
% Camm0=0
% Cmabo=0
% Vo=0.79


umax = 1.09; %d^-1
Kglc = 1.0; %mM
Kgln = 0.3; %mM

%umax = 1.09 %d^-1
kdmax = 0.69; %d^1
kdgln = 0.02; %mM
kdlac = 0.01; %d^-1mM^-1
kdamm = 0.06; % d^-1mM^-1

Yxv_Cgln = 380000000; %cells/mM
Yxv_Cglc = 109000000; %cells/mM
mglc = 0.0000000017; %mM/cells*d
kmglc = 19.0; %mM

YClac_Cglc = 1.8; %mM/mM
YCamm_Cgln = 0.85; %mM/mM

alphao = 0.0000000257; %mg/cells*d
ku = 0.02; %d^-1
beta = 0.0000000035; %mg/cells*d

u = umax*(Cglc./(Kglc + Cglc))*(Cgln./(Kgln+Cgln));
kd = kdmax*(umax-kdlac.*Clac)^-1*(umax-kdamm.*Camm)^-1*kdgln/(kdgln+Cgln);

qgln = u/Yxv_Cgln;
qglc = u/Yxv_Cglc+ mglc*(Cglc/(kmglc+Cglc));

qlac = YClac_Cglc*qglc;
qamm = YCamm_Cgln*qgln;

qmab = (alphao/(ku + u))*u + beta;

dvars_dt(1,1) = (u-kd)*Xv-(Fglc+Fgln)*Xv/V;
dvars_dt(2,1) = Fglc*Cglcin/V - (Fglc+Fgln)*Cglc/V - qglc*Xv;
dvars_dt(3,1) = Fgln*Cglnin/V -(Fglc+Fgln)*Cgln/V - qgln*Xv;
dvars_dt(4,1) = -(Fglc+Fgln)*Clac/V +qlac*Xv;
dvars_dt(5,1) = -(Fglc+Fgln)*Camm/V + qamm*Xv;
dvars_dt(6,1) = -(Fglc+Fgln)*Cmab/V + qmab*Xv;
dvars_dt(7,1) = (Fglc+Fgln);



