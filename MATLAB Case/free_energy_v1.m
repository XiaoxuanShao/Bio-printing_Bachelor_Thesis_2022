function [dfdphi] =free_energy_v1(i,j,icell,ncell,gamma,kappa,phi,phis)

 format long;
sum_phi =0.0;

 for jcell =1:ncell
 if(icell ~= jcell)
 sum_phi= sum_phi + phis(i,j,jcell)^2;
 end
 end

 dfdphi = gamma*phi(i,j)*(1.0-phi(i,j))*(1.0-2.0*phi(i,j)) + 2.0*kappa*phi(i,j)*sum_phi;
end