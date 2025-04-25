function [nm] = temp_ag_eps22(lam_n,Temp)
%% defining parameters %%
lam_p0=1.4541*1e-7;                 %plasma frequency at room temperature
gamma_m=1.89*1e-5;                  %thermal linear coeffeceient of metal
Tao=0.55;                           %Fermi surface constatnt
% sigma_0=1/(3.90e-6);              % DC resistivity
T_D=215;                            % Debye temperature
T_0=273.15+25;                                         % Room temperature in Kelvin
Delta=0.73;                         % Fractional unklapp scattering
% T=273+040;                                          %Temp in Kelvin
% T=273+(25:5:180);                                    %% Variable Temperature

E_f=5.48*(1.602e-19);                              %% converting eV to joule
% lam=632*1e-9;                                       %operating wavelength
c=3e8;                                            %speed of light in vacuum
omega=2*pi*c/lam_n;                                   %Frequency in hertz
% epsilon_0=8.8541878176*1e-12;                       %free space permitivity

h=6.62607004*1e-34;                                 %planck constant
k_B=1.38064852*1e-23;                               %Bltzman Constant
% omega_p_T0=2.0477e13; % the value at T_0
omega_p_T0=05.119300e13; % the value at T_0 %%adjusted
%% Uploading the Temperature vs Integral values  for different temperature
xx=load('integration_ag.dat');                             %%loading the document file
Temp1=xx(:,1);                                       %% Temperature in kelvin
Int=xx(:,2);                                        %% value of the integration
%%applying the obtained values for different temperatures 
Int1=spline(Temp1,Int,Temp);
% Int2=0.2366158792390948;                               %% second fixed integral

%%program for variable Temperature
 omega_cp=omega_p_T0*((2/5)+4*(Temp/T_D).^5.*Int1);% photon-electron contribution
 omega_ce=2*pi*c*pi^3*Tao*Delta/(12*c*h*E_f)*((k_B*Temp)^2+(h*omega/4/pi^2)^2); % electron-electron contribution
 omega_c=omega_cp+omega_ce; % total collison frequency
 lam_c=2*pi*c/omega_c;
 lam_p=1/(1/lam_p0*(1+3*gamma_m*(Temp-T_0))^(-0.5));
 omega_p=2*pi*c/(lam_p);
 epsilon_T=1-(lam_n^2/(lam_p^2*(1+1i*lam_n/lam_c)));
 nm=sqrt(epsilon_T);
 ri=real(nm);
    end