% Caluclate the refractive index of MgF2

function [n] = n_Ta2O5(lam)      % lam in micrometers

n = 2.06+0.024./lam.^2;

