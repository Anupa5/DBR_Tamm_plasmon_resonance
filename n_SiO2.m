% Refractive index for silica ======

function [n] =  n_SiO2(lam)

C0 = 1.4508554;
C1 = -0.0031268;
C2 = -0.0000381;
C3 = 0.0030270;
C4 = -0.0000779;
C5 = 0.0000018;
l = 0.035;

n = C0+C1.*lam.^2+C2.*lam.^4+C3./(lam.^2-l)+C4./(lam.^2-l).^2+C5./(lam.^2-l).^3;
