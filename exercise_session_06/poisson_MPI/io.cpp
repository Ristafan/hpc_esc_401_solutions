#include "io.h"
#include "init.h"

/**
 * @brief      Output the exact solution to the Poisson equation in a csv file
 *
 * @param[in]  p        Parameters
 * @param      f        Matrix containing the source term
 */
void output_source(params p, double** f, int rank){
    std::string srank = std::to_string(rank);
    std::string file_name = "output/output_source_"+ srank +".csv";
    std::ofstream ofs(file_name, std::ofstream::out | std::ofstream::trunc);
    for (int i=p.xmin; i<p.xmax; i++){
        for (int j=p.ymin; j<p.ymax; j++){
            ofs << f[i - p.xmin][j - p.ymin];
            if (j != p.ymax-1)
                ofs <<',';
        } 
        ofs << '\n';
    }
    std::cout<<"I am writing output_source\n";
    ofs.close();
}

/**
 * @brief      Output the approximate solution
 *
 * @param[in]  p      Parameters
 * @param[in]  step   The current number of Jacobi steps performed
 * @param      u_new  Matrix containing the approximate solution
 */
void output(params p, int step, double** u_new, int rank){
    std::string fnum = std::to_string(step);
    fnum.insert(fnum.begin(), 7 - fnum.length(), '0');
    std::string srank = std::to_string(rank);
    // std::string file_name = "output/output_" + fnum + ".csv";
    std::string file_name = "output/output_"+ srank +"_" + fnum + ".csv";
    std::ofstream ofs(file_name, std::ofstream::out | std::ofstream::trunc);
    for (int i=p.xmin; i<p.xmax; i++){
        for (int j=p.ymin; j<p.ymax; j++){
            ofs << u_new[i - p.xmin][j - p.ymin];
            // std::cout<<"i:"<<i<<" j: "<<j<<" unewij: "<<u_new[i][j]<<"\n";
            if (j != p.ymax-1)
                ofs <<',';
        } 
        ofs << '\n';
    }
    ofs.close();
    std::cout<<"printing...\n";
}