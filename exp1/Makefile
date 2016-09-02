CC=cc
CFLAGS= 
LDFLAGS=
SOURCE2=execute.c
OBJECTS=$(SOURCE1:.c=.o)
EXECUTABLE=khatri-rao
COMMON=

all: khatra

khatra:
	$(CC) $(CFLAGS) $(SOURCE1) -o kr
	
ref1:
	./kr 100 100 100

ref0:
	nvcc -c main.cu kernel.cu -ptx
	nvcc -c main.cu kernel.cu
	nvcc -lm -o kr main.o kernel.o
	g++ $(SOURCE2) -o ex
	g++ crex.c -o crex
	./crex
	chmod 777 crex.sh
	chmod 777 exex.sh
	./crex.sh
	./exex.sh
test: 
	$(CC) $(CFLAGS) $(SOURCE1) -o kr
	./kr 100 100 100

clean:
	
.PHONY : all clean
