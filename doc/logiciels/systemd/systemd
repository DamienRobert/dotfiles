vim: ft=markdownlight fdm=expr

doc
===

- https://systemd.io
  - https://systemd.io/BOOT_LOADER_SPECIFICATION
- https://www.freedesktop.org/wiki/Software/systemd/ [older doc]
  - https://www.freedesktop.org/wiki/Software/systemd/ContainerInterface/

systemd*
========

systemd-analyze systemd-ask-password systemd-cat systemd-cgls systemd-cgtop systemd-delta systemd-detect-virt systemd-escape systemd-firstboot systemd-hwdb systemd-inhibit systemd-machine-id-setup systemd-notify systemd-nspawn systemd-path systemd-run systemd-stdio-bridge systemd-sysusers systemd-tmpfiles systemd-tty-ask-password-agent

[they accept --cat-config option, eg  systemd-tmpfiles --cat-config]

- systemd-run: starts a program as a transcient unit
  eg systemd-run --scope --user screen
  to let screen live if KillUserProcesses=true in logind.conf
  [this kills all processes in the scope of the session, so since 'screen'
  is another scope, it is not affected. See also 'lingering' in logind and
  systemd-run]
  --scope: If a command is run as transient scope unit, it will be executed by
           systemd-run itself as parent process and will thus inherit the
           execution environment of the caller.
  --property=, -p
           Sets a property on the scope or service unit that is created. This option takes an assignment in the same format as systemctl(1)'s set-property command.
    Ex: systemd-run -p NetworkNamespacePath=/var/run/netns/ns1 ip a
- systemd-cgls, systemd-cgtop: cgroups
- systemd-analyse
  systemd-analyse blame
  systemd-analyse critical-chain
  systemd-analyze plot > /tmp/plot.svg
  systemd-analyze cat-config systemd/system.conf
- systemd-path: query paths

Types
=====

.automount, .device, .mount, .path, .scope, .service, .slice, .socket, .swap,
.target, .timer

+ systemd-networkd: .link, .network, .netdev

systemctl
=========

systemctl enable [--now]/disable [--now]/start/stop/restart
systemctl preset/preset-all
systemctl cat/show/status
systemctl list:
  list-dependencies  -- Show unit dependency tree
  list-jobs          -- List jobs
  list-sockets       -- List sockets
  list-timers        -- List timers
  list-unit-files    -- List installed unit files
  list-units         -- List units
systemctl list-units -t service [--all]

systemctl status:
  The dot ("●") uses color on supported terminals to summarize the
  unit state at a glance. White indicates an "inactive" or
  "deactivating" state. Red indicates a "failed" or "error" state and
  green indicates an "active", "reloading" or "activating" state.
  [White = Black on a light background; also appears when 'condition failed']


*ctl
====
systemd-firsboot --locale=... --locale-messages=... --timezone=... --hostname=... --root-password=...
#/etc/{locale.conf,localtime,hostname,shadow}

bootctl, coredumpctl, hostnamectl, journalctl, localectl, loginctl,
machinectl, networkctl, systemctl, timedatectl, portablectl, resolvectl

Ex: 
timedatectl set-local-rtc true #adjust /etc/adjtime to store the hardware clock in local tz
timedatectl set-timezone Europe/Paris #/etc/localtime
hostnamectl set-hostname --static "$HOSTNAME" #/etc/hostname
hostnamectl set-hostname --pretty "$HOSTNAME" #/etc/machine-info 

localectl
---------
localectl set-locale LANG=en_US.utf8 LC_MESSAGES=...
localectl set-keymap -> /etc/vconsole.conf and /etc/X11/xorg.conf.d/00-keyboard.conf

localectl set-x11-keymap --no-convert fr oss
localectl set-keymap --no-convert fr-latin1

loginctl
--------
loginctl session-status
loginctl show-session

coredumpctl
-----------
coredumpctl list [default], info, dump, gdb

cat /usr/lib/sysctl.d/50-coredump.conf 
kernel.core_pattern=|/usr/lib/systemd/systemd-coredump %p %u %g %s %t %e
Settings for systemd-coredump: /etc/systemd/coredump.conf
Storage: /var/lib/systemd/coredump

bootctl
-------
Manage bootloader (with systemd-boot), cf also kernel-install to setup
kernels
bootctl update

