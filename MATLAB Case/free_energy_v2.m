function [dfdphi]=free_energy_v2(Nx,Ny,icell,ncell,gamma,kappa,phi,phis)

 format long;

 sum_phi =zeros(Nx,Ny);

 for jcell =1:ncell
 if(icell ~= jcell)
 sum_phi = sum_phi + phis( :, :,jcell).^2;
 end
 end

 dfdphi = gamma*phi.*(1.0-phi).*(1.0-2.0*phi) + 2.0*kappa*phi.*sum_phi;

 end %end function