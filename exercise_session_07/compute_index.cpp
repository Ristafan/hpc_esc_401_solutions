#include <iostream>


int ii(int x, int y) {
    return 14 * y + x;
}

int main (int argc, char *argv[]) {
    int x, y;
    for (y=0; y<6; y++) {
        for (x=0; x<14; x++) {
            printf( " (%d, %d ) %d \n ", y , x , ii (x , y ));
        }
    }
}
