vim: ft=markdownlight fdm=expr

pacman
=====
--ask: https://git.archlinux.org/pacman.git/commit/?id=90e3e026d1236ad89c142b427d7eeb842bbb7ff4
=> --ask 4 : only conflict question is inversed
 PM_TRANS_CONV_INSTALL_IGNOREPKG = 0x01, PM_TRANS_CONV_REPLACE_PKG = 0x02, PM_TRANS_CONV_CONFLICT_PKG = 0x04, PM_TRANS_CONV_CORRUPTED_PKG = 0x08, PM_TRANS_CONV_LOCAL_NEWER = 0x10, PM_TRANS_CONV_REMOVE_PKGS = 0x20;
 for each conv matched, the default answer is inversed. 
--ask 0 : all default answers are preserved 
--ask 4 : only conflict question is inversed 
--ask 63 : all questions are inversed (63 == 1+2+4+8+16+32) 

Install/Remove
--------------

pacman -Syu
pacman -S --needed $CORE

eg Lighter texlive-most: sudo pacman -Rcs texlive-fontsextra texlive-pstricks

Query
-----

pacman -Qdt #orphans packages
  (-d: dependency packages, -t: unrequired packages)
sudo pacman -Rcs $(pacman -Qdtq)
  (-Qq: output for script; see also -Rn to not create .pacsave, or -Rcu to remove groups, and -Qtt to only filter real unrequired packages but keep optional dependencies in the list)

-Qm #foreigns packages
-Qn #natives packages
-Qe #explicitely installed packages
-Qg group #list packages part of group
-Qu: out of date packages

-Qo file: print the package owning a file
-Ql package: list files in package
-Qc package: show changelog
[for a local package, use -Q?p package.tar.xz]

-Qu: show upgrades (after a -Sy)
 Better: checkupdates

Exemples:
- pacman -Sl repo: list packages in repo [script: `pacman -Slq core`;
  `paclist core` to have versions; or to have the output in the form
  core/pkg: `pacsift --repo=core`. Note that `pacsift` will list all
  packages including the local one.]
- pacman -Sddp --print-format '%n %v' openssh: list name+version in the sync db
  expac -S '%n %v' openssh [expac has more formatting abilities]
- expac '%n %v' openssh [=-Q: look in local db; use -S to look in sync db]
  expac '%n %v' -p /var/cache/pacman/pkg/openssh-7.7p1-1-x86_64.pkg.tar.xz
  (reads directly the metadata from a package)
- `pacinfo pacman` is like `pacman -Si pacman` + `pacman -Qi pacman` but
  more suited for parsing
  -Si: `pacinfo core/pacman`, -Qi: `pacinfo local/pacman`

Note:
- `pacman -Qu` will show available updates in testing since I have
  Usage = Sync Search
- to only get package that will really update, use
  pacman -Sddpu --print-format '%n %v'

Note: parsing a db file is complicated, one needs to call
  pacsift --dbpath /tmp/pacsift --dbext '.db.tar.xz'
where the foo.db.tar.xz is in /tmp/pacsift/sync
+ there needs to be a [foo] repo in pacman.conf

Remove
------

pacman -p -Rc ploum #packages dépendant du package ploum
 #see also pactree ploum
pacman -p -Rs ploum #packages dont uniquement ploum dépend et qui ne sont pas installés explicitement (un autre s relaxe cette condition)
  #see also pactree -r ploum
pacman -p -Ru ploum plim #enlève ploum s'il n'est pas requis par un autre package
ex: pacman -p -Ru group #pour enlever les packets dont on ne se sert pas d'un groupe
    (pacman -Rc risque de tout enlever)
-Rn: don't save config files in .pacsave

Database
--------

pacman -D --asdeps ploum
pacman -D --asexplicit ploum  #dire si c'est une dep ou une version explicitement installée

https://wiki.archlinux.org/index.php/Pacman_tips#Backing_up_and_retrieving_a_list_of_installed_packages
paclog-pkglist: list packages installed from reading pacman.log

Files
-----

