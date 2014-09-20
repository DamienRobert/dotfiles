#include <stdio.h>
 
void foo(void)
{
    puts("Hello, I'm a shared library");
}

// gcc -c -Wall -Werror -fpic foo.c
// gcc -shared -o libfoo.so foo.o
// #use nm libfoo.so to look at the .so
