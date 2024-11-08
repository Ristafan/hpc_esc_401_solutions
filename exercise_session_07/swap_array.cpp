#include <iostream>


void swap_arrays(int **M) {
    int tmp;
    
    for (int i = 0; i < 5; i++) {
        tmp = *(*(M) + i);
        *(*(M) + i) = *(*(M+1) + 4 - i);
        *(*(M+1) + 4 - i) = tmp;
    }
}


int main()
{
    int ** M = new int *[2];
    M[0] = new int[5]{0,1,2,3,4};
    M[1] = new int[5]{5,6,7,8,9};
    
    for (int i = 0; i < 5; i++) {
        std::cout << *(*(M) + i);
    }
    for (int i = 0; i < 5; i++) {
        std::cout << *(*(M+1) + i);
    }
    
    std::cout << "\n";
    swap_arrays(M);
    
    for (int i = 0; i < 5; i++) {
        std::cout << *(*(M) + i);
    }
    for (int i = 0; i < 5; i++) {
        std::cout << *(*(M+1) + i);
    }
    
    return 0;
}
