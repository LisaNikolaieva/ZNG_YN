global DO_PARALLEL;
DO_PARALLEL = 1;

%%

NN0 = 2.5e4;

s0=0;  
s1=0;
s2=0;

R_i_ph=20e-6;         % m
R_o_ph=45e-6;         % m

%% Grid parameters
L = 30;    Lx=L; Ly=L; Lz=L/4;
N = 128;    Nx=N; Ny=N; Nz=N/4;

%% Physical parameters
a_s=5.3112e-9;                  % m     Rb87 s-wave scattering length
omega_r = 2*pi*110;             % Hz
omega_z = 2*pi*245;             % Hz
kappa=omega_z/omega_r;
mass=87/6.02*1e-26;             % kg    Rb87 mass
hbar=1.06e-34;
k_b=1.380649e-23;               % J/K

l_r=sqrt(hbar/(mass*omega_r));  % m 
l_z=sqrt(hbar/(mass*omega_z));  % m

g3D_ph=4*pi*a_s*hbar^2/mass;    % m^5*kg/s^2
%g2D_ph=g3D_ph/(sqrt(2*pi)*l_z); % m^4*kg/s^2



%% Dimension 3D
t_mult=1/omega_r;                   % s
r_mult=l_r;                         % m
r_mult_microm=r_mult*1e6;           % microm
V_mult=hbar*omega_r;                % J
mu_mult=hbar*omega_r;               % J
mu_mult_nK=mu_mult/k_b*1e9;         % nK
Psi_mult=1/(l_r^(3/2));             % 1/sqrt(m^3)                       
Psi_mult_cm3=Psi_mult*1e-3;         % 1/sqrt(cm^3)
Rho_mult_cm3=Psi_mult_cm3^2;        % 1/cm^3
T_mult=hbar*omega_r/k_b;            % K
W_mult=V_mult/t_mult;


%% Dimensionless parameters

g=4*pi*a_s/l_r;                    % 3D dimensionless

R_i=R_i_ph/r_mult;                 % dimensionless
R_o=R_o_ph/r_mult;                 % dimensionless




%% Initialize grid
rx = linspace(-Lx/2,Lx/2,Nx);
ry = linspace(-Ly/2,Ly/2,Ny);
rz = linspace(-Lz/2,Lz/2,Nz);

hx = rx(2)-rx(1);
hy = ry(2)-ry(1);
hz = rz(2)-rz(1);
kx = [ (0:Nx/2-1)*2*pi/Lx -(Nx/2:-1:1)*2*pi/Lx];
ky = [ (0:Ny/2-1)*2*pi/Ly -(Ny/2:-1:1)*2*pi/Ly];
kz = [ (0:Nz/2-1)*2*pi/Lz -(Nz/2:-1:1)*2*pi/Lz];
dV = hx * hy * hz;


%% 
[X,Y,Z] = meshgrid(rx,ry,rz);
[KX,KY,KZ] = meshgrid(kx,ky,kz);
if DO_PARALLEL
    kk = gpuArray(KX.^2+KY.^2+KZ.^2);
else
    kk = KX.^2+KY.^2+KZ.^2;
end


%% Potential
Potential;

%% ITP
dt_itp = 0.02; 

eD_hp_itp = exp(0.5*dt_itp*(-0.5)*kk);


%% make_dir
% make_dir;


%% Clear
clear k KX KY;





