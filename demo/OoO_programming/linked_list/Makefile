all: linked_list linked_list.s


#arraySort

EXTRA_CFLAGS = -DHAVE_LINUX_PERF_EVENT_H
CFLAGS = -O3 -Wno-implicit-function-declaration -Wno-format-zero-length

linked_list: linked_list.c perfstats.c
	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) perfstats.c  linked_list.c -o linked_list

linked_list.s: linked_list.c 
	$(CC) -S $(CFLAGS) $(EXTRA_CFLAGS) linked_list.c 
	
clean:
		rm -f linked_list linked_list.s
