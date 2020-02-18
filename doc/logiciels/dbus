vim: ft=markdownlight fdm=expr

Dbus explanation
================

http://lwn.net/Articles/619250/

    What OO/D-Bus calls a "method" translates to a C "function".
    What OO/D-Bus calls an "interface" translates to a C "struct" plus the functions you'd use to modify the struct.
    What D-Bus calls an "object path" in a way translates in C to a pointer to a specific instance of a struct.
    What D-Bus calls a method "signature" is really like a C signature, or function prototype if you so will.
    What OO/D-Bus calls a "service" one could translate more or less to a UNIX socket.
    And finally, the concept of a "bus" one could translate to a directory in the file system that multiple UNIX sockets are placed in.

Now, if you want to call a function on some other process via D-Bus, then you would do a method call, passing an object path, its interface, and the right arguments according to the method's signature, and send that to a specific service, on a specific bus.

{
        sd_bus *bus;
        sd_bus_new_system(&bus);
        sd_bus_call_method(bus, 
                "org.freedesktop.timedate1",
                "/org/freedesktop/timedate1",
                "org.freedesktop.timedate1"
                "SetTimezone"
                NULL,
                NULL, 
                "sb",
                "Europe/Berlin",
                1);
       sd_bus_unref(bus);
}

This connects to the system bus (which is where all system services are found on), then call a method on the "org.freedesktop.timedate1" service, referencing an object by its path "/org/freedesktop/timedate1", selecting its interface "org.freedesktop.timedate1", invoking the "SetTimezone" method call. The two NULL pointers are for getting back a more verbose error on failure and for getting some other response data back. In thise case for the sake of just being an example we pass that as NULL because we aren't interested. Then, the signature of the call is "sb", meaning a string followed by a boolean. And finally, that's the wo arguments we pass.

                                 --------------------

 The "stuttering" is because the example is a bit simple.

The first "org.freedesktop.timedate1" is the destination process, and the "org.freedesktop." part is a java-style reverse-dns prefix to handle the fact that the namespace in dbus is global.

The "/org/freedesktop/timedate1" is the object in this process that we wish to talk to. Since this service typically only has one interesting object and we need a standardized place for it we use something similar to the destination name. It could technically be "/", but then it would be hard for the timeddate1 service to also serve other objects.

The second "org.freedesktop.timedate1" is the interface name we wish to call a method on. An object in dbus may implement several interfaces, and in this case it probably also implements the standard "org.freedesktop.DBus.Properties" and "org.freedesktop.DBus.Introspectable" interfaces too. Think of this as a namespace for the method name argument.

In this case we're just calling the "normal" methods on the timedate service, but we need to name that something and typically it gets the same name as the destination.

dbus-send
=========

dbus-send --dest=org.freedesktop.ExampleName               \
          /org/freedesktop/sample/object/name              \
          org.freedesktop.ExampleInterface.ExampleMethod   \
          int32:47 string:'hello world' double:65.32       \
          array:string:"1st item","next item","last item"  \
          dict:string:int32:"one",1,"two",2,"three",3      \
          variant:int32:-8                                 \
          objpath:/org/freedesktop/sample/object/name


Dbus activation
===============

## Launching services:

https://dbus.freedesktop.org/doc/system-activation.txt

    Trivial methods on services can be called directly and the launch
    helper will start the service and execute the method on the service.
    The lauching of the service is completely transparent to the caller, e.g.:

    dbus-send --system --print-reply			\
    	--dest=org.freedesktop.Hal			\
    	/org/freedesktop/Hal/Manager			\
    	org.freedesktop.Hal.Manager.DeviceExists	\
    	string:/org/freedesktop/Hal/devices/computer

    If you wish to activate the service without calling a well known method,
    the standard dbus method StartServiceByName can be used:
    
    dbus-send --system --print-reply			\
    	--dest=org.freedesktop.DBus			\
    	/org/freedesktop/DBus				\
    	org.freedesktop.DBus.StartServiceByName		\
    	string:org.freedesktop.Hal uint32:0

## dbus service files

http://kkaempf.blogspot.fr/2009/03/d-bus-service-on-demand.html

A typical service file for my.awesome.Service would be named my.awesome.Service.service and contain

    # DBus service activation config
    [D-BUS Service]
    Name=my.awesome.Service
    Exec=/usr/bin/awesome
    User=the_dude
    
- Name is the name of the service, Exec the path to the executable implementing the service and User the user name to run the service. Be careful when using User=root, only very few services actually need root rights.
- The Exec line can also contain arguments to be passed to the executable. This can be used to e.g. implement multiple services in a single binary and pass the actual service name as a parameter.

=> Installing the .service file
   Just copy the service file to either /usr/share/dbus-1/system-services
   (for a system bus service) or to /usr/share/dbus-1/services (for a
   session bus service).
   [Note: I think /etc/dbus-1/[system-]services/ works too]
   Your service is now ready to run. The D-Bus daemon will automatically
   pick up changes in the service directories and find the new file.

Note: there is hardcoded support for systemd activation via SystemdService=
when systemd is running:

Example org.gtk.vfs.Daemon.service:
    [D-BUS Service]
    Name=org.gtk.vfs.Daemon
    Exec=/usr/lib/gvfs/gvfsd
    SystemdService=gvfs-daemon.service

Environment
===========

man dbus-update-activation-environment

Monitor
=======

dbus-monitor "type='method_call',interface='org.gtk.vfs.Metadata'"

* https://unix.stackexchange.com/questions/46301/a-list-of-available-dbus-services
dbus-send --session           \
  --dest=org.freedesktop.DBus \
  --type=method_call          \
  --print-reply               \
  /org/freedesktop/DBus       \
  org.freedesktop.DBus.ListNames

Gui:
- qdbusviewer
- DFeet: https://wiki.gnome.org/action/show/Apps/DFeet?action=show&redirect=DFeet


Power off
=========

http://askubuntu.com/questions/454039/what-command-is-executed-when-shutdown-from-the-graphical-menu-in-14-04

dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" boolean:true

PowerOff/Reboot/Suspend/Hibernate
