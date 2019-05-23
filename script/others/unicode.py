#!/usr/bin/python

# From the comments of http://www.madore.org/~david/weblog/d.2019-04-10.2591.html#d.2019-04-10.2591
# reads char from stdin and output their unicode meaning
# + also print their decomposition

import sys
import unicodedata

string = sys.stdin.readline().strip()
for char in string:
  print("U+%04x" % ord(char), end="")
  if (ord(char) < 31):
    print()
  else:
    print(" " + char + " ", end="")
    try:
      print(unicodedata.name(char), "["+unicodedata.category(char)+"]")
      decomposition = unicodedata.decomposition(char).split(" ")
      if len(decomposition) > 1:
        for subchar in decomposition:
          try:
            unicode_char = chr(int(subchar, 16))
            print("           U+%s" % subchar, unicodedata.name(unicode_char))
          except ValueError:
            print("           " + subchar)
    except:
      pass
