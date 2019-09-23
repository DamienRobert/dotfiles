// Try to crack a password

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <crypt.h>

static const char *alphabet = "abcdef0123456789";
static const char *salt= "vd";
static const char *goal= "vdTL..tq7RU7g";

static void generate(int maxlen);

int main(int argc, char *argv[])
{
  if (argc < 2) {
    fprintf(stderr, "Usage: %s Length\n", argv[0]);
    exit(1);
  }

  generate(atoi(argv[1]));
  return 0;
}

static void test_buffer(char *buffer, int bufLen, int len) {
  char *passwd;
  char *hash;
  for(int i=0; i < bufLen; i+=len) {
    passwd=buffer+i;
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
static void generate(int maxlen)
{
  int   alphaLen = strlen(alphabet);
  int   len      = maxlen;
  char *buffer   = malloc((maxlen + 1) * alphaLen * alphaLen * alphaLen);
  int  *letters  = malloc(maxlen * sizeof(int));

  if (buffer == NULL || letters == NULL) {
    fprintf(stderr, "Not enough memory.\n");
    exit(1);
  }

  // The stride is one larger than len because each line has a '\n'.
  int i;
  int stride = len+1;
  int bufLen = stride * alphaLen * alphaLen * alphaLen;

  if (len == 1) {
    // Special case.  The main algorithm hardcodes the last two
    // letters, so this case needs to be handled separately.
    int j = 0;
    bufLen = (len + 1) * alphaLen;
    for (i=0;i<alphaLen;i++) {
      buffer[j++] = alphabet[i];
      buffer[j++] = '\n';
    }
    test_buffer(buffer, bufLen,len);
    exit(0);
  } else if (len == 2) {
    // Also a special case.
    int let0 = 0;
    int let1 = 0;
    bufLen = (len + 1) * alphaLen * alphaLen;
    for (i=0;i<bufLen;i+=stride) {
      buffer[i]   = alphabet[let0];
      buffer[i+1] = alphabet[let1++];
      buffer[i+2] = '\n';
      if (let1 == alphaLen) {
	let1 = 0;
	let0++;
	if (let0 == alphaLen)
	    let0 = 0;
      }
    }
    test_buffer(buffer, bufLen,len);
    exit(0);
  }

  // Initialize buffer to contain all first letters.
  memset(buffer, alphabet[0], bufLen);

  // Now write all the last 3 letters and newlines, which
  // will after this not change during the main algorithm.
  {
    // Let0 is the 3rd to last letter.  Let1 is the 2nd to last letter.
    // Let2 is the last letter.
    int let0 = 0;
    int let1 = 0;
    int let2 = 0;
    for (i=len-3;i<bufLen;i+=stride) {
      buffer[i]   = alphabet[let0];
      buffer[i+1] = alphabet[let1];
      buffer[i+2] = alphabet[let2++];
      buffer[i+3] = '\n';
      if (let2 == alphaLen) {
	let2 = 0;
	let1++;
	if (let1 == alphaLen) {
	  let1 = 0;
	  let0++;
	  if (let0 == alphaLen)
	      let0 = 0;
	}
      }
    }
  }

  // Write the first sequence out.
  test_buffer(buffer, bufLen,len);

  // Special case for length 3, we're already done.
  if (len == 3)
      exit(0);

  // Set all the letters to 0.
  for (i=0;i<len;i++)
      letters[i] = 0;

  // Now on each iteration, increment the the fourth to last letter.
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
      
      test_buffer(buffer, bufLen,len);
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
