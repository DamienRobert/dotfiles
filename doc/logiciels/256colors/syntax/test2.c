#include <stdio.h>

static void f (unsigned int *a)
{
  *a = 1 ;
}

int main (void)
{
  unsigned long b = 0 ;
  printf("Size of unsigned int: %i\n", sizeof(unsigned int));
  printf("Size of unsigned long: %i\n", sizeof(unsigned long));
  f((unsigned int *)(char *)(&b)) ;
  printf("%lu\n", b) ;
  return 0 ;
}

/*
 * See: forum Informatique.lang.c:8288
 gcc -O3 -fstrict-aliasing -Wstrict-aliasing=1 test2.c && ./a.out
 */