pacman -Fy; pacman -Fl package; pacman -Fo file; pacman -Fs search-term
(the difference with -Q is that -F looks at the package database, not at
the locally installed packages.
-F uses /var/lib/pacman/sync/*.files database)

=> pacman -Fys paccache

Note that 'pkgfile file' and 'pkgfile -l package' do the same things as
pacman -F but more efficiently. [However the cache at /var/cache/pkgfile is
much bigger than the one from pacman, since it is unarchived]

Options
-------

-d: skips dependency checks
-dd: don't add dependancy packages when installing a package
--noprogressbar: do not show progress bar
--noscriptlet: do not use install scriptlet
-p: only print targets, don't do operation

Sync:
-yy forces package list refresh even if it's up-to-date.
-uu Upgrades packages and also downgrades some if repository has older version. 

Signature
---------

SigLevel=Never/Optional [default]/Required  TrustedOnly [default]/TrustAll
  Optional: check only if the signature exist
  TrustedOnly: only fully trusted keys are valid
  TrustAll: all keys in the keyring are valid (even marginal or unknown trust)
One can add Database or Package in front of the option so that this option
only affect this group. Ex: SigLevel = Required DatabaseOptional

Hooks
=====

http://allanmcrae.com/2016/01/pacman-5-0-released/
man alpm-hooks
ls /usr/share/libalpm/hooks

- update-desktop-database
  Target = usr/share/applications/*.desktop -> Exec = /usr/bin/update-desktop-database --quiet
- update-mime-database
  Target = usr/share/mime/packages/*.xml -> Exec = /usr/bin/update-mime-database /usr/share/mime
- install-info
  Target = usr/share/info/* -> Exec = /bin/sh -c 'while read -r f; do install-info --delete "$f" /usr/share/info/dir 2> /dev/null; done'
- gtk-update-icon-cache/xdg-icon-resource
  Target = usr/share/icons/*/ -> Exec = /usr/lib/pacman-hooks/gtk-update-icon-cache
  while read -r f; do
      #this is what is called by "xdg-icon-resource forceupdate"
      gtk-update-icon-cache -q "$f"
  done

Examples:
- https://github.com/saber-nyan/kernel-modules-hook
  Keeps your Arch Linux fully functional after a kernel upgrade

Signatures
==========

pacman-key foo => 
    GPG_PACMAN=(gpg --homedir "${PACMAN_KEYRING_DIR}" --no-permission-warning)
    if [[ -n ${KEYSERVER} ]]; then
    	GPG_PACMAN+=(--keyserver "${KEYSERVER}")
    fi

- pacman-key --init
  create the keyrings, a secret key if none are available, a gpg.conf and --check-trustdb
- pacman-key --populate archlinux
  - import the specified keys in /usr/share/pacman/keyrings/${keyrings}.gpg
  - read ${keyring}-trusted. This file is --import-ownertrust and the trusted keys inside are lsigned
  - read also ${keyring}-revoked to revoke keys
  Note: when no arguments is passed to --populate, process all keyrings
  (+ update-trustdb)
- pacman-key --refresh-keys => gpg --refresh-keys
- pacman-key --updatedb => gpg --check-trusdb [automatically called by
  other pacman-key functions, like --populate, --init, --add...]

If pacman needs some more keys, several ways around that:
- Try updating archlinux-keyring
- sudo pacman-key --refresh-keys
- sudo pacman-key --populate archlinux
  sudo pacman-key --populate #get all keyrings
- Sign locally a missing key:
  sudo pacman-key --recv-keys 753E0F1F
  sudo pacman-key --lsign-key 753E0F1F;
(the key is an exemple of a key of an arch developer that was updated and
needed to be reuploaded)

Keyring
-------
* If needed, rebuilding the keyring:
sudo pacman -Syu haveged
sudo systemctl start haveged

sudo rm -fr /etc/pacman.d/gnupg
sudo pacman-key --init && sudo pacman-key --populate archlinux

Importing key
-------------
- Import
$ pacman-key -r keyid
$ pacman-key --add /path/to/downloaded/keyfile
- Check fingerprint
$ pacman-key -f keyid
- Sign
$ pacman-key --lsign-key keyid

Custom keyring
--------------
cf ~syst/keyrings
- archlinux-init: the result of a pacman-key --init
  (but in fact I have cheated to get a ed25519 key!
   gpg --homedir=/tmp/archlinux --full-gen-key --expert)
- archlinux: the result of a pacman-key --populate on archlinux-init ->
  cp -a archlinux-init archlinux
  fakeroot pacman-key --gpgdir=$HOME/mine/syst/keyrings/archlinux --init
  fakeroot pacman-key --gpgdir=$HOME/mine/syst/keyrings/archlinux --populate archlinux
  fakeroot pacman-key --gpgdir=$HOME/mine/syst/keyrings/archlinux --refresh-keys
Warning: we only populate with 'archlinux' rather than all the keyrings,
because archlinux_dams contains my public key, and then gpg complains that
it is duplicate

Tools
=====

Bundled binaries
----------------
- makepkg, pacman, pacman-key
- cleanupdelta: cleanupdelta [-b <pacman db>] core extra ... : Returns a list of unused delta in a given sync database
- pacman-db-upgrade: upgrade the local pacman db to a newer format
- pacman-optimize: relocate files in pacman db to a continuous location to improve database performance
- pactree: produces a dependency tree for a package
  Ex: pactree linux
- pacsort: sort files according to their version numbers
- vercmp: compares two version numbers
- pkgdelta: package delta generation utility (only generates the delta between two packages)
  Ex: pkgdelta package1 package2
- repo-add, repo-remove@: used to help build a package database for packages built with makepkg
- repo-elephant@: shows an elephant (two ascii arts at random)
- testdb: test pacman database
  Removed: https://lists.archlinux.org/pipermail/pacman-dev/2014-December/019720.html
  The functionality of testdb is now available in pacman. pacman -Dk will
check the local database for consistency, and pacman -Dkk will check the
sync databases.
- testpkg: test a pacman package .pkg
  Ex: sudo testpkg /var/cache/pacman/pkg/xz-5.2.1-1-x86_64.pkg.tar.xz

Other tools
-----------

* aur
- cower: search the aur [obsolete]
  Replacement: auracle
- package-query (like cower, used by yaourt)
- pacaur: aur helper
- other aur helpers: aurman, aurutils, yay, trizen
  cf https://wiki.archlinux.org/index.php/AUR_helpers#Comparison_table
- repository managers: repoctl, repose
- powerpill, pacserve: multiple downloads resp local cache to speed up dl
- publish: aurpublish, aur publisher (https://gitlab.com/es20490446e/aur-publisher)

* pacman-contrib (which was split from pacman)
- /usr/bin/bacman: rebuild a package from the files in the system
  Ex: bacman xz
  Option: --pacnew: include the pacnew file rather than the original config file
- checkupdates
- /usr/bin/pacsearch: syntax coloring to pacman -Ss
    [seems to be called by default now by pacman -Ss]
- /usr/bin/paclist: list packages from a repo (works by filtering pacman -Sl)
    Ex: paclist core
- /usr/bin/pacdiff: look for *.pac* and merge
- /usr/bin/paclog-pkglist: list the packages installed from pacman.log
- /usr/bin/pacscripts: list the post/pre-install/remove scripts of a package
    Ex: pacscripts linux
- /usr/bin/paccache: fine control on cache management
    Ex: paccache -vd; paccache -vvv --dryrun
- pacsearch, pacsort, rankmirrors, updpkgsums

* official
- asp: https://github.com/falconindy/asp
  Arch Build Source Management Tool
  asp is a tool to manage the build source files used to create Arch Linux packages. It attempts to replace the abs tool, offering more up to date sources (via the svntogit repositories)
  - export ASPROOT=/tmp/asp #stores packages as branches in $ASPROOT/.git (Default to ~/.cache/asp)
  - asp update packages #get packages infos (used automatically by the other commands if the package is not already tracked). 
  - asp difflog/log/shortlog packages #get log of packages
  - asp checkout packages #get the git repo of package
  - asp export packages #just get the sources
  - asp show pkg #get PKGBUILD
- reflector: retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed
  [-l/--latest n] n most recently sync servers
  [-c/--country] filter by country
  [-f/--fastest n] filter the n fastest mirrors
  [-p/--protocol] filter by protocol available
  $ reflector --verbose -l 5 --sort rate #the 5 last sync servers ranked by speed
  $ reflector --verbose -p rsync -l 5 --sort rate #rsync servers for powerpill
  (bad idea to sort by the last sync servers since it will select servers
  closers to the arch main mirror)
- pkgfile: given a file return the package containing this file
    [unlike pacman -Qo uses a cache to speed up the process; can also list
    the files of a non installed package]
- expac: alpm data extraction utility (format packages info in the local
  database)
- namcap: Namcap is a tool to check binary packages and source PKGBUILDs for common packaging mistakes, which can also be automatically enabled.
- aurpublish [push a subtree to the aur]

* pacutils
- install and remove: pactrans/pacinstall/pacremove, pacsync
- query config: pacconf (query pacman's configuration file), pacini, paccapability
- infos: pacfile, pacinfo, paclog, pacreport, pacsift
- check and repair: paccheck, pacrepairdb, pacrepairfile

* pacman-contrib (which was split from pacman)
- /usr/bin/bacman: rebuild a package from the files in the system
  Ex: bacman xz
  Option: --pacnew: include the pacnew file rather than the original config file
- checkupdates
- /usr/bin/pacsearch: syntax coloring to pacman -Ss
    [seems to be called by default now by pacman -Ss]
- /usr/bin/paclist: list packages from a repo
    Ex: paclist core
- /usr/bin/pacdiff: look for *.pac* and merge
- /usr/bin/paclog-pkglist: list the packages installed from pacman.log
- /usr/bin/pacscripts: list the post/pre-install/remove scripts of a package
    Ex: pacscripts linux
- /usr/bin/paccache: fine control on cache management
    Ex: paccache -vd; paccache -vvv --dryrun
- pacsearch, pacsort, rankmirrors, updpkgsums

* ~/script/pacman/
- ~syst/config/{00stat_pacnem,01diff_pacnew,02diff-gen-pacnew}: pour voir s'il y a des nouveaux .pacnew
- aur: build an aur package
- pacgrep: pacgrep 'pattern' packages to took for a patter in the files of packages
- pacgroups: A simple script that informs the user of pacman groups that are
partially installed or upgraded.
- pacman_optdep: list optional dependencies of installed packages
- pacsrc: get all sources url for an Arch package
    (parse the source array of the pkgbuild)
- pacverify: verify all pacman packages against installed files (by checking if the sha256sum is the same)
    Ex: pacverify xz
- pacman_log_clean: output a cleanup up version of pacman log
    Ex: ./pacman_log_clean 1

* Xyne's scripts
http://xyne.archlinux.ca/projects/#arch-linux
http://xyne.archlinux.ca/projects/#aur
http://xyne.archlinux.ca/projects/#pacman

Installed via aur:
[x] http://xyne.archlinux.ca/projects/powerpill/: download packages in parallel

Installed in ~/usr/dist/@arch/xyne:
(To get the latest version: pacaur -m pkg_scripts pacnew_scripts)
-> http://xyne.archlinux.ca/projects/pkg_scripts/: A collection of pacman and package-related utilities.
-> http://xyne.archlinux.ca/projects/pacnew_scripts/: A collection of scripts to help merge changes in .pacnew files.

Installed in ~/script/pacman
[x] http://xyne.archlinux.ca/scripts/pacman/: pacman related scripts
-> pacman_log_clean

Interesting:
-> http://xyne.archlinux.ca/projects/pacserve/: Easily share Pacman packages between computers. A replacement for PkgD.
-> http://xyne.archlinux.ca/projects/pm2ml/: Generate metalinks for downloading Pacman packages and databases.
-> http://xyne.archlinux.ca/scripts/pacman/repkg to easily repackage for metadata change
-> http://xyne.archlinux.ca/projects/pbget/: dl pkgbuilds

Repos and mirrors
=================

Repos
-----

https://wiki.archlinux.org/index.php/Unofficial_user_repositories

[archlinuxfr]
Server = http://repo.archlinux.fr/$arch
SigLevel = Optional TrustAll

Ex: 
- repo-ck
https://wiki.archlinux.org/index.php/repo-ck
    Maintainer: graysky
    Description: Kernel and modules with Brain Fuck Scheduler and all the goodies in the ck1 patch set.
    Upstream page: repo-ck.com
    Wiki: repo-ck
    Key-ID: 5EE46C4C (see above pacman-key to sign it)

[repo-ck]
Server = http://repo-ck.com/$arch

- https://wiki.archlinux.org/index.php/Unofficial_user_repositories#chaotic-aur

Mirror List
-----------

All:
https://www.archlinux.org/mirrorlist/all/
curl -o ~etc/pacman.d/mirrorlist.all https://www.archlinux.org/mirrorlist/all/

All With Score:
https://www.archlinux.org/mirrorlist/?country=all&protocol=http&ip_version=4&use_mirror_status=on

Country Specific:
https://www.archlinux.org/mirrorlist/?country=FR&protocol=http&ip_version=4&use_mirror_status=on

Ex:
COUNTRY='FR'
URL="https://www.archlinux.org/mirrorlist/?country=${COUNTRY}&protocol=http&ip_version=4&use_mirror_status=on"
if /usr/bin/curl --silent --fail --output mirrorlist "${URL}"; then
  /usr/bin/sed -i 's/#Server/Server/g' mirrorlist
fi

Rather than doing it manually, one can also use reflector:
https://wiki.archlinux.org/index.php/Reflector


Structure
=========

 #RootDir     = /
 #DBPath      = /var/lib/pacman/ #DB
 #CacheDir    = /var/cache/pacman/pkg/ #Packages cache
 #LogFile     = /var/log/pacman.log
 #GPGDir      = /etc/pacman.d/gnupg/

Db files
--------

- /var/lib/pacman/sync: [location of the dbs]
community.db  core.db  extra.db  multilib.db

  This is a tar.gz archive of the files package-version/desc
  Note that it contains the pgp signature

  %FILENAME%
  xz-5.2.4-1-x86_64.pkg.tar.xz
  %NAME%
  xz
  %VERSION%
  5.2.4-1
  %DESC%
  Library and command line tools for XZ and LZMA compressed files
  %CSIZE%
  236700
  %ISIZE%
  775168
  %MD5SUM%
  7eea2d921fc272dff9c897f9d194027a
  %SHA256SUM%
  e4b78b19bc181deec39d832bae012bf7a8bece66933088e29102c1ab446f81d1
  %PGPSIG%
  ...
  %URL%
  https://tukaani.org/xz/
  %LICENSE%
  GPL
  LGPL
  custom
  %ARCH%
  x86_64
  %BUILDDATE%
  1525058334
  %PACKAGER%
  Pierre Schmitz <pierre@archlinux.de>
  %DEPENDS%
  sh

Exemple: check inline signature
echo $pgpsig | base64 -d | gpg  --enable-special-filenames --verify - pacaur-4.7.90-1-any.pkg.tar.xz

Local database
--------------

/var/lib/pacman/local/xz-5.2.1-1 [local db]
desc  files  mtree
desc [-> similar to PKGINFO]:
    %NAME%
    xz
    %VERSION%
    5.2.1-1
    %DESC%
    Library and command line tools for XZ and LZMA compressed files
    %URL%
    http://tukaani.org/xz/
    %ARCH%
    x86_64
    %BUILDDATE%
    1424972573
    %INSTALLDATE%
    1425311033
    %PACKAGER%
    Pierre Schmitz <pierre@archlinux.de>
    %SIZE%
    769024
    %REASON%
    1
    %LICENSE%
    GPL
    LGPL
    custom
    %VALIDATION%
    pgp
    %DEPENDS%
    sh

files
    %FILES%
    usr/
    usr/bin/
    ...

mtree (binary), install: directly copied from the .pkg

Package archive
---------------

https://wiki.archlinux.org/index.php/Creating_packages
A .pkg is an archive of
-  The binary files to install.
- .PKGINFO: contains all the metadata needed by pacman to deal with packages, dependencies, etc.
- .MTREE: contains hashes and timestamps of the files, which are included in the local database so that pacman can verify the integrity of the package.
- .INSTALL: an optional file used to execute commands after the install/upgrade/remove stage. (This file is present only if specified in the PKGBUILD.)
- .Changelog: an optional file kept by the package maintainer documenting the changes of the package. (It is not present in all packages.)

.PKGINFO:
  # Generated by makepkg 4.2.1
  # using fakeroot version 1.20.2
  # Thu Feb 26 17:42:53 UTC 2015
  pkgname = xz
  pkgver = 5.2.1-1
  pkgdesc = Library and command line tools for XZ and LZMA compressed files
  url = http://tukaani.org/xz/
  builddate = 1424972573
  packager = Pierre Schmitz <pierre@archlinux.de>
  size = 769024
  arch = x86_64
  license = GPL
  license = LGPL
  license = custom
  depend = sh

Note: .PKGINFO used to containe makepkgopts:
  makepkgopt = strip
  makepkgopt = docs
  makepkgopt = !libtool
  makepkgopt = !staticlibs
  makepkgopt = emptydirs
  makepkgopt = zipman
  makepkgopt = purge
  makepkgopt = !upx
  makepkgopt = !debug
but they are now in .BUILDINFO:
  builddir = /build
  pkgbuild_sha256sum = 2bed847fe8350eee987d7de2b0c0b01d67387c3ace10aed815bdbbe7dffd3310
  buildenv = !distcc
  buildenv = color
  buildenv = !ccache
  buildenv = check
  buildenv = !sign
  options = strip
  options = docs
  options = !libtool
  options = !staticlibs
  options = emptydirs
  options = zipman
  options = purge
  options = !optipng
  options = !upx
  options = !debug
  installed = acl-2.2.52-4
  installed = archlinux-keyring-20180404-1
  ...

.MTREE is the gzip of a mtree archive (man mtree):
  #mtree
  /set type=file uid=0 gid=0 mode=644
  ./.BUILDINFO time=1535014142.0 size=77918 md5digest=62e78a97a9501c5761be78f10c57c01e sha256digest=4ff255f96a00554efbc15c5a0483c42db51dabc2c7616e5380a27e703e5dc2a0
  ./.PKGINFO time=1535014142.0 size=404 md5digest=2ae4a829cd8ac4d0109c422c1c7e2085 sha256digest=375e2d9f3bab3a402c52e6b42abb8c1060f089b19c6435663200db138c0f490f
  ./etc time=1535014142.0 mode=755 type=dir
  ./etc/xdg time=1535014142.0 mode=755 type=dir
  ./etc/xdg/pacaur time=1535014142.0 mode=755 type=dir

to recreate:
tar -cf .MTREE --format=mtree --options='!all,type,time,size,uid,gid,md5digest,sha256digest' dir
The real command line in makepkg is:
  list_package_files | LANG=C bsdtar -cnf - --format=mtree \
  	--options='!all,use-set,type,uid,gid,mode,time,size,md5,sha256,link' \
  	--null --files-from - --exclude .MTREE | gzip -c -f -n > .MTREE
where
  list_package_files() {
  	(find . -path './.*' \! -name '.'; find . \! -path './.*' \! -name '.' | LC_ALL=C sort) |
  	sed -e 's|^\./||' | tr '\n' '\0'
  }
cf ~/script/archlinux/make_mtree

Src info
--------

AUR: to updload a package to aur, one needs to generate the .SRCINFO, using
mksrcinfo from pkgbuild-instrospection or simply 'makepkg --printsrcinfo > .SRCINFO'
See: https://github.com/falconindy/pkgbuild-introspection
     https://wiki.archlinux.org/index.php/Arch_User_Repository#AUR_metadata

makepkg --printsrcinfo
  pkgbase = xz
  	pkgdesc = Library and command line tools for XZ and LZMA compressed files
  	pkgver = 5.2.4
  	pkgrel = 1
  	url = https://tukaani.org/xz/
  	arch = x86_64
  	license = GPL
  	license = LGPL
  	license = custom
  	depends = sh
  	source = https://tukaani.org/xz/xz-5.2.4.tar.gz
  	source = https://tukaani.org/xz/xz-5.2.4.tar.gz.sig
  	validpgpkeys = 3690C240CE51B4670D30AD1C38EE757D69184620
  	md5sums = 5ace3264bdd00c65eeec2891346f65e6
  	md5sums = SKIP

  pkgname = xz

Aur Helpers
===========

- cower: search the aur [obsolete]
  Replacement: auracle
  Check update: cower -u / auracle sync
  Resolve deps: auracle buildorder
  Search, infos: auracle search ..., auracle info ...
  Download: cower -d, auracle download [--recurse]
- package-query (like cower, used by yaourt)
- Fully featured: aurman, aurutils, yay, trizen, pikaur
  [pacaur: obsolete]
  cf https://wiki.archlinux.org/index.php/AUR_helpers#Comparison_table
  aurman => aurmansolver is a nice solver
  aurutils => local repo
  yay => nice 'pacaur' like interface

pacaur
------

pacaur -k #check for updates => cower -u
pacaur -u #update
pacaur -u --devel #upgrade aur packages, --devel is here to also upgrade the *git packages
pacaur -y pkg #install
pacaur -d => cower -d: download target (pkgbuild)
pacaur -m => pacman -Sw: downloadonly

yay
---

yay --repo, yay -a/--aur
yay pkg #search package and propose to install
yay -S pkg; yay -Ss pkg
yay -G #get pkgbuild
yay -Pw #print arch news
yay -Ps # print stats
[ yay -Pu # print updates (deprecated, use yay -Qu instead) ]
yay --gendb # regenerate the clones of all foreign packages [when migrating from another aur helper]
yay -Yc[c] # clean uneeded dependencies (essentially does 'pacman -Rcs $(pacman -Qdt[t])')

aurutils
--------

See all aur packages: aur pkglist; search them: aur search pkg
Clone a package: aur fetch pkg
Recursive deps of a packages (tsorted): echo plasma-desktop-git | aur depends | cut -f1,2 | tsort | tac
Same but use .SRCINFO rather than aur rpc: cat */.SRCINFO | aur graph | tsort | tac
Filter official packages: echo "pacman\npacaur" | aur repo-filter
  (filter those in my repo: aur repo-filter -d dams;
   filter those in all repos: aur repo-filter -a)
List version of VCS packages: aur srcver pkgbase/
Compare versions: echo "foo 0.1" | aur vercmp
  Take a list of "packages version" on stdin, and show upgrades in aur.
  -a: show downgrades too
  -p file: look for newer versions in file rather than in aur
  -d repo: take packages from this repo rather than STDIN
   (Note this use pacman's version of the repo rather than the actual
   version, so call pacman -Sy to update if needed; or use
   `aur sync -d repo --list | cut -f2,3 | aur vercmp`,
   this is what aur vercmp-devel uses)
  -c: reverse, ie consider the versions from STDIN as the new versions
Build a package: aur-build, aur-chroot
=> Build in a chroot: aur chroot
  A bit like archbuild for aur, calls mkarchchroot to build the chroot and
  then makechrootpkg. Specify '-d local_repo' to pass the local_repo options
  (cache and file) to the chroot. So calls makechrootpkg, but with the
  local repos bind mounted in the chroot.
  Default location is /var/lib/aurbuild (while for archbuild it is /var/lib/archbuild)
=> Build packages: aur build -a <(echo "foo\nbar\n") -d database makepkg_args
  (default to '.' if '-a pkgsfile' is not specified)
  Uses makepkg or `aur chroot` if called with '-c'
  The built packages are added to 'database'
  Note: 'database' can be set via AUR_REPO=database

aur sync: download, upgrade and build
  Clone dir can be set via AURDEST=~/.cache/aur
  -c: use aur build -c => aur chroot
  --list (list the db's repo), --repo-list (list the db's configuration), --print (print packages, don't build)
  -u/--upgrades
  --no-ver: rebuild even if up to date
  --no-ver-shallow: rebuild packages given in argument even if up to date (but don't rebuild up to date dependencies) (=> --rebuild/--rebuild-tree)
  xargs -a <(aur vercmp-devel) aur sync --no-ver-shallow

  It uses the following files in /tmp/sync.XXXX:
  argv, db_info (the content of --list), depends (aur depends <argv),
  filter (the packages not to build), queue_0 (depends tsorted - filter)
  pkginfo (the aur packages to build, with their versions, extracted from depends), queue (the aur pkgbase to build, extracted from pkginfo and sorted from queue_0)

  Examples:
  - aur sync -d dams --root ~/mnt/imb/public_html/archlinux/dams/os/x86_64 ...
    => aur mysync
  - Build packages and sign them: aur mysync -cs pkg
  - Update: aur mysync -csu
  - Check updates: aur vercmp -d dams / aur vercmp-devel -d dams
  - Update vcs: xargs -a <(aur vercmp-devel) aur mysync -c --no-ver-shallow
  - Check what will be done: aursync --print --no-view [-u] pkgs...
