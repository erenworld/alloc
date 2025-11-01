CC = gcc
EXECUTABLES = alloc
CFLAGS = -g -Wall

all: $(EXECUTABLES)

alloc: alloc.o
	$(CC) $(CFLAGS) -o alloc alloc.o

alloc.o: alloc.c alloc.h
	$(CC) $(CFLAGS) -c alloc.c

clean:
	rm -f core $(EXECUTABLES) a.out *.o

re: clean all

.PHONY: all clean re