#!/usr/bin/python

##############################################################################
# GCALC - A command-line interface to the Google calculator. Simply passes
#		 the command-line arguments to the Google web-site and displays the
#		 results.
#
#	eg:
#		gcalc "1 hour 5 minutes in seconds"
#		1 hour 5 minutes = 3900 seconds
#
#		gcalc "100 + 2 * 5"
#		100 + (2 * 5) = 110
#
#		gcalc "41000 yen in british pounds"
#		41,000 Japanese yen = 277.129372 British pounds
#
#
#
# Published under the GNU Public License: http://www.gnu.org/copyleft/gpl.html
#
# $Id: $

from httplib import HTTPConnection
import sys, re, urllib, htmlentitydefs


##############################################################################
# HTTP Constants

GoogleServer = 'www.google.co.uk'
RequestBase  = '/search?num=1&q='
# You get back simpler and smaller html if you pretend to be Lynx
Headers	  = { 'User-Agent' : 'Lynx/2.8.6rel.4 libwww-FM/2.14' }

##############################################################################
# Regular Expressions

CoarseMatchEx = re.compile ( '.*calc_img\.gif(?P<match>.*)<\/h2>', re.DOTALL )
FineMatchEx   = re.compile ( '.*<b>(?P<match>.*)</b>' )

PostProcessExs = [ ( re.compile ( pattern ), subst ) for pattern, subst in ( ( '<sup>', 'E' ), ( '<[^>]*>', '' ) ) ]

##############################################################################
# Script

# Construct the request string (the path component of the HTTP request)
calculation = ' '.join ( sys.argv [ 1 : ] ).strip ( )
if not calculation:
	sys.exit ( 'Must provide something to calculate!' )
requeststring = RequestBase + urllib.quote_plus ( calculation )

# Connect to the Google server, make the request and retrieve the response
try:
	connection = HTTPConnection ( GoogleServer )
	connection.request ( method = 'GET', url = requeststring, headers = Headers  )
	response = connection.getresponse ( ).read ( ).strip ( )
except Exception, exception:
	sys.exit ( 'Unable to make request "http://%s/%s" - %s' % ( GoogleServer, requeststring, exception ) )

# Process the response and display the Google Calculator response, if any
coarsematch = CoarseMatchEx.match ( response )
if coarsematch:
	finematch = FineMatchEx.match ( coarsematch.group ( 'match' ) )
	if finematch:
		value = finematch.group ( 'match' )
		# Pass the value through the post processing regular expressions
		for regex, subst in PostProcessExs: value = regex.sub ( subst, value )
		# Expand any unicode values to ASCII
		# &#215; The multiplication symbol seems to be missing from the Python entity list, so I account for that:
		if '&#215;' in value:
			value = value.replace ( '&#215;', 'x' )
		for unicode in htmlentitydefs.codepoint2name:
			if '&#%d;' % unicode in value:
				entity = htmlentitydefs.codepoint2name [ unicode ]
				if entity in htmlentitydefs.entitydefs:
					value = value.replace ( '&#%d;' % unicode, htmlentitydefs.entitydefs [ entity ] )
				else:
					value = value.replace ( '&#%d;' % unicode, '' )

		# Expand any entity definitions to ASCII
		for entity in htmlentitydefs.entitydefs:
			if '&%s;' % entity in value:
				value = value.replace ( '&%s;' % entity, htmlentitydefs.entitydefs [ entity ] )
		# strip &nbsp;'s that appear in value as raw char 160's, hex A0
		# These only seem to be used a thousands separators, so I'll be UK centric and replace with a comma but a space would work too.
		value = value.replace('\xA0', ',')
		# Done!
		print value
	else:
		sys.exit ( 'Warning - Google appears to have changed its page layout, update Fine Match expression' )
else:
	print 'Google Calculator did not understand : %s' % calculation
	#output = open('/tmp/gcalc_response.html', 'w')
	#output.write(response)
	#output.close()
	#print coarsematch
	#print finematch
	#print requeststring
