#!/usr/bin/python

import json
import subprocess
import os

#this idiot of offlineimap source this file each time after it sleeps for 5minutes, which defeat the purpose of calling get_authinfo only once. I use the following code to see if this is the first time sourcing this file or not
if not 'serverdict' in locals():
	serverdict = dict(json.loads(subprocess.check_output([os.environ['HOME']+"/mine/ruby/lib/dr/config/authinfo.rb", "--offlineimap"]).decode("utf-8")))
	#print(serverdict)

def get_password_fromdict(machine):
	return serverdict[machine]["imap"]["password"]

def get_user_fromdict(machine):
	user=serverdict[machine]["imap"]["user"]
	if "gmail" in machine:
		return user+"@gmail.com"
	else:
		return user

def get_server_fromdict(machine):
	return serverdict[machine]["imap"]["host"]

def get_refresh_token_fromdict(machine):
	#print(serverdict[machine]["oauth"]["refresh"])
	return serverdict[machine]["oauth"]["refresh"].encode('utf-8')

def get_id_token_fromdict(machine):
	#print(serverdict[machine]["oauth"]["id"])
	return serverdict[machine]["oauth"]["id"].encode('utf-8')

def get_secret_token_fromdict(machine):
	#print(serverdict[machine]["oauth"]["secret"])
	return serverdict[machine]["oauth"]["secret"].encode('utf-8')