Generators
==========
man systemd.generator
  /run/systemd/system-generators/*
  /etc/systemd/system-generators/*
  /usr/local/lib/systemd/system-generators/*
  /usr/lib/systemd/system-generators/*

  /run/systemd/user-generators/*
  /etc/systemd/user-generators/*
  /usr/local/lib/systemd/user-generators/*
  /usr/lib/systemd/user-generators/*

http://www.freedesktop.org/wiki/Software/systemd/Generators/
Generators are invoked with three arguments, all of them paths to runtime directories where generator tools can place their generated unit files or symlinks.
- Normal: argv[1] may be used to override unit files in /usr, but not those in /etc. This means that unit files placed in this directory take precedence over vendor unit configuration but not over native user/administrator unit configuration.
- Early: argv[2] may be used to override unit files in /usr and in /etc. This means that unit files placed in this directory take precedence over all configuration, regardless if vendor or user/administrator.
- Late: argv[3] may be used to extend the unit file tree but not override any other unit files. Any native configuration files regardless if supplied by the vendor or user/administrator take precedence over the generated ones placed in this directory.
Examples:
- systemd-fstab-generator converts /etc/fstab into native mount units. It uses argv[1] as location to place the generated unit files in order to allow the user to override fstab with his own native unit files, but also to ensure that /etc/fstab overrides any vendor default from /usr.
- Similar, systemd-cryptsetup-generator converts /etc/crypttab to native service units. It also uses argv[1].
- systemd-system-update-generator temporarily redirects default.target to system-update.target if a system update is scheduled. Since this needs to override the default user configuration for default.target it uses argv[2].

Environment generators
-----------------------

man systemd.environment-generator
  /run/systemd/system-environment-generators/*
  /etc/systemd/system-environment-generators/*
  /usr/local/lib/systemd/system-environment-generators/*
  /usr/lib/systemd/system-environment-generators/*

  /run/systemd/user-environment-generators/*
  /etc/systemd/user-environment-generators/*
  /usr/local/lib/systemd/user-environment-generators/*
  /usr/lib/systemd/user-environment-generators/*

Scripts that are run in alphabetical order, and should output
ENVVAR=value
to specify systemd's (system or user) environment.

For instance,
/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator
will  reads environment configuration specified by environment.d(7)
configuration files, cf `man systemd-environment-d-generator`

man environment.d:
- ~/.config/environment.d/*.conf
- /etc/environment.d/*.conf
- /run/environment.d/*.conf
- /usr/lib/environment.d/*.conf
- /etc/environment

Note: others methods to configure the environment
https://wiki.archlinux.org/index.php/Systemd/User#Environment_variables
- For users with a $HOME directory, create a .conf file in the ~/.config/environment.d/ directory with lines of the form NAME=VAL. Affects only that user's user unit. See environment.d(5) for more information.
- Use the DefaultEnvironment option in /etc/systemd/user.conf file. Affects all user units.
- Add a drop-in config file in /etc/systemd/system/user@.service.d/. Affects all user units; see #Service example
- At any time, use systemctl --user set-environment or systemctl --user import-environment. Affects all user units started after setting the environment variables, but not the units that were already running.
- Using the dbus-update-activation-environment --systemd --all command provided by dbus. Has the same effect as systemctl --user import-environment, but also affects the D-Bus session. You can add this to the end of your shell initialization file.
- For "global" environment variables for the user environment you can use the environment.d directories which are parsed by systemd generators. See environment.d(5) for more information.
- You can also write an environment generator script which can produce environment variables that vary from user to user, this is probably the best way if you need per-user environments (this is the case for XDG_RUNTIME_DIR, DBUS_SESSION_BUS_ADDRESS, etc). See systemd.environment-generator(7).
[ cf aussi .pam_environment, cf Xsession]

Path orders
===========

System:
- /etc/systemd/system.control
- /run/systemd/system.control
- /run/systemd/transient #this is where systemd-run service files are put
- /run/systemd/generator.early
- /etc/systemd/system
- /run/systemd/system
- /run/systemd/generator
- /usr/local/lib/systemd/system
- /usr/lib/systemd/system
- /lib/systemd/system
- /run/systemd/generator.late

User:
- ~/.config/systemd/system.control
- $XDG_RUNTIME_DIR/systemd/system.control
- $XDG_RUNTIME_DIR/systemd/transient
- $XDG_RUNTIME_DIR/systemd/generator.early
- ~/.config/systemd/user
- /etc/systemd/user
- $XDG_RUNTIME_DIR/systemd/user
- /run/systemd/user
- $XDG_RUNTIME_DIR/systemd/generator
- ~/.local/share/systemd/user
- /usr/local/lib/systemd/user
- /usr/local/share/systemd/user
- /usr/lib/systemd/user
- /usr/lib/systemd/user
- /usr/share/systemd/user
- $XDG_RUNTIME_DIR/systemd/generator.late

See src/shared/path-lookup.c for the full (not-quite-documented) details.

Divers
======

- https://github.com/systemd/mkosi
  Build Legacy-Free OS Images
- https://github.com/systemd/casync
  Content-Addressable Data Synchronization Tool
- http://0pointer.net/blog/index.html

Find private mounts: sudo grep systemd-private /proc/*/mountinfo

* Network namespace
- https://cloudnull.io/2019/04/running-services-in-network-name-spaces-with-systemd/
- https://github.com/systemd/systemd/issues/2741
