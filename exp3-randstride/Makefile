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
	nvcc -c main.cu kernel_parallel.cu -O0 -ptx
	nvcc -lm -o kr main.o kernel_parallel.o
	g++ $(SOURCE2) -o ex
	./ex
	chmod 777 execute.sh
	./execute.sh
test: 
	$(CC) $(CFLAGS) $(SOURCE1) -o kr
	./kr 100 100 100

clean:
	
.PHONY : all clean
