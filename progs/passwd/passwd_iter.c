#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// create a large buffer
static const int BUFFLEN=1024*100;

static const char alphabet[] =
"abcdefghijklmnopqrstuvwxyz"
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
"0123456789";

static const int alphabetSize = sizeof(alphabet) - 1;

static void brute2(int maxLen)
{
  char* indices = malloc(maxLen + 1);
  char* terminal = indices+maxLen;
  char *printbuff = malloc(BUFFLEN);
  char *pbend = &printbuff[BUFFLEN-1];
  char *b = printbuff;
  *pbend = '\0';
  ++indices[0];
  char *p;

  while (*terminal == 0) {
    // print value
    for (p = indices; *p; ++p)
        ;
    for (--p ; p >= indices; --p) {
      *b++ = alphabet[*p-1];
      if (b == pbend) {
        fwrite(printbuff, 1, b-printbuff, stdout);
        b = printbuff;
      }
    }
    *b++ = '\n';
    if (b == pbend) {
      fwrite(printbuff, 1, b-printbuff, stdout);
      b = printbuff;
    }
    // increment values
    int carry = 1;
    for (++p ; carry; ++p) {
      if ((*p += carry) > alphabetSize) {
        *p = 1;
        carry = 1;
      } else {
        carry = 0;
      }
    }
  }
  fwrite(printbuff, 1, b-printbuff, stdout);

  free(indices);
  free(printbuff);
}

int main(int argc, char *argv[])
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s Length\n", argv[0]);
    exit(1);
  }

  brute2(atoi(argv[1]));
  return 0;
}
