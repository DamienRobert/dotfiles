vim: ft=markdownlight fdm=expr
man systemd, man systemctl

Config
======

Precedence is /etc/systemd/system, /run/systemd/system, /usr/lib/systemd/system
(cf [systemd] for the full list). This acts like an unionfs.

ploum.d/foo.conf dropfile are read in the alphabetical order (so a
00foo.conf in /etc will have less precedence than a 99foo.conf in /usr).

Variables that acts as list (like ExectStart, or ListenStream) get appended
when they are repeated (eg ListenStream=44007 in
sshd.socket.d/override.conf adds the port to the existing 22 one). To reset
the list, put 'ListenStream=' first.

ConditionPathExists=!foo => foo does not exist

  If multiple conditions are specified, the unit will be executed if all of
  them apply (i.e. a logical AND is applied). Condition checks can be
  prefixed with a pipe symbol (|) in which case a condition becomes a
  triggering condition. If at least one triggering condition is defined for
  a unit, then the unit will be executed if at least one of the triggering
  conditions apply and all of the non-triggering conditions.

* Security:
ReadWritePaths=, ReadOnlyPaths=, InaccessiblePaths=, TemporaryFileSystem=
RootDirectory, Bind[ReadOnly]Paths=, MountAPIVFS
ProtectSystem=true [/usr,/boot], full [+/etc], strict [/]
ProtectHome=true [/home, /root, /run/user], read-only, tmpfs
DynamicUser= [this implies several other security features]
PrivateTmp, PrivateDevices, PrivateNetwork, PrivateUsers, PrivateHostname ...

ExecStart
---------

Use ; (or several ExecStart) to start several processes (need OneShot)
Partial environment substitution: cf systemd.service and systemd.exec
ExecStart=-/foo means to continue even if /foo fails
ExecStart=@/foo bar ploum means that bar will be argv[0]
+/foo => process executed with full privileges
!,!!/foo => process executed with more privileges (cf systemd.service)

Graph Dependency
================

cf systemd.unit
Requires, RequiresOverridable #needed dependencies
Requisite, RequisiteOverridable #needed dependencies that have to be already started
Wants #optional dependencies
BindsTo #like Requires, but also stop if the dependencies stop
PartOf #starting/stopping the units listed will also affect us
Conflict
ReloadPropagatedFrom, PropagatesReloadTo

Booleans:
StopWhenUnneeded=
DefaultDependencies=

Install:
Alias=, WantedBy=, RequiredBy=, Also=, DefaultInstance=
WantedBy=foo.service <=> Alias=foo.service.wants/bar.service

Ordering:
Before=, After=
  Note that when two units with an ordering dependency between them are shut
  down, the inverse of the start-up order is applied.

Automatic Properties: ConsistsOf, BoundBy, RequisiteOf, Triggers, TriggeredBy, ConflictedBy

Mount Units
----------

Note that local-fs.target does have 'DefaultDependencies=no'. So unless a
Before=local-fs.target is configured in a mount unit, local-fs.target will
not wait for the mount.

systemd-fstab-generator:
- If noauto is specified, there is no dependendcy on the mount unit generated
- Otherwise there is a RequiredBy=local-fs.target and a Before=local-fs.target
- But if we add nofail, then the RequiredBy is a WantedBy and there is no
  Before=

More details in `man systemd.mount`, which documents the x-systemd.*
settings that can get specified in the fstab, like x-systemd.automount

Dependencies
============

systemctl list-dependencies
systemctl show -p WantedBy local-fs.target
systemctl show -p Wants local-fs.target

Default Dependencies
--------------------

target, services, paths, sockets, timers, scope, slices => Before+Conflicts=shutdown.target
mount, automount, swap => Before+Conflicts=umount.target
services, paths, sockets, timers => Requires+After=sysinit.target

timers, socket, paths => Before=$1.target
service => After=basic.target

Implicit dependencies: timers, socket, paths => Before=$1.service

### targets
       ·   Target units will automatically complement all configured
           dependencies of type Wants= or Requires= with dependencies of type
           After= unless DefaultDependencies=no is set in the specified units.
           Note that Wants= or Requires= must be defined in the target unit
           itself — if you for example define Wants=some.target in
           some.service, the automatic ordering will not be added.

       ·   Target units automatically gain Conflicts= dependency against
           shutdown.target.

So to set up a target that launch units but do not wait for them it seems
like we should use DefaultDependencies=false

### services
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   Services with Type=dbus set automatically acquire dependencies of
           type Requires= and After= on dbus.socket.

       ·   Socket activated services are automatically ordered after their
           activating .socket units via an automatic After= dependency.
           Services also pull in all .socket units listed in Sockets= via
           automatic Wants= and After= dependencies.

       Additional implicit dependencies may be added as result of execution
       and resource control parameters as documented in systemd.exec(5) and
       systemd.resource-control(5).

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Service units will have dependencies of type Requires= and After=
           on sysinit.target, a dependency of type After= on basic.target as
           well as dependencies of type Conflicts= and Before= on
           shutdown.target. These ensure that normal service units pull in
           basic system initialization, and are terminated cleanly prior to
           system shutdown. Only services involved with early boot or late
           system shutdown should disable this option.

       ·   Instanced service units (i.e. service units with an "@" in their
           name) are assigned by default a per-template slice unit (see
           systemd.slice(5)), named after the template unit, containing all
           instances of the specific template. This slice is normally stopped
           at shutdown, together with all template instances. If that is not
           desired, set DefaultDependencies=no in the template unit, and
           either define your own per-template slice unit file that also sets
           DefaultDependencies=no, or set Slice=system.slice (or another
           suitable slice) in the template unit. Also see systemd.resource-
           control(5).
