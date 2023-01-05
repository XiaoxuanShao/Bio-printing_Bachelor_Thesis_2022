#include <iostream>
#include <fstream>
#include <windows.h>
#include <ctime>

using namespace std;
int main() {

    int Nx = 50, Ny = 50, Nz = 1;
    fstream out;
    char filename[20] = "output.vtk";
    out.open(filename, ios::out);
    if (!out) {
        cout << "open failed" << endl;
    }
    out << "# vtk DataFile Version 3.0" << endl;
    out << filename << endl;
    out << "ASCII " << endl;
    out << "DATASET STRUCTURED_GRID" << endl;
    out << "DIMENSIONS " << 50 << " " << 50 << " " << 1 << endl;

    out << "POINTS " << 2500 << " float" << endl;
    for (int i = 0; i < Nx; i++) {
        for (int j = 0; j < Ny; j++) {
            out << i << " " << j << " " << 0 << endl;
        }
    }
    out << "POINT_DATA " << 2500 << endl;

    out << "SCALARS one float" << endl;
    out << "LOOKUP_TABLE default" << endl;
    for (int i = 0; i < 50; i++)
    {
        for (int j = 0; j < 50; j++)
        {
            out << 1 << "\t";
        }
    }

    out << "SCALARS two float" << endl;
    out << "LOOKUP_TABLE default" << endl;
    for (int i = 0; i < 50; i++)
    {
        for (int j = 0; j < 50; j++)
        {
            out << 2 << "\t";
        }
    }
 
    out.close();
    system("pause");
    return 0;
}