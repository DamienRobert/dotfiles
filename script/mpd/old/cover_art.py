#!/usr/bin/env python2
# This script will download album art for a music collection and put it in a specific folder

## Location of the music collection
music_location = "/home/dams/.mpd/music/"
## Location of the cover images
covers_location = "/home/dams/Musique/.covers"
# Import tagging library
try:
    import tagpy
except ImportError:
    print "This script requires tagpy in order to work. On ubuntu, you can install it with sudo apt-get install tagpy."

import urllib2,os,time

try:
    import pylast
except ImportError:
    print "This script requires python bindings for last.fm. Getting them now."
    import sys
    pylast_urlfile = urllib2.urlopen("http://pylast.googlecode.com/svn/trunk/pylast.py") # Get pylast.py from pylast's svn
    pylast_file = open(sys.path[0] + "/pylast.py",'wb')
    pylast_file.write(pylast_urlfile.read())
    pylast_file.close() # Save it to pylast.py in the current directory
    import pylast

def GetMusicFiles(music_location):
    """Get a list of music files in the location"""
    # Use the find unix command to get all files in the location
    all_files = os.popen('find %s'%music_location).read().split('\n')
    # Extract the music files from the list and put them into a new one
    music_files = []
    for file in all_files:
        # Try opening with tagpy
        try:
            tagpy.FileRef(file)
            music_files.append(file)
        # If it fails, then it is not a music file
        except ValueError:
            pass
    return music_files

def GetAlbums(music_location):
    """Get a list of albums from the list of music"""
    # Get music files
    music_files = GetMusicFiles(music_location)
    # Initiate a list of albums
    albums = []
    # Initiate a list of failed music files
    failed_files = []
    # Loop through the music files, read their album info
    for file in music_files:
        music = tagpy.FileRef(file).tag()
        # Read the artist name
        try:
            artist = music.artist
            if artist ==  "":
                artist = None
        except AttributeError: # If the tag doesn't exist
            artist = None
        # Read the album name
        try:
            album = music.album
            if album == "":
                album = None
        except AttributeError: # If the tag doesn't exist
            album = None
        # If it isn't already in the albums db, add it
        if (artist,album) not in albums and None not in (artist,album):
            albums.append((artist,album))
        elif None in (artist,album):
            failed_files.append(file)
    return albums,failed_files

def GetExistingCovers(covers_location):
    """Get a list of existing cover images so that we only download what is needed"""
    # All covers should be in the same folder
    all_files = os.listdir(covers_location)
    # Filter the cover files
    cover_files = []
    # Image files to accept as covers
    image_types = ['png','jpg','bmp','gif']
    for file in all_files:
        # If the extension is in the accepted list, then add it to the cover list
        if file.split('.')[-1].lower() in image_types:
            # Remove the extension before appending
            # Loop through the extensions and it is the one for the file, then remove it
            for image_type in image_types:
                if file.split('.')[-1].lower() == image_type:
                    length_extension = -1 - len(image_type)
                    file = file[:length_extension]
                    break
            cover_files.append(file)
    return cover_files

def ListCoversToGet(covers_location,music_location):
    """Get a list of covers to download"""
    # Get existing covers
    cover_images = GetExistingCovers(covers_location)
    albums,failed_files = GetAlbums(music_location)
    # Loop through the albums, checking if a cover image for it exists
    covers_to_get = []
    for album in albums:
        # Replace disallowed characters with an underscore in the artist and album parts of the filename
        disallowed = ['\\','/',':','<','>','?','*','|']
        artist_filename = album[0]
        album_filename = album[1]
        for character in disallowed:
            artist_filename = artist_filename.replace(character,'_')
            album_filename = album_filename.replace(character,'_')
        if "%s-%s"%(artist_filename,album_filename) not in cover_images:
            covers_to_get.append(album)

    return covers_to_get,failed_files

def GetCoverArt(artist,album,download_location,size):
    """Use last.fm for album art fetching"""
    ## Last.FM API key
    api_key = '5dde241299a6b25d28769972e966471b'
    network = pylast.get_lastfm_network(api_key = api_key)
    # Get the album object using album info we have
    album_object = network.get_album(artist,album)
    # Get the url of the cover art
    try:
        cover_url = album_object.get_cover_image(size=size)
    except pylast.WSError:
        cover_url = None
    # Get the cover image and put it in the covers directory, if it has been found
    if cover_url != None:
      try:
        coverfile = urllib2.urlopen(cover_url)

        # Replace disallowed characters with an underscore in the artist and album parts of the filename
        disallowed = ['\\','/',':','<','>','?','*','|']
        artist_filename = artist
        album_filename = album
        for character in disallowed:
            artist_filename = artist_filename.replace(character,'_')
            album_filename = album_filename.replace(character,'_')

        output = open(download_location + '/#%s#%s#.%s'%(artist_filename,album_filename,cover_url.split('.')[-1]),'wb')
        output.write(coverfile.read())
        output.close()
        found = True
      except:
	    print "Unexpected error:"
	    found = False
    else:
        found = False
    time.sleep(5)
    return found

def GetAllCovers(music_location,covers_location,size=3,verbose=False):
    """Get all the covers that are needed"""
    # Albums that need covers
    albums,failed_files = ListCoversToGet(covers_location,music_location)
    # Total number of albums to get
    total = len(albums)
    current = 0
    # Initiate a list of failed albums
    failed_albums = []
    for album in albums:
        if GetCoverArt(album[0],album[1],covers_location,size):
            if verbose:
                current += 1
                print "Got %s - %s [%s/%s]"%(album[0],album[1],current,total)
        else:
            failed_albums.append((album[0],album[1]))

    # Print out a list of errors
    print str(len(failed_files)) + " files failed to be read correctly."
    if verbose:
        for file in failed_files:
            print "%s failed to be read."%file
    print str(len(failed_albums)) + " album covers could not be downloaded."
    if verbose:
        for album in failed_albums:
            print "%s - %s album cover was not downloaded"%album
if __name__ == "__main__":
    GetAllCovers(music_location,covers_location,verbose=True)
