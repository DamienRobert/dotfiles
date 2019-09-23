// Try to crack a password

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <crypt.h>

static const char *alphabet = "abcdef0123456789";
static const char *salt= "vd";
static const char *goal= "vdTL..tq7RU7g";
static const int len = 8;
static void generate(char* prefix);

int main(int argc, char *argv[])
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s Prefix\n", argv[0]);
    exit(1);
  }

  generate(argv[1]);
  return 0;
}

static void test_buffer(char *buffer, int bufLen) {
  char *passwd;
  char *hash;
  for(int i=0; i < bufLen; i+=len) {
    passwd=buffer+i;
    // write(STDOUT_FILENO, passwd, len);
    hash = crypt(passwd, salt);
    if (strcmp(goal, hash) == 0) {
      // passwd[len+1]="\0";
      write(STDOUT_FILENO, passwd, len);
    }
  }
}

/**
 * Generates all patterns of the alphabet up to maxlen in length.  This
 * function uses a buffer that holds alphaLen^3 patterns at a time.
 * One pattern of length 5 would be "aaaaa\n".  The reason that alphaLen^3
 * patterns are used is because we prepopulate the buffer with the last 3
 * letters already set to all possible combinations.  So for example,
 * the buffer initially looks like "aaaaa\naaaab\naaaac\n ... aa999\n".  Then
 * on every iteration, we write() the buffer out, and then increment the
 * fourth to last letter.  So on the first iteration, the buffer is modified
 * to look like "abaaa\nabaab\nabaac\n ... ab999\n".  This continues until
 * all combinations of letters are exhausted.
 */
static void generate(char* prefix)
{
  int   alphaLen = strlen(alphabet);
  char *buffer   = malloc(len * alphaLen * alphaLen * alphaLen);
  int bufLen = sizeof(buffer);
  int  *letters  = malloc(len * sizeof(int));

  if (buffer == NULL || letters == NULL) {
    fprintf(stderr, "Not enough memory.\n");
    exit(1);
  }

  int i;
  int stride = len;

  // Initialize buffer to contain all first letters.
  memset(buffer, alphabet[0], bufLen);

  {
    for (i=len-3;i<bufLen;i+=stride) {
      buffer[i]   = prefix[0];
      buffer[i+1] = prefix[1];
      buffer[i+2] = prefix[2];
    }
  }

  // Write the first sequence out.
  test_buffer(buffer, bufLen);

  // Set all the letters to 0.
  for (i=0;i<len;i++)
      letters[i] = 0;

  // Now on each iteration, increment the fourth to last letter.
  i = len-4;
  do {
    char c;
    int  j;

    // Increment this letter.
    letters[i]++;

    // Handle wraparound.
    if (letters[i] >= alphaLen)
      letters[i] = 0;

    // Set this letter in the proper places in the buffer.
    c = alphabet[letters[i]];
    for (j=i;j<bufLen;j+=stride)
      buffer[j] = c;

    if (letters[i] != 0) {
      // No wraparound, so we finally finished incrementing.
      // Write out this set.  Reset i back to second to last letter.

      test_buffer(buffer, bufLen);
      i = len - 4;
      continue;
    }

    // The letter wrapped around ("carried").  Set up to increment
    // the next letter on the left.
    i--;
    // If we carried past last letter, we're done with this
    // whole length.
    if (i < 0)
	break;
  } while(1);

  // Clean up.
  free(letters);
  free(buffer);
}
