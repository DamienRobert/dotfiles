#include <stdio.h>
#include "foo.h"

int main(void)
{
    puts("This is a shared library test...");
    foo();
    return 0;
}

/*
 gcc -Ifoo -Lfoo -Wall -o test main.c -lfoo
 #Without -I and -L
 LIBRARY_PATH=foo/: CPATH=foo/: gcc -o test main.c -lfoo
 #Run it
 LD_LIBRARY_PATH=foo:$LD_LIBRARY_PATH ./test
 #Or so that there is no need to set LD_LIBRARY_PATH:
 gcc -Ifoo -Lfoo -Wl,-rpath=foo -Wall -o test2 main.c -lfoo
 ./test2
*/
