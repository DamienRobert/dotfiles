vim: ft=markdownlight fdm=expr

[!] Installed [+] Interesting
Liste de logiciels libres: http://enacit.epfl.ch/logiciel-libre/

Password manager
================

- lastpass
+ bitwarden
-> set up bitwarden server, using docker and bitwarden_rs (=bitwarden server reimplemented in rust) https://tech.oeru.org/setting-your-own-bitwarden-password-keeper-and-sync-server

Backups
=======

+ bup
+ borg https://borgbackup.readthedocs.io/en/stable/
  a deduplicating backup program. Optionally, it supports compression and authenticated encryption.
+ https://github.com/restic/restic
  Fast, secure, efficient backup program https://restic.net
- https://burp.grke.org/burp2/00contents.html
  Improved Open Source Backup:
  Incorporating inline deduplication and sparse indexing solutions
- https://github.com/restic/others
  Rust: preserve, rdedup, zVault
    https://github.com/dswd/zvault
    Rust, but unmaintened

Borg vs restic:
https://stickleback.dk/borg-or-restic/
https://sysadministrivia.com/episodes/S4E5

Commercial: crashplan and backblaze https://lifehacker.com/online-backup-faceoff-crashplan-vs-backblaze-1768101631

- rclone: like rsync but to sync with cloud storage (support google drive)

Parsing
=======

* Json:
+ http://stedolan.github.io/jq/
  jq is a lightweight and flexible command-line JSON processor.
  jq is like sed for JSON data
  $ jq '.foo' {"foo": 42, "bar": "less interesting data"}
- http://kmkeen.com/jshon/
  A similar tool with a different syntax
  jshon -e b -a -t -> bool bool null string
- https://github.com/therealklanni/jp (light jq)
- Json formatters: https://github.com/antonmedv/fx, https://github.com/busyloop/vj

* Yaml:
+ https://github.com/kislyuk/yq => yq, xq (=xml)
  Command-line YAML and XML processor - jq wrapper for YAML/XML documents https://yq.readthedocs.io/
! https://github.com/rubyworks/yaml_command
  YAML Command is a command line tool for working with YAML files.
- https://github.com/pandastrike/yaml-cli [coffeescript]
  (In rubygems: yaml_command)

Infos
=====

* Divers:
glxgears #pour tester la puissance du proc
look #regarder des trucs dans le dico
par #reformater les paragraphes
tac, rev #miroirs
xxd #hexdump

* Système
ldconfig, uname, modprobe, miitools
proot http://proot.me/: userspace chroot, mount, and binfmt_misc based on ptrace

