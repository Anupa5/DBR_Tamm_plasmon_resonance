% Caluclate the refractive index of BK7
function [n] = n_BK7(lam)      % lam in micrometers

n = sqrt(1+1.03961212*lam^2/(lam^2-0.00600069867)+0.231792344*lam^2/(lam^2-0.0200179144)+1.01046945*lam^2/(lam^2-103.560653));
% n = sqrt(2.81418+0.87968*lam^2/(lam^2-0.3042^2)-0.00711*lam^2);