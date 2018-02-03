OBJS = string.o test-string.o
OOPTS = -Wall -Wextra -std=c99 -g -c
LOPTS = -Wall -Wextra -std=c99 -g

all : test-string

test-string : $(OBJS)
		gcc $(LOPTS) $(OBJS) -o test-string

string.o : string.c string.h
		gcc $(OOPTS) string.c

test-string.o :	test-string.c string.h
		gcc $(OOPTS) test-string.c

test : test-string
		./test-string

valgrind : test-string
		valgrind test-string

clean	:
		rm -f *.o vgcore.* test-string
