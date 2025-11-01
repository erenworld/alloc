CC = gcc
EXECUTABLES = alloc

CFLAGS = -g -Wall

all: $(EXECUTABLES)

clean:
	rm -f core $(EXECUTABLES) a.out *.o

alloc.o: alloc.c alloc.h
	$(CC) $(CFLAGS) -c alloc.c