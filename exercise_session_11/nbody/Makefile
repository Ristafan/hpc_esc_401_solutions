# module load cray

nbody	: nbody.cpp Makefile
	CC -O3 -march=native -ffast-math -g -o nbody nbody.cpp

nbody1	: nbody1.cpp Makefile
	CC -fopt-info-vec -O3 -march=native -ffast-math -g -o nbody1 nbody1.cpp

nbody2	: nbody2.cpp Makefile
	CC -fopt-info-vec -O3 -march=native -ffast-math -g -o nbody2 nbody2.cpp

nbody3	: nbody3.cpp Makefile
	CC -fopenmp -fopt-info-vec -O3 -march=native -ffast-math -g -o nbody3 nbody3.cpp

nbody4  : nbody4.cpp Makefile
	CC -fopt-info-vec -O3 -march=native -ffast-math -g -o nbody4 nbody4.cpp

clean:
	rm -f nbody nbody1 nbody2 nbody3 nbody4
