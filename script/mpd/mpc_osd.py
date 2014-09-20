#!/usr/bin/env python2
# coding: utf-8
#
# Copyright (C) 2011 by Edgar Merino (http://devio.us/~emerino)
#
# Licensed under the Artistic License 2.0 (The License). 
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at:
#
#    http://www.perlfoundation.org/artistic_license_2_0
#
# THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS "AS
# IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES. THE IMPLIED
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
# NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY YOUR LOCAL
# LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR CONTRIBUTOR WILL
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
# DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
# This script acts as a client for a MPD server and displays information about
# the current song being played through the org.freedesktop.Notifications DBus
# interface. By reusing (serializing/deserializing) the UID for the Notification
# window it guarantees the information will be displayed in the same window.
# By doing this, instead of using "pynotify" or the command line tool
# "notify-send", the script doesn't need to be run as a daemon, instead it
# should be called on a per command basis (like mpc). This is useful when the
# script is bound to keyboard shortcuts. It may execute any command supported
# by the mpd module and additionaly "toggle" and "info".
#
# It supports three types of notification:
# > Desktop Notifications Specification through DBUS
# > XOSD through pyosd
# > Desktop Notifications Specification through libnotify
#
# Options can be passed as arguments or can also be fetched from a configuration
# file located by default at ~/.mpcosdrc, although a different path may be specified.
#
# The format of the configuration file is as follows:
#
# > Lines beginning with a "#" are ignored
# > key = value pairs accepted only
#
# Dependencies
# =========
# python >= 2.5
# python-mpdclient
#
# DBUS
#   python-dbus
#   an implementation of the Desktop Notifications Specification 
#                               (e.g. notify-osd, xfce4-notifyd)
# 
# XOSD
#   pyosd
#
# LIBNOTIFY
#   pynotify
#
# How to run it
# =========
# see usage()

__version__ = "0.6"
__author__  = "emerino <emerino at gmail dot com>"
__date__    = "$29/04/2011 06:18:45 PM$"

import os
import sys
import getopt

from mpd import MPDClient

# DBUS Desktop Notifications Specification
try:
    import dbus
    DBUS_AVAILABLE = True
except ImportError:
    DBUS_AVAILABLE = False

# PyOSD (xosd)
try:
    import time
    import threading
    import pyosd
    XOSD_AVAILABLE = True
except ImportError:
    XOSD_AVAILABLE = False

# Libnotify (pynotify)
try:
    import pynotify
    LIBNOTIFY_AVAILABLE = True
except ImportError:
    LIBNOTIFY_AVAILABLE = False
    

def main():
    player = None

    try:
        # Obtain configuration and command from parameters
        conf, command = parse_parameters()

        # Create and connect the client
        player = MPCPlayer()
        player.connect(conf["host"], conf["port"])

        # Use the selected notification
        notification_box = get_notification_box(conf)

        # Add a NotificationListener to the player to display notifications
        player.listeners.add(NotificationListener(notification_box))

        # Execute the given command
        player.execute(command)
    except Exception, err:
        print str(err)
        usage()
    finally:
        if player != None: 
            try:
                player.disconnect()
            except Exception:
                pass

def usage():
    print """
Usage: mpc_osd.py <options> command

Available options:
    -c, --config        path to mpcosdrc configuration file
    -d, --display       display notification to use: dbus | xosd | libnotify
    -s, --stack         stack notifications, default is not stacked:
                            libnotify always stacks notifications
                            dbus does not stack notifications by default
                            xosd does not support stacking
    -h, --host          mpd server: tcp host | unix socket
    -p, --port          mpd server tcp port

    --font              xosd font
    --color             xosd color
    --help              show this message

Available commands:
    play                play current song
    pause               pause current song
    toggle              toggle play/pause
    stop                stop current song
    info                display information for the current song
    next                next song in playlist
    previous            previous song in playlist
    shuffle             shuffle the playlist
    """

