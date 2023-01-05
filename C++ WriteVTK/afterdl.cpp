#include <iostream>
#include <fstream>
#include <windows.h>
#include <ctime>

using namespace std;
int main() {

	//open output file

	fstream out;
	char filename[20] = "output.vtk";
	out.open(filename, ios::out);
	if (!out) {
		cout << "open failed" << endl;
	}

	int nx = 50;
	int ny = 50;
	int nz = 1;

	int npoint = nx * ny * nz;

	 //start writing ASCII VTK file :

	//header of VTK file

	out << "# vtk DataFile Version 3.0\n";
	out << filename << endl;
	out << "ASCII\n";
	out << "DATASET RECTILINEAR_GRID\n";

	 //coords of grid points
		
	out << "DIMENSIONS" << nx << ny << nz << endl;

	out << "X_COORDINATES" << nx << endl;
	for (int i = 1; i <= nx; i++)
	{
		out << i - 1 << endl;
	}
	out << endl;

	out << "Y_COORDINATES" << ny << endl;
	for (int i = 1; i <= nx; i++)
	{
		out << i - 1 << endl;
	}
	out << endl;

	out << "Z_COORDINATES" << nz << endl;
	for (int i = 1; i <= nx; i++)
	{
		out << i - 1 << endl;
	}
	out << endl;
	
	out << "POINT_DATA" << npoint << endl;

	 //write grid point values :

	out << "SCALARS CON float 1\n";
	out << "LOOKUP_TABLE default\n";

	for (int i = 1; i <= nx; i++)
	{
		for (int j = 1; j <= ny; j++)
		{
			out << 1 << endl;
		}
	}

	out.close();
	return 1;
}