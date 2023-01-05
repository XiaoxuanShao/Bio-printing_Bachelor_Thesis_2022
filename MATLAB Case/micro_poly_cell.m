function [ncell,phis,vac,nccel,ccell] = micro_poly_cell(Nx,Ny,ncell,R)

 format long;
 
 %--- initialize
 for icell =1:ncell
 for i=1:Nx
 for j=1:Ny
 phis(i,j,icell) = 0.0;
 end
 end
 end

 phis =zeros(Nx,Ny,ncell);

 %---

 if(ncell == 80)

 R2 =2.0*R;
 Rsq = R*R;

 ncell =0;
 xmin =0.0;
 ymin =0.0;

 xmax=Nx;
 ymax=Ny;


 xc =zeros(64);
 yc= zeros(64);

 for iter = 1:500000

 xnc = Nx*rand( );
 ync = Ny*rand( );

 iflag = 1;

 if(((xnc-R) < xmin) || ((xnc+R)> xmax))
 iflag = 0;
 end

 if(((ync-R) < ymin) || ((ync+R)> ymax))
 iflag = 0;
 end

 if(iflag == 1)
 for i=1:ncell

 xdist = sqrt((xc(i)-xnc)^2 +(yc(i)-ync)^2);

 if(xdist <= R*1.6)
 iflag = 0;
 end
 end

 end %if


 if(iflag == 1)

 ncell =ncell+1;

 xc(ncell) = xnc;
 yc(ncell) = ync;

 for i=1:Nx
 for j=1:Ny

 if((i-xnc)^2 + (j-ync)^2 <Rsq)
 phis(i,j,ncell) =0.999;
 end

 end
 end

 end %iflag


 if(ncell == 80)
 break;
 end

 end % irand

 %--- randomize cell self propulsion velocities:

 velc = 0.2;

 for i=1:ncell

 ix =rand( );
 if(ix <= 0.5)
 vac(i)= -velc;
 else
 vac(i) = velc;
  end
 end


 fprintf('iteration done:%5d\n',iter);
 fprintf('number of cell created%5d\n',ncell);

 %--- soft cells:

 nccel = 5;
 ccell(1) = 32;
 ccell(2) = 11;
 ccell(3) = 16;
 ccell(4) = 21;
 ccell(5) = 46;

 end %if ncell=80

 %---
 %- For two cell simulation:
 %---

 if(ncell == 2)

 nccel = 0;
 ccell(1)=10000;


 R2 = R*R;

 xc(1,1)=Nx/2-1.25*R;
 yc(1,1)=Ny/2;

 xc(1,2)=Nx/2+1.25*R;
 yc(1,2)=Ny/2;

 ncol=1;
 nrow=2;

 icell =0;

 for icol=1:ncol

 for irow=1:nrow

 icell = icell+1;

 dx = xc(icol,irow);
 dy = yc(icol,irow);

 for i=1:Nx
 for j=1:Ny

 if((i- dx)*(i-dx) + (j-dy)*(j-dy)< R2)
 phis(i,j,icell) =0.999;
 end

 end
 end

 end
 end

 %--- cell self propulsion velocity:

 vac(1) = 0.5;
 vac(2) =-0.5;

 end %if ncell ?2

 end %end function