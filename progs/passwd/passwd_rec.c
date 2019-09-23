#include <stdio.h>
#include <string.h>
#include <stdlib.h>
// https://codereview.stackexchange.com/questions/38474/brute-force-algorithm-in-c

static const char alphabet[] =
"abcdefghijklmnopqrstuvwxyz"
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
"0123456789";

static const int alphabetSize = sizeof(alphabet) - 1;

static void bruteImpl(char* str, int index, int maxDepth)
{
  for (int i = 0; i < alphabetSize; ++i)
  {
    str[index] = alphabet[i];

    if (index == maxDepth - 1) printf("%s\n", str);
    else bruteImpl(str, index + 1, maxDepth);
  }
}

static void bruteSequential(int maxLen)
{
  char* buf = calloc(maxLen + 1, sizeof(char));

  for (int i = 1; i <= maxLen; ++i)
  {
    memset(buf, 0, maxLen + 1);
    bruteImpl(buf, 0, i);
  }

  free(buf);
}

int main(int argc, char *argv[])
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s Length\n", argv[0]);
    exit(1);
  }

  bruteSequential(atoi(argv[1]));
  return 0;
}
