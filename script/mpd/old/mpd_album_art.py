#! /usr/bin/env python3
# From: https://github.com/jameh/mpd-album-art
# Modifications by Damien Robert
# MPD Album Art
# This program is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published
# by the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""
:copyright: 2013 Jamie Macdonald
:license: GNU General Public License (GPL) version 3

.. testsetup::

    from mpd_album_art import Grabber

"""

from pylast import LastFMNetwork, AlbumSearch
from mpd2 import MPDClient, socket

import os, sys
try:
    # Python 3
    from urllib.request import urlretrieve
except ImportError:
    # Python 2
    from urllib import urlretrieve

_image_extensions = (".jpg", ".jpeg", ".png")
"""Extensions to qualify a file as an image"""

_last_fm_api_key = "6b6d8768f0c41f7e82da0de44e1db76a"
"""LastFM API key for the application"""


class Grabber(object):
    """An object to grab artwork for MPD songs

    :param str save_dir:
        Directory into which Grabber should download new images.
    :param str library_dir:
        Directory MPD is currently playing from.

    Construct a Grabber with ``save_dir = ~/.covers``:

    >>> import os
    >>> home_dir = os.environ['HOME']
    >>> cover_path = os.path.join(home_dir, '.covers')
    >>> grabber = Grabber(cover_path)

    specify more stuff:

    >>> music_path = os.path.join(home_dir, 'Music/Library')
    >>> grabber = Grabber(save_dir=cover_path, library_dir=music_path)
    """
    def __init__(self, save_dir, library_dir=None):
        super(Grabber, self).__init__()

        self.save_dir = save_dir

        if library_dir is None:
            library_dir = os.path.join(os.environ['HOME'], 'Music')
        self.library_dir = library_dir

    def get_art(self, song):
        """Get artwork from LastFM.

        Before connecting to network, if there exists a file whose name begins
        with ``_sanitize(song['artist'] + ' ' + song['album'])``, return that
        file path.
        Do not overwrite existing files.

        :param dict song:
            A dictionary with keys ``'album'`` and ``'artist'`` to correspond
            with string representations of the album and artist (resp.) of
            interest. Use ``MPDClient.currentsong()`` to return uch a dictionary
            .
        :return:
            A string representation of the local file path to the image file for
            ``song`` or ``None`` if no results found
        """
        album_tofind=_sanitize(song['artist'],song['album'])

        l = [n for n in os.listdir(self.save_dir)
             if n.startswith(album_tofind)]
        if l != []:
            file_path = os.path.join(self.save_dir, l[0])
            sys.stderr.write("Found {}\n".format(file_path))
            return file_path

        # Define the search network compatible with LastFM API
        network = LastFMNetwork(api_key = _last_fm_api_key)

        album_search = AlbumSearch(song['album'], network)

        #if int(album_search.get_total_result_count()) == 0:
        if album_search.get_total_result_count() == None:
            # LastFm does not have this album, links to unknown.png
            sys.stderr.write("Last.FM: no results\n")
            unknown=os.path.join(self.save_dir,'unknown.png')
            album_tofind+=".png"
            os.symlink(unknown,os.path.join(self.save_dir,album_tofind))
            return album_tofind

        # Get the first hit, since there is at least one result -
        # the "I'm feeling lucky" approach.
        album = album_search.get_next_page()[0]

        # Get url of album art from ``pylast.AlbumSearch`` object
        img_url = album.get_cover_image()

        file_path = os.path.join(self.save_dir,
                                 self._get_save_name(song, img_url))

        # Check if this file exists in filesystem already
        if os.path.isfile(file_path):
            sys.stderr.write("Last.FM: we already had the album {}!\n".format(file_path))
            return file_path
        else:
            try:
                # Download the image
                urlretrieve(img_url, file_path)
            except e:
                sys.stderr.write(e + "\n")
                return None

        sys.stderr.write("Last.FM: found {}\n".format(file_path))
        return file_path

    def get_local_art(self, song):
        """Get artwork from ``song`` folder.

        :param dict song:
            A dictionary with keys ``'album'`` and ``'artist'`` to correspond
            with string representations of the album and artist (resp.) of
            interest. Such a dictionary returns from
            ``MPDClient.currentsong()``
        :return:
            A string representation of the local file path to the largest image
            file for ``song`` found in ``song_folder``, or ``None`` if no results
            found
        """
        song_folder = os.path.dirname(os.path.join(self.library_dir,
                                                   song['file']))
        images = self._get_images_from_folder(song_folder)

        if images == []:
            sys.stderr.write("No local results from {}\n".format(song_folder))
            return None

        # Pick the largest file
        images = [os.path.join(song_folder, i) for i in images]
        file_path = max(images, key=os.path.getsize)
        sys.stderr.write('Found image in {}.\n'.format(song_folder))
        return file_path

    def _get_save_name(self, song, img_url=None):
        """Return file name of album art at img_url

        :param dict song:
            A dictionary with keys ``'album'`` and ``'artist'`` to correspond
            with string representations of the album and artist (resp.) of
            interest. Such a dictionary returns from
            ``MPDClient.currentsong()``
        :param str img_url:
            A string representation of an external url points to the album
            artwork image file
        :return:
            ``str`` of the form 'Artist_Name_Album_Name_h45h.png', or if
            ``img_url`` is ``None``, simply 'Artist_Name_Album_Name'. In this
            example, ``'h45h.png'`` extracts from the original filename in
            ``img_url``.
        """
        save_name = song['artist'] + ' ' + song['album']
        extra=""
        if img_url:
            extra = img_url.split("/")[-1]
        return _sanitize(song['artist'], song['album'], extra)

    def _get_images_from_folder(self, folder):
        """Get a list of image files from ``folder``.

        :return list:
            A list of file names from within ``folder`` that end with an extension
            defined in the ``image_extensions`` tuple.
        """
        return [f for f in os.listdir(folder) if f.endswith(_image_extensions)]


def _sanitize(artist,album,extra=""):
    """Replace occurences of ``disallowed_characters`` in name with
    underscores and double quotation marks with single quotation marks.
    """
    name="#"+artist+"#"+album+"#"+extra
    disallowed_characters = r",\/:<>?*| "

    for character in disallowed_characters:
        name = name.replace(character, '_')
    # Replace " with '
    return name.replace('"', "'")


if __name__ == '__main__':
    import argparse, os

    home_dir = os.environ['HOME']
    if 'MPD_HOST' in os.environ:
      mpd_host = os.environ['MPD_HOST']
    else:
      mpd_host = '/run/user/1000/mpd_sock'
    parser = argparse.ArgumentParser()
    #parser.add_argument('-n', '--hostname', type=str, default='localhost')
    parser.add_argument('-n', '--hostname', type=str, default=mpd_host)
    parser.add_argument('-p', '--port', type=int, default=6600)
    parser.add_argument('-m', '--music_dir', type=str,
                        default=os.path.join(home_dir, '.mpd/music/'))
    parser.add_argument('-a', '--art_dir', type=str,
                        default=os.path.join(home_dir, '.mpd/music/.covers'))
    args = parser.parse_args()

    # initialize MPD client
    mpd_client = MPDClient()

    grabber = Grabber(save_dir=args.art_dir, library_dir=args.music_dir)

    try:
        # connect client to MPD server
        mpd_client.connect(args.hostname, args.port)
    except socket.error:
        # Cannot connect
        sys.stderr.write('MPD not running?'+'\n')
        sys.exit(1)

    current_song = mpd_client.currentsong()

    if current_song == {}:
        # No song is playing
        print("")

    # try local pics
    else:
        art=grabber.get_local_art(current_song)
        if art is not None:
            print(art)
        else:
            # try lastFM pics
            art=grabber.get_art(current_song)
            if art is not None:
                 print(art)

    # done
    mpd_client.disconnect()
    sys.exit(0)
