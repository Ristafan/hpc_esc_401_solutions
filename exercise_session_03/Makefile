# Variables
CC = mpicc
CFLAGS = -O3 -Wall
TARGET = cpi_mpi

# List of source files
SRCS = cpi_mpi.c gettime.c
OBJS = $(SRCS:.c=.o)

# Default target
all: $(TARGET)

# Link object files and create the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Compile .c files into .o files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(TARGET) $(OBJS)