* Time
ntpd, openntpd, chrony (cf https://chrony.tuxfamily.org/index.html)

* Disques durs
badblocks, smartctl, hdparm
lshw, dmidecode (hardware information)

* Firmware:
+ https://github.com/fwupd/fwupd (arch: fwupd)

  # fwupdmgr get-devices
This will display all devices detected by fwupd.

  # fwupdmgr refresh
This will download the latest metadata from LVFS.

  # fwupdmgr get-updates
If updates are available for any devices on the system, they'll be displayed.

  # fwupdmgr update
This will download and apply all updates for your system.

grep
----

ag: https://github.com/ggreer/the_silver_searcher
  # a faster ack like
pt: https://github.com/monochromegane/the_platinum_searcher
  #written in go (but in practice not as fast as ag)

rg: https://github.com/BurntSushi/ripgrep
  #the best/fastest one

Benchmark
---------
calcul entier: openssl speed
calcul flottant: povray
proc: bogomips
mem: free
disque: df
carte graphique: glxgears

ls*
---
lsattr lsmod lsof lsdev lspci lspgpot lsusb lsraid lshw
Ex: lsusb -t to see usb1/2/3 ports, cf
  http://www.linuxnix.com/find-usb-device-details-in-linuxunix-using-lsusb-command/
  http://superuser.com/questions/781398/how-can-i-be-sure-that-ive-plugged-a-device-into-a-usb-3-port
Note: xhci=usb 3 (+usb2/1), ehci=usb 2, ehci/uhci=usb 1
Graphic: usbview

Updates
-------
mandb #pour updater le cache de man (aucune idée de ce que ça fait en fait)
updatedb #pour updater le cache de locate

Monitoring
==========

On archlinux:
* Full diagnostic: glances, conky

* Top: htop, atop, top; iotop

* Net:
  + ss: the new netstat
  + nethogs [show programs using connections]
  + iftop [show ip src <-> dst, like ss]
  + iptraf-ng [a curse like wireshark]
  + nload [displays the current network usage]
  - jnettop [like iftop]
  - netwatch [ethernet protocol monitor, ver old]
  - mtr
    https://github.com/traviscross/mtr (in arch: mtr, mtr-gtk)
    mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool.

* Stats:
  + dstat: Dstat is a versatile replacement for vmstat, iostat and ifstat
  - nmon [curse]
  - sysstat (iostat, mpstat = processors, pidstat, sadf = read sar output, sar = output system activity) - divers indicateurs
  - sysdig: the definitive system and process troubleshooting tool (native support for containers)

* Progress: pv/progress
  + pv - monitor the progress of data through a pipe
    $ cat /dev/urandom | pv | cat >/dev/null
  + https://github.com/Xfennec/progress (in arch)
    Linux tool to show progress for cp, mv, dd, ... (formerly known as cv)

* Rust cli
- ps: procs, process-viewer
- divers: strace-analyzer, battop
- stats: mprober

* Not in archlinux:
- Conky like: https://wtfutil.com/
- Net:
  - iptraf, nettop
  - https://github.com/vesche/histstat
    history for netstat => easily view connections on a system as they occur
- latencytop comme similaires à iotop
- collectl (avec colmux) et sar (avec sag et sadf) comme combinant iotop et
  nettop avec top en plus.
- https://github.com/andreoli/fulltrace [dead]
  A complete ftrace- and uprobes-based tracer (user, libraries, kernel) for GNU/Linux

* Log analyzer
+ https://github.com/allinurl/goaccess (in arch)
  GoAccess is a real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser. https://goaccess.io
+ http://lnav.org/
  https://github.com/tstack/lnav
- https://github.com/dogoncouch/logdissect
  CLI utility and Python module for analyzing log files and other data.

strace
------

strace/ltrace/...

* https://sysdig.com/blog/sysdig-vs-dtrace-vs-strace-a-technical-discussion/
Strace is based on a facility called ptrace that is exported by Linux and other operating systems. Ptrace can do many complex things and is used, for example, by debuggers like gdb to look into a running process. Strace uses it to instrument a target process and “listen” to that process's system

* https://en.wikipedia.org/wiki/Ftrace
- strace – a debugging utility for Linux and some other Unix-like systems, monitors system calls used by a program and all received signals
- ltrace – a Linux debugging utility, displays the calls a userland application makes to shared libraries

Perf
----

* ftrace: allow to see what happens inside the kernel
[ftrace/dtrace: in kernel, more powerful than strace which only listen for syscalls (dtrace is on solaris)]

* perf (the difference with ftrace is not clear; perf looks like it counts
kernel event while ftrace trace them. Note: The ftrace function tracer is
also available from within perf, as the ftrace:function tracepoint.)

Exemple: `sudo perf top / stat`

https://perf.wiki.kernel.org/index.php/Tutorial
   This is the wiki page for the perf performance counters subsystem in
   Linux. Performance counters are CPU hardware registers that count hardware
   events such as instructions executed, cache-misses suffered, or branches
   mispredicted. They form a basis for profiling applications to trace
   dynamic control flow and identify hotspots.

* Brendan Gregg
+ perf-tools: https://github.com/brendangregg/perf-tools, wrappers autour de perf et ftrace

EBPF
----

* Brendan Gregg
+ http://www.brendangregg.com/blog/2015-07-08/choosing-a-linux-tracer.html
  => ftrace, perf_events, eBPF, SystemTap, sysdig
  - Linux perf_events (aka "perf", after its command) is the official tracer/profiler for Linux users.

+ The famous diagrams: http://www.brendangregg.com/linuxperf.html
  - observability + static + perf-tools/bcc: http://www.brendangregg.com/Perf/linux_perf_tools_full.png
  - observability: http://www.brendangregg.com/Perf/linux_observability_tools.png
    Cf the story at https://www.linux.com/news/netflix-architect-offers-template-monitoring-linux-performance-tools/
    And an older version: https://wiert.me/2014/03/19/reference-card-for-linux-performance-and-analysis-tools%EF%BB%BF-via-antony-peel-google/
  - static: http://www.brendangregg.com/Perf/linux_static_tools.png
  - benchmarking: http://www.brendangregg.com/Perf/linux_benchmarking_tools.png
  - tuning: http://www.brendangregg.com/Perf/linux_tuning_tools.png
  - sar: http://www.brendangregg.com/Perf/linux_observability_sar.png
  - perf-tools: http://www.brendangregg.com/Perf/perf-tools_2016.png
  - bcc tracing tools: http://www.brendangregg.com/Perf/bcc_tracing_tools.png

* BPF adds programmatic capabilities to the existing kernel tracing facilities (tracepoints, kprobes, uprobes) and should include both perf and ftrace capabilities and replace them
Cf http://www.brendangregg.com/blog/2019-01-01/learn-ebpf-tracing.html

Tools:
- https://github.com/iovisor/bcc BCC - Tools for BPF-based Linux IO analysis, networking, monitoring, and more
More modern version of the perf-tools, using ebpf [opensnoop, ...]

- http://www.brendangregg.com/blog/2018-10-08/dtrace-for-linux-2018.html
  bpftrace, ply
  https://github.com/iovisor/bpftrace High-level tracing language for Linux eBPF
  # bpftrace -e 'tracepoint:syscalls:sys_enter_* { @[probe] = count(); }'

Exemples: https://blog.cloudflare.com/cloudflare-architecture-and-how-bpf-eats-the-world/

Liste
-----

- http://techthrob.com/2010/07/21/three-apps-for-monitoring-performance-in-linux/
- Nice wiki: https://wiki.yoctoproject.org/wiki/Tracing_and_Profiling

* Julia Evans blog
- https://jvns.ca/blog/2016/07/03/debugging-tools-i-love/
  strace, dstat, tcpdump + wireshark, perf, opensnoop
- https://jvns.ca/blog/2016/06/30/why-do-we-use-the-linux-kernels-tcp-stack/
- https://jvns.ca/blog/2017/06/28/notes-on-bpf---ebpf/

Parallel
========

gnu parallel
=> https://www.gnu.org/software/parallel/sem.html
  sem -j 2 'sleep 1;echo 1 finished';   echo sem 1 exited
  sem -j 2 'sleep 2;echo 2 finished';   echo sem 2 exited
  sem -j 2 'sleep 3;echo 3 finished';   echo sem 3 exited
  sem -j 2 'sleep 4;echo 4 finished';   echo sem 4 exited
  sem --wait; echo sem --wait done

  for i in *.log ; do
    echo $i
    sem -j+0 gzip $i ";" echo done
  done
  sem --wait

=> https://www.reddit.com/r/rust/comments/c66dtz/async_parallelize_your_shell_commands/
Reimplementation of `sem -j+0` in rust
    This looks very similar to akramer's lateral command.
    https://github.com/akramer/lateral that I've also ported to rust and can be
    installed via cargo install lateral.

    I haven't looked at your implementation, but the syntax for starting
    commands is a little different. lateral supports arbitrary file descriptor
    passing, and adjusting the number of inflight commands allowed while
    running. Not sure if async supports those or not. Here's a brief example,
    more can be found on the README.md.

=> http://adapton.org/
   Programming Language Abstractions for Incremental Computation

Applications graphiques
=======================

* Console
https://www.freedesktop.org/wiki/Software/kmscon/
Modern (userland) linux console

* X
Liste de (vieux) utilitaires X: https://cyber.dabamos.de/unix/x11/

startx -- :1
xwd #dumpe la fenêtre
xsetroot,xsetbg #pour définir le fond d'écran
Xnest   #pour lancer X dans une fenêtre (sert à rien mais est rigolo)
xrandr  #changer la resolution
xev #pour voir les évènements x
xdpyinfo #voir les modules chargés par x

xcalc   #calculatrice graphique
xman    #man graphique
xmag    #loupe graphique

zenity #dialog box from shell scripts

setxkbmap fr #le layout clavier

terminals
---------
lilyterm #lightweight vte emulator
roxterm #same but with more features (now dead :-()
terminix: https://github.com/gnunn1/terminix vte gtk3+ but no tab support :-(
terminology #lots of bells and whistle
            #no support yet for True Color: https://phab.enlightenment.org/T746
kitty: https://github.com/kovidgoyal/kitty
  A cross-platform, fast, feature full, GPU based terminal emulator
  No support for bce, cf https://github.com/kovidgoyal/kitty/issues/160#issuecomment-346470545
  http://invisible-island.net/ncurses/ncurses.faq.html#bce_mismatches
alacritty: https://github.com/jwilm/alacritty
  Like kitty, in rust, lightweight
terminus: in electron... https://news.ycombinator.com/item?id=19988557

WM
--
fvwm awesome i3 pekwm fluxbox

Destkop:
gnome, kde, xfce, lxde, lxqt
mate (successor of gnome 2), cinnamon [linux mint desktop, forked from gnome 3, with layout inspired by gnome 2]
unity, gnome shell: front end for gnome 3

Medias
======

MediaCenter
-----------
omxplayer: décodeur vidéo hardware pour raspberry
kodi [was xbmc]: interface graphique par dessus (xbox media center)

- kodi (ex XBMC)
- http://www.navixtreme.com/
  media links via Navi-X a kodi plugin
- mythtv: an app for tnt tuners
- webmin: web-based interface for system administration for Unix
- hellanzb/nzbget (usenet nzb downloader)
- couchpotato (usenet and torrent downloader)
- sickrage (Automatic Video Library Manager for TV Shows. It watches for new episodes of your favorite shows, and when they are posted it does its magic.)
- télécommande: flirc / hdmi cec

- upnp: serveurs => rygel, minidlna, pulseaudio-dlna (dlna+chromecast)
        client => vlc (playlist->upnp
         + chromecast: https://unix.stackexchange.com/questions/291975/how-do-i-stream-to-chromecast-using-vlc)
        android => bubbleupnp (server+client + chromecast)

- serveurs de media: plex, emby, jellyfish (open source)

Photos
------
eog       (affiche les miniatures et l'image en meme temps)
xzgv      (logger)
gqview    (affiche les images, mais pas de miniatures)
gthumb    (pour travailler sur les images -- donnees exif,...)
kuickshow (kde, bof)

Tags
----
id3 #pour les afficher
id3ed #pour les changer (interactivement ou non)
id3ren #pour changer les filenames en fonction des tags
id3tool #pour les changer en ligne de commande
id3v2    #pour convertir en id3 version 2
vorbiscomment #tags ogg

Audio
-----
* Sip
- linphone
- ekiga (ne marche pas très bien avec freephonie.net)

* Ripp
grip #front-end graphique pour lecture/ripping de cd
abcde (command line version of grip)
TODO: whipper (python2 version, fork of morituri)
=> use musicbrainz database https://musicbrainz.org/doc/About

Album cover fetcher:
- https://github.com/sahib/glyr
- On the web: https://coverartarchive.org/
  Can be retrieved using Music brainz api: https://wiki.musicbrainz.org/Development/XML_Web_Service/Version_2

bplay #player/recorder de wav
-cdtool #audio player en texte (cdplay/...)
mp3blaster #audio player en mode texte
cccd #lecteur de cd minimaliste
cdcd #lecteur de cd en ligne de commande
cplay #lecteur en monde texte minimaliste (front end pour les ploum123)
gnomp3 #clone de music match
-gqmpeg #un clone de winamp (frontend x pour mpg123)
xmms   #un autre clone de winamp
mpg321   #lecteurs de musiques
ogg123   #
music123 #
rhythmbox #clone de windows media (play radio too)
mp3gain: mp3gain -r files

cmus: https://cmus.github.io/#download (lightweight console music player)
moc: https://news.ycombinator.com/item?id=10430512
mpd+ncmpcpp
mpd+cantata (graphical frontend to mpd)

Tagging:
- https://wiki.gnome.org/Apps/EasyTAG (last release: 2016)
- https://kid3.sourceforge.io (qt)

Video
-----
gaupol -> rectifier les sous-titres

cdburning
---------

cdrtools: mkisofs, cdrecord [original]
cdrkit: fork by debian -> genisoimage, cdrecord, wodim [deprecated]
libisoburn: xorriso, cdrskin [recommanded]

DVD
---

growisofs: pour graver
vobcopy, dvdbackup: pour copier un dvd sur le disque
acidrip, dvd::rip: frontend pour ripper des films
mencoder, transcode: pour encoder des films
lsdvd, isoinfo: info sur l'iso
mplayer  -dvd-device /tmp/film-dvd/LOST_IN_TRANSLATION dvd://1

Text
----

* Convert to Text
img2txt (libcaca)
doc: antiword, catdoc/xls2csv (antiword tries to preserve formatting)
docx: docx2txt

* Pdf
- diff pdf:
  - diffpdf (unmaintened)
  - https://vslavik.github.io/diff-pdf/
- gscan2pdf: scan to pdf + ocr
- https://github.com/ifad/pdfbeads: convert scanned images to a single PDF file

* ebook
calibre -> transférer les epub
cool-reader -> surtout pour la lecture

* Notes: joplin https://joplinapp.org

Files
=====
Notify
------
Gamin [replace FAM]
http://www.noah.org/wiki/FAM,_Gamin,_inotify

inotify-tools -> inotifywait

UI
--
nautilus (gnome)
thunar (xfce)
pcmanfm (lxde)
spacefm

udisk
-----
User disk mounter:
udisks2 [replace udisks], udevil [lightweight], pmount [last release 2011-03]

  There are two versions of udisks called udisks and udisks2. Development of udisks has ceased in favor of udisks2. [1]
  udisksd (udisks2) and udisks-daemon (udisks) are started on-demand by D-Bus

Automounter
udiskie [use udisks], devmon [included in udevil]

symlink farm manager
--------------------
stow: https://www.gnu.org/software/stow/ [in arch]
  see stow plugin for mr: http://lists.gnu.org/archive/html/info-stow/2011-12/msg00000.html
graft: http://peters.gormand.com.au/Home/tools/graft/graft-html
dotfiles: https://pypi.python.org/pypi/dotfiles

File manager
------------

cli: vifm, ranger, fman https://fman.io/ (non free, beurk)

Recovery
--------
- fsarchiver/partclone/partimage: saving partitions to an image file
- testdisk
  TestDisk is powerful free data recovery software! It was primarily designed
  to help recover lost partitions and/or make non-booting disks bootable
  again when these symptoms are caused by faulty software, certain types of
  viruses or human error (such as accidentally deleting a Partition Table).
  Partition table recovery using TestDisk is really easy.
- foremost
  Foremost is a console program to recover files based on their headers,
  footers, and internal data structures. This process is commonly referred
  to as data carving.

- ddrescue #projet gnu
- dd_rescue #un autre similaire
  -> comme dd mais permet de continuer en cas d'erreur
- dd_rhelp: wrapper around dd_rescue
  http://www.kalysto.org/utilities/dd_rhelp/index.en.html
  -> ddrescue is better than dd_rescue+dd_rhelp
  http://ubuntu-rescue-remix.org/node/51:
  -> ddrescue est mieux (mais dd_rescue permet d'aller en arrière explicitement)

Trash
-----

+ https://github.com/andreafrancia/trash-cli (arch: trash-cli)
Command line interface to the freedesktop.org trashcan.


File transfer
-------------

* Overview: https://schollz.com/software/sending-a-file/

* Sites
- https://wetransfer.com/
- https://www.renater.fr/en/filesender
- https://partage.inria.fr/

* https://send.firefox.com/
Cli: https://news.ycombinator.com/item?id=21898310
Ffsend – Share Files from the CLI: A Firefox Send Client Written in Rust (gitlab.com)

* web torrent: https://webtorrent.io/faq
https://news.ycombinator.com/item?id=12526717
Instant.io – Streaming file transfer over WebTorrent (instant.io)
- https://instant.io/
- https://file.pizza/

* Decentralised:
- https://ipfs.io/#how
  https://news.ycombinator.com/item?id=18650375
  IPFS, The Interplanetary File System, Simply Explained (achainofblocks.com)
- https://schollz.com/blog/ipfs-enabled-personal-internet-archive/
  https://schollz.com/blog/how-to-post-a-site-to-ipfs/
  https://macwright.org/2017/08/09/decentralize-ipfs.html (comparison between ipfs and dat)


* magic wormhole (pake)
- https://github.com/warner/magic-wormhole
- https://github.com/schollz/croc (archlinux: croc)

Latex
=====

latex on the web: mathjax, katex, latex2img
https://www.bersling.com/2016/05/10/displaying-math-on-the-web/
- mathjax: https://www.mathjax.org/
- katex: https://khan.github.io/KaTeX/

- Editeurs généraux: kile
- Editeurs TeX: texmaker
- Ide: texworks
- WYSIWYM: lyx
- TeX-like: texmacs


Chat
====

pidgin/empathy
bitlbee (passerelle irc <-> msn/yahoo/...)

IRC
---
weechat (client irc puissant en mode texte)
irssi (idem, sur phare)

web: https://client00.chat.mibbit.com/?url=ircs%3A%2F%2Fchat.freenode.net%2Farchlinux-aur

Web 2.0: 
- irc like: slack, gitter #https://www.quora.com/What-are-the-pros-and-cons-of-Gitter-vs-Slack => gitter is more open source friendly
- teamspeak/skype like: discord
- forums: discourse
Open source: matrix
=> https://matrix.org/docs/projects/try-matrix-now.html: riot, weechat

Fonts
=====

* libotf: otfdump font.ttf, otflist dir, otfview font (show glyphs)
* freetype2-demos: ftbench ftchkwd ftdiff ftdump ftgamma ftgrid ftlint ftmemchk ftmulti ftpatchk ftstring fttimer ftvalid ftview ttdebug
- ftchkdwd consola.ttf: Consolas : KO! Tagged as fixed, but has 6 `proportional' glyphs
- ftdiff consola.ttf: compare native hinter, auto-hinter, unhinted
- ftdump consola.ttf: font infos (more like otfinfo than a full dump)
- ftgamma: free type gamma matcher
- ftgrid 16pt consola.ttf: show glyph on a grid and can toggle hint options
- ftpatchk consola.ttf: consola.ttf doesn't use patented opcodes
- ftstring 16pt consola.ttf: show a string and can toggle hint options
- ftvalid consola.ttf: layout table validator
- ftview 16pt consola.ttf: show glyphs/waterfall and can toggle hint options

* List fonts:
  - xorg-xfontsel: Point and click selection of X11 font names
  - xlsfonts: List available X fonts
  - otflist dir
  - gnome-font-viewer
* Collection: fontypython (unmaintained), fontmatrix
              font-manager (in aur): show glyphs/waterfall
* List glyphs:
  - xfd (xfd -fa "DejaVu Sans Mono")
  - otfview font.otf
  - gucharmap = gnome-character-map (can then copy paste)
  - gnome-characters (for smileys)
  - Web: http://bluejamesbond.github.io/CharacterMap/
* View sample text:
  - ftview/ftstring
  - fontview https://github.com/googlei18n/fontview (not very interesting)
  - gnome-font-viewer consola.ttf
* View font infos: cf https://stackoverflow.com/questions/4458696/finding-out-what-characters-a-font-supports https://superuser.com/questions/430033/how-to-check-all-available-characters-in-a-font-file
  - fc-query consola.ttf
  From texlive:
  - otfinfo -i consola.ttf
  - ttfdump consola.ttf (from libotf: otfdump font.ttf)
  - luaotfload-tool --find="fira mono" -I
* Vectoriel: inkscape, scribus
* Converting fonts: 
  - fontforge
  - Latex: pour convertir des fontes vers le format latex:
    https://ctan.org/tex-archive/fonts/utilities/fontools, which wrap the
    texlive lcdf package: otfinfo, otftotfm (otftotfm: create font metrics)
  - Python: https://github.com/fonttools/fonttools (ne pas confondre avec
    celui de latex) => TTX tool, that can convert TrueType and OpenType
    fonts to and from an XML text format

Find fallback font used for a glyph:
- https://repolinux.wordpress.com/2013/03/10/find-out-fallback-font-used-by-fontconfig-for-a-certain-character/
  FC_DEBUG=4 pango-view  --font='mono' -q -t '{character}' 2>&1 | \
    grep -o 'family: "[^"]\+' # | cut -c 10- | tail -n 1

  firefox 'data:text/html,<meta charset="utf8"><p style="font-family: monospace;">¿</p>'

Mail
====

metamail mimencode rot13
notmuch/mu: search mails
urlscan: https://github.com/firecat53/urlscan
  Mutt and terminal url selector (similar to urlview)
vdirsyncer: sync address and calendars
khard: https://github.com/scheibler/khard (show addressbook of a cal server on a terminal)
http://www.pldaniels.com/ripmime/: download mime attachements

KDE
===
k3b -> graver
kaudiocreator -> ripper

Photos
------
kphotoalbum -> pour classer des albums photos, mettre des tags (méta données, ne déplasse pas l'album)
kallery -> pour exporter des photos sur le web
digikam -> pour importer des photos

Images
------
kuickshow -> pour voir des images
kview -> pour voir une image
gwenview -> comme gqview

IRC
---
logiciels de chat irc du - au + complexe
konversation ->  last release July 2010
ksirc -> July 2009
kvirc -> Mars 2011
[Pb: la notification ne marche pas avec fvwm]
kopete pour l'équivalent gaim

Divers
======

zsnes: émulateur de super nintendo
rarcrack: cracker des rar protégés par mdp

! https://github.com/tombenner/ru: Ruby in your shell

- https://github.com/TimKaechele/WorkingClass
An human readable plain text tasklist syntax.

- http://moo.nac.uci.edu/~hjm/parsync/
  parsyncfp - a parallel rsync wrapper for large data transfers

+ https://github.com/davatorium/rofi
  Rofi: A window switcher, application launcher and dmenu replacement
  => https://blog.wizardsoftheweb.pro/tag/rofi/

Web
===

* Cli navigator:
Simple: links, lynx
More powerfull: w3m

- https://github.com/atsepkov/Graphene
  A text-based web browser that's a joy to use.
  Uses puppeteer, an headless chromium

* Download:
curl/httpie #pour le web
wget, aria2

* Testing:
- https://github.com/gchaincl/httplab
  The interactive web server.
  HTTPLabs let you inspect HTTP requests and forge responses.

Network
=======

https://tmate.io/ Instant terminal sharing (using tmux)

Emoji
=====

* On arch: gnome-charaters, rofimoji

* search for emoji
- https://github.com/sindresorhus/emoj (nodejs)
  Relevant emojis appear when you start writing
+ https://github.com/dematerializer/emoji-finder (nodejs)
  inspired by emoj
  -> can add several emojis at once, better search results
- https://github.com/b4b4r07/emoji-cli
  Emoji completion on the command line (zsh)
  Outputs :emojy:
+ https://github.com/arp242/uni
  Query the Unicode database from the commandline, with good support for emojis
  Has a dmenu and rofi integration
  -> wasm: https://arp242.github.io/uni-wasm/

  - uni i/identify  🏊€
         cpoint  dec    utf-8       html       name
    '🏊' U+1F3CA 127946 f0 9f 8f 8a &#x1f3ca;  SWIMMER (Other_Symbol)
    '€'  U+20AC  8364   e2 82 ac    &euro;     EURO SIGN (Currency_Symbol)
  - uni s/search swim
  - uni p/print U+2042; uni print 2042..2044 #range
    uni p Po; #accept a category: https://www.compart.com/en/unicode/category
    uni p arrows #or a block: https://en.wikipedia.org/wiki/Unicode_block
  - $ uni e/emojy cry
    😢 crying face         Smileys & Emotion  face-concerned
    😭 loudly crying face  Smileys & Emotion  face-concerned
    $ uni e -groups cat-face #search group (can match the Smileys & Emotion or face-concerned classification from above)
    😺 grinning cat                    Smileys & Emotion  cat-face
    😸 grinning cat with smiling eyes  Smileys & Emotion  cat-face
    $ uni e -groups cat-face tears
    😹 cat with tears of joy  Smileys & Emotion  cat-face
    $ uni e -tone dark -groups hands #skin tone modifiers: light, mediumlight, medium, mediumdark, dark
    $ uni e -gender man -groups person-gesture # The default is to display all genders ("person", "man", "woman")
    $ uni e -tone light,dark -gender f,m shrug # can pass a list of tones
    and genders; use all to select all, eg uni e -tone all -gender f,m shrug

- https://github.com/mrowa44/emojify (shell)
  emojify substitutes emoji aliases that many services (like GitHub) use for emoji raw characters.
  $ emojify "Hey, I just :raising_hand: you, and this is :scream: , but here's my :calling: , so :telephone_receiver: me, maybe?"

Modern cli
==========

- https://lib.rs/command-line-utilities
- https://darrenburns.net/posts/tools/
- https://www.linuxjournal.com/content/without-gui-how-live-entirely-terminal
    Lynx ELinks w3m
    Mutt Email Client;Notmuch—Just an email system; Alpine
    Finch (pidgin text version)
    WordGrinder; sc, Spreadsheet Calculator; tpp, Text Presentation Program
    Midnight Commander
    cmus
    GNU Screen, tmux, Byobu [configuration wrapper for screen/tmux]
+ vim like utilities https://github.com/Badacadabra/Vimpressionist
  (ie tools with vimlike bindings)
  calcurse (=calendar), cmus (music player), feh, i3, mutt, newsbeuter (rss/atom), termite, tig, vifm, vim, w3m, weechat, zathura

+ In arch: rg bat fd ncdu exa/lsd(=ls) tokei prettyping

Other:
- bfs https://github.com/tavianator/bfs, A breadth-first version of the UNIX find command
- ascii recording: asciinema & svg-term

* Other cat alternative like bat:
https://github.com/jingweno/ccat

* Other ls alternative like exa
  - https://github.com/athityakumar/colorls (ruby)
  + https://github.com/Peltoche/lsd
    lsdeluxe: inspired by lscolor but in rust
  - https://github.com/trapd00r/ls--
  - https://github.com/dborzov/lsp

* Blog and utils from the author of rg:
- https://blog.burntsushi.net/ripgrep/
- https://blog.burntsushi.net/transducers/
  => https://github.com/BurntSushi/fst
- https://github.com/BurntSushi/tabwriter
  Elastic tabstops for Rust.
- https://github.com/BurntSushi/xsv
  A fast CSV command line toolkit written in Rust.

Rust cli
========

* ripgrep, fd-find, bat, tokei, hyperfine, exa, lsd, skim [=fzf in rust]
  [TODO: configure exa, lsd, skim, bat. ]

- Note: skim has interactive commands, eg `sk --ansi -i -c 'rg --color=always --line-number "{}"'`.
  See also the aliases in https://github.com/mitsuhiko/dotfiles/blob/3c4b18c2190d94655ea64df7bc1d3d45b6abba6e/sh/myprofile#L127-L133

+ uutils: a rewrite of coreutils in rust https://github.com/uutils/coreutils

Legend: [+ installed in rust-cli-utils; ! to install or to configure
         - potentially interesting; x there are better packages]

## Informations

+ hyperfine (like bench but in rust) https://github.com/sharkdp/hyperfine
  [- bench (benchmarking) https://github.com/Gabriel439/bench]
  => hyperfine -w3 'fd . ~/mine'

+ https://lib.rs/crates/bingrep Cross-platform binary parser and colorizer 
  => bingrep /bin/ls

! https://lib.rs/crates/procs A modern replacement for ps

+ https://lib.rs/crates/strace-analyzer analyze strace output
  => strace -s 0 -ff -o cmd.strace /bin/cat haskell-register.log
     strace-analyzer  cmd.strace.23974
    read 20.7K with 2 ops (128.0K / op) haskell-register.log

+ https://lib.rs/crates/mprober This program aims to collect Linux system information including hostname, kernel version, uptime, RTC time, load average, CPU, memory, network interfaces and block devices. It can be used not only as a normal CLI tool, but also a web application with a front-end webpage and useful HTTP APIs. 
  => mprober cpu / memory / ...
     mprober web

+ battop: battery top https://github.com/svartalf/rust-battop
          (give info on the battery, not on the software consumption)

- https://crates.io/crates/gptman
  A CLI tool for Linux that allows you to copy a partition from one disk to another and more.

+ https://github.com/GuillaumeGomez/process-viewer
  A process viewer GUI in rust

+ https://github.com/kpcyrd/sniffglue [arch: sniffglue]
  Secure multithreaded packet sniffer

! https://github.com/imsnif/bandwhich
  Terminal bandwidth utilization tool (formerly known as "what")

## Disk

x https://lib.rs/crates/tin-summer Command-line tool to find build artifacts and thing occupying space on your computer. Shatters records not glass. 
  (Note: default depth is 2; Use file length)
  => sn fat/f #biggest directories
  => sn directories/dir/d/all / sn files/l # show dirs / dirs+files [sn files/l = sn d -f]
  => sn parallel/p # like all but in parallel
  => sn sort/o #sort biggest dirs
  => sn artifacts/ar/r / sn clean/c # show artifacts / clean them

x https://lib.rs/crates/diskus A minimal, fast alternative to ‘du -sh’ 
  Use file length.
  $ hyperfine 'sn d -d0' 'diskus' 'du -sh .'
    'diskus' ran
    1.23 ± 0.19 times faster than 'sn d -d0'
    1.52 ± 0.23 times faster than 'du -sh .'
  Note: 'sn p -d0' ran 1.30 ± 0.18 times faster than 'diskus'

+ dua-cli https://github.com/Byron/dua-cli
  => dua. [warning: I had a dua alias, so call with \dua or =dua. Now renamed to the alias to duh]
     Default to 'aggregate' subcmd. Sort.
     Also has an interactive mode: `dua i`
     Show file length
     Follow symlinks :-(. No --depth
     Faster than sn p
      'dua Music' ran
          1.24 ± 0.05 times faster than 'ds Music/'
          1.36 ± 0.09 times faster than 'sn p Music'
     Promising (compared to sn) if ui is improved

+ dirstat-rs https://crates.io/crates/dirstat-rs
  => ds. Tree like
     Default depth 1. Show size+%
     Use file length. Can use block length with `-a`
     -d: depth (default 1), -m: min percent (default 0.1)
     └── 100.00% [98.33 MB] ── mine
        ├── 31.77% [31.24 MB] ── .git
        ├── 17.58% [17.28 MB] ── doc

+ https://github.com/bootandy/dust
  tree like view of `du -hd1  | sort -h`
  => dust
     No default depth (`-d ...`) but limit to `-n 20` lines by default. But cannot combine both, and don't have min_percent.
     Show block length. Can use file length with `-s`.
     Slow: 'ds' ran 5.93 ± 0.05 times faster than 'dust'
     But usefull to quickly know which subfiles/dirs contribute to the top dirs
     139M ─┬ .
      48M  ├─┬ .git
      35M  │ ├─┬ objects
      16M  │ │ └─┬ pack
      14M  │ │   └── pack-3ae252b9ebbdde88ed2b63ed25bb136654aba8c0.pack
      11M  │ └─┬ subtree-cache
      11M  │   └─┬ 31949
     8.6M  │     └── notree
      19M  ├─┬ ruby

  Comparison: file size of ~/mine/.git
  sn p -d0, diskus: 29MB [Note: dua -f MiB => 29.79MiB]
  dua, ds: 31.24MB
  dust -s: 30M

+ https://ownyourbits.com/2018/03/25/analyze-disk-usage-with-dutree/

- https://gitlab.com/Dzejkop1/spruce
  yet another du

## Files

+ https://lib.rs/crates/xcp xcp is a (partial) clone of the Unix cp command with some more user-friendly feedback and some optimisations 
  => xcp foo bar

+ https://lib.rs/crates/rm-improved rip: a safe and ergonomic alternative to rm 
  => rip file/dir
     rip -s #see graveyed files

! broot(=interactive tree)
  Voir aussi https://github.com/jarun/nnn

! https://lib.rs/crates/lolcate-rs A comically fast way of indexing and querying your filesystem. Replaces locate / mlocate / updatedb. 
  Bug: skip symlinks does not work

+ https://lib.rs/crates/tree-rs tree-rs is a cross platform reimplementation of the linux tree command. It supports colored output and specifying the number of directory levels it should search 
  $ hyperfine -w3 'tree' 'tree-rs'
    'tree-rs' ran
    1.35 ± 0.05 times faster than 'tree'

+ https://lib.rs/crates/dupe-krill A fast file deduplicator. Replaces duplicate files with identical content with hardlinks. 
  => dupe-krill -d . #dry-run

+ https://lib.rs/crates/xcompress XCompress is a free file archiver utility on Linux, providing multi-format archiving to and extracting from ZIP, Z, GZIP, BZIP2, LZ, XZ, LZMA, 7ZIP, TAR, RAR and ZSTD 
  => xcompress a foo.wav /root/bar.txt
     xcompress a -o /tmp/out.7z foo.wav
     xcompress x foo.tar.gz /tmp/out_folder

+ https://lib.rs/crates/hunter Fast, lag-free terminal file browser 

- https://github.com/iqlusioninc/sear
  Signed/Encrypted ARchive: always-encrypted tar-like archive tool with optional signature support

## Text:

+ https://github.com/chmln/sd
  sd Intuitive find & replace CLI (sed alternative)

+ https://github.com/TankerHQ/ruplacer
  Find and replace text in source files (so like sd but handle a whole dir)
  => ruplacer foo bar
  See https://github.com/TankerHQ/ruplacer/issues/19 for the comparison with ruplacer

+ https://lib.rs/crates/fastmod Fast partial replacement for codemod (find/replace tool for programmers) 
  Like ruplacer, but ask interactively
  => fastmod foo bar

+ https://github.com/dalance/amber
  => ambs: like rg
  => ambr: like fastmod
  Cf https://github.com/dalance/amber/issues/8
  ambr split a large file into several threads, so is faster than rg or fastmod in this case.

+ tabwriter
  => echo 'foo\tbar\nploum\tplam' | tabwriter

+ xv: https://chrisvest.github.io/xv/
      terminal hex viewer with a text user interface

+ https://github.com/lunaryorn/mdcat
  cat for markdown

- https://github.com/jhspetersson/fselect
  Find files with SQL-like queries

## Data:

+ https://lib.rs/crates/cw Count Words, a fast wc clone 
  $ hyperfine 'cw /tmp/mine.tar.xz' 'wc /tmp/mine.tar.xz'
  'cw /tmp/mine.tar.xz' ran 8.08 ± 0.08 times faster than 'wc /tmp/mine.tar.xz'

+ https://lib.rs/crates/runiq An efficient way to filter duplicate lines from input, à la uniq
  Cf https://whitfin.io/filtering-unique-logs-using-rust/
  => runiq -f digest/bloom/naive/sorted

+ https://lib.rs/crates/jql A JSON query language CLI tool
  => jql '"some"."property"' example.json

+ xsv a suite of CSV command line utilities.

+ fst
  Construct:
  => fst set /usr/share/dict/french myfst
     fst union myfst1 myfst2 myfst
     fst map input output
  Introspect:
     fst dupes myfst
     fst node myfst nodenumber
     fst csv edges/nodes myfst
     fst dot your-transducer.fst | dot -Tpng > your-transducer.png
     fst rust
   Query:
     fst grep myfst m...on
     fst fuzzy -d2 myfst maison
     fst range -s maison -e matin myfst

## git

git-find, git-global: cf [git-applications]

! https://github.com/mookid/diffr
  An improved diff-highlight script

## Devel:

+ https://github.com/dbrgn/tealdeer
  A very fast implementation of tldr in Rust. https://github.com/tldr-pages/tldr
  With a better colorscheme => tldr in rust

+ https://github.com/WindSoilder/hors
  howdoi in rust
x https://lib.rs/crates/howto-cli instant coding answers via the command line
  [does not compile]

+ https://lib.rs/crates/gig A command line tool to rapidly scaffold projects using the power of YAML
   => gig [-g] <SCAFFOLD_YAML_FILE> <PROJECT>
   SCAFFOLD:
    folder:
      file.ext: "The contents of the file"

+ https://lib.rs/crates/slink Simple remote dev environments over SSH
    - slink current / use foo
    - slink go: SSH to the machine, switching to the mirror of PWD (if it exists).
    - slink run <command>: runs a command on the machine. Automatically allocates a PTY for you to allow interactive commands to work corrrectly.
    - slink forward <ports...>: forward ports from your local machine to the same ports on the remote machine.
    - slink sync up: sync the current directory to the remote machine via rsync, maintaining relative path from $HOME if in $HOME, or from root otherwise.
    - slink sync down: inverse of sync up.
    - slink upload <file>: uploads a file to the remote, in the same relative location from $HOME if in $HOME, or from root otherwise. Also has an optional --to <file> flag, to upload the local file to an arbitrary path on the remote.
    - slink download <file>: inverse of upload. Has an optional --from flag, to download the file from an arbitrary path on the remote.

+ https://github.com/r-darwish/topgrade
  Upgrade everything (see package manager below for more details)

+ https://github.com/starship/starship
  The cross-shell prompt for astronauts. https://starship.rs
  -> starship prompt
  -> starship module git_branch #output of just one module
     starship module --list # aws battery character cmd_duration conda directory dotnet env_var git_branch git_commit git_state git_status golang hg_branch hostname java jobs kubernetes line_break memory_usage nix_shell nodejs package python ruby rust php terraform time username

- https://github.com/artichoke/artichoke
  ruby in rust

- https://github.com/casey/just
  makefile like in rust

## Misc:

+ https://lib.rs/crates/genact A nonsense activity generator 
  => genact / genact -m module1 module2
  Modules: bootlog botnet cargo cc composer cryptomining simcity download memdump mkinitcpio kernel_compile weblog

! https://lib.rs/crates/ttdl TTDL - Terminal ToDo List manager (use the http://todotxt.org/ format)
  x (A) 2011-03-02 2011-03-01 Review Tim's pull request +TodoTxtTouch @github due:2016-02
  Done Priority Completed Created 'Subject +project @context keyword:value'
  => ttdl add/list/done/undone/remove/clean/edit/append/prepend/start/stop/stats/postpone
  Special keywords: 
     due:2019-04-10 rec:1y t:2018-05-01 [=threshold date: ie future todos]
     spent:78 tmr:off [for start/stop]
  Eg:
   (A) A high priority todo due:2019-11-01
   Faire du sport spent:78 tmr:off
  TODO: config file https://github.com/VladimirMarkelov/ttdl/blob/master/ttdl.toml

x https://gitlab.com/DarrienG/terminal-typeracer
  An open source terminal based version of Typeracer written in rust.
  [Not on cargo, cf
  https://www.reddit.com/r/rust/comments/bsuyx8/release_100_terminal_typeracing_game/ so to install: 
  cargo install [--force] --git https://gitlab.com/DarrienG/terminal-typeracer.git]
  => typeracer
  :-( core dumped

## New

Awesome clis
============
- https://github.com/agarrharr/awesome-cli-apps
- https://github.com/alebcay/awesome-shell

Downloads and ssh
-----------------
- https://github.com/timvisee/ffsend
  Easily and securely share files from the command line. A fully featured Firefox Send client
- https://github.com/webtorrent/webtorrent-cli
  WebTorrent, the streaming torrent client. For the command line. https://webtorrent.io
- https://github.com/six-ddc/hss
  An interactive parallel ssh client featuring autocomplete and asynchronous execution.
- https://github.com/Russell91/sshrc
  bring your .bashrc, .vimrc, etc. with you when you ssh

Shell
-----
- https://github.com/kdabir/has
  checks presence of various command line tools and their versions on the path
- https://github.com/LuRsT/hr
  A horizontal straight_ruler for your terminal
+ https://github.com/facebook/PathPicker [facebook]
- https://github.com/nickolasburr/rng
  Stream range of input to stdout.
  rng 5,10:17,22 main.c #Get lines 5-10 and 17-22 in main.c.

Medias
------
- https://github.com/mps-youtube/mps-youtube
  Terminal based YouTube player and downloader
  [In arch we already have: youtube-dl]
- https://github.com/streamlink/streamlink
  fork of livestreamer
- https://github.com/iCHAIT/moviemon
  Everything about your movies within the command line. https://ichait.github.io/moviemon/
- https://github.com/mayankchd/movie
  A CLI for getting information about movies and comparing two movies

+ https://github.com/papis/papis
  Powerful and highly extensible command-line based document and bibliography manager. http://papis.readthedocs.io/en/latest/

Web data from cli
-----------------

- https://github.com/sindresorhus/is-up-cli
  Check whether a website is up or down using the isitup.org API
- https://github.com/miguelmota/cointop
  The fastest and most interactive terminal based UI application for tracking cryptocurrencies https://cointop.sh
- https://github.com/sgentle/caniuse-cmd
  Caniuse command line tool. [In ruby: 'cani use']
- https://github.com/bevacqua/hget
  Render websites in plain text from your terminal https://ponyfoo.com

* Google:
  + https://github.com/jarun/googler
  https://github.com/Astranno/googlr

* Weathers:
  + https://github.com/schachmat/wego
    Utilisé par https://github.com/chubin/wttr.in
    ⛅️ The right way to check the weather http://wttr.in
  - https://github.com/riyadhalnur/weather-cli

* Maps: https://github.com/rastapasta/mapscii

Remote access to localhost
--------------------------

Open a tunnel to a public endpoint:
https://blog.cloudflare.com/a-free-argo-tunnel-for-your-next-project/
https://github.com/localtunnel/localtunnel
https://ngrok.com/
https://serveo.net/

https://seashells.io/ Seashells lets you pipe output from command-line programs to the web in real-time

Divers
------
- https://github.com/akavel/up
  Ultimate Plumber is a tool for writing Linux pipes with instant live preview
- https://github.com/jhspetersson/fselect
  Find files with SQL-like queries
- https://github.com/raine/ramda-cli
  Like ru but via nodejs
- https://github.com/jarun/pdd
  Tiny date, time diff calculator with timers

Markdown
--------
- https://github.com/visit1985/mdp
  A command-line based markdown presentation tool.
- https://github.com/axiros/terminal_markdown_viewer
  Styled Terminal Markdown Viewer

Help
----
! tldr - Simplified and community-driven man pages.
  -> tealdeer [rust]
! howdoi - Instant coding answers via the command line.
  -> howrs [rust]
- how2 - Finds the simplest way to do something on a unix bash command line (Nodejs implementation of howdoi).

Easter Eggs
===========

http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#slide2
- sudo: "Defaults insults" in /etc/sudoers
- apt-get moo, aptitude -vvvvv moo
- pacman: 'ILoveCandy' in /etc/pacman.conf
- repo-elephant [from archlinux's repo-add]
- nmap -oS - google.com
- ddate (discordian date), cowsay (cowsay moo), lolcat (colorize output), sl (steam locomotive), cmatrix (matrix like effect)

Package manager
===============

A list of what topgrade updates: https://github.com/r-darwish/topgrade
- yay / pacman
- etc-update
- pearl
- zplug (zsh), tpm (for tmux)
- rust (rustup+ cargo), ocaml (opam), ruby (rubygem), python (pipx), node (yarn/npm), vim packages, emacs (paradox), atom packages
- nix, flatpak, snap
- fwupd https://github.com/fwupd/fwupd = firmware upgrade
  rpi-update to update Raspberry Pi Firmware
  pihole update
- needrestart: https://github.com/liske/needrestart Restart daemons after library updates. 

## Pearl

+ https://github.com/pearl-core/pearl
Pearl is a lightweight package manager for automating reproducible environments between different systems (Linux and OSX). It can be used for dotfiles, plugins, programs and any form of code accessible via git.

$ wget https://raw.githubusercontent.com/pearl-core/installer/master/install.sh
$ bash install.sh
=> * Downloading Pearl to /home/dams/.local/share/pearl

A pearl package is a git repo with a pearl-config optional directory which
contains 
│   ├── install.sh
│   ├── config.sh
...
- install.sh - contains the hooks functions executed during the install, update and remove events.
- config.sh - will be sourced whenever a new Bash/Zsh shell is starting up.

~~~ install.sh
export PEARL_HOME="$XDG_CONFIG_HOME/pearl" #where the packages are installed
export PEARL_ROOT="$XDG_DATA_HOME/pearl" #the pearl source code

$ git clone --quiet $branch --depth 1  --recurse-submodules \
	'https://github.com/pearl-core/pearl.git' "$PEARL_ROOT"

"$PEARL_ROOT/bin/pearl" init
~~~

~~~ pearl_init
    mkdir -p $PEARL_HOME/bin
    mkdir -p $PEARL_HOME/packages
    mkdir -p $PEARL_HOME/repos
    mkdir -p $PEARL_HOME/tmp
    mkdir -p $PEARL_HOME/var

    [[ -e "$PEARL_HOME/bin/pearl" ]] && rm -f "$PEARL_HOME/bin/pearl"
    ln -s "$PEARL_ROOT/bin/pearl" "$PEARL_HOME/bin"

    [[ -e "$PEARL_HOME/pearl.conf" ]] || cp "$PEARL_ROOT/etc/pearl.conf.template" "$PEARL_HOME/pearl.conf"

    apply "source ${PEARL_ROOT}/boot/sh/pearl.sh" ${HOME}/.bashrc #apply change some escape characters and whitespace, grr!
    apply "export PEARL_ROOT=${PEARL_ROOT}" ${HOME}/.bashrc
    bold_cyan; echo -n "* "; normal; echo "Activated Pearl for Bash"
~~~
=> Annoyingly this rewrite (badly) my config files
So the best to use it is to simply clone it, create the dirs, symlink the
bin and the conf file, rather than call `pearl init`

* Files changed:
- vimrc: source /home/dams/.local/share/pearl/boot/vim/pearl.vim
- bashrc: export PEARL_ROOT=/home/dams/.local/share/pearl; source /home/dams/.local/share/pearl/boot/sh/pearl.sh
- zshrc: export PEARL_ROOT=/home/dams/.local/share/pearl; source /home/dams/.local/share/pearl/boot/sh/pearl.sh
- emacs: (load-file "/home/dams/.local/share/pearl/boot/emacs/pearl.el")
- config.fish: set -x PEARL_ROOT /home/dams/.local/share/pearl; source /home/dams/.local/share/pearl/boot/fish/pearl.fish

~~~ boot/sh/pearl.sh
  export PEARL_HOME=${HOME}/.config/pearl
  if [[ $PATH != *"${PEARL_HOME}/bin"* ]]
  then
      PATH=$PATH:${PEARL_HOME}/bin
  fi
  if [[ $MANPATH != *"${PEARL_ROOT}/man"* ]]
  then
      MANPATH=$MANPATH:${PEARL_ROOT}/man
  fi
+ for each package in $PEARL_HOME/packages/reponame/pkgname it source pearl-config/config.{sh,bash,zsh} (Note: pearl.vim source pearl-config/config.vim)
~~~

During the source, the following variables are available:
            PEARL_PKGDIR=${PEARL_HOME}/packages/${reponame}/${pkgname}
            PEARL_PKGVARDIR=${PEARL_HOME}/var/${reponame}/${pkgname}
            PEARL_PKGNAME=${pkgname}
            PEARL_PKGREPONAME=${reponame}

+ buava https://github.com/fsquillace/buava 'The utility library for Bash you always dreamed of' commands are available
and https://github.com/fsquillace/buava/blob/master/lib/utils.sh
has 'install_git_repo'

* Commands
PEARL_ROOT="$HOME/.local/share/pearl" $PEARL_ROOT/bin/pearl list
$ pearl list
$ pearl search vim
$ pearl update [pkg]
$ pearl remove [pkg]
$ pearl emerge [pkg] # Emerge is an idempotent command for either installing or updating a package

Games
=====

- Worms armaggeddon et world party
- Blobby volley
- Icy towers
