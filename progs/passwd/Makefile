CC=gcc
CFLAGS=-O3 -Wall -Wextra -std=c99 -Wpedantic -march=native -mtune=native -pipe
LIBS = -lcrypt

PROGS=passwd_rec passwd_iter passwd2 passwd3 passwd_test

all: ${PROGS}

passwd_test:
	cc -o passwd_test -lcrypt passwd_test.o
passwd_test.o: passwd_test.c
	cc -c passwd_test.c

clean:
	rm -f ${PROGS}

bench:
	time ./passwd_rec 5 >/dev/null
	time ./passwd_iter 5 >/dev/null
	time ./passwd2 5 >/dev/null
	time ./passwd3 5 >/dev/null