def parse_parameters():
    short_opts = "d:sh:pc:"
    long_opts = ["display=", "stack", "host=", "port=", \
                 "font=", "color=", "config=", "help"]

    config = {}
    config_file = os.path.expanduser("~/.mpcosdrc")

    if not os.path.exists(config_file):
        config_file = None

    default_config = { # defaults
        "display": "dbus",
        "stack": False,
        "host": "localhost",
        "port": 6600,
        "font": "-*-helvetica-*-r-normal--34-*-*",
        "color": "#287D28"
    }

    opts, args = getopt.getopt(sys.argv[1:], short_opts, long_opts)

    for opt,arg in opts:
        if opt == "--help":
            usage()
            sys.exit(0) # =(
        elif opt in ("--config", "-c"):
           config_file = arg 
        if opt in ("--display", "-d"):
            config["display"] = arg
        elif opt in ("--stack", "-s"):
            config["stack"] = True
        elif opt in ("--host", "-h"):
            config["host"] = arg
        elif opt in ("--port", "-p"):
            config["port"] = arg
        elif opt == "--font":
            config["font"] = arg
        elif opt == "--color":
            config["color"] = arg

    if not args or len(args) == 0:
        raise Exception("Command missing")

    if config_file:
        user_config = {}

        for line in open(config_file):
            # Ignore comments
            if len(line.strip()) > 0 and line.lstrip()[:1] != "#":
                opt, value = line.split("=")

                if opt.strip() == "stack":
                    value = value.strip().lower() == "true"
                else:
                    value = value.strip()

                user_config[opt.strip()] = value

        for opt, value in user_config.items():
            if opt not in config:
                config[opt] = value
        
    for opt, value in default_config.items():
            if opt not in config:
                config[opt] = value

    return config, args[0]

def get_notification_box(conf):
    name = conf["display"]

    if name == "xosd":
        if not XOSD_AVAILABLE:
            raise Exception("No pyosd library found, XOSD is not supported")

        return xosd_notification(conf["font"], conf["color"])
    elif name == "dbus":
        if not DBUS_AVAILABLE:
            raise Exception("No python-dbus library found, DBUS is not supported")

        return dbus_notification(conf["stack"])
    elif name == "libnotify":
        if not LIBNOTIFY_AVAILABLE:
            raise Exception("No pynotify library found, libnotify is not supported")

        return libnotify_notification()
    else:
        raise ValueError("Wrong display notifier specified")
        
def xosd_notification(font, color):
    return XOSDNotification(3, font, color)

def dbus_notification(stack):
    uid_file = "/tmp/mpc_osd.uid"

    if stack:
        dbus_notification = DBusNotification(dbus.SessionBus(), \
                                            app_name="mpc_osd")
    else:
        dbus_notification = UniqueDBusNotification(dbus.SessionBus(), \
                                                  app_name="mpc_osd", \
                                                  uid_file=uid_file)

    return dbus_notification

def libnotify_notification():
    return LibnotifyNotification("mpc_osd")

class MPCPlayer:
    """
    MPD player that wraps a MPDClient to provide it with an
    event driven interface
    """

    def __init__(self):
        self.__client = MPDClient()

        self.listeners = set()

    def __toggle(self):
        """
        Toggle play/pause commands
        """

        if self.__client.status()["state"] == "play":
            self.pause()
        else:
            self.play()

    def __info(self):
        pass

    def __getattr__(self, attr):
        if attr == "toggle":
            value = self.__toggle
        elif attr == "info":
            value = self.__info
        else:
            value = getattr(self.__client, attr)

        # TODO: Usar funciones lambda
        class FunctionWrapper:
            def __init__(self, func, command, player, listeners):
                self.func = func
                self.command = command
                self.player = player
                self.listeners = listeners

            def __call__(self, *args):
                ret_val = self.func(*args)

                for listener in self.listeners:
                    listener.command_executed(self.command, self.player)

                return ret_val

        if callable(value):
            value = FunctionWrapper(value, attr, self.__client, self.listeners)

        return value

    def execute(self, command):
        func = getattr(self, command)

        if callable(func):
            func()

class PlayerListener:
    def command_executed(self, command, player):
        raise NotImplementedError

