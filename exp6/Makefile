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
	nvcc -c main.cu kernel.cu
	nvcc -lm -o kr main.o kernel.o
	g++ $(SOURCE2) -o ex
	./ex 32
	chmod 777 execute.sh
	./execute.sh
ex0: 
	./ex
	chmod 777 execute.sh
	./execute.sh

clean:
	
.PHONY : all clean
