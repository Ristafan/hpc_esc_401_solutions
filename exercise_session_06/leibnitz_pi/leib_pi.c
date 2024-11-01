#include "mpi.h"
#include <stdio.h>
#include <math.h>

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);

    int my_rank, size;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

    int dims[2] = {3, 4};
    int periods[2] = {0, 1};
    MPI_Comm cart_comm;
    MPI_Cart_create(MPI_COMM_WORLD, 2, dims, periods, 0, &cart_comm);

    int coords[2];
    MPI_Cart_coords(cart_comm, my_rank, 2, coords);

    int N = 1000000000;
    double pi_part = 0.0;
    int num_terms = N / (size);
    int start = my_rank * num_terms;
    int end = start + num_terms;

    for (int i = start; i < end; i++) {
        pi_part += pow(-1, i) / (2 * i + 1);
    }

    double recv_buffer = 0.0;
    int left_rank, right_rank, top_rank, bottom_rank;

    MPI_Cart_shift(cart_comm, 0, 1, &left_rank, &right_rank);
    MPI_Cart_shift(cart_comm, 1, 1, &top_rank, &bottom_rank);

    MPI_Sendrecv(&pi_part, 1, MPI_DOUBLE, right_rank, 0, 
                 &recv_buffer, 1, MPI_DOUBLE, left_rank, 0, 
                 cart_comm, MPI_STATUS_IGNORE);
    pi_part += recv_buffer;

    MPI_Sendrecv(&pi_part, 1, MPI_DOUBLE, bottom_rank, 0, 
                 &recv_buffer, 1, MPI_DOUBLE, top_rank, 0, 
                 cart_comm, MPI_STATUS_IGNORE);
    pi_part += recv_buffer;

    pi_part *= 4.0;
    printf("I am processor %d out of %d, and the value of pi is %f\n", my_rank, size, pi_part);

    MPI_Finalize();
}

