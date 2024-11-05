#include <iostream>


int ii(int x, int y) {
    return 14 * y + x;
}

int main (int argc, char *argv[]) {
    int x, y;
    for (x=0; x<14; x++) {
        for (y=0; y<6; y++) {
            printf( " (%d, %d ) %d \n ", x , y , ii (x , y ));
        }
    }
}