class NotificationListener(PlayerListener):
    
    def __init__(self, notification_box):
        """
        @type notification_box Notification
        """

        self.__notification_box = notification_box
        self.supported_commands = ( # commands that display information
            "play",
            "pause",
            "toggle",
            "info",
            "stop",
            "next",
            "previous" 
        )
        
    def command_executed(self, command, player):
        if command in self.supported_commands:
            content = self.display_content(player.currentsong(), \
                                           player.status()["state"])

            self.__notification_box.notify(content)

    def display_content(self, current_song, player_state):
        """
        Return the content that will be displayed in the Notification.
        """

        # TODO: Cover support
        content = {
            "title": self.__get_song_property(current_song, "Title"),
            "artist": self.__get_song_property(current_song, "Artist"),
            "icon": "notification-audio-%s" % (player_state)
        }

        return content

    def __get_song_property(self, song, prop):
        if prop.lower() in song:
            return song[prop.lower()]
        else:
            return prop + " missing"
           
        
class Notification:
    """
    Abstract class that acts as an interface to a Notification window
    """

    def notify(self, content):
        raise NotImplementedError

    def close(self):
        raise NotImplementedError

class XOSDNotification(Notification):
    """
    XOSD (pyosd) Notification implementation
    """
    
    class OSDThread(threading.Thread):
        def __init__(self, timeout, osd, song_info):
            threading.Thread.__init__(self)

            self.timeout = timeout
            self.osd = osd
            self.song_info = song_info

        def run(self):
            self.osd.display("%s: %s" % (self.song_info["artist"], \
                                         self.song_info["title"]))
            time.sleep(self.timeout)

    def __init__(self, timeout, font, color):
        self.osd = pyosd.osd(font=font, colour=color)
        self.timeout = timeout

    def notify(self, song_info):
        thread = self.OSDThread(self.timeout, self.osd, song_info)
        thread.start()

class DBusNotification(Notification):
    """
    Provides a direct way to communicate with a
    dbus org.freedesktop.Notifications Interface
    """

    def __init__(self, bus, app_name, uid=0, timeout=-1):
        # org.freedesktop.Notifications interface
        self.__dbus_notification = dbus.Interface(bus.get_object( \
                                   'org.freedesktop.Notifications', \
                                   '/org/freedesktop/Notifications'), \
                                   'org.freedesktop.Notifications')
        
        # uid of the Notification this class will handle
        self.uid = uid; 

        if app_name == None: 
            raise Exception("Application name cannot be null")

        self.__app_name = app_name

        # timeout before the notification box disappears
        self.timeout = timeout 

    def notify(self, song_info):
        """
        org.freedesktop.Notifications.Notify
        """

        content = {
            "summary": song_info["title"],
            "body": song_info["artist"],
            "icon": song_info["icon"]    
        }

        self.uid = self.__dbus_notification.Notify(self.__app_name, \
                   self.uid, content["icon"], content["summary"], \
                   content["body"], '', '', self.timeout)

    def close(self):
        """
        org.freedesktop.Notifications.CloseNotification
        """

        self.__dbus_notification.CloseNotification(self.uid)

class UniqueDBusNotification(DBusNotification):
    def __init__(self, bus, app_name, uid_file):
        DBusNotification.__init__(self, bus, app_name)

        self.__uid_file = uid_file
        self.__read_uid()

    def notify(self, song_info):
        DBusNotification.notify(self, song_info)

        self.__write_uid()

    def __read_uid(self):
        if os.path.exists(self.__uid_file):
            self.uid = open(self.__uid_file).read()

    def __write_uid(self):
        f = open(self.__uid_file, "w")
        f.write(str(self.uid))
        f.close()

class LibnotifyNotification(Notification):
    def __init__(self, app_name):
        if not pynotify.init(app_name):
            raise Exception("There was an error initializing libnotify")

    def notify(self, song_info):
        content = {
            "summary": song_info["title"],
            "body": song_info["artist"],
            "icon": song_info["icon"]    
        }

        notification = pynotify.Notification(content["summary"], \
                                             content["body"], \
                                             content["icon"])

        notification.show()


if __name__ == "__main__":
    main()
