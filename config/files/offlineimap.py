#!/usr/bin/python

import json
import subprocess
import os

#this idiot of offlineimap source this file each time after it sleeps for 5minutes, which defeat the purpose of calling get_authinfo only once. I use the following code to see if this is the first time sourcing this file or not
# Ensure variable is defined
try:
    passdict
except NameError:
    passdict = None

# Test whether variable is defined to be None
if passdict is None:
  auth = subprocess.check_output(["gpg", "--no-tty", "-d", os.environ['HOME']+"/.authinfo.gpg"]).decode("utf-8")
  #print(auth)
  passdict = json.loads(auth)
  #print(passdict)

def get_password_fromdict(machine):
  return passdict[machine][3]

def get_user_fromdict(machine):
  if "gmail" in machine:
    return passdict[machine][2]+"@gmail.com"
  else:
    return passdict[machine][2]

def get_server_fromdict(machine):
  return passdict[machine][0]
