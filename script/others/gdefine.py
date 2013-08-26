#!/usr/bin/python

"""Python script to query Google for definitions of words from the command line

 Usage:
 define [-lr] phrase1 [phrase2 phrase3 ...]
 Options:
		 -h : Quick help
         -l : Include URLs to sources of definitions
		 -r : Pipe raw HTML to terminal, useful for redirection to browsers
		 -f : (Slightly) Fancy output 
		 -u : Display results in Unicode UTF-8
"""

__author__ = "Karthik Chikmagalur (karthik.chikmagalur@gmail.com)"
__version__ = "$Revision: 0.1 $"
__copyright__ = "(C) Karthik Chikmagalur"
__license_ = "GNU GPL 3"

##############################################################################
# To Do:
# Improve Unicode support
# Port to Windows: minor changes needed
##############################################################################

from httplib import HTTPConnection
from sgmllib import SGMLParser
from optparse import OptionParser
import sys, re, urllib, htmlentitydefs

##############################################################################
#Flags
flag_word={}

# Parse command line options:

cli_parser = OptionParser( usage="usage: %prog [-rlf] phrase1 [phrase2 phrase3 ...]\n%prog --help for help" )
cli_parser.add_option( "-l", "--links", action="store_true", dest="url", 
					  default=False, help="Include URLs to sources of definitions" )
cli_parser.add_option( "-r", "--raw", action="store_true", dest="raw",
					  default=False, help="Spout raw HTML, useful for redirection to browsers" )
cli_parser.add_option( "-f", "-F", action="store_true", dest="fancy",
					  default=False, help="Slightly fancier output, makes it easier to read" )
cli_parser.add_option( "-u", "--unicode", action="store_true", dest="unicode",
					  default=False, help="Display results in unicode UTF-8" )

( flag, words ) = cli_parser.parse_args(  )
if not words: 
	words = sys.stdin.read( ).strip( ).split( " " )
if not words:
	print "usage: define [-rlf] phrase1 [phrase2 phrase3 ...]\ndefine --help for help"
	sys.exit(  )
##############################################################################
# HTTP Constants

GoogleServer = 'www.google.com'
RequestBase  = '/search?q='
DefineKeyword = 'define: '
# Pretending to be Lynx, simplifies HTML returned by Google (?)
Headers	  = { 'User-Agent' : 'Lynx/2.8.6rel.4 libwww-FM/2.14' }

#Example: http://www.google.co.in/search?hl=en&q=define%3A+pine+tree
##############################################################################
# Data Retrieval from Google

if not words:
	sys.exit( "Usage: define [-lrf] phrase1 [phrase2 phrase3 ...]\ndefine --help for help" )

response = {}

try:
	connection = HTTPConnection( GoogleServer )
	for word in words:
		requeststring = RequestBase + urllib.quote_plus( DefineKeyword + word )
		connection.request ( method = 'GET', url = requeststring, headers = Headers )
		response[ word ] = connection.getresponse( ).read( ).strip( )
except Exception, exception:
	sys.exit( 'Unable to make request "http://%s/%s" - %s' % ( GoogleServer, requeststring, exception ) )

##############################################################################
# Regular Expressions

# This regular expression discards the HTML bits not required- which is most of what is returned.
CoarseMatchEx = re.compile ( r'.*on the Web:</p>(?P<def_section>.*?)'
							 r'(<font size=-1><p>|<div style="text-align:center">)',
							 re.DOTALL )

# Matches <a href="some_url">hypertext</a>, that is, any URL bit.
URLMatchEx = re.compile ( r'<a href=.*?</a>', re.MULTILINE )

##############################################################################
# Data processing with Regular expressions defined above

value = {}
for word in words:
	flag_word[ word ] = 1
	coarsematch = CoarseMatchEx.match( response[ word ] )
	if coarsematch:
		value[ word ] = coarsematch.group( 'def_section' )
	else:
		# No match => No definitions found.
		flag_word[ word ] = 0

if not flag.url:
	for word in words:
		# Discard URLs given that definitions are found.
		if flag_word[ word ]: value[ word ] = URLMatchEx.sub( '', value[ word ], 0 )
		
