#!/usr/bin/perl

### Subject: Re: Fuller example of Net::NNTP?
### Date:  Tue, 4 Feb 1997 10:37:58 -0800
### From: "Paul E. Hoffman" <phoffman@imc.org>
### To: Graham Barr <gbarr@ti.com>
###
### Thanks for your reply. After looking at the examples, I realized that
### you're not doing what I want, which is to store the messages on the local
### hard disk with the same message number as what was on the remote. So, I
### rolled my own program, although I haven't finished it yet (I have a hook
### for expiring, but haven't done it yet).
###
### You are welcome to use this in the Net:: distribution if you think it is
### useful.
###
### NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE NOTE
###
### This script is included as-is, I give no guarantee that it will
### work on every system
###

use Net::NNTP;
use Cwd qw(getcwd);
$cwd=Cwd::getcwd();
$BaseDir = "$cwd/forum";
chdir($BaseDir) or die "Could not cd to $BaseDir\n";

# Format of grouplist is:
#    groupname<tab>expirationdays
# expirationdays is the number of days to leave the articles around;
#    set it to 0 if you want the articles to stay forever
# If the groupname starts with a #, it is skipped
# open(GROUPLIST, 'grouplist.txt') or die "Could not open grouplist.txt\n";
# while(<GROUPLIST>) {
#         $Line = $_; chomp($Line);
#         if($Line eq '') { next };  # Skip blank lines
#         if(substr($Line, 0, 1) eq '#') { next };  # Skip comments
#         push(@Groups, $Line)
# }

my $NntpPtr = Net::NNTP->new('localhost:42119');
$NntpPtr->authinfo('robert@phare.normalesup.org', 'zbOuj8a/JnkRC3J/');
my $Groups = $NntpPtr->list();

foreach my $GroupName (keys %{$Groups}) {
  print "$GroupName";
        #($GroupName, $GroupExp) = split(/\s/, $GroupLine, 2);
        # Process the expiration first (still to be done...)

        # See if this is a new group
        unless(-e "$BaseDir/$GroupName") {
                unless(mkdir("$BaseDir/$GroupName", 0755))
                        { die "Could not make $BaseDir/$GroupName\n" }
        }
        chdir("$BaseDir/$GroupName") or die "Couldn't chdir to $GroupName\n";
        # Find the last article in the directory
        @AllInDir = <*>; @RevSortedAllInDir = sort {$b <=> $a} @AllInDir;
        $LenArr = @RevSortedAllInDir;
        if($LenArr > 0) { $NumLastInDir = $RevSortedAllInDir[0] }
        else { $NumLastInDir = 0 }
        ($NumArt, $NumFirst, $NumLast, $XGroupName) = $NntpPtr->group($GroupName);

        if($NumLast == $NumLastInDir) { print "\n"; next }  # No new articles
        if($NumLast < $NumLastInDir)
                { die "In $GroupName, the last number was $NumLast, but the " .
                        " last number in the directory was $NumLastInDir\n" }
        # Figure out which article to start from
        if($NumLastInDir == 0) { $GetArtNum = $NumFirst }
        else { $GetArtNum = $NumLastInDir + 1 }

        print " $GetArtNum -> $NumLast\n";
        # Now read each of the new articles
        while(1) {  # Loop until "last" is called
                $ArtRef = $NntpPtr->article($GetArtNum);
                @ArtArr = @$ArtRef; $ArtArrLen = @ArtArr;
                if($ArtArrLen > 0 ) {  # Skip article numbers that had 0 len
                        open(OUT, ">$GetArtNum") or
                                die "Could not create $GroupName/$GetArtNum\n";
                        print OUT @$ArtRef; close(OUT);
                }
                #else {
                #	print "Empty article: $GetArtNum\n";
                #}

                # Check if we're at the end
                if($GetArtNum >= $NumLast) { last }
                $GetArtNum += 1;  # Increment the article number to get
        }
}

$NntpPtr->quit;
exit;