### paths
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   If a path unit is beneath another mount unit in the file system
           hierarchy, both a requirement and an ordering dependency between
           both units are created automatically.

       ·   An implicit Before= dependency is added between a path unit and the
           unit it is supposed to activate.

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Path units will automatically have dependencies of type Before= on
           paths.target, dependencies of type After= and Requires= on
           sysinit.target, and have dependencies of type Conflicts= and
           Before= on shutdown.target. These ensure that path units are
           terminated cleanly prior to system shutdown. Only path units
           involved with early boot or late system shutdown should disable
           DefaultDependencies= option.
### sockets
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   Socket units automatically gain a Before= dependency on the service
           units they activate.

       ·   Socket units referring to file system paths (such as AF_UNIX
           sockets or FIFOs) implicitly gain Requires= and After= dependencies
           on all mount units necessary to access those paths.

       ·   Socket units using the BindToDevice= setting automatically gain a
           BindsTo= and After= dependency on the device unit encapsulating the
           specified network interface.

       Additional implicit dependencies may be added as result of execution
       and resource control parameters as documented in systemd.exec(5) and
       systemd.resource-control(5).

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Socket units automatically gain a Before= dependency on
           sockets.target.

       ·   Socket units automatically gain a pair of After= and Requires=
           dependency on sysinit.target, and a pair of Before= and Conflicts=
           dependencies on shutdown.target. These dependencies ensure that the
           socket unit is started before normal services at boot, and is
           stopped on shutdown. Only sockets involved with early boot or late
           system shutdown should disable DefaultDependencies= option.
### timers
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   Timer units automatically gain a Before= dependency on the service
           they are supposed to activate.

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Timer units will automatically have dependencies of type Requires=
           and After= on sysinit.target, a dependency of type Before= on
           timers.target, as well as Conflicts= and Before= on shutdown.target
           to ensure that they are stopped cleanly prior to system shutdown.
           Only timer units involved with early boot or late system shutdown
           should disable the DefaultDependencies= option.

       ·   Timer units with at least one OnCalendar= directive will have an
           additional After= dependency on time-sync.target to avoid being
           started before the system clock has been correctly set.
### mount
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   If a mount unit is beneath another mount unit in the file system
           hierarchy, both a requirement dependency and an ordering dependency
           between both units are created automatically.

       ·   Block device backed file systems automatically gain BindsTo= and
           After= type dependencies on the device unit encapsulating the block
           device (see below).

       ·   If traditional file system quota is enabled for a mount unit,
           automatic Wants= and Before= dependencies on
           systemd-quotacheck.service and quotaon.service are added.

       ·   Additional implicit dependencies may be added as result of
           execution and resource control parameters as documented in
           systemd.exec(5) and systemd.resource-control(5).

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   All mount units acquire automatic Before= and Conflicts= on
           umount.target in order to be stopped during shutdown.

       ·   Mount units referring to local file systems automatically gain an
           After= dependency on local-fs-pre.target.

       ·   Network mount units automatically acquire After= dependencies on
           remote-fs-pre.target, network.target and network-online.target.
           Towards the latter a Wants= unit is added as well.

### automount
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   If an automount unit is beneath another mount unit in the file
           system hierarchy, both a requirement and an ordering dependency
           between both units are created automatically.

       ·   An implicit Before= dependency is created between an automount unit
           and the mount unit it activates.

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Automount units acquire automatic Before= and Conflicts= on
           umount.target in order to be stopped during shutdown.

### swap
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   All swap units automatically get the BindsTo= and After=
           dependencies on the device units or the mount units of the files
           they are activated from.

       Additional implicit dependencies may be added as result of execution
       and resource control parameters as documented in systemd.exec(5) and
       systemd.resource-control(5).

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Swap units automatically acquire a Conflicts= and a Before=
           dependency on umount.target so that they are deactivated at
           shutdown as well as a Before=swap.target dependency.

### devices
IMPLICIT DEPENDENCIES
       Many unit types automatically acquire dependencies on device units of
       devices they require. For example, .socket unit acquire dependencies on
       the device units of the network interface specified in BindToDevice=.
       Similar, swap and mount units acquire dependencies on the units
       encapsulating their backing block devices.
### scope
DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Scope units will automatically have dependencies of type Conflicts=
           and Before= on shutdown.target. These ensure that scope units are
           removed prior to system shutdown. Only scope units involved with
           early boot or late system shutdown should disable
           DefaultDependencies= option.
### slice
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:

       ·   Slice units automatically gain dependencies of type After= and
           Requires= on their immediate parent slice unit.

DEFAULT DEPENDENCIES
       The following dependencies are added unless DefaultDependencies=no is
       set:

       ·   Slice units will automatically have dependencies of type Conflicts=
           and Before= on shutdown.target. These ensure that slice units are
           removed prior to system shutdown. Only slice units involved with
           late system shutdown should disable DefaultDependencies= option.

### resouce-control
For slice.slice, scope.scope, service.service, socket.socket, mount.mount, swap.swap
IMPLICIT DEPENDENCIES
       The following dependencies are implicitly added:
       ·   Units with the Slice= setting set automatically acquire Requires=
           and After= dependencies on the specified slice unit.

       Slice=
           The name of the slice unit to place the unit in. Defaults to
           system.slice for all non-instantiated units of all unit types
           (except for slice units themselves see below). Instance units are
           by default placed in a subslice of system.slice that is named after
           the template name.