if flag.raw:
	#Raw output needed, no more processing necessary.
	for word in words:
		if flag_word[ word ]:
			print "<b>%s</b>: " % word.upper(  )
			print value[ word ]
		else:
			print "No definitions found for <b>%s</b><br><br>" % word.upper(  )
	sys.exit(  )

# Done
##############################################################################
# HTML processing and conversion to text

# Class methods for HTML to Text conversion. Most tags will be discarded,
# some replaced by newlines and asterisks, etc.

entitysubs = { 'quot': '"', 'lt' : '<', 'gt' : '>', 'amp' : '&', 'apos' : '\'', 
			  'rsquo':"'", 'lsquo':"'", 'rdquo':'"', 'ldquo':'"', 'copy':'(C)', 
			  'mdash':'--', 'nbsp':' ', 'rarr':'->', 'larr':'<-', 'middot':'*',
			  'ndash':'-' } 
if not flag.unicode:
	charsubs = { 'oelig':'oe', 'aelig':'ae', 'agrave':'a', 'aacute':'a', 'uuml':'u', 
			  	 'acirc':'a', 'atilde':'a', 'auml':'a', 'aring':'a', 'egrave':'e', 
			  	 'eacute':'e', 'ecirc':'e', 'euml':'e', 'igrave':'i', 'iacute':'i',
			  	 'icirc':'i', 'iuml':'i', 'ograve':'o', 'oacute':'o', 'ocirc':'o',
			  	 'otilde':'o', 'ouml':'o', 'ugrave':'u', 'uacute':'u', 'ucirc':'u' }


class DefinePageHTML2Text( SGMLParser ):
	def reset( self ):
		self.ignore_URL = 0
		self.prefix = ''
		self.suffix = ''
		self.pieces = [  ]
		SGMLParser.reset( self )
		
	def start_br( self, attrs ):
		self.unknown_starttag( "br", attrs )
		self.pieces.append( "\n" )
		self.prefix= ""
		self.suffix= "\n"

	def start_li( self, attrs ):
		self.unknown_starttag( "li", attrs )
		self.pieces.append( "\n" )
		if flag.fancy: self.prefix = "* "
		self.suffix= ""

	def start_a( self, attrs ):
		self.unknown_starttag( "a", attrs )
		self.ignore_URL = 1
		if attrs[ 0 ][ 0 ]== 'href':
			self.pieces.append( re.match( r'.*&q=(.*?)&usg.*$', attrs[ 0 ][ 1 ] ).group( 1 )+"\n" )

	def handle_charref( self, ref ):
		# Called for each character reference, e.g. for "&#160;", ref will be "160"
		# Convert ref to unicode string and append to output text
		if flag.unicode:
			self.pieces.append( unichr( int( ref ) ).encode( 'utf-8' ) ) 
		else:
			if ref in htmlentitydefs.codepoint2name.keys( ):
				self.pieces.append( charsubs[ htmlentitydefs.codepoint2name [ref].lower( ) ] )
		
	def handle_entityref( self, ref ):
		# called for each entity reference, e.g. for "&copy;", ref will be "copy"
		# Replace with closest ASCII equivalent if possible
		if ref in entitysubs.keys( ):
			self.pieces.append( entitysubs[ ref ] )
		else:
			self.pieces.append("&%(ref)s" % locals( ) )
			if htmlentitydefs.entitydefs.has_key( ref ):
				self.pieces.append( ";" )

	def handle_data( self, text ):
		if not self.ignore_URL: self.pieces.extend( [ self.prefix, text, self.suffix ] )
		self.ignore_URL = 0
		
	def output( self ):
		"""Return processed HTML as a single string"""
		return "".join( self.pieces )

parser = DefinePageHTML2Text(  )

#Almost done- Time to feed the parser...
for word in words:
	print str.upper( word )+": ",
	if flag_word[ word ]: 
		parser.feed( value[ word ] ) 
		#...and spit the text out.
		print parser.output(  )
	else:
		#Ouch.
		print "No definitions found for %s\n" % word.upper(  )
	parser.reset(  )

#And that's that.
##############################################################################
