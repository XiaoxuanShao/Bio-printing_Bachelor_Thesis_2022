function [ ]= write_vtk_grid_values(nx,ny,dx,dy,istep,data1)

 format long

 %-- open output file

 fname=sprintf('time_%d.vtk',istep);
 out =fopen(fname,'w');

 nz=1;

 npoin =nx*ny*nz;

 % start writing ASCII VTK file:

 % header of VTK file

 fprintf(out,'# vtk DataFileVersion 3.0\n');
 fprintf(out,'time_10.vtk\n');
 fprintf(out,'ASCII\n');
 fprintf(out,'DATASET STRUCTURED_GRID\n');

 %--- coords of grid points:

 fprintf(out,'DIMENSIONS %5d %5d %5d\n',nx,ny,nz);
 
 fprintf(out, 'X_COORDINATES %5d', nx);
  for i = 1:nx
       x =(i-1)*dx;
        fprintf(out, '%14.6e\t',x);
  end
  fprintf(out, '\n');
  
   fprintf(out, 'Y_COORDINATES %5d', ny);
  for j = 1:ny
       y =(j-1)*dx;
        fprintf(out, '%14.6e\t',y);
  end
  fprintf(out, '\n');
  
   fprintf(out, 'Z_COORDINATES %5d', nz);
  for k = 1:nz
       z =(i-1)*dx;
        fprintf(out, '%14.6e\t',z);
  end
  fprintf(out, '\n');
  
 fprintf(out,'POINTS %7d float\n',npoin);

 %--- write grid point values:


 fprintf(out,'SCALARS CONfloat 1\n');

 fprintf(out,'LOOKUP_TABLEdefault\n');

 for i = 1:nx
 for j = 1:ny
      for k = 1:nz
 ii=(i-1)*nx+j;

 fprintf(out,'%14.6e\n',data1(i,j));
 end
 end
 end

 fclose(out);

 end %endfunction