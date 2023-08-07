all: madd arraySort bitonic quicksort arraySortO3 


madd: madd.c
	gcc madd.c -o madd 

arraySortO3: arraySort.cpp calculate_sum.c
	gcc -O3 calculate_sum.c -c -o calculate_sum_O3.o
	g++ -O3 arraySort.cpp calculate_sum_O3.o -o arraySortO3

arraySort: arraySort.cpp calculate_sum.c
	gcc calculate_sum.c -c 
	g++ -O0 arraySort.cpp calculate_sum.o -o arraySort

bitonic: bitonic.cu
	/usr/local/cuda/bin/nvcc -O3 bitonic.cu -o bitonic
        
quicksort: quicksort.cu 
	/usr/local/cuda/bin/nvcc -O3 quicksort.cu -o quicksort
        
clean:
		rm -f madd arraySort bitonic quicksort arraySortO3
